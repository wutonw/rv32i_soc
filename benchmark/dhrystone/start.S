.section .text.start
.globl _start

_start:
    la sp, __stack_top

    la t0, __bss_start
    la t1, __bss_end
.Lclear_bss:
    bgeu t0, t1, .Lbss_done
    sw zero, 0(t0)
    addi t0, t0, 4
    j .Lclear_bss

.Lbss_done:
    call dhry_port_init
    call main

.Lhang:
    j .Lhang
