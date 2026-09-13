#include <stdint.h>

/* The last two words of the 32 KiB data RAM are a commit record for TB/ILA. */
#define SIGNATURE_ADDR  0x00007ff8u
#define PASS_SIGNATURE  0x600dcafeu
#define FAIL_SIGNATURE  0xdead0001u
#define RUN_SIGNATURE   0x454d0000u

#define GUARD0_ADDR     0x00001000u
#define GUARD1_ADDR     0x00001004u
#define GUARD0_VALUE    0x13579bdfu
#define GUARD1_VALUE    0x89abcdefu
#define FAULT_RD_VALUE  0x2468ace0u

enum {
    CAUSE_INST_MISALIGNED  = 0,
    CAUSE_ILLEGAL_INST     = 2,
    CAUSE_BREAKPOINT       = 3,
    CAUSE_LOAD_MISALIGNED  = 4,
    CAUSE_STORE_MISALIGNED = 6,
    CAUSE_ECALL_M          = 11
};

#define TRAP_TYPES      6u
#define TRAP_TEST_COUNT 12u

/* These symbols sit on the actual faulting instructions.  Comparing mepc
 * against them catches an off-by-one-stage PC bug, not merely bad alignment. */
extern const unsigned char trap_site_ecall[];
extern const unsigned char trap_site_ebreak[];
extern const unsigned char trap_site_illegal[];
extern const unsigned char trap_site_load_misaligned[];
extern const unsigned char trap_site_store_misaligned[];
extern const unsigned char trap_site_inst_misaligned[];

/* Keep all logs in .bss; this SoC has no .data copy-down path yet. */
volatile uint32_t trap_count;
volatile uint32_t trap_causes[TRAP_TEST_COUNT];
volatile uint32_t trap_epcs[TRAP_TEST_COUNT];
volatile uint32_t trap_mstatus[TRAP_TEST_COUNT];
volatile uint32_t load_fault_rd;
volatile uint32_t jump_fault_rd;

static inline uint32_t read_mstatus(void)
{
    uint32_t value;
    __asm__ volatile ("csrr %0, mstatus" : "=r"(value));
    return value;
}

static uint32_t expected_cause(uint32_t index)
{
    if (index >= TRAP_TYPES)
        index -= TRAP_TYPES;

    switch (index) {
    case 0u: return CAUSE_ECALL_M;
    case 1u: return CAUSE_BREAKPOINT;
    case 2u: return CAUSE_ILLEGAL_INST;
    case 3u: return CAUSE_LOAD_MISALIGNED;
    case 4u: return CAUSE_STORE_MISALIGNED;
    default: return CAUSE_INST_MISALIGNED;
    }
}

static uint32_t expected_epc(uint32_t index)
{
    if (index >= TRAP_TYPES)
        index -= TRAP_TYPES;

    switch (index) {
    case 0u: return (uint32_t)(uintptr_t)trap_site_ecall;
    case 1u: return (uint32_t)(uintptr_t)trap_site_ebreak;
    case 2u: return (uint32_t)(uintptr_t)trap_site_illegal;
    case 3u: return (uint32_t)(uintptr_t)trap_site_load_misaligned;
    case 4u: return (uint32_t)(uintptr_t)trap_site_store_misaligned;
    default: return (uint32_t)(uintptr_t)trap_site_inst_misaligned;
    }
}

/* trap_entry.S passes mcause/mepc here and writes this return value to mepc. */
uint32_t trap_handler(uint32_t cause, uint32_t epc)
{
    uint32_t index = trap_count;

    if (index < TRAP_TEST_COUNT) {
        trap_causes[index] = cause;
        trap_epcs[index] = epc;
        trap_mstatus[index] = read_mstatus();
    }
    trap_count = index + 1u;
    return epc + 4u;
}

static __attribute__((noinline)) void trigger_ecall(void)
{
    __asm__ volatile (
        ".global trap_site_ecall\n"
        "trap_site_ecall:\n"
        "ecall\n" ::: "memory");
}

static __attribute__((noinline)) void trigger_ebreak(void)
{
    __asm__ volatile (
        ".global trap_site_ebreak\n"
        "trap_site_ebreak:\n"
        "ebreak\n" ::: "memory");
}

static __attribute__((noinline)) void trigger_illegal(void)
{
    __asm__ volatile (
        ".global trap_site_illegal\n"
        "trap_site_illegal:\n"
        ".word 0xffffffff\n" ::: "memory");
}

static __attribute__((noinline)) void trigger_load_misaligned(void)
{
    uint32_t observed;

    /* Also verify that the faulting load never writes its destination. */
    __asm__ volatile (
        "li t0, 0x2468ace0\n"
        "li t1, 0x00001001\n"
        ".global trap_site_load_misaligned\n"
        "trap_site_load_misaligned:\n"
        "lw t0, 0(t1)\n"
        "mv %0, t0\n"
        : "=r"(observed) : : "t0", "t1", "memory");
    load_fault_rd = observed;
}

