"""Multiply unit + actual pipeline regression; never edits the RTL or firmware.

Golden values use Python arbitrary-precision arithmetic. The pipeline reference
executes architectural instructions, with no model of forwarding or stalls.
"""

from __future__ import annotations

import argparse
from collections import Counter
from pathlib import Path
import random
import re
import shutil
import subprocess
import sys

ROOT = Path(__file__).resolve().parent.parent
MASK = 0xFFFFFFFF
OPS = ("mul", "mulh", "mulhsu", "mulhu")
EDGES = (0, 1, 2, 3, 31, 32, 0x7FFF, 0x8000, 0xFFFF, 0x10000,
         0x7FFFFFFF, 0x80000000, 0x80000001, 0xFFFFFFFE, MASK,
         0x55555555, 0xAAAAAAAA, 0x01010101)
SIGNATURE_BASE = 0x1000
DONE = 0x7FFC


def signed(value: int, bits: int = 32) -> int:
    value &= (1 << bits) - 1
    return value - (1 << bits) if value & (1 << (bits - 1)) else value


def multiply(op: str, a: int, b: int) -> int:
    # Independently choose signedness for each operand before multiplication.
    left = signed(a) if op in ("mulh", "mulhsu") else a & MASK
    right = signed(b) if op == "mulh" else b & MASK
    product = left * right
    return (product if op == "mul" else product >> 32) & MASK


