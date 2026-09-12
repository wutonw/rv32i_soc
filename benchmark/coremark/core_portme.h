#ifndef CORE_PORTME_H
#define CORE_PORTME_H

#define HAS_FLOAT       0
#define HAS_TIME_H      0
#define USE_CLOCK       0
#define HAS_STDIO       0
#define HAS_PRINTF      0
#define SEED_METHOD     SEED_VOLATILE
#define MEM_METHOD      MEM_STATIC
#define MULTITHREAD     1
#define MAIN_HAS_NOARGC 1
#define MAIN_HAS_NORETURN 0
#define COMPILER_VERSION "riscv-none-elf-gcc"
#define COMPILER_FLAGS   "-O2 -march=rv32i -mabi=ilp32"
#define MEM_LOCATION     "STATIC"

typedef signed short   ee_s16;
typedef unsigned short ee_u16;
typedef signed int     ee_s32;
typedef unsigned int   ee_u32;
typedef unsigned char  ee_u8;
typedef unsigned int   ee_ptr_int;
typedef unsigned int   ee_size_t;
typedef ee_u32         CORE_TICKS;

#define NULL ((void *)0)
#define align_mem(x) (void *)(4 + (((ee_ptr_int)(x) - 1) & ~3u))

typedef struct CORE_PORTABLE_S {
    ee_u8 portable_id;
} core_portable;

extern ee_u32 default_num_contexts;
void portable_init(core_portable *p, int *argc, char *argv[]);
void portable_fini(core_portable *p);
int ee_printf(const char *fmt, ...);

#endif
