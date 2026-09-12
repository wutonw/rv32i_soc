#include "support.h"

#ifndef RESULT_ADDR
#define RESULT_ADDR     0x00007fecu
#endif
#ifndef TIME_ADDR
#define TIME_ADDR       0x00007ff4u
#endif
#ifndef SIGNATURE_ADDR
#define SIGNATURE_ADDR  0x00007ff8u
#endif
#define RUNNING_MARKER  0x454d0000u
#define START_MARKER    0x454d0001u
#define STOP_MARKER     0x454d0002u
#define PASS_SIGNATURE  0x600dcafeu
#define FAIL_SIGNATURE  0xdead0001u

static volatile unsigned int *const result_address =
    (volatile unsigned int *)RESULT_ADDR;
static volatile unsigned int *const timing =
    (volatile unsigned int *)TIME_ADDR;
static volatile unsigned int *const signature =
    (volatile unsigned int *)SIGNATURE_ADDR;

void initialise_board(void)
{
    *result_address = 0u;
    *timing = 0u;
    *signature = RUNNING_MARKER;
}

void __attribute__((noinline, externally_visible)) start_trigger(void)
{
    *timing = START_MARKER;
}

void __attribute__((noinline, externally_visible)) stop_trigger(void)
{
    *timing = STOP_MARKER;
}

int main(void)
{
    volatile int result;
    int correct;

    initialise_board();
    initialise_benchmark();
    warm_caches(0);

    start_trigger();
    result = benchmark();
    stop_trigger();

    correct = verify_benchmark(result);
    *result_address = (unsigned int)result;
    *signature = (correct == 1) ? PASS_SIGNATURE : FAIL_SIGNATURE;

    while (1) {
        __asm__ volatile ("nop");
    }
}
