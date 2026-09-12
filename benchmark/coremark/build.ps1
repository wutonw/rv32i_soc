param(
  [ValidateRange(1, 1000000)]
  [int]$Iterations = 1
)

$COREMARK_ROOT = $PSScriptRoot
$COREMARK_BUILD = Join-Path $COREMARK_ROOT "build"
$OFFICIAL = Join-Path $COREMARK_ROOT "official"

New-Item -ItemType Directory -Force -Path $COREMARK_BUILD | Out-Null

riscv-none-elf-gcc `
  -march=rv32i `
  -mabi=ilp32 `
  -O2 `
  -mstrict-align `
  -msmall-data-limit=0 `
  -ffreestanding `
  -fno-builtin `
  -fno-tree-loop-distribute-patterns `
  -nostdlib `
  -nostartfiles `
  "-DITERATIONS=$Iterations" `
  -DPERFORMANCE_RUN=1 `
  -DTOTAL_DATA_SIZE=2000 `
  -I "$COREMARK_ROOT" `
  -I "$OFFICIAL" `
  -T "$COREMARK_ROOT\link.ld" `
  "$COREMARK_ROOT\start.S" `
  "$COREMARK_ROOT\core_portme.c" `
  "$OFFICIAL\core_main.c" `
  "$OFFICIAL\core_list_join.c" `
  "$OFFICIAL\core_matrix.c" `
  "$OFFICIAL\core_state.c" `
  "$OFFICIAL\core_util.c" `
  -lgcc `
  "-Wl,-Map=$COREMARK_BUILD\coremark.map" `
  -o "$COREMARK_BUILD\coremark.elf"
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

riscv-none-elf-objcopy -O binary --only-section=.text `
  "$COREMARK_BUILD\coremark.elf" "$COREMARK_BUILD\coremark_text.bin"
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

riscv-none-elf-objcopy -O binary --only-section=.rodata --only-section=.data `
  "$COREMARK_BUILD\coremark.elf" "$COREMARK_BUILD\coremark_data.bin"
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

riscv-none-elf-objdump -d -S "$COREMARK_BUILD\coremark.elf" `
  > "$COREMARK_BUILD\coremark.asm"
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

riscv-none-elf-size -A "$COREMARK_BUILD\coremark.elf"
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

python "$COREMARK_ROOT\bin2hex.py"
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
