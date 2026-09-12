#include "dhry.h"

#define SIGNATURE_ADDR 0x00007ff8u
#define ITER_ADDR      0x00007ff0u
#define TIME_ADDR      0x00007ff4u
#define RUNNING_MARKER 0x44480000u
#define START_MARKER   0x44480001u
#define STOP_MARKER    0x44480002u
#define PASS_SIGNATURE 0x600dcafeu
#define FAIL_SIGNATURE 0xdead0001u

extern Rec_Pointer Ptr_Glob, Next_Ptr_Glob;
extern int Int_Glob;
extern Boolean Bool_Glob;
extern char Ch_1_Glob, Ch_2_Glob;
extern int Arr_1_Glob[50];
extern int Arr_2_Glob[50][50];

static unsigned char heap_area[256];
static unsigned int heap_offset;
static unsigned int timer_call;

static volatile unsigned int *const signature =
    (volatile unsigned int *)SIGNATURE_ADDR;
static volatile unsigned int *const iteration_result =
    (volatile unsigned int *)ITER_ADDR;
static volatile unsigned int *const timing =
    (volatile unsigned int *)TIME_ADDR;

int printf(const char *format, ...)
{
    (void)format;
    return 0;
}

char *malloc(unsigned int size)
{
    unsigned int aligned = (size + 3u) & ~3u;
    char *result;

    if (heap_offset + aligned > sizeof(heap_area))
        return (char *)0;
    result = (char *)&heap_area[heap_offset];
    heap_offset += aligned;
    return result;
}

char *strcpy(char *destination, const char *source)
{
    char *result = destination;
    while ((*destination++ = *source++) != '\0') {
    }
    return result;
}

int strcmp(const char *left, const char *right)
{
    while (*left != '\0' && *left == *right) {
        ++left;
        ++right;
    }
    return (unsigned char)*left - (unsigned char)*right;
}

long time(long *ignored)
{
    (void)ignored;
    if (timer_call++ == 0u) {
        *timing = START_MARKER;
        return 0;
    }
    *timing = STOP_MARKER;
    return 10;
}

static int string_equal(const char *left, const char *right)
{
    return strcmp(left, right) == 0;
}

void dhry_validate(int runs,
                   int int_1_loc,
                   int int_2_loc,
                   int int_3_loc,
                   Enumeration enum_loc,
                   const char *str_1_loc,
                   const char *str_2_loc)
{
    int ok = 1;

    ok &= Int_Glob == 5;
    ok &= Bool_Glob == 1;
    ok &= Ch_1_Glob == 'A';
    ok &= Ch_2_Glob == 'B';
    ok &= Arr_1_Glob[8] == 7;
    ok &= Arr_2_Glob[8][7] == runs + 10;
    ok &= Ptr_Glob != (Rec_Pointer)0;
    ok &= Next_Ptr_Glob != (Rec_Pointer)0;

    if (Ptr_Glob != (Rec_Pointer)0) {
        ok &= Ptr_Glob->Discr == Ident_1;
        ok &= Ptr_Glob->variant.var_1.Enum_Comp == Ident_3;
        ok &= Ptr_Glob->variant.var_1.Int_Comp == 17;
        ok &= string_equal(Ptr_Glob->variant.var_1.Str_Comp,
                           "DHRYSTONE PROGRAM, SOME STRING");
    }
    if (Next_Ptr_Glob != (Rec_Pointer)0) {
        ok &= Next_Ptr_Glob->Discr == Ident_1;
        ok &= Next_Ptr_Glob->variant.var_1.Enum_Comp == Ident_2;
        ok &= Next_Ptr_Glob->variant.var_1.Int_Comp == 18;
        ok &= string_equal(Next_Ptr_Glob->variant.var_1.Str_Comp,
                           "DHRYSTONE PROGRAM, SOME STRING");
    }

    ok &= int_1_loc == 5;
    ok &= int_2_loc == 13;
    ok &= int_3_loc == 7;
    ok &= enum_loc == Ident_2;
    ok &= string_equal(str_1_loc, "DHRYSTONE PROGRAM, 1'ST STRING");
    ok &= string_equal(str_2_loc, "DHRYSTONE PROGRAM, 2'ND STRING");

    *iteration_result = (unsigned int)runs;
    *signature = ok ? PASS_SIGNATURE : FAIL_SIGNATURE;
}

void dhry_port_init(void)
{
    heap_offset = 0u;
    timer_call = 0u;
    *iteration_result = 0u;
    *timing = 0u;
    *signature = RUNNING_MARKER;
}
