OUTPUT_ARCH(riscv)
ENTRY(_start)

/* Simulation-only layout used to estimate xgboost on a 48 KiB data RAM. */
MEMORY
{
    ROM  (rx)  : ORIGIN = 0x00000000, LENGTH = 32K
    DATA (rwx) : ORIGIN = 0x00001000, LENGTH = 0xA000
}

SECTIONS
{
    .text ORIGIN(ROM) : ALIGN(4)
    {
        KEEP(*(.text.start))
        *(.text*)
    } > ROM

    .rodata ORIGIN(DATA) : ALIGN(4)
    {
        *(.rodata*)
    } > DATA

    .data : ALIGN(4)
    {
        __data_start = .;
        *(.data*)
        *(.sdata*)
        __data_end = .;
    } > DATA

    .bss (NOLOAD) : ALIGN(4)
    {
        __bss_start = .;
        *(.bss*)
        *(COMMON)
        *(.sbss*)
        __bss_end = .;
    } > DATA

    PROVIDE(__stack_bottom = 0x0000B000);
    PROVIDE(__stack_top = 0x0000BF00);

    ASSERT(SIZEOF(.text) <= LENGTH(ROM), "program exceeds instruction ROM")
    ASSERT(__bss_end <= __stack_bottom, "data overlaps simulation stack")
}
