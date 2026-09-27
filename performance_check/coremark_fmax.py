r"""Run CoreMark and calculate Fmax/CoreMark metrics for this RV32I project.

The timing result is calculated from the constraint period and Vivado's WNS:

    data path delay = clock period - WNS
    Fmax            = 1000 / data path delay       (MHz)

CoreMark/MHz comes from the RTL run and is independent of the selected clock.
CoreMark is the estimated score at the calculated Fmax.

Examples (from the repository root)::

    .\performance_check\run_coremark_fmax.cmd
    .\performance_check\run_coremark_fmax.cmd --period-ns 10 --wns-ns 0.42
    .\performance_check\run_coremark_fmax.cmd --period-ns 8 --wns-ns -0.35

The script prints the three values needed for an optimization spreadsheet:
Fmax, CoreMark/MHz and CoreMark at Fmax.
"""

from __future__ import annotations

import argparse
import os
import queue
import re
import shutil
import subprocess
import sys
import threading
import time
from pathlib import Path


DEFAULT_PERIOD_NS = 10.0
DEFAULT_WNS_NS = 0.0
DEFAULT_MAX_CYCLES = 15_000_000


def calculate_fmax(period_ns: float, wns_ns: float) -> tuple[float, float]:
    """Return (actual path delay in ns, Fmax in MHz)."""
    if period_ns <= 0:
        raise ValueError("clock period must be greater than 0 ns")
    actual_delay_ns = period_ns - wns_ns
    if actual_delay_ns <= 0:
        raise ValueError(
            "period - WNS must be greater than 0 ns; check the timing report"
        )
    return actual_delay_ns, 1000.0 / actual_delay_ns


def prompt_float(label: str, default: float) -> float:
    value = input(f"{label} [{default:g}]: ").strip()
    return default if not value else float(value)


def run_coremark(repo_root: Path, max_cycles: int) -> str:
    """Build and simulate CoreMark, returning combined stdout/stderr."""
    powershell = shutil.which("pwsh") or shutil.which("powershell")
    if powershell is None:
        raise RuntimeError("找不到 PowerShell（pwsh 或 powershell），无法运行 CoreMark")

    run_script = repo_root / "benchmark" / "coremark" / "run.ps1"
    if not run_script.is_file():
        raise RuntimeError(f"找不到 CoreMark 脚本: {run_script}")

    command = [
        powershell,
        "-NoProfile",
        "-ExecutionPolicy",
        "Bypass",
        "-File",
        str(run_script),
        "-Iterations",
        "10",
        "-MaxCycles",
        str(max_cycles),
        "-ClockMHz",
        "100",
        "-ProgressCycles",
        "1000000",
    ]
    output_lines = []
    output_queue: queue.Queue[str | None] = queue.Queue()
    process = subprocess.Popen(
        command,
        cwd=repo_root,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
        text=True,
        encoding="utf-8",
        errors="replace",
        bufsize=1,
        creationflags=subprocess.CREATE_NEW_PROCESS_GROUP if os.name == "nt" else 0,
    )

    def read_output() -> None:
        try:
            assert process.stdout is not None
            for line in process.stdout:
                output_queue.put(line)
        finally:
            output_queue.put(None)

    reader = threading.Thread(target=read_output, daemon=True)
    reader.start()
    start_time = time.monotonic()
    last_status = start_time
    try:
        while True:
            try:
                line = output_queue.get(timeout=1)
            except queue.Empty:
                now = time.monotonic()
                if now - last_status >= 15:
                    print(f"CoreMark 仍在运行，已等待 {int(now - start_time)} 秒...", flush=True)
                    last_status = now
                continue
            if line is None:
                break
            output_lines.append(line)
            if line.startswith("PROGRESS:"):
                print(line.rstrip(), flush=True)
                last_status = time.monotonic()
        returncode = process.wait()
    except KeyboardInterrupt:
        if process.poll() is None:
            if os.name == "nt":
                subprocess.run(
                    ["taskkill", "/PID", str(process.pid), "/T", "/F"],
                    stdout=subprocess.DEVNULL,
                    stderr=subprocess.DEVNULL,
                    check=False,
                )
            else:
                process.terminate()
            try:
                process.wait(timeout=5)
            except subprocess.TimeoutExpired:
                process.kill()
                process.wait()
        raise
    finally:
        reader.join(timeout=1)
        if process.stdout is not None:
            process.stdout.close()
    output = "".join(output_lines)
    if returncode != 0:
        raise RuntimeError(
            f"CoreMark 运行失败（退出码 {returncode}）。\n{output}"
        )
    return output


