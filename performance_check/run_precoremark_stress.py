"""Fail-fast RTL regression gate for the CoreMark/Fmax launcher."""

from __future__ import annotations

import shutil
import subprocess
import sys
import tempfile
from pathlib import Path


ROOT = Path(__file__).resolve().parent.parent
RTL = [
    "alu.v", "csr_file.v", "decoder.v", "imm_gen.v", "pc_reg.v",
    "pipe_if_id.v", "pipe_id_ex.v", "pipe_ex_mem.v", "pipe_mem_wb.v",
    "regfile.v", "trap.v", "cpu_core.v","m_ext.sv",
]
TESTS = [
    ("pipeline_long_stress_tb", "PASS: 640 signatures, wrong-path guards, 4 mid-run resets"),
    ("csr_commit_trap_stress_tb", "PASS: CSR WB commit, forwarding, and trap ordering checks passed"),
    ("forwarding_tb", "PASS: all forwarding tests passed"),
    ("memory_hazard_tb", "PASS: memory/forwarding/hazard stress passed"),
    ("extreme_tb", "PASS: extreme RV32I/CSR stress passed"),
    ("firmware_trap_tb", "PASS: all 12 firmware Trap tests passed"),
]


def run(command: list[str], label: str) -> str:
    result = subprocess.run(
        command, cwd=ROOT, stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
        text=True, encoding="utf-8", errors="replace",
    )
    if result.returncode:
        raise RuntimeError(f"{label} failed (exit {result.returncode}):\n{result.stdout}")
    return result.stdout


def main() -> int:
    if sys.prefix == sys.base_prefix:
        raise RuntimeError("Run this through run_coremark_fmax.cmd with the project .venv")
    for tool in ("iverilog", "vvp", "riscv-none-elf-gcc"):
        if shutil.which(tool) is None:
            raise RuntimeError(f"Missing required tool: {tool}")
    powershell = shutil.which("pwsh") or shutil.which("powershell")
    if powershell is None:
        raise RuntimeError("Missing PowerShell for firmware build")

    print("[stress] Building trap-test firmware...", flush=True)
    run([powershell, "-NoProfile", "-ExecutionPolicy", "Bypass", "-File",
         str(ROOT / "firmware" / "build.ps1")], "firmware build")

    sources = [str(ROOT / "src" / "core" / name) for name in RTL]
    sources.append(str(ROOT / "src" / "periph" / "ram.v"))
    with tempfile.TemporaryDirectory(prefix="rv32i_stress_") as temporary:
        for name, marker in TESTS:
            print(f"[stress] {name}...", flush=True)
            binary = str(Path(temporary) / f"{name}.vvp")
            testbench = (Path(__file__).resolve().parent / f"{name}.v"
                         if name in {"pipeline_long_stress_tb", "csr_commit_trap_stress_tb"}
                         else ROOT / "tb" / f"{name}.v")
            run(["iverilog", "-g2012", "-I", str(ROOT / "src"),
                 "-s", name, "-o", binary, *sources,
                 str(testbench)], f"compile {name}")
            output = run(["vvp", binary], name)
            if marker not in output or "FAIL" in output or "TIMEOUT" in output:
                raise RuntimeError(f"{name} did not pass:\n{output}")
            print(f"[stress] PASS {name}", flush=True)
    print("[stress] All RTL checks passed. Starting CoreMark.\n", flush=True)
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except (OSError, RuntimeError) as error:
        print(f"[stress] ERROR: {error}", file=sys.stderr)
        raise SystemExit(1)
