param(
  [ValidateRange(1, 1000)]
  [int]$ScaleFactor = 1,
  [ValidateRange(0, 1000000)]
  [int]$LocalScaleOverride = 0
)

$EMBENCH_ROOT = $PSScriptRoot
$PROJECT_ROOT = Split-Path -Parent (Split-Path -Parent $EMBENCH_ROOT)
$SOURCE_ROOT = Join-Path $EMBENCH_ROOT "official\src"
$SUPPORT_ROOT = Join-Path $EMBENCH_ROOT "official\support"
$PORT_ROOT = Join-Path $EMBENCH_ROOT "port"
$BUILD_ROOT = Join-Path $EMBENCH_ROOT "build"

New-Item -ItemType Directory -Force -Path $BUILD_ROOT | Out-Null
$results = @()

foreach ($benchmarkDir in (Get-ChildItem -LiteralPath $SOURCE_ROOT -Directory | Sort-Object Name)) {
  $name = $benchmarkDir.Name
  $outputDir = Join-Path $BUILD_ROOT $name
  New-Item -ItemType Directory -Force -Path $outputDir | Out-Null

  $elf = Join-Path $outputDir "$name.elf"
  $map = Join-Path $outputDir "$name.map"
  $benchmarkSources = @(Get-ChildItem -LiteralPath $benchmarkDir.FullName -Filter *.c |
    ForEach-Object FullName)
  if ($LocalScaleOverride -gt 0) {
    $generatedSourceDir = Join-Path $outputDir "generated-src"
    New-Item -ItemType Directory -Force -Path $generatedSourceDir | Out-Null
    $generatedSources = @()
    foreach ($source in $benchmarkSources) {
      $generatedSource = Join-Path $generatedSourceDir (Split-Path -Leaf $source)
      $sourceText = [System.IO.File]::ReadAllText($source)
      $sourceText = [regex]::Replace(
        $sourceText,
        '(?m)^#define\s+LOCAL_SCALE_FACTOR\s+[^\r\n]+',
        "#define LOCAL_SCALE_FACTOR $LocalScaleOverride"
      )
      [System.IO.File]::WriteAllText($generatedSource, $sourceText)
      $generatedSources += $generatedSource
    }
    $benchmarkSources = $generatedSources
  }

  $sources = @(
    (Join-Path $PORT_ROOT "start.S"),
    (Join-Path $PORT_ROOT "main.c"),
    (Join-Path $PORT_ROOT "libc.c"),
    (Join-Path $SUPPORT_ROOT "beebsc.c")
  ) + $benchmarkSources

  $arguments = @(
    "-march=rv32i", "-mabi=ilp32", "-O2", "-std=gnu11", "-mstrict-align",
    "-msmall-data-limit=0", "-ffreestanding", "-fno-builtin",
    "-fno-tree-loop-distribute-patterns", "-ffunction-sections",
    "-fdata-sections", "-nostdlib", "-nostartfiles",
    "-DGLOBAL_SCALE_FACTOR=$ScaleFactor", "-DWARMUP_HEAT=0",
    "-I$PORT_ROOT", "-I$SUPPORT_ROOT", "-I$($benchmarkDir.FullName)",
    "-T$PORT_ROOT\link.ld"
  ) + $sources + @(
    "-Wl,--gc-sections", "-Wl,--no-check-sections", "-Wl,-Map=$map",
    "-lm", "-lgcc", "-o", $elf
  )

  $compilerOutput = & riscv-none-elf-gcc @arguments 2>&1
  if ($LASTEXITCODE -ne 0) {
    Write-Host "BUILD FAIL: $name"
    $compilerOutput | ForEach-Object { Write-Host "  $_" }
    $results += [pscustomobject]@{
      Benchmark = $name; Status = "BUILD_FAIL"; TextBytes = 0; DataBytes = 0
    }
    continue
  }

  $textBin = Join-Path $outputDir "text.bin"
  $dataBin = Join-Path $outputDir "data.bin"
  & riscv-none-elf-objcopy -O binary --only-section=.text $elf $textBin
  if ($LASTEXITCODE -ne 0) { throw "objcopy text failed for $name" }
  & riscv-none-elf-objcopy -O binary --only-section=.rodata --only-section=.data $elf $dataBin
  if ($LASTEXITCODE -ne 0) { throw "objcopy data failed for $name" }
  & riscv-none-elf-objdump -d $elf | Out-File -Encoding ascii (Join-Path $outputDir "$name.asm")
  if ($LASTEXITCODE -ne 0) { throw "objdump failed for $name" }
  python "$EMBENCH_ROOT\bin2hex.py" $outputDir
  if ($LASTEXITCODE -ne 0) { throw "hex conversion failed for $name" }

  $textBytes = (Get-Item -LiteralPath $textBin).Length
  $dataBytes = (Get-Item -LiteralPath $dataBin).Length
  Write-Host ("BUILD OK  : {0,-16} text={1,6} data_init={2,6}" -f `
              $name, $textBytes, $dataBytes)
  $results += [pscustomobject]@{
    Benchmark = $name; Status = "OK"; TextBytes = $textBytes; DataBytes = $dataBytes
  }
}

$results | Export-Csv -NoTypeInformation -Encoding utf8 `
  (Join-Path $BUILD_ROOT "build_summary.csv")

if (($results | Where-Object Status -eq "OK").Count -eq 0) { exit 1 }
exit 0
