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

$COREMARK_ROOT = $PSScriptRoot
$PROJECT_ROOT = Split-Path -Parent (Split-Path -Parent $COREMARK_ROOT)

& "$COREMARK_ROOT\build.ps1" -Iterations $Iterations
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

Push-Location $PROJECT_ROOT
try {
  iverilog -g2012 -Wall -I src -s coremark_tb `
    -o benchmark\coremark\build\coremark_tb.vvp `
    src\core\alu.v `
    src\core\csr_file.v `
    src\core\decoder.v `
    src\core\imm_gen.v `
    src\core\pc_reg.v `
    src\core\pipe_if_id.v `
    src\core\pipe_id_ex.v `
    src\core\pipe_ex_mem.v `
    src\core\pipe_mem_wb.v `
    src\core\regfile.v `
    src\core\cpu_core.v `
    src\periph\ram.v `
    benchmark\coremark\coremark_tb.v
  if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

  vvp benchmark\coremark\build\coremark_tb.vvp `
    "+MAX_CYCLES=$MaxCycles" `
    "+CLOCK_MHZ=$ClockMHz" `
    "+PROGRESS_CYCLES=$ProgressCycles"
  if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
}
finally {
  Pop-Location
}
