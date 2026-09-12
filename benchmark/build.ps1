$BENCH_ROOT = $PSScriptRoot
$BENCH_BUILD = Join-Path $BENCH_ROOT "build"

New-Item -ItemType Directory -Force -Path $BENCH_BUILD | Out-Null

riscv-none-elf-gcc `
  -march=rv32i `
  -mabi=ilp32 `
  -Os `
  -msmall-data-limit=0 `
  -ffreestanding `
  -fno-builtin `
  -fno-tree-loop-distribute-patterns `
  -nostdlib `
  -nostartfiles `
  -T "$BENCH_ROOT\link.ld" `
  "$BENCH_ROOT\start.S" "$BENCH_ROOT\main.c" `
  "-Wl,-Map=$BENCH_BUILD\benchmark.map" `
  -o "$BENCH_BUILD\benchmark.elf"

if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

riscv-none-elf-objcopy -O binary `
  --only-section=.text --only-section=.rodata `
  "$BENCH_BUILD\benchmark.elf" "$BENCH_BUILD\benchmark.bin"
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

riscv-none-elf-objdump -d -S "$BENCH_BUILD\benchmark.elf" `
  > "$BENCH_BUILD\benchmark.asm"
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

riscv-none-elf-size "$BENCH_BUILD\benchmark.elf"
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

python "$BENCH_ROOT\bin2hex.py"
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
