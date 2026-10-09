param(
  [ValidateRange(1, 1000000)]
  [int]$Iterations = 1,
  [ValidateRange(1000, 2000000000)]
  [long]$MaxCycles = 20000000,
  [ValidateRange(1, 1000)]
  [int]$ClockMHz = 100,
  [ValidateRange(1000000, 1000000000)]
  [int]$ProgressCycles = 50000000
)

$ErrorActionPreference = "Stop"
$COREMARK_ROOT = $PSScriptRoot
$PROJECT_ROOT = Split-Path -Parent (Split-Path -Parent $COREMARK_ROOT)
$python = Join-Path $PROJECT_ROOT ".venv\Scripts\python.exe"
if (-not (Test-Path -LiteralPath $python)) { $python = "python" }

& "$COREMARK_ROOT\build.ps1" -Iterations $Iterations
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

& $python "$PROJECT_ROOT\tb\xsim_runner.py" `
  --build "$COREMARK_ROOT\build\xsim" `
  --top coremark_tb `
  --testbench "$COREMARK_ROOT\coremark_tb.v" `
  --marker "PASS: official CoreMark CRC validation succeeded" `
  --plusarg "MAX_CYCLES=$MaxCycles" `
  --plusarg "CLOCK_MHZ=$ClockMHz" `
  --plusarg "PROGRESS_CYCLES=$ProgressCycles"
exit $LASTEXITCODE
