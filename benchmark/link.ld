OUTPUT_ARCH(riscv)
ENTRY(_start)

MEMORY
{
    ROM (rx)  : ORIGIN = 0x00000000, LENGTH = 4K
    RAM (rwx) : ORIGIN = 0x00000000, LENGTH = 32K
}

SECTIONS
{
    .text ORIGIN(ROM) : ALIGN(4)
    {
        KEEP(*(.text.start))
        *(.text*)
    } > ROM

    .rodata : ALIGN(4)
    {
        *(.rodata*)
    } > ROM

    .data ORIGIN(RAM) : ALIGN(4)
    {
        __data_start = .;
        *(.data*)
        *(.sdata*)
        __data_end = .;
    } > RAM

    .bss (NOLOAD) : ALIGN(4)
    {
        __bss_start = .;
        *(.bss*)
        *(COMMON)
        *(.sbss*)
        __bss_end = .;
    } > RAM

    PROVIDE(__stack_bottom = 0x00007000);
    PROVIDE(__stack_top = 0x00007f00);

    ASSERT(SIZEOF(.text) + SIZEOF(.rodata) <= LENGTH(ROM),
           "benchmark exceeds the 4 KiB instruction pROM")
    ASSERT(__bss_end <= __stack_bottom,
           "benchmark data overlaps the reserved stack")
    ASSERT(SIZEOF(.data) == 0,
           "initialized .data is unsupported by the current Harvard memory map")
}
