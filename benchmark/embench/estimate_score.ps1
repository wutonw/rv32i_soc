param(
  [ValidateRange(1, 1000)]
  [double]$ClockMHz = 100,
  [ValidateRange(1, 2000000000)]
  [long]$XgboostCycles = 4371902
)

$EMBENCH_ROOT = $PSScriptRoot
$BUILD_ROOT = Join-Path $EMBENCH_ROOT "build"
$SOURCE_ROOT = Join-Path $EMBENCH_ROOT "official\src"
$baseline = Get-Content -Raw `
  (Join-Path $EMBENCH_ROOT "official\baseline-data\speed.json") | ConvertFrom-Json
$lsf1 = Import-Csv (Join-Path $BUILD_ROOT "results_lsf1.csv")
$lsf2 = Import-Csv (Join-Path $BUILD_ROOT "results_lsf2.csv")

$results = foreach ($one in ($lsf1 | Where-Object Status -eq "PASS")) {
  $two = $lsf2 | Where-Object Benchmark -eq $one.Benchmark
  $sources = Get-ChildItem -LiteralPath (Join-Path $SOURCE_ROOT $one.Benchmark) `
    -Filter *.c
  $match = Select-String -Path $sources.FullName `
    -Pattern '^#define\s+LOCAL_SCALE_FACTOR\s+(\d+)' | Select-Object -First 1
  if (-not $match) { throw "Missing LOCAL_SCALE_FACTOR for $($one.Benchmark)" }

  $officialLsf = [int]$match.Matches[0].Groups[1].Value
  $cycles1 = [long]$one.TimedCycles
  $cycles2 = [long]$two.TimedCycles
  $cyclesPerLoop = $cycles2 - $cycles1
  $estimatedCycles = $cycles1 + ($officialLsf - 1) * $cyclesPerLoop
  $timeMs = $estimatedCycles / ($ClockMHz * 1000.0)
  $score = [double]$baseline.($one.Benchmark) / $timeMs

  [pscustomobject]@{
    Benchmark = $one.Benchmark
    Method = "LSF1/2 extrapolated"
    OfficialLSF = $officialLsf
    EstimatedCycles = $estimatedCycles
    TimeMs = $timeMs
    Score = $score
    ScorePerMHz = $score / $ClockMHz
  }
}

$xgboostTimeMs = $XgboostCycles / ($ClockMHz * 1000.0)
$xgboostScore = [double]$baseline.xgboost / $xgboostTimeMs
$results += [pscustomobject]@{
  Benchmark = "xgboost"
  Method = "measured with sim-only 48 KiB RAM"
  OfficialLSF = 1
  EstimatedCycles = $XgboostCycles
  TimeMs = $xgboostTimeMs
  Score = $xgboostScore
  ScorePerMHz = $xgboostScore / $ClockMHz
}

$scoreGeomean = [Math]::Exp((($results | ForEach-Object {
  [Math]::Log([double]$_.Score)
} | Measure-Object -Average).Average))

$results | Export-Csv -NoTypeInformation -Encoding utf8 `
  (Join-Path $BUILD_ROOT "estimated_score_19.csv")
$results | Format-Table Benchmark,Method,OfficialLSF,EstimatedCycles,TimeMs,Score,ScorePerMHz -AutoSize
Write-Host ""
Write-Host ("Estimated Embench-IoT score @ {0} MHz : {1:F3}" -f $ClockMHz, $scoreGeomean)
Write-Host ("Estimated Embench-IoT score/MHz      : {0:F4}" -f ($scoreGeomean / $ClockMHz))
Write-Host "This is a 19-item RTL estimate, not an official measured submission."
