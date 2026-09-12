param(
  [ValidateRange(1, 10000000)]
  [int]$Iterations = 10000
)

$DHRY_ROOT = $PSScriptRoot
$DHRY_BUILD = Join-Path $DHRY_ROOT "build"
$DHRY_SOURCE = Join-Path $DHRY_ROOT "source"

New-Item -ItemType Directory -Force -Path $DHRY_BUILD | Out-Null

riscv-none-elf-gcc `
  -march=rv32i `
  -mabi=ilp32 `
  -O2 `
  -std=gnu89 `
  -mstrict-align `
  -msmall-data-limit=0 `
  -ffreestanding `
  -fno-builtin `
  -nostdlib `
  -nostartfiles `
  -DTIME `
  -DREG=register `
  "-DDHRY_ITERS=$Iterations" `
  -I "$DHRY_SOURCE" `
  -T "$DHRY_ROOT\link.ld" `
  "$DHRY_ROOT\start.S" `
  "$DHRY_ROOT\port.c" `
  "$DHRY_SOURCE\dhry_1.c" `
  "$DHRY_SOURCE\dhry_2.c" `
  -lgcc `
  "-Wl,-Map=$DHRY_BUILD\dhrystone.map" `
  -o "$DHRY_BUILD\dhrystone.elf"
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

riscv-none-elf-objcopy -O binary --only-section=.text `
  "$DHRY_BUILD\dhrystone.elf" "$DHRY_BUILD\dhrystone_text.bin"
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

riscv-none-elf-objcopy -O binary --only-section=.rodata --only-section=.data `
  "$DHRY_BUILD\dhrystone.elf" "$DHRY_BUILD\dhrystone_data.bin"
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

riscv-none-elf-objdump -d -S "$DHRY_BUILD\dhrystone.elf" `
  > "$DHRY_BUILD\dhrystone.asm"
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

riscv-none-elf-size -A "$DHRY_BUILD\dhrystone.elf"
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

python "$DHRY_ROOT\bin2hex.py"
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
