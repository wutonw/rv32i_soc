param(
  [ValidateRange(10000, 2000000000)]
  [long]$MaxCycles = 20000000
)

$EMBENCH_ROOT = $PSScriptRoot
$PROJECT_ROOT = Split-Path -Parent (Split-Path -Parent $EMBENCH_ROOT)
$PORT_ROOT = Join-Path $EMBENCH_ROOT "port"
$SUPPORT_ROOT = Join-Path $EMBENCH_ROOT "official\support"
$SOURCE_ROOT = Join-Path $EMBENCH_ROOT "official\src\xgboost"
$OUTPUT_ROOT = Join-Path $EMBENCH_ROOT "build\xgboost-sim48k"
New-Item -ItemType Directory -Force -Path $OUTPUT_ROOT | Out-Null

$elf = Join-Path $OUTPUT_ROOT "xgboost.elf"
$map = Join-Path $OUTPUT_ROOT "xgboost.map"
$sources = @(
  (Join-Path $PORT_ROOT "start.S"),
  (Join-Path $PORT_ROOT "main.c"),
  (Join-Path $PORT_ROOT "libc.c"),
  (Join-Path $SUPPORT_ROOT "beebsc.c")
) + @(Get-ChildItem -LiteralPath $SOURCE_ROOT -Filter *.c | ForEach-Object FullName)

$arguments = @(
  "-march=rv32i", "-mabi=ilp32", "-O2", "-std=gnu11", "-mstrict-align",
  "-msmall-data-limit=0", "-ffreestanding", "-fno-builtin",
  "-fno-tree-loop-distribute-patterns", "-ffunction-sections", "-fdata-sections",
  "-nostdlib", "-nostartfiles", "-DGLOBAL_SCALE_FACTOR=1", "-DWARMUP_HEAT=0",
  "-DRESULT_ADDR=0x0000BFECu", "-DTIME_ADDR=0x0000BFF4u",
  "-DSIGNATURE_ADDR=0x0000BFF8u", "-I$PORT_ROOT", "-I$SUPPORT_ROOT",
  "-I$SOURCE_ROOT", "-T$PORT_ROOT\link_48k.ld"
) + $sources + @(
  "-Wl,--gc-sections", "-Wl,--no-check-sections", "-Wl,-Map=$map",
  "-lm", "-lgcc", "-o", $elf
)

& riscv-none-elf-gcc @arguments
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
& riscv-none-elf-objcopy -O binary --only-section=.text $elf `
  (Join-Path $OUTPUT_ROOT "text.bin")
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
& riscv-none-elf-objcopy -O binary --only-section=.rodata --only-section=.data `
  $elf (Join-Path $OUTPUT_ROOT "data.bin")
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
python "$EMBENCH_ROOT\bin2hex.py" $OUTPUT_ROOT --data-words 10240
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

Push-Location $PROJECT_ROOT
try {
  iverilog -g2012 -Wall -I src -s embench_tb `
    -P "embench_tb.RAM_WORDS=12288" `
    -P "embench_tb.DATA_LAST=11263" `
    -P "embench_tb.RESULT_INDEX=12283" `
    -P "embench_tb.TIME_INDEX=12285" `
    -P "embench_tb.SIG_INDEX=12286" `
    -o benchmark\embench\build\xgboost-sim48k\xgboost_tb.vvp `
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
    benchmark\embench\ram_48k_sim.v `
    benchmark\embench\embench_tb.v
  if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

  vvp benchmark\embench\build\xgboost-sim48k\xgboost_tb.vvp `
    "+TEXT=benchmark\embench\build\xgboost-sim48k\text.hex" `
    "+DATA=benchmark\embench\build\xgboost-sim48k\data.hex" `
    "+NAME=xgboost" "+MAX_CYCLES=$MaxCycles"
  exit $LASTEXITCODE
}
finally {
  Pop-Location
}
