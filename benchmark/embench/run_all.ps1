param(
  [ValidateRange(1, 1000)]
  [int]$ScaleFactor = 1,
  [ValidateRange(0, 1000000)]
  [int]$LocalScaleOverride = 0,
  [ValidateRange(10000, 2000000000)]
  [long]$MaxCycles = 200000000
)

$EMBENCH_ROOT = $PSScriptRoot
$PROJECT_ROOT = Split-Path -Parent (Split-Path -Parent $EMBENCH_ROOT)
$BUILD_ROOT = Join-Path $EMBENCH_ROOT "build"

& "$EMBENCH_ROOT\build_all.ps1" `
  -ScaleFactor $ScaleFactor -LocalScaleOverride $LocalScaleOverride
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

Push-Location $PROJECT_ROOT
try {
  iverilog -g2012 -Wall -I src -s embench_tb `
    -o benchmark\embench\build\embench_tb.vvp `
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
    benchmark\embench\embench_tb.v
  if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

  $summary = @()
  $buildSummary = Import-Csv (Join-Path $BUILD_ROOT "build_summary.csv")
  foreach ($item in $buildSummary) {
    if ($item.Status -ne "OK") {
      $summary += [pscustomobject]@{
        Benchmark=$item.Benchmark; Status=$item.Status; TimedCycles=0;
        Retired=0; CPI=0; TotalCycles=0; TextBytes=$item.TextBytes;
        DataInitBytes=$item.DataBytes; Result=""
      }
      continue
    }

    $name = $item.Benchmark
    $dir = Join-Path $BUILD_ROOT $name
    Write-Host "RUN: $name"
    $output = & vvp benchmark\embench\build\embench_tb.vvp `
      "+TEXT=$dir\text.hex" "+DATA=$dir\data.hex" `
      "+NAME=$name" "+MAX_CYCLES=$MaxCycles" 2>&1
    $output | ForEach-Object { Write-Host $_ }

    $line = $output | Where-Object { $_ -match '^EMBENCH_RESULT ' } | Select-Object -Last 1
    if ($line -match '^EMBENCH_RESULT\s+(\S+)\s+(\S+)\s+(\d+)\s+(\d+)\s+(\d+)\s+([0-9a-fA-F]+)$') {
      $cycles = [long]$Matches[3]
      $retired = [long]$Matches[4]
      $cpi = if ($retired -ne 0) { $cycles / [double]$retired } else { 0 }
      $summary += [pscustomobject]@{
        Benchmark=$Matches[1]; Status=$Matches[2]; TimedCycles=$cycles;
        Retired=$retired; CPI=$cpi; TotalCycles=[long]$Matches[5];
        TextBytes=$item.TextBytes; DataInitBytes=$item.DataBytes;
        Result=$Matches[6]
      }
    } else {
      $summary += [pscustomobject]@{
        Benchmark=$name; Status="NO_RESULT"; TimedCycles=0; Retired=0;
        CPI=0; TotalCycles=0; TextBytes=$item.TextBytes;
        DataInitBytes=$item.DataBytes; Result=""
      }
    }
  }

  $summary | Export-Csv -NoTypeInformation -Encoding utf8 `
    (Join-Path $BUILD_ROOT "results.csv")
  Write-Host ""
  Write-Host "--- Embench-IoT summary (GSF=$ScaleFactor, LSF override=$LocalScaleOverride) ---"
  $summary | Format-Table Benchmark,Status,TimedCycles,CPI,TextBytes,DataInitBytes -AutoSize
}
finally {
  Pop-Location
}
