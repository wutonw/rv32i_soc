$BENCH_ROOT = $PSScriptRoot
$PROJECT_ROOT = Split-Path -Parent $BENCH_ROOT

& "$BENCH_ROOT\build.ps1"
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

Push-Location $PROJECT_ROOT
try {
  iverilog -g2012 -Wall -I src -s benchmark_tb `
    -o benchmark\build\benchmark_tb.vvp `
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
    benchmark\benchmark_tb.v
  if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

  vvp benchmark\build\benchmark_tb.vvp
  if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
}
finally {
  Pop-Location
}
