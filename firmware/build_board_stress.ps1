$ROOT = $PSScriptRoot
$BUILD = Join-Path $ROOT "build"

New-Item -ItemType Directory -Force -Path $BUILD | Out-Null

riscv-none-elf-gcc `
  -march=rv32i_zicsr `
  -mabi=ilp32 `
  -nostdlib `
  -nostartfiles `
  "-Wl,--no-relax" `
  "-Wl,-Ttext=0" `
  "-Wl,-e,_start" `
  (Join-Path $ROOT "board_stress.S") `
  -o (Join-Path $BUILD "board_stress.elf")
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

riscv-none-elf-objcopy -O binary `
  (Join-Path $BUILD "board_stress.elf") `
  (Join-Path $BUILD "board_stress.bin")
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

python -c "import sys; from pathlib import Path; sys.path.insert(0, sys.argv[1]); from bin2hex import bin_to_hex; bin_to_hex(Path(sys.argv[2]), Path(sys.argv[3]))" `
  $ROOT `
  (Join-Path $BUILD "board_stress.bin") `
  (Join-Path $ROOT "board_stress.hex")
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

riscv-none-elf-nm -n (Join-Path $BUILD "board_stress.elf") |
  Select-String ' (loop|fail)$'