class Program:
    def __init__(self) -> None:
        self.code: list[tuple[str, tuple, str]] = []
        self.labels: dict[str, int] = {}
        self.context = "setup"
        self.signatures = 0
        self.emit("addi", 0, 0, 0)
        self.li(27, SIGNATURE_BASE)
        self.li(26, 0x400)
        self.li(25, 0x600)

    def emit(self, op: str, *args) -> None:
        self.code.append((op, args, self.context))

    def label(self, name: str) -> None:
        if name in self.labels:
            raise ValueError(f"duplicate label: {name}")
        self.labels[name] = 4 * len(self.code)

    def li(self, rd: int, value: int) -> None:
        value &= MASK
        upper = ((value + 0x800) >> 12) & 0xFFFFF
        self.emit("lui", rd, upper)
        self.emit("addi", rd, rd, signed(value, 12))

    def save(self, rd: int) -> None:
        if SIGNATURE_BASE + self.signatures * 4 >= 0x7000:
            raise ValueError("signature area full")
        self.emit("sw", rd, 27, 0)
        self.emit("addi", 27, 27, 4)
        self.signatures += 1

    def finish(self) -> None:
        self.context = "completion"
        self.li(24, 0x600DCAFE)
        self.li(23, DONE)
        self.emit("sw", 24, 23, 0)
        self.label("done")
        self.emit("jal", 0, "done")

    def encode(self, index: int) -> int:
        op, a, _ = self.code[index]
        pc = index * 4
        if op == "lui":
            rd, imm = a
            return imm << 12 | rd << 7 | 0x37
        if op in OPS or op in ("add", "xor"):
            rd, rs1, rs2 = a
            f3 = OPS.index(op) if op in OPS else (4 if op == "xor" else 0)
            f7 = 1 if op in OPS else 0
            return f7 << 25 | rs2 << 20 | rs1 << 15 | f3 << 12 | rd << 7 | 0x33
        if op in ("addi", "lw", "lb", "lbu", "lh", "lhu", "jalr"):
            rd, rs1, imm = a
            f3 = {"addi": 0, "lw": 2, "lb": 0, "lbu": 4,
                  "lh": 1, "lhu": 5, "jalr": 0}[op]
            opcode = 0x13 if op == "addi" else (0x67 if op == "jalr" else 3)
            assert -2048 <= imm < 2048
            return (imm & 0xFFF) << 20 | rs1 << 15 | f3 << 12 | rd << 7 | opcode
        if op in ("sw", "sb", "sh"):
            rs2, rs1, imm = a
            assert -2048 <= imm < 2048
            value = imm & 0xFFF
            f3 = {"sb": 0, "sh": 1, "sw": 2}[op]
            return (value >> 5) << 25 | rs2 << 20 | rs1 << 15 | f3 << 12 | (value & 31) << 7 | 0x23
        if op in ("beq", "bne", "blt", "bge", "bltu", "bgeu"):
            rs1, rs2, label = a
            offset = self.labels[label] - pc
            assert offset % 2 == 0 and -4096 <= offset < 4096
            value = offset & 0x1FFF
            f3 = {"beq": 0, "bne": 1, "blt": 4, "bge": 5, "bltu": 6, "bgeu": 7}[op]
            return ((value >> 12) << 31 | ((value >> 5) & 63) << 25 |
                    rs2 << 20 | rs1 << 15 | f3 << 12 | ((value >> 1) & 15) << 8 |
                    ((value >> 11) & 1) << 7 | 0x63)
        if op == "jal":
            rd, label = a
            value = (self.labels[label] - pc) & 0x1FFFFF
            return ((value >> 20) << 31 | ((value >> 1) & 1023) << 21 |
                    ((value >> 11) & 1) << 20 | ((value >> 12) & 255) << 12 | rd << 7 | 0x6F)
        if op in ("csrrw", "csrrs"):
            rd, rs1, csr = a
            return csr << 20 | rs1 << 15 | (1 if op == "csrrw" else 2) << 12 | rd << 7 | 0x73
        raise ValueError(op)

    def reference(self, initial: list[int]) -> tuple[list[int], list[int], list[int], Counter]:
        regs = [0] * 32
        memory = initial.copy()
        csrs = {0x304: 0}
        reg_trace: list[int] = []
        store_trace: list[int] = []
        coverage = Counter()
        pc = 0
        for _ in range(20000):
            if pc % 4 or not 0 <= pc // 4 < len(self.code):
                raise ValueError(f"reference jumped outside ROM at {pc:#x}")
            op, a, _ = self.code[pc // 4]
            coverage[op] += 1
            next_pc = pc + 4
            rd = None
            value = 0
            if op == "lui":
                rd, imm = a
                value = imm << 12
            elif op in OPS:
                rd, rs1, rs2 = a
                value = multiply(op, regs[rs1], regs[rs2])
            elif op in ("add", "xor"):
                rd, rs1, rs2 = a
                value = regs[rs1] + regs[rs2] if op == "add" else regs[rs1] ^ regs[rs2]
            elif op == "addi":
                rd, rs1, imm = a
                value = regs[rs1] + imm
            elif op in ("lw", "lb", "lbu", "lh", "lhu"):
                rd, rs1, imm = a
                addr = (regs[rs1] + imm) & MASK
                size = 4 if op == "lw" else (2 if op in ("lh", "lhu") else 1)
                assert addr % size == 0 and addr + size <= 32768
                value = (memory[addr >> 2] >> ((addr & 3) * 8)) & ((1 << (size * 8)) - 1)
                if op in ("lb", "lh"):
                    value = signed(value, size * 8)
            elif op in ("sw", "sb", "sh"):
                rs2, rs1, imm = a
                addr = (regs[rs1] + imm) & MASK
                size = {"sw": 4, "sh": 2, "sb": 1}[op]
                assert addr % size == 0 and addr + size <= 32768
                lane = addr & 3
                enables = ((1 << size) - 1) << lane
                data = regs[rs2] if size == 4 else (
                    (regs[rs2] & 0xFF) * 0x01010101 if size == 1 else
                    (regs[rs2] & 0xFFFF) * 0x00010001)
                mask = ((1 << (size * 8)) - 1) << (lane * 8)
                memory[addr >> 2] = ((memory[addr >> 2] & ~mask) |
                    ((regs[rs2] << (lane * 8)) & mask)) & MASK
                store_trace.append(pc << 68 | addr << 36 | enables << 32 | data)
                if addr == DONE and data == 0x600DCAFE:
                    return memory, reg_trace, store_trace, coverage
            elif op in ("beq", "bne", "blt", "bge", "bltu", "bgeu"):
                rs1, rs2, label = a
                left, right = regs[rs1], regs[rs2]
                take = {"beq": left == right, "bne": left != right,
                        "blt": signed(left) < signed(right), "bge": signed(left) >= signed(right),
                        "bltu": left < right, "bgeu": left >= right}[op]
                coverage[f"{op}_{'taken' if take else 'not_taken'}"] += 1
                if take:
                    next_pc = self.labels[label]
            elif op == "jal":
                rd, label = a
                value = pc + 4
                next_pc = self.labels[label]
            elif op == "jalr":
                rd, rs1, imm = a
                next_pc = (regs[rs1] + imm) & MASK & ~1
                value = pc + 4
            elif op in ("csrrw", "csrrs"):
                rd, rs1, csr = a
                value = csrs[csr]
                if op == "csrrw":
                    csrs[csr] = regs[rs1]
                elif rs1:
                    csrs[csr] |= regs[rs1]
            else:
                raise ValueError(op)
            if rd is not None and rd != 0:
                regs[rd] = value & MASK
                reg_trace.append(pc << 37 | rd << 32 | regs[rd])
            pc = next_pc
        raise ValueError("reference did not finish")


def product_cases(pairs: list[tuple[int, int]]) -> Program:
    p = Program()
    for index, (a, b) in enumerate(pairs):
        p.context = f"product[{index}] a={a:08x} b={b:08x}"
        p.li(1, a)
        p.li(2, b)
        # Contiguous four-op stream followed immediately by stores.
        for op, rd in zip(OPS, (3, 4, 5, 6)):
            p.emit(op, rd, 1, 2)
        for rd in (3, 4, 5, 6):
            p.save(rd)
    p.finish()
    return p


def dependency_cases(rng: random.Random) -> Program:
    p = Program()
    for index in range(80):
        a, b = rng.getrandbits(32), rng.getrandbits(32)
        p.context = f"dependencies[{index}] a={a:08x} b={b:08x}"
        p.li(1, a)
        p.li(2, b)
        op = OPS[index % 4]
        p.emit(op, 3, 1, 2)
        p.emit("mul", 4, 3, 2)  # immediate rs1 dependency
        p.emit("mulh", 5, 1, 4)  # immediate rs2 dependency
        p.emit("mulhsu", 5, 5, 3)  # rd == rs1, two producers
        p.emit("mulhu", 6, 5, 5)  # both sources match one rd
        p.emit("add", 7, 6, 3)
        p.emit("xor", 8, 7, 5)
        for rd in (3, 4, 5, 6, 7, 8):
            p.save(rd)
        # MUL -> MUL with same destination: newest producer must win over WB.
        p.emit("mul", 9, 1, 2)
        p.emit("mulhu", 9, 9, 2)
        p.emit("mulh", 10, 1, 9)
        p.save(10)
        # ALU / WB -> MUL and destination aliasing the second source.
        p.emit("add", 11, 1, 2)
        p.emit("addi", 12, 1, -17)
        p.emit("mulhsu", 12, 11, 12)
        p.save(12)
        # x0 as destination or input must not pollute forwarding.
        p.emit(op, 0, 1, 2)
        p.emit("mul", 13, 0, 2)
        p.save(13)
        p.emit("mulh", 14, 1, 0)
        p.save(14)
        # A real backward loop exercises repeated mixed multiply dependencies.
        p.emit("addi", 15, 0, 7)
        p.emit("addi", 16, 0, 9)
        p.label(f"loop{index}")
        p.emit("mul", 16, 16, 2)
        p.emit("mulhu", 17, 16, 1)
        p.emit("xor", 16, 17, 16)
        p.emit("addi", 15, 15, -1)
        p.emit("bne", 15, 0, f"loop{index}")
        p.save(16)
    p.finish()
    return p


def memory_control_cases(rng: random.Random) -> Program:
    p = Program()
    for index in range(64):
        p.context = f"load/store/flush[{index}]"
        p.li(1, rng.getrandbits(32))
        p.li(2, rng.getrandbits(32))
        op = OPS[index % 4]
        p.emit("sw", 1, 26, 0)
        p.emit("sw", 2, 26, 4)
        p.emit("lw", 3, 26, 0)
        p.emit(op, 4, 3, 2)
        p.emit("mul", 5, 4, 4)
        p.emit("sw", 5, 26, 8)  # immediate MUL -> store data
        p.emit("lw", 6, 26, 8)  # overlapping store -> load -> MUL
        p.emit("mulhsu", 7, 6, 3)
        p.save(7)
        # Repeated loads to one rd, followed by a multiply using latest value.
        p.emit("lw", 8, 26, 0)
        p.emit("lw", 8, 26, 4)
        p.emit("mulhu", 9, 8, 8)
        p.save(9)
        # Byte and halfword signed/unsigned loads immediately feed multiply.
        for load, offset in (("lb", 1), ("lbu", 3), ("lh", 2), ("lhu", 0)):
            p.emit(load, 10, 26, offset)
            p.emit(op, 11, 10, 2)
            p.save(11)
        # Multiply result used as both data and address on the next instruction.
        p.emit("addi", 12, 0, 256)
        p.emit("addi", 13, 0, 4)
        p.emit("mul", 14, 12, 13)  # 0x400
        p.emit("sw", 14, 14, 16)
        p.emit("mul", 14, 12, 13)
        p.emit("lw", 15, 14, 16)
        p.emit("mul", 16, 15, 2)
        p.save(16)
        # All branch types consume a multiply result, with known taken/outcome.
        p.emit("addi", 17, 0, -1)
        p.emit("addi", 18, 0, 1)
        p.emit("mul", 19, 17, 18)
        for branch, left, right in (("beq", 19, 17), ("bne", 19, 0),
                ("blt", 19, 0), ("bge", 0, 19), ("bltu", 0, 19), ("bgeu", 19, 0)):
            target = f"{branch}{index}"
            # Recompute right before the branch to force EX/MEM forwarding.
            p.emit("mul", 19, 17, 18)
            p.emit(branch, left, right, target)
            p.emit("mul", 20, 1, 2)  # wrong-path register write
            p.emit("sw", 20, 25, 0)  # wrong-path memory write
            p.label(target)
            p.emit("mulhu", 20, 1, 2)
            p.save(20)
        # A not-taken branch followed by an uninterrupted multiply.
        p.emit("mul", 19, 17, 18)
        p.emit("beq", 19, 0, f"skip{index}")
        p.emit("mulh", 21, 1, 2)
        p.save(21)
        p.label(f"skip{index}")
        # JAL link immediately consumed by MUL, then multiply-built JALR target.
        p.emit("jal", 22, f"jump{index}")
        p.emit("sw", 1, 25, 4)
        p.label(f"jump{index}")
        p.emit("mul", 21, 22, 2)
        p.save(21)
        target = f"indirect{index}"
        # Fixed two-word li, MUL, JALR, and two wrong-path instructions.
        target_pc = (len(p.code) + 7) * 4
        p.li(20, target_pc)
        p.emit("addi", 18, 0, 1)
        p.emit("mul", 19, 20, 18)
        p.emit("jalr", 22, 19, 0)
        p.emit("mul", 21, 1, 2)
        p.emit("sw", 21, 25, 8)
        p.label(target)
        assert p.labels[target] == target_pc
        p.emit("mulhu", 21, 22, 2)
        p.save(21)
    p.finish()
    return p


def csr_cases(rng: random.Random, gap: int) -> Program:
    p = Program()
    for index in range(96):
        p.context = f"MUL -> CSR[{index}] gap={gap}"
        p.li(1, rng.getrandbits(32))
        p.li(2, rng.getrandbits(32))
        op = OPS[index % 4]
        p.emit(op, 3, 1, 2)
        for _ in range(gap):
            p.emit("addi", 0, 0, 0)
        p.emit("csrrw", 4, 3, 0x304)
        p.emit("csrrs", 5, 0, 0x304)
        p.save(5)
        p.emit("mul", 6, 5, 2)
        p.save(6)
    p.finish()
    return p


def minimal_csr_case() -> Program:
    p = Program()
    p.context = "minimal: 3 * 7 = 21, not ordinary ALU 3 + 7 = 10"
    p.li(1, 3)
    p.li(2, 7)
    p.emit("mul", 3, 1, 2)
    p.emit("csrrw", 0, 3, 0x304)
    p.emit("csrrs", 5, 0, 0x304)
    p.save(5)
    p.finish()
    return p


def write_hex(path: Path, values: list[int], digits: int = 8) -> None:
    path.write_text("".join(f"{value:0{digits}x}\n" for value in values), encoding="ascii")


def run(command: list[str], timeout: int = 120) -> tuple[bool, str]:
    try:
        result = subprocess.run(command, cwd=ROOT, stdout=subprocess.PIPE,
            stderr=subprocess.STDOUT, text=True, encoding="utf-8", errors="replace", timeout=timeout)
        return result.returncode == 0, result.stdout
    except subprocess.TimeoutExpired as error:
        output = error.stdout or b""
        if isinstance(output, bytes):
            output = output.decode("utf-8", errors="replace")
        return False, output + "\nTIMEOUT: simulator exceeded wall-time limit"


def compile_tb(name: str, sources: list[Path], build: Path) -> Path:
    binary = build / f"{name}.vvp"
    ok, output = run(["iverilog", "-g2012", "-I", str(ROOT / "src"),
        "-s", name, "-o", str(binary), *(str(p) for p in sources),
        str(Path(__file__).resolve().parent / f"{name}.sv")])
    (build / f"{name}_compile.log").write_text(output, encoding="utf-8")
    if not ok:
        raise RuntimeError(output)
    return binary


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--seed", type=lambda s: int(s, 0), default=0x20261008)
    parser.add_argument("--unit-pairs", type=int, default=10000)
    parser.add_argument("--random-pairs", type=int, default=256)
    args = parser.parse_args()
    if not 1 <= args.unit_pairs <= 24000 or not 1 <= args.random_pairs <= 10000:
        parser.error("unit-pairs must be 1..24000; random-pairs must be 1..10000")
    for tool in ("iverilog", "vvp"):
        if shutil.which(tool) is None:
            raise RuntimeError(f"missing tool: {tool}")
    build = ROOT / "performance_check" / "build" / "mul_stress"
    build.mkdir(parents=True, exist_ok=True)
    print(f"Multiply stress seed={args.seed:#x}; artifacts: {build}", flush=True)
    rng = random.Random(args.seed)
    edge_pairs = [(a, b) for a in EDGES for b in EDGES]
    vectors = []
    for a, b in edge_pairs + [(rng.getrandbits(32), rng.getrandbits(32)) for _ in range(args.unit_pairs)]:
        for number, op in enumerate(OPS):
            vectors.append(number << 96 | a << 64 | b << 32 | multiply(op, a, b))
    vector_file = build / "unit_vectors.hex"
    write_hex(vector_file, vectors, 25)
    unit = compile_tb("mul_unit_stress_tb", [ROOT / "src/core/m_ext.sv"], build)
    ok, output = run(["vvp", str(unit), f"+VECTORS={vector_file.as_posix()}", f"+COUNT={len(vectors)}"])
    (build / "unit.log").write_text(output, encoding="utf-8")
    print(output.strip(), flush=True)
    failed = [] if ok and "PASS:" in output else ["unit"]
    rtl = sorted((ROOT / "src/core").glob("*.v")) + sorted((ROOT / "src/core").glob("*.sv"))
    pipeline = compile_tb("mul_pipeline_stress_tb", rtl + [ROOT / "src/periph/ram.v"], build)
    groups = []
    for start in range(0, len(edge_pairs), 96):
        groups.append((f"boundary_{start // 96}", product_cases(edge_pairs[start:start+96])))
    random_pairs = [(rng.getrandbits(32), rng.getrandbits(32)) for _ in range(args.random_pairs)]
    for start in range(0, len(random_pairs), 96):
        groups.append((f"random_{start // 96}", product_cases(random_pairs[start:start+96])))
    groups.extend([("dependencies", dependency_cases(rng)),
                   ("memory_control", memory_control_cases(rng))])
    # Keep each producer-consumer distance independent: a failed immediate
    # bypass must not contaminate the following case's old-CSR expectation.
    for gap in range(4):
        groups.append((f"csr_gap_{gap}", csr_cases(random.Random(args.seed ^ 0xC5A), gap)))
    groups.append(("csr_adjacent_minimal", minimal_csr_case()))
    totals = Counter()
    for name, program in groups:
        if len(program.code) > 8192:
            raise RuntimeError(f"{name}: program exceeds real 32 KiB ROM")
        initial = [rng.getrandbits(32) for _ in range(8192)]
        initial[DONE >> 2] = 0
        memory, registers, stores, coverage = program.reference(initial)
        totals.update(coverage)
        files = {key: build / f"{name}_{key}.hex" for key in ("rom", "init", "ram", "regs", "stores")}
        write_hex(files["rom"], [program.encode(i) for i in range(len(program.code))] +
            [0x13] * (8192 - len(program.code)))
        write_hex(files["init"], initial)
        write_hex(files["ram"], memory)
        write_hex(files["regs"], registers, 18)
        write_hex(files["stores"], stores, 25)
        listing = "\n".join(f"{i*4:08x}  {program.encode(i):08x}  {op} {a}  # {context}"
            for i, (op, a, context) in enumerate(program.code))
        (build / f"{name}.asm").write_text(listing + "\n", encoding="utf-8")
        print(f"[pipeline] {name}: {len(program.code)} words, {program.signatures} signatures", flush=True)
        command = ["vvp", str(pipeline)] + [f"+{key.upper()}={path.as_posix()}" for key, path in files.items()]
        command += [f"+REG_COUNT={len(registers)}", f"+STORE_COUNT={len(stores)}"]
        ok, output = run(command)
        (build / f"{name}.log").write_text(output, encoding="utf-8")
        print(output.strip(), flush=True)
        if not ok or "PASS:" not in output:
            failed.append(name)
            match = re.search(r"FAIL WB\[\d+\] pc=([0-9a-fA-F]{8})", output)
            if match:
                index = int(match[1], 16) // 4
                print("First mismatch instruction context:", flush=True)
                for row in listing.splitlines()[max(0, index-4):index+3]:
                    print("  " + row, flush=True)
    print("Executed multiplication coverage (before the second reset/replay): " +
        ", ".join(f"{op}={totals[op]}" for op in OPS), flush=True)
    if failed:
        print("FAIL: " + ", ".join(failed), flush=True)
        return 1
    print(f"PASS: all {len(groups)} multiplication pipeline batches and unit vectors", flush=True)
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except (OSError, RuntimeError, ValueError) as error:
        print(f"ERROR: {error}", file=sys.stderr)
        raise SystemExit(1)
