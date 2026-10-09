"""Fail-fast regression gate for the CoreMark/Fmax launcher.

The original six benches and the multiplication suite use the current core
with its actual generated Vivado IP model.
"""

from __future__ import annotations

import subprocess
import shutil
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parent.parent
sys.path.insert(0, str(ROOT / "tb"))
from xsim_runner import XSimProject

TESTS = [
    ("pipeline_long_stress_tb", "PASS: 640 signatures, wrong-path guards, 4 mid-run resets"),
    ("csr_commit_trap_stress_tb", "PASS: CSR WB commit, forwarding, and trap ordering checks passed"),
    ("forwarding_tb", "PASS: all forwarding tests passed"),
    ("memory_hazard_tb", "PASS: memory/forwarding/hazard stress passed"),
    ("extreme_tb", "PASS: extreme RV32I/CSR stress passed"),
    ("firmware_trap_tb", "PASS: all 12 firmware Trap tests passed"),
]


def main() -> int:
    if sys.prefix == sys.base_prefix:
        raise RuntimeError("Run this through run_coremark_fmax.cmd with the project .venv")
    powershell = shutil.which("pwsh") or shutil.which("powershell")
    if powershell is None:
        raise RuntimeError("Missing PowerShell")
    print("[stress] Building trap firmware...", flush=True)
    subprocess.run([powershell, "-NoProfile", "-ExecutionPolicy", "Bypass", "-File",
                    str(ROOT / "firmware/build.ps1")], cwd=ROOT, check=True)
    project = XSimProject(ROOT / "performance_check/build/precoremark_xsim")
    benches = [(ROOT / "performance_check" if name in
                {"pipeline_long_stress_tb", "csr_commit_trap_stress_tb"} else ROOT / "tb") /
               (name + ".v") for name, _ in TESTS]
    project.compile(benches)
    for name, marker in TESTS:
        print(f"[stress] {name}...", flush=True)
        project.simulate(name, [], marker)
        print(f"[stress] PASS {name}", flush=True)
    python = sys.executable
    mul_runner = ROOT / "tb" / "mul_dsp_stress" / "run.py"
    print("[stress] Running multiplier/IP, forwarding, memory, CSR and trap regression...", flush=True)
    result = subprocess.run([python, str(mul_runner)], cwd=ROOT)
    if result.returncode != 0:
        raise RuntimeError("multiplier/IP regression failed")
    print("[stress] Current RTL/IP regression passed. Starting CoreMark.\n", flush=True)
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except (OSError, RuntimeError, subprocess.CalledProcessError) as error:
        print(f"[stress] ERROR: {error}", file=sys.stderr)
        raise SystemExit(1)
