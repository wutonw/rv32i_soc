# CoreMark/Fmax check

From the repository root, run `performance_check\run_coremark_fmax.cmd`.
You can also open that CMD file in VS Code and use Run Code. The launcher
uses the project's `.venv\Scripts\python.exe` and puts it first on `PATH`.

The launcher runs the RTL stress gate first, then 10 CoreMark iterations.
Both use Vivado XSim and the actual generated multiplier IP model.
CoreMark is built with `-O2 -march=rv32i_zmmul -mabi=ilp32`: hardware multiply,
software division, no unsupported DIV/REM instructions.
After CoreMark passes CRC validation, it asks for the clock constraint period
(default 10 ns) and WNS. The only final metrics are Fmax, CoreMark/MHz, and
CoreMark at Fmax. You can pass `--period-ns` and `--wns-ns` to avoid prompts.

The stress gate includes 128 unrolled dependency cases with 640 checked RAM
results, four resets during execution, branch/JAL wrong-path guards, existing
forwarding and memory tests, CSR WB-commit/forwarding checks, a misaligned-load
trap with a younger CSR write that must be flushed, and firmware checks for 12
traps and 12 returns.
The gate also runs `tb/mul_dsp_stress/run.py`: four multiplication operations,
dependent chains, load/store/branch/CSR forwarding, reset during multiply,
and 19 trap/MRET/flush ordering cases. Tests and their generated files stay
under `tb/`, not in this CoreMark folder. Any failed check stops CoreMark.

Required tools on `PATH`: RISC-V GCC, binutils and PowerShell. The launcher
uses the project's Python virtual environment. Vivado defaults to
`E:/AMDDesignTools/2026.1/Vivado`; set `XILINX_VIVADO` to override it.
IP latency and simulator library version are read from the generated IP,
not fixed to one pipeline stage. Changing `PIPELINE_STAGE` in the core and
the IP's Pipeline Stages together, then regenerating IP output products,
is sufficient; stale/mismatched configurations fail before simulation.

Logs are under `build/precoremark_xsim`, `tb/mul_dsp_stress/build`, and
`benchmark/coremark/build/xsim`. The scripts refer to the project's RTL,
firmware, and official
CoreMark sources in their existing locations; keep this folder in the repo.
