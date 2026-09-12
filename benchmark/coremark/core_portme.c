#include "coremark.h"

#define SIGNATURE_ADDR 0x00007ff8u
#define TIMING_ADDR    0x00007ff4u
#define ITER_ADDR      0x00007ff0u
#define RUNNING_MARKER 0x434d0000u
#define START_MARKER   0x434d0001u
#define STOP_MARKER    0x434d0002u
#define PASS_SIGNATURE 0x600dcafeu
#define FAIL_SIGNATURE 0xdead0001u

volatile ee_s32 seed1_volatile = 0;
volatile ee_s32 seed2_volatile = 0;
volatile ee_s32 seed3_volatile = 0x66;
volatile ee_s32 seed4_volatile = ITERATIONS;
volatile ee_s32 seed5_volatile = 0;

ee_u32 default_num_contexts = 1;

static volatile ee_u32 *const signature =
    (volatile ee_u32 *)SIGNATURE_ADDR;
static volatile ee_u32 *const timing =
    (volatile ee_u32 *)TIMING_ADDR;
static volatile ee_u32 *const iteration_result =
    (volatile ee_u32 *)ITER_ADDR;

static int starts_with(const char *text, const char *prefix)
{
    while (*prefix != '\0') {
        if (*text++ != *prefix++)
            return 0;
    }
    return 1;
}

void start_time(void)
{
    *timing = START_MARKER;
}

void stop_time(void)
{
    *timing = STOP_MARKER;
}

CORE_TICKS get_time(void)
{
    /* The testbench measures real cycles between the two markers. */
    return 10u;
}

secs_ret time_in_secs(CORE_TICKS ticks)
{
    return ticks;
}

void portable_init(core_portable *p, int *argc, char *argv[])
{
    (void)argc;
    (void)argv;
    *signature = RUNNING_MARKER;
    *timing = 0u;
    *iteration_result = (ee_u32)ITERATIONS;
    p->portable_id = 1u;
}

void portable_fini(core_portable *p)
{
    p->portable_id = 0u;
}

/*
 * CoreMark's normal console output is suppressed.  The validation result is
 * converted into a RAM signature which the Verilog testbench can inspect.
 */
int ee_printf(const char *fmt, ...)
{
    if (starts_with(fmt, "Correct operation validated"))
        *signature = PASS_SIGNATURE;
    else if (starts_with(fmt, "Errors detected") ||
             starts_with(fmt, "Cannot validate operation"))
        *signature = FAIL_SIGNATURE;
    return 0;
}

void *portable_malloc(ee_size_t size)
{
    (void)size;
    return NULL;
}

void portable_free(void *p)
{
    (void)p;
}
