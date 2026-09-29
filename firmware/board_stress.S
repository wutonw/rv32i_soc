    .option norvc
    .option norelax
    .section .text
    .globl _start
    .globl fail

_start:
    li      s0, 0
    li      s1, 1
    li      s4, 0x13579bdf
    li      s5, 0x100           # Data RAM scratch area
    la      t0, fail
    csrw    mtvec, t0           # Unexpected trap also lights the LED
    li      a0, 0
    li      s6, 0

loop:
    # Fibonacci recurrence and independent algebraic checks.
    add     s2, s0, s1
    sub     s3, s2, s1
    bne     s3, s0, fail
    xor     t0, s2, s0
    xor     t0, t0, s0
    bne     t0, s2, fail
    and     t0, s2, s0
    or      t1, s2, s0
    xor     t1, t1, t0
    xor     t0, s2, s0
    bne     t0, t1, fail

    # Signed/unsigned byte, halfword and word paths.
    sw      s2, 0(s5)
    lw      t0, 0(s5)
    bne     t0, s2, fail
    sb      s2, 4(s5)
    lbu     t0, 4(s5)
    andi    t1, s2, 255
    bne     t0, t1, fail
    li      t1, -1
    sb      t1, 5(s5)
    lb      t0, 5(s5)
    bne     t0, t1, fail
    sh      s2, 6(s5)
    lhu     t0, 6(s5)
    slli    t1, s2, 16
    srli    t1, t1, 16
    bne     t0, t1, fail
    li      t1, -2
    sh      t1, 8(s5)
    lh      t0, 8(s5)
    bne     t0, t1, fail

    # All base integer ALU families, including both shift forms.
    li      t2, -16
    li      t3, 3
    add     t4, t2, t3
    addi    t5, t2, 3
    bne     t4, t5, fail
    sub     t4, t3, t2
    li      t5, 19
    bne     t4, t5, fail
    sll     t4, t3, t3
    slli    t5, t3, 3
    bne     t4, t5, fail
    srl     t4, t2, t3
    srli    t5, t2, 3
    bne     t4, t5, fail
    sra     t4, t2, t3
    srai    t5, t2, 3
    bne     t4, t5, fail
    slt     t4, t2, t3
    slti    t5, t2, 3
    bne     t4, t5, fail
    sltu    t4, t2, t3
    sltiu   t5, t2, 3
    bne     t4, t5, fail
    xor     t4, t3, t3
    xori    t5, t3, 3
    bne     t4, t5, fail
    and     t4, t3, t3
    andi    t5, t3, 3
    bne     t4, t5, fail
    or      t4, t3, zero
    ori     t5, zero, 3
    bne     t4, t5, fail

    # Both taken and not-taken paths of each branch comparison.
    beq     t3, t3, 1f
    j       fail
1:  bne     t3, t3, fail
    blt     t2, t3, 2f
    j       fail
2:  bge     t2, t3, fail
    bltu    t3, t2, 3f
    j       fail
3:  bgeu    t3, t2, fail

    # AUIPC, JAL link and JALR return.
    auipc   t0, 0
    addi    t1, t0, 8
    auipc   t2, 0
    bne     t1, t2, fail
    jal     ra, subroutine
    addi    t0, a0, -1
    bne     t0, s6, fail
    mv      s6, a0

    # Back-to-back CSR operations and CSR read-after-write forwarding.
    li      t0, 0x15
    csrrw   t1, mie, t0
    csrrs   t2, mie, zero
    bne     t2, t0, fail
    csrrc   t2, mie, t0
    bne     t2, t0, fail
    csrrwi  t2, mie, 7
    csrrsi  t2, mie, 8
    csrrci  t2, mie, 1
    csrrs   t2, mie, zero
    li      t3, 14
    bne     t2, t3, fail
    csrrw   zero, mie, zero

    # Evolving data prevents the workload from becoming a constant pattern.
    slli    t0, s4, 13
    xor     s4, s4, t0
    srli    t0, s4, 17
    xor     s4, s4, t0
    slli    t0, s4, 5
    xor     s4, s4, t0
    sw      s4, 12(s5)
    lw      t0, 12(s5)
    bne     t0, s4, fail

    # Sweep nearly all 32 KiB of data RAM with a changing xorshift stream.
    # Save the seed, then regenerate the same stream while reading it back.
    mv      s7, s4
    mv      t2, s7
    li      t0, 0x200
    li      t3, 0x8000
ram_fill:
    slli    t1, t2, 13
    xor     t2, t2, t1
    srli    t1, t2, 17
    xor     t2, t2, t1
    slli    t1, t2, 5
    xor     t2, t2, t1
    sw      t2, 0(t0)
    addi    t0, t0, 4
    bltu    t0, t3, ram_fill

    mv      s4, t2
    mv      t2, s7
    li      t0, 0x200
ram_check:
    slli    t1, t2, 13
    xor     t2, t2, t1
    srli    t1, t2, 17
    xor     t2, t2, t1
    slli    t1, t2, 5
    xor     t2, t2, t1
    lw      t4, 0(t0)
    bne     t4, t2, fail
    addi    t0, t0, 4
    bltu    t0, t3, ram_check

    mv      s0, s1
    mv      s1, s2
    j       loop

subroutine:
    addi    a0, a0, 1
    jalr    zero, 0(ra)

fail:
    j       fail