static __attribute__((noinline)) void trigger_store_misaligned(void)
{
    __asm__ volatile (
        "li t0, 0xa5a55a5a\n"
        "li t1, 0x00001002\n"
        ".global trap_site_store_misaligned\n"
        "trap_site_store_misaligned:\n"
        "sw t0, 0(t1)\n" ::: "t0", "t1", "memory");
}

static __attribute__((noinline)) void trigger_inst_misaligned(void)
{
    uint32_t observed;

    /* jal t0,+2 has a misaligned target.  It must not write its link rd. */
    __asm__ volatile (
        "li t0, 0x2468ace0\n"
        ".global trap_site_inst_misaligned\n"
        "trap_site_inst_misaligned:\n"
        ".word 0x002002ef\n"
        "mv %0, t0\n"
        : "=r"(observed) : : "t0", "memory");
    jump_fault_rd = observed;
}

static __attribute__((noinline)) uint32_t exercise_normal_state(void)
{
    volatile uint32_t data[8];
    uint32_t i;
    uint32_t sum = 0u;

    for (i = 0u; i < 8u; ++i) {
        data[i] = (i * 3u) + 1u;
        sum += data[i];
    }

    for (i = 0u; i < 4u; ++i) {
        uint32_t tmp = data[i];
        data[i] = data[7u - i];
        data[7u - i] = tmp;
    }

    return (sum == 92u && data[0] == 22u && data[7] == 1u) ? 1u : 0u;
}

int main(void)
{
    volatile uint32_t *signature = (volatile uint32_t *)SIGNATURE_ADDR;
    volatile uint32_t *guard0 = (volatile uint32_t *)GUARD0_ADDR;
    volatile uint32_t *guard1 = (volatile uint32_t *)GUARD1_ADDR;
    uint32_t i;
    uint32_t fail_code = 0xffffffffu;
    uint32_t normal_ok;
    uint32_t first_group_status;
    uint32_t second_group_status;

    signature[0] = RUN_SIGNATURE;
    signature[1] = 0u;
    *guard0 = GUARD0_VALUE;
    *guard1 = GUARD1_VALUE;
    normal_ok = exercise_normal_state();

    /* Group 1 enters with MIE=1; handler should see MIE=0/MPIE=1. */
    __asm__ volatile ("csrsi mstatus, 8" ::: "memory");
    trigger_ecall();
    trigger_ebreak();
    trigger_illegal();
    trigger_load_misaligned();
    trigger_store_misaligned();
    trigger_inst_misaligned();
    /* Give the final mret/redirect time to retire before the CSR read. */
    __asm__ volatile ("nop\n nop\n nop" ::: "memory");
    first_group_status = read_mstatus();

    /* Group 2 enters with MIE=0; handler should see both bits cleared. */
    __asm__ volatile ("csrci mstatus, 8" ::: "memory");
    trigger_ecall();
    trigger_ebreak();
    trigger_illegal();
    trigger_load_misaligned();
    trigger_store_misaligned();
    trigger_inst_misaligned();
    __asm__ volatile ("nop\n nop\n nop" ::: "memory");
    second_group_status = read_mstatus();

    if (normal_ok == 0u)
        fail_code = 0x300u;
    if (trap_count != TRAP_TEST_COUNT && fail_code == 0xffffffffu)
        fail_code = 0x100u | trap_count;
    if (*guard0 != GUARD0_VALUE && fail_code == 0xffffffffu)
        fail_code = 0x200u;
    if (*guard1 != GUARD1_VALUE && fail_code == 0xffffffffu)
        fail_code = 0x201u;
    if (load_fault_rd != FAULT_RD_VALUE && fail_code == 0xffffffffu)
        fail_code = 0x700u;
    if (jump_fault_rd != FAULT_RD_VALUE && fail_code == 0xffffffffu)
        fail_code = 0x701u;
    if (first_group_status != 0x00000088u && fail_code == 0xffffffffu)
        fail_code = 0x600u;
    if (second_group_status != 0x00000080u && fail_code == 0xffffffffu)
        fail_code = 0x601u;

    for (i = 0u; i < TRAP_TEST_COUNT; ++i) {
        uint32_t expected_status = (i < TRAP_TYPES) ? 0x80u : 0u;

        if ((trap_causes[i] != expected_cause(i) ||
             trap_epcs[i] != expected_epc(i)) &&
            fail_code == 0xffffffffu)
            fail_code = 0x400u | i;

        if (trap_mstatus[i] != expected_status &&
            fail_code == 0xffffffffu)
            fail_code = 0x500u | i;
    }

    /* Commit protocol: detail first, marker last. */
    if (fail_code == 0xffffffffu) {
        signature[1] = trap_count;
        signature[0] = PASS_SIGNATURE;
    } else {
        signature[1] = fail_code;
        signature[0] = FAIL_SIGNATURE;
    }

    while (1)
        __asm__ volatile ("nop");
}
