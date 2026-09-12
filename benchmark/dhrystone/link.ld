OUTPUT_ARCH(riscv)
ENTRY(_start)

MEMORY
{
    ROM  (rx)  : ORIGIN = 0x00000000, LENGTH = 32K
    DATA (rwx) : ORIGIN = 0x00003000, LENGTH = 0x4000
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

    PROVIDE(__stack_bottom = 0x00007000);
    PROVIDE(__stack_top = 0x00007f00);

    ASSERT(SIZEOF(.text) <= LENGTH(ROM),
           "Dhrystone exceeds the 32 KiB instruction pROM")
    ASSERT(__bss_end <= __stack_bottom,
           "Dhrystone data overlaps the reserved stack")
}
