#include <stdint.h>

#define SIGNATURE_ADDR    0x00007ff8u
#define RESULT_ADDR       0x00007ffcu
#define RUNNING_SIGNATURE 0x12345678u
#define PASS_SIGNATURE    0x600dcafeu
#define FAIL_SIGNATURE    0xdead0001u
#define EXPECTED_RESULT   0xdfbb2e2fu
#define ITERATIONS        256u

static uint32_t rotl32(uint32_t value, uint32_t amount)
{
    amount &= 31u;
    return (value << amount) | (value >> ((32u - amount) & 31u));
}

/*
 * Small CoreMark-style integer kernel for the current RV32I core.  It is not
 * an official CoreMark score: it deliberately avoids libc, multiplication,
 * timers and initialized data so it fits the present Harvard memory system.
 * Volatile scratch memory prevents the compiler from folding the workload.
 */
static uint32_t run_kernel(void)
{
    volatile uint32_t scratch[32];
    uint32_t state = 0x12345678u;
    uint32_t acc = 0x9e3779b9u;
    uint32_t i;

    for (i = 0u; i < 32u; ++i)
        scratch[i] = 0x13579bdfu ^ (i << 16) ^ (i << 3) ^ i;

    for (i = 0u; i < ITERATIONS; ++i) {
        uint32_t index;
        uint32_t value;

        state ^= state << 13;
        state ^= state >> 17;
        state ^= state << 5;

        index = state & 31u;
        value = scratch[index];

        if (state & 1u) {
            value += state ^ acc;
            acc ^= rotl32(value, state & 15u);
        } else {
            value ^= state + acc;
            acc += rotl32(value, (state >> 27) + 1u);
        }

        scratch[index] = value;
        acc ^= scratch[(index + 7u) & 31u];
    }

    acc ^= state;
    for (i = 0u; i < 32u; ++i) {
        acc = rotl32(acc, 3u);
        acc ^= scratch[i];
    }

    return acc;
}

int main(void)
{
    volatile uint32_t *signature = (volatile uint32_t *)SIGNATURE_ADDR;
    volatile uint32_t *result = (volatile uint32_t *)RESULT_ADDR;
    uint32_t checksum;

    signature[0] = RUNNING_SIGNATURE;
    result[0] = 0u;

    checksum = run_kernel();
    result[0] = checksum;
    signature[0] = (checksum == EXPECTED_RESULT) ?
                   PASS_SIGNATURE : FAIL_SIGNATURE;

    while (1) {
        __asm__ volatile ("nop");
    }
}