def parse_coremark_output(output: str) -> tuple[int, int, float]:
    """Extract iterations, timed cycles and CoreMark/MHz from testbench output."""
    def find_int(pattern: str, name: str) -> int:
        match = re.search(pattern, output, flags=re.IGNORECASE | re.MULTILINE)
        if not match:
            raise RuntimeError(f"CoreMark 输出中没有找到 {name}")
        return int(match.group(1).replace(",", ""))

    iterations = find_int(r"^iterations\s*:\s*([0-9,]+)", "iterations")
    timed_cycles = find_int(r"^timed cycles\s*:\s*([0-9,]+)", "timed cycles")
    if timed_cycles <= 0:
        raise RuntimeError("CoreMark timed cycles 为 0，无法计算 CoreMark/MHz")

    # Calculate from the raw counters rather than trusting a formatted estimate.
    coremark_per_mhz = iterations * 1_000_000.0 / timed_cycles
    if "PASS: official CoreMark CRC validation succeeded" not in output:
        raise RuntimeError("CoreMark CRC 校验没有 PASS，请检查仿真输出")
    return iterations, timed_cycles, coremark_per_mhz


def read_number(prompt: str, supplied: float | None, default: float) -> float:
    if supplied is not None:
        return supplied
    return prompt_float(prompt, default)


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(description="Run CoreMark and calculate Fmax/CoreMark metrics")
    parser.add_argument("--period-ns", type=float, help="clock constraint period in ns")
    parser.add_argument("--wns-ns", type=float, help="worst negative slack in ns; positive WNS means margin")
    parser.add_argument("--max-cycles", type=int, default=DEFAULT_MAX_CYCLES, help="simulation cycle limit")
    return parser


def main() -> int:
    if sys.prefix == sys.base_prefix:
        raise RuntimeError(
            "请使用项目虚拟环境运行："
            " .\\performance_check\\run_coremark_fmax.cmd"
        )
    args = build_parser().parse_args()
    if args.max_cycles < 1:
        raise ValueError("max-cycles must be positive")
    repo_root = Path(__file__).resolve().parent.parent
    print("正在运行 CoreMark（10 次迭代），请稍候...", flush=True)
    output = run_coremark(repo_root, args.max_cycles)
    iterations, timed_cycles, coremark_per_mhz = parse_coremark_output(output)
    if iterations != 10:
        raise RuntimeError(f"CoreMark 实际运行了 {iterations} 次，预期为 10 次")
    print(f"CoreMark PASS；计时周期: {timed_cycles:,}")

    period_ns = read_number("时钟约束周期(ns)", args.period_ns, DEFAULT_PERIOD_NS)
    wns_ns = read_number("WNS(ns，可正可负)", args.wns_ns, DEFAULT_WNS_NS)
    _, fmax_mhz = calculate_fmax(period_ns, wns_ns)
    coremark_at_fmax = coremark_per_mhz * fmax_mhz
    print()
    print(f"Fmax                : {fmax_mhz:.3f} MHz")
    print(f"CoreMark/MHz        : {coremark_per_mhz:.6f}")
    print(f"CoreMark            : {coremark_at_fmax:.3f}")
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except KeyboardInterrupt:
        print("\n已取消 CoreMark 运行。", file=sys.stderr)
        raise SystemExit(130)
    except (OSError, RuntimeError, ValueError) as error:
        print(f"错误: {error}", file=sys.stderr)
        raise SystemExit(1)
