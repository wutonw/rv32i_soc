param(
  [ValidateRange(1, 1000)]
  [int]$ClockMHz = 100,
  [ValidateRange(100000, 10000000)]
  [int]$CyclesPerIteration = 1169834
)

$COREMARK_ROOT = $PSScriptRoot
$targetCycles = [long]$ClockMHz * 1000000L * 10L
$iterations = [int][Math]::Ceiling($targetCycles / [double]$CyclesPerIteration)
$maxCycles = [long][Math]::Ceiling($targetCycles * 1.10) + 1000000L

Write-Host "CoreMark 10-second-equivalent RTL run"
Write-Host "Clock assumption     : $ClockMHz MHz"
Write-Host "Iterations           : $iterations"
Write-Host "Target timed cycles  : $targetCycles"
Write-Host "Simulation limit     : $maxCycles"
Write-Host "This Icarus run may take several hours."

& "$COREMARK_ROOT\run.ps1" `
  -Iterations $iterations `
  -MaxCycles $maxCycles `
  -ClockMHz $ClockMHz `
  -ProgressCycles 50000000

exit $LASTEXITCODE
