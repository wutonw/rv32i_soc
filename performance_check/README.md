# CoreMark/Fmax check

From the repository root, run `performance_check\run_coremark_fmax.cmd`.
You can also open that CMD file in VS Code and use Run Code. The launcher
uses the project's `.venv\Scripts\python.exe` and puts it first on `PATH`.

The launcher runs the RTL stress gate first, then 10 CoreMark iterations.
After CoreMark passes CRC validation, it asks for the clock constraint period
(default 10 ns) and WNS. The only final metrics are Fmax, CoreMark/MHz, and
CoreMark at Fmax. You can pass `--period-ns` and `--wns-ns` to avoid prompts.

The stress gate includes 128 unrolled dependency cases with 640 checked RAM
results, four resets during execution, branch/JAL wrong-path guards, existing
forwarding and memory tests, CSR WB-commit/forwarding checks, a misaligned-load
trap with a younger CSR write that must be flushed, and firmware checks for 12
traps and 12 returns.
Any failed check stops the launcher before CoreMark.

Required tools on `PATH`: Icarus Verilog (`iverilog`, `vvp`), RISC-V GCC and
binutils. The scripts refer to the project's RTL, firmware, and official
CoreMark sources in their existing locations; keep this folder in the repo.
