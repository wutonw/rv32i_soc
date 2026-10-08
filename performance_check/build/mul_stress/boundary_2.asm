00000000  00000013  addi (0, 0, 0)  # setup
00000004  00001db7  lui (27, 1)  # setup
00000008  000d8d93  addi (27, 27, 0)  # setup
0000000c  00000d37  lui (26, 0)  # setup
00000010  400d0d13  addi (26, 26, 1024)  # setup
00000014  00000cb7  lui (25, 0)  # setup
00000018  600c8c93  addi (25, 25, 1536)  # setup
0000001c  800000b7  lui (1, 524288)  # product[0] a=7fffffff b=80000001
00000020  fff08093  addi (1, 1, -1)  # product[0] a=7fffffff b=80000001
00000024  80000137  lui (2, 524288)  # product[0] a=7fffffff b=80000001
00000028  00110113  addi (2, 2, 1)  # product[0] a=7fffffff b=80000001
0000002c  022081b3  mul (3, 1, 2)  # product[0] a=7fffffff b=80000001
00000030  02209233  mulh (4, 1, 2)  # product[0] a=7fffffff b=80000001
00000034  0220a2b3  mulhsu (5, 1, 2)  # product[0] a=7fffffff b=80000001
00000038  0220b333  mulhu (6, 1, 2)  # product[0] a=7fffffff b=80000001
0000003c  003da023  sw (3, 27, 0)  # product[0] a=7fffffff b=80000001
00000040  004d8d93  addi (27, 27, 4)  # product[0] a=7fffffff b=80000001
00000044  004da023  sw (4, 27, 0)  # product[0] a=7fffffff b=80000001
00000048  004d8d93  addi (27, 27, 4)  # product[0] a=7fffffff b=80000001
0000004c  005da023  sw (5, 27, 0)  # product[0] a=7fffffff b=80000001
00000050  004d8d93  addi (27, 27, 4)  # product[0] a=7fffffff b=80000001
00000054  006da023  sw (6, 27, 0)  # product[0] a=7fffffff b=80000001
00000058  004d8d93  addi (27, 27, 4)  # product[0] a=7fffffff b=80000001
0000005c  800000b7  lui (1, 524288)  # product[1] a=7fffffff b=fffffffe
00000060  fff08093  addi (1, 1, -1)  # product[1] a=7fffffff b=fffffffe
00000064  00000137  lui (2, 0)  # product[1] a=7fffffff b=fffffffe
00000068  ffe10113  addi (2, 2, -2)  # product[1] a=7fffffff b=fffffffe
0000006c  022081b3  mul (3, 1, 2)  # product[1] a=7fffffff b=fffffffe
00000070  02209233  mulh (4, 1, 2)  # product[1] a=7fffffff b=fffffffe
00000074  0220a2b3  mulhsu (5, 1, 2)  # product[1] a=7fffffff b=fffffffe
00000078  0220b333  mulhu (6, 1, 2)  # product[1] a=7fffffff b=fffffffe
0000007c  003da023  sw (3, 27, 0)  # product[1] a=7fffffff b=fffffffe
00000080  004d8d93  addi (27, 27, 4)  # product[1] a=7fffffff b=fffffffe
00000084  004da023  sw (4, 27, 0)  # product[1] a=7fffffff b=fffffffe
00000088  004d8d93  addi (27, 27, 4)  # product[1] a=7fffffff b=fffffffe
0000008c  005da023  sw (5, 27, 0)  # product[1] a=7fffffff b=fffffffe
00000090  004d8d93  addi (27, 27, 4)  # product[1] a=7fffffff b=fffffffe
00000094  006da023  sw (6, 27, 0)  # product[1] a=7fffffff b=fffffffe
00000098  004d8d93  addi (27, 27, 4)  # product[1] a=7fffffff b=fffffffe
0000009c  800000b7  lui (1, 524288)  # product[2] a=7fffffff b=ffffffff
000000a0  fff08093  addi (1, 1, -1)  # product[2] a=7fffffff b=ffffffff
000000a4  00000137  lui (2, 0)  # product[2] a=7fffffff b=ffffffff
000000a8  fff10113  addi (2, 2, -1)  # product[2] a=7fffffff b=ffffffff
000000ac  022081b3  mul (3, 1, 2)  # product[2] a=7fffffff b=ffffffff
000000b0  02209233  mulh (4, 1, 2)  # product[2] a=7fffffff b=ffffffff
000000b4  0220a2b3  mulhsu (5, 1, 2)  # product[2] a=7fffffff b=ffffffff
000000b8  0220b333  mulhu (6, 1, 2)  # product[2] a=7fffffff b=ffffffff
000000bc  003da023  sw (3, 27, 0)  # product[2] a=7fffffff b=ffffffff
000000c0  004d8d93  addi (27, 27, 4)  # product[2] a=7fffffff b=ffffffff
000000c4  004da023  sw (4, 27, 0)  # product[2] a=7fffffff b=ffffffff
000000c8  004d8d93  addi (27, 27, 4)  # product[2] a=7fffffff b=ffffffff
000000cc  005da023  sw (5, 27, 0)  # product[2] a=7fffffff b=ffffffff
000000d0  004d8d93  addi (27, 27, 4)  # product[2] a=7fffffff b=ffffffff
000000d4  006da023  sw (6, 27, 0)  # product[2] a=7fffffff b=ffffffff
000000d8  004d8d93  addi (27, 27, 4)  # product[2] a=7fffffff b=ffffffff
000000dc  800000b7  lui (1, 524288)  # product[3] a=7fffffff b=55555555
000000e0  fff08093  addi (1, 1, -1)  # product[3] a=7fffffff b=55555555
000000e4  55555137  lui (2, 349525)  # product[3] a=7fffffff b=55555555
000000e8  55510113  addi (2, 2, 1365)  # product[3] a=7fffffff b=55555555
000000ec  022081b3  mul (3, 1, 2)  # product[3] a=7fffffff b=55555555
000000f0  02209233  mulh (4, 1, 2)  # product[3] a=7fffffff b=55555555
000000f4  0220a2b3  mulhsu (5, 1, 2)  # product[3] a=7fffffff b=55555555
000000f8  0220b333  mulhu (6, 1, 2)  # product[3] a=7fffffff b=55555555
000000fc  003da023  sw (3, 27, 0)  # product[3] a=7fffffff b=55555555
00000100  004d8d93  addi (27, 27, 4)  # product[3] a=7fffffff b=55555555
00000104  004da023  sw (4, 27, 0)  # product[3] a=7fffffff b=55555555
00000108  004d8d93  addi (27, 27, 4)  # product[3] a=7fffffff b=55555555
0000010c  005da023  sw (5, 27, 0)  # product[3] a=7fffffff b=55555555
00000110  004d8d93  addi (27, 27, 4)  # product[3] a=7fffffff b=55555555
00000114  006da023  sw (6, 27, 0)  # product[3] a=7fffffff b=55555555
00000118  004d8d93  addi (27, 27, 4)  # product[3] a=7fffffff b=55555555
0000011c  800000b7  lui (1, 524288)  # product[4] a=7fffffff b=aaaaaaaa
00000120  fff08093  addi (1, 1, -1)  # product[4] a=7fffffff b=aaaaaaaa
00000124  aaaab137  lui (2, 699051)  # product[4] a=7fffffff b=aaaaaaaa
00000128  aaa10113  addi (2, 2, -1366)  # product[4] a=7fffffff b=aaaaaaaa
0000012c  022081b3  mul (3, 1, 2)  # product[4] a=7fffffff b=aaaaaaaa
00000130  02209233  mulh (4, 1, 2)  # product[4] a=7fffffff b=aaaaaaaa
00000134  0220a2b3  mulhsu (5, 1, 2)  # product[4] a=7fffffff b=aaaaaaaa
00000138  0220b333  mulhu (6, 1, 2)  # product[4] a=7fffffff b=aaaaaaaa
0000013c  003da023  sw (3, 27, 0)  # product[4] a=7fffffff b=aaaaaaaa
00000140  004d8d93  addi (27, 27, 4)  # product[4] a=7fffffff b=aaaaaaaa
00000144  004da023  sw (4, 27, 0)  # product[4] a=7fffffff b=aaaaaaaa
00000148  004d8d93  addi (27, 27, 4)  # product[4] a=7fffffff b=aaaaaaaa
0000014c  005da023  sw (5, 27, 0)  # product[4] a=7fffffff b=aaaaaaaa
00000150  004d8d93  addi (27, 27, 4)  # product[4] a=7fffffff b=aaaaaaaa
00000154  006da023  sw (6, 27, 0)  # product[4] a=7fffffff b=aaaaaaaa
00000158  004d8d93  addi (27, 27, 4)  # product[4] a=7fffffff b=aaaaaaaa
0000015c  800000b7  lui (1, 524288)  # product[5] a=7fffffff b=01010101
00000160  fff08093  addi (1, 1, -1)  # product[5] a=7fffffff b=01010101
00000164  01010137  lui (2, 4112)  # product[5] a=7fffffff b=01010101
00000168  10110113  addi (2, 2, 257)  # product[5] a=7fffffff b=01010101
0000016c  022081b3  mul (3, 1, 2)  # product[5] a=7fffffff b=01010101
00000170  02209233  mulh (4, 1, 2)  # product[5] a=7fffffff b=01010101
00000174  0220a2b3  mulhsu (5, 1, 2)  # product[5] a=7fffffff b=01010101
00000178  0220b333  mulhu (6, 1, 2)  # product[5] a=7fffffff b=01010101
0000017c  003da023  sw (3, 27, 0)  # product[5] a=7fffffff b=01010101
00000180  004d8d93  addi (27, 27, 4)  # product[5] a=7fffffff b=01010101
00000184  004da023  sw (4, 27, 0)  # product[5] a=7fffffff b=01010101
00000188  004d8d93  addi (27, 27, 4)  # product[5] a=7fffffff b=01010101
0000018c  005da023  sw (5, 27, 0)  # product[5] a=7fffffff b=01010101
00000190  004d8d93  addi (27, 27, 4)  # product[5] a=7fffffff b=01010101
00000194  006da023  sw (6, 27, 0)  # product[5] a=7fffffff b=01010101
00000198  004d8d93  addi (27, 27, 4)  # product[5] a=7fffffff b=01010101
0000019c  800000b7  lui (1, 524288)  # product[6] a=80000000 b=00000000
000001a0  00008093  addi (1, 1, 0)  # product[6] a=80000000 b=00000000
000001a4  00000137  lui (2, 0)  # product[6] a=80000000 b=00000000
000001a8  00010113  addi (2, 2, 0)  # product[6] a=80000000 b=00000000
000001ac  022081b3  mul (3, 1, 2)  # product[6] a=80000000 b=00000000
000001b0  02209233  mulh (4, 1, 2)  # product[6] a=80000000 b=00000000
000001b4  0220a2b3  mulhsu (5, 1, 2)  # product[6] a=80000000 b=00000000
000001b8  0220b333  mulhu (6, 1, 2)  # product[6] a=80000000 b=00000000
000001bc  003da023  sw (3, 27, 0)  # product[6] a=80000000 b=00000000
000001c0  004d8d93  addi (27, 27, 4)  # product[6] a=80000000 b=00000000
000001c4  004da023  sw (4, 27, 0)  # product[6] a=80000000 b=00000000
000001c8  004d8d93  addi (27, 27, 4)  # product[6] a=80000000 b=00000000
000001cc  005da023  sw (5, 27, 0)  # product[6] a=80000000 b=00000000
000001d0  004d8d93  addi (27, 27, 4)  # product[6] a=80000000 b=00000000
000001d4  006da023  sw (6, 27, 0)  # product[6] a=80000000 b=00000000
000001d8  004d8d93  addi (27, 27, 4)  # product[6] a=80000000 b=00000000
000001dc  800000b7  lui (1, 524288)  # product[7] a=80000000 b=00000001
000001e0  00008093  addi (1, 1, 0)  # product[7] a=80000000 b=00000001
000001e4  00000137  lui (2, 0)  # product[7] a=80000000 b=00000001
000001e8  00110113  addi (2, 2, 1)  # product[7] a=80000000 b=00000001
000001ec  022081b3  mul (3, 1, 2)  # product[7] a=80000000 b=00000001
000001f0  02209233  mulh (4, 1, 2)  # product[7] a=80000000 b=00000001
000001f4  0220a2b3  mulhsu (5, 1, 2)  # product[7] a=80000000 b=00000001
000001f8  0220b333  mulhu (6, 1, 2)  # product[7] a=80000000 b=00000001
000001fc  003da023  sw (3, 27, 0)  # product[7] a=80000000 b=00000001
00000200  004d8d93  addi (27, 27, 4)  # product[7] a=80000000 b=00000001
00000204  004da023  sw (4, 27, 0)  # product[7] a=80000000 b=00000001
00000208  004d8d93  addi (27, 27, 4)  # product[7] a=80000000 b=00000001
0000020c  005da023  sw (5, 27, 0)  # product[7] a=80000000 b=00000001
00000210  004d8d93  addi (27, 27, 4)  # product[7] a=80000000 b=00000001
00000214  006da023  sw (6, 27, 0)  # product[7] a=80000000 b=00000001
00000218  004d8d93  addi (27, 27, 4)  # product[7] a=80000000 b=00000001
0000021c  800000b7  lui (1, 524288)  # product[8] a=80000000 b=00000002
00000220  00008093  addi (1, 1, 0)  # product[8] a=80000000 b=00000002
00000224  00000137  lui (2, 0)  # product[8] a=80000000 b=00000002
00000228  00210113  addi (2, 2, 2)  # product[8] a=80000000 b=00000002
0000022c  022081b3  mul (3, 1, 2)  # product[8] a=80000000 b=00000002
00000230  02209233  mulh (4, 1, 2)  # product[8] a=80000000 b=00000002
00000234  0220a2b3  mulhsu (5, 1, 2)  # product[8] a=80000000 b=00000002
00000238  0220b333  mulhu (6, 1, 2)  # product[8] a=80000000 b=00000002
0000023c  003da023  sw (3, 27, 0)  # product[8] a=80000000 b=00000002
00000240  004d8d93  addi (27, 27, 4)  # product[8] a=80000000 b=00000002
00000244  004da023  sw (4, 27, 0)  # product[8] a=80000000 b=00000002
00000248  004d8d93  addi (27, 27, 4)  # product[8] a=80000000 b=00000002
0000024c  005da023  sw (5, 27, 0)  # product[8] a=80000000 b=00000002
00000250  004d8d93  addi (27, 27, 4)  # product[8] a=80000000 b=00000002
00000254  006da023  sw (6, 27, 0)  # product[8] a=80000000 b=00000002
00000258  004d8d93  addi (27, 27, 4)  # product[8] a=80000000 b=00000002
0000025c  800000b7  lui (1, 524288)  # product[9] a=80000000 b=00000003
00000260  00008093  addi (1, 1, 0)  # product[9] a=80000000 b=00000003
00000264  00000137  lui (2, 0)  # product[9] a=80000000 b=00000003
00000268  00310113  addi (2, 2, 3)  # product[9] a=80000000 b=00000003
0000026c  022081b3  mul (3, 1, 2)  # product[9] a=80000000 b=00000003
00000270  02209233  mulh (4, 1, 2)  # product[9] a=80000000 b=00000003
00000274  0220a2b3  mulhsu (5, 1, 2)  # product[9] a=80000000 b=00000003
00000278  0220b333  mulhu (6, 1, 2)  # product[9] a=80000000 b=00000003
0000027c  003da023  sw (3, 27, 0)  # product[9] a=80000000 b=00000003
00000280  004d8d93  addi (27, 27, 4)  # product[9] a=80000000 b=00000003
00000284  004da023  sw (4, 27, 0)  # product[9] a=80000000 b=00000003
00000288  004d8d93  addi (27, 27, 4)  # product[9] a=80000000 b=00000003
0000028c  005da023  sw (5, 27, 0)  # product[9] a=80000000 b=00000003
00000290  004d8d93  addi (27, 27, 4)  # product[9] a=80000000 b=00000003
00000294  006da023  sw (6, 27, 0)  # product[9] a=80000000 b=00000003
00000298  004d8d93  addi (27, 27, 4)  # product[9] a=80000000 b=00000003
0000029c  800000b7  lui (1, 524288)  # product[10] a=80000000 b=0000001f
000002a0  00008093  addi (1, 1, 0)  # product[10] a=80000000 b=0000001f
000002a4  00000137  lui (2, 0)  # product[10] a=80000000 b=0000001f
000002a8  01f10113  addi (2, 2, 31)  # product[10] a=80000000 b=0000001f
000002ac  022081b3  mul (3, 1, 2)  # product[10] a=80000000 b=0000001f
000002b0  02209233  mulh (4, 1, 2)  # product[10] a=80000000 b=0000001f
000002b4  0220a2b3  mulhsu (5, 1, 2)  # product[10] a=80000000 b=0000001f
000002b8  0220b333  mulhu (6, 1, 2)  # product[10] a=80000000 b=0000001f
000002bc  003da023  sw (3, 27, 0)  # product[10] a=80000000 b=0000001f
000002c0  004d8d93  addi (27, 27, 4)  # product[10] a=80000000 b=0000001f
000002c4  004da023  sw (4, 27, 0)  # product[10] a=80000000 b=0000001f
000002c8  004d8d93  addi (27, 27, 4)  # product[10] a=80000000 b=0000001f
000002cc  005da023  sw (5, 27, 0)  # product[10] a=80000000 b=0000001f
000002d0  004d8d93  addi (27, 27, 4)  # product[10] a=80000000 b=0000001f
000002d4  006da023  sw (6, 27, 0)  # product[10] a=80000000 b=0000001f
000002d8  004d8d93  addi (27, 27, 4)  # product[10] a=80000000 b=0000001f
000002dc  800000b7  lui (1, 524288)  # product[11] a=80000000 b=00000020
000002e0  00008093  addi (1, 1, 0)  # product[11] a=80000000 b=00000020
000002e4  00000137  lui (2, 0)  # product[11] a=80000000 b=00000020
000002e8  02010113  addi (2, 2, 32)  # product[11] a=80000000 b=00000020
000002ec  022081b3  mul (3, 1, 2)  # product[11] a=80000000 b=00000020
000002f0  02209233  mulh (4, 1, 2)  # product[11] a=80000000 b=00000020
000002f4  0220a2b3  mulhsu (5, 1, 2)  # product[11] a=80000000 b=00000020
000002f8  0220b333  mulhu (6, 1, 2)  # product[11] a=80000000 b=00000020
000002fc  003da023  sw (3, 27, 0)  # product[11] a=80000000 b=00000020
00000300  004d8d93  addi (27, 27, 4)  # product[11] a=80000000 b=00000020
00000304  004da023  sw (4, 27, 0)  # product[11] a=80000000 b=00000020
00000308  004d8d93  addi (27, 27, 4)  # product[11] a=80000000 b=00000020
0000030c  005da023  sw (5, 27, 0)  # product[11] a=80000000 b=00000020
00000310  004d8d93  addi (27, 27, 4)  # product[11] a=80000000 b=00000020
00000314  006da023  sw (6, 27, 0)  # product[11] a=80000000 b=00000020
00000318  004d8d93  addi (27, 27, 4)  # product[11] a=80000000 b=00000020
0000031c  800000b7  lui (1, 524288)  # product[12] a=80000000 b=00007fff
00000320  00008093  addi (1, 1, 0)  # product[12] a=80000000 b=00007fff
00000324  00008137  lui (2, 8)  # product[12] a=80000000 b=00007fff
00000328  fff10113  addi (2, 2, -1)  # product[12] a=80000000 b=00007fff
0000032c  022081b3  mul (3, 1, 2)  # product[12] a=80000000 b=00007fff
00000330  02209233  mulh (4, 1, 2)  # product[12] a=80000000 b=00007fff
00000334  0220a2b3  mulhsu (5, 1, 2)  # product[12] a=80000000 b=00007fff
00000338  0220b333  mulhu (6, 1, 2)  # product[12] a=80000000 b=00007fff
0000033c  003da023  sw (3, 27, 0)  # product[12] a=80000000 b=00007fff
00000340  004d8d93  addi (27, 27, 4)  # product[12] a=80000000 b=00007fff
00000344  004da023  sw (4, 27, 0)  # product[12] a=80000000 b=00007fff
00000348  004d8d93  addi (27, 27, 4)  # product[12] a=80000000 b=00007fff
0000034c  005da023  sw (5, 27, 0)  # product[12] a=80000000 b=00007fff
00000350  004d8d93  addi (27, 27, 4)  # product[12] a=80000000 b=00007fff
00000354  006da023  sw (6, 27, 0)  # product[12] a=80000000 b=00007fff
00000358  004d8d93  addi (27, 27, 4)  # product[12] a=80000000 b=00007fff
0000035c  800000b7  lui (1, 524288)  # product[13] a=80000000 b=00008000
00000360  00008093  addi (1, 1, 0)  # product[13] a=80000000 b=00008000
00000364  00008137  lui (2, 8)  # product[13] a=80000000 b=00008000
00000368  00010113  addi (2, 2, 0)  # product[13] a=80000000 b=00008000
0000036c  022081b3  mul (3, 1, 2)  # product[13] a=80000000 b=00008000
00000370  02209233  mulh (4, 1, 2)  # product[13] a=80000000 b=00008000
00000374  0220a2b3  mulhsu (5, 1, 2)  # product[13] a=80000000 b=00008000
00000378  0220b333  mulhu (6, 1, 2)  # product[13] a=80000000 b=00008000
0000037c  003da023  sw (3, 27, 0)  # product[13] a=80000000 b=00008000
00000380  004d8d93  addi (27, 27, 4)  # product[13] a=80000000 b=00008000
00000384  004da023  sw (4, 27, 0)  # product[13] a=80000000 b=00008000
00000388  004d8d93  addi (27, 27, 4)  # product[13] a=80000000 b=00008000
0000038c  005da023  sw (5, 27, 0)  # product[13] a=80000000 b=00008000
00000390  004d8d93  addi (27, 27, 4)  # product[13] a=80000000 b=00008000
00000394  006da023  sw (6, 27, 0)  # product[13] a=80000000 b=00008000
00000398  004d8d93  addi (27, 27, 4)  # product[13] a=80000000 b=00008000
0000039c  800000b7  lui (1, 524288)  # product[14] a=80000000 b=0000ffff
000003a0  00008093  addi (1, 1, 0)  # product[14] a=80000000 b=0000ffff
000003a4  00010137  lui (2, 16)  # product[14] a=80000000 b=0000ffff
000003a8  fff10113  addi (2, 2, -1)  # product[14] a=80000000 b=0000ffff
000003ac  022081b3  mul (3, 1, 2)  # product[14] a=80000000 b=0000ffff
000003b0  02209233  mulh (4, 1, 2)  # product[14] a=80000000 b=0000ffff
000003b4  0220a2b3  mulhsu (5, 1, 2)  # product[14] a=80000000 b=0000ffff
000003b8  0220b333  mulhu (6, 1, 2)  # product[14] a=80000000 b=0000ffff
000003bc  003da023  sw (3, 27, 0)  # product[14] a=80000000 b=0000ffff
000003c0  004d8d93  addi (27, 27, 4)  # product[14] a=80000000 b=0000ffff
000003c4  004da023  sw (4, 27, 0)  # product[14] a=80000000 b=0000ffff
000003c8  004d8d93  addi (27, 27, 4)  # product[14] a=80000000 b=0000ffff
000003cc  005da023  sw (5, 27, 0)  # product[14] a=80000000 b=0000ffff
000003d0  004d8d93  addi (27, 27, 4)  # product[14] a=80000000 b=0000ffff
000003d4  006da023  sw (6, 27, 0)  # product[14] a=80000000 b=0000ffff
000003d8  004d8d93  addi (27, 27, 4)  # product[14] a=80000000 b=0000ffff
000003dc  800000b7  lui (1, 524288)  # product[15] a=80000000 b=00010000
000003e0  00008093  addi (1, 1, 0)  # product[15] a=80000000 b=00010000
000003e4  00010137  lui (2, 16)  # product[15] a=80000000 b=00010000
000003e8  00010113  addi (2, 2, 0)  # product[15] a=80000000 b=00010000
000003ec  022081b3  mul (3, 1, 2)  # product[15] a=80000000 b=00010000
000003f0  02209233  mulh (4, 1, 2)  # product[15] a=80000000 b=00010000
000003f4  0220a2b3  mulhsu (5, 1, 2)  # product[15] a=80000000 b=00010000
000003f8  0220b333  mulhu (6, 1, 2)  # product[15] a=80000000 b=00010000
000003fc  003da023  sw (3, 27, 0)  # product[15] a=80000000 b=00010000
00000400  004d8d93  addi (27, 27, 4)  # product[15] a=80000000 b=00010000
00000404  004da023  sw (4, 27, 0)  # product[15] a=80000000 b=00010000
00000408  004d8d93  addi (27, 27, 4)  # product[15] a=80000000 b=00010000
0000040c  005da023  sw (5, 27, 0)  # product[15] a=80000000 b=00010000
00000410  004d8d93  addi (27, 27, 4)  # product[15] a=80000000 b=00010000
00000414  006da023  sw (6, 27, 0)  # product[15] a=80000000 b=00010000
00000418  004d8d93  addi (27, 27, 4)  # product[15] a=80000000 b=00010000
0000041c  800000b7  lui (1, 524288)  # product[16] a=80000000 b=7fffffff
00000420  00008093  addi (1, 1, 0)  # product[16] a=80000000 b=7fffffff
00000424  80000137  lui (2, 524288)  # product[16] a=80000000 b=7fffffff
00000428  fff10113  addi (2, 2, -1)  # product[16] a=80000000 b=7fffffff
0000042c  022081b3  mul (3, 1, 2)  # product[16] a=80000000 b=7fffffff
00000430  02209233  mulh (4, 1, 2)  # product[16] a=80000000 b=7fffffff
00000434  0220a2b3  mulhsu (5, 1, 2)  # product[16] a=80000000 b=7fffffff
00000438  0220b333  mulhu (6, 1, 2)  # product[16] a=80000000 b=7fffffff
0000043c  003da023  sw (3, 27, 0)  # product[16] a=80000000 b=7fffffff
00000440  004d8d93  addi (27, 27, 4)  # product[16] a=80000000 b=7fffffff
00000444  004da023  sw (4, 27, 0)  # product[16] a=80000000 b=7fffffff
00000448  004d8d93  addi (27, 27, 4)  # product[16] a=80000000 b=7fffffff
0000044c  005da023  sw (5, 27, 0)  # product[16] a=80000000 b=7fffffff
00000450  004d8d93  addi (27, 27, 4)  # product[16] a=80000000 b=7fffffff
00000454  006da023  sw (6, 27, 0)  # product[16] a=80000000 b=7fffffff
00000458  004d8d93  addi (27, 27, 4)  # product[16] a=80000000 b=7fffffff
0000045c  800000b7  lui (1, 524288)  # product[17] a=80000000 b=80000000
00000460  00008093  addi (1, 1, 0)  # product[17] a=80000000 b=80000000
00000464  80000137  lui (2, 524288)  # product[17] a=80000000 b=80000000
00000468  00010113  addi (2, 2, 0)  # product[17] a=80000000 b=80000000
0000046c  022081b3  mul (3, 1, 2)  # product[17] a=80000000 b=80000000
00000470  02209233  mulh (4, 1, 2)  # product[17] a=80000000 b=80000000
00000474  0220a2b3  mulhsu (5, 1, 2)  # product[17] a=80000000 b=80000000
00000478  0220b333  mulhu (6, 1, 2)  # product[17] a=80000000 b=80000000
0000047c  003da023  sw (3, 27, 0)  # product[17] a=80000000 b=80000000
00000480  004d8d93  addi (27, 27, 4)  # product[17] a=80000000 b=80000000
00000484  004da023  sw (4, 27, 0)  # product[17] a=80000000 b=80000000
00000488  004d8d93  addi (27, 27, 4)  # product[17] a=80000000 b=80000000
0000048c  005da023  sw (5, 27, 0)  # product[17] a=80000000 b=80000000
00000490  004d8d93  addi (27, 27, 4)  # product[17] a=80000000 b=80000000
00000494  006da023  sw (6, 27, 0)  # product[17] a=80000000 b=80000000
00000498  004d8d93  addi (27, 27, 4)  # product[17] a=80000000 b=80000000
0000049c  800000b7  lui (1, 524288)  # product[18] a=80000000 b=80000001
000004a0  00008093  addi (1, 1, 0)  # product[18] a=80000000 b=80000001
000004a4  80000137  lui (2, 524288)  # product[18] a=80000000 b=80000001
000004a8  00110113  addi (2, 2, 1)  # product[18] a=80000000 b=80000001
000004ac  022081b3  mul (3, 1, 2)  # product[18] a=80000000 b=80000001
000004b0  02209233  mulh (4, 1, 2)  # product[18] a=80000000 b=80000001
000004b4  0220a2b3  mulhsu (5, 1, 2)  # product[18] a=80000000 b=80000001
000004b8  0220b333  mulhu (6, 1, 2)  # product[18] a=80000000 b=80000001
000004bc  003da023  sw (3, 27, 0)  # product[18] a=80000000 b=80000001
000004c0  004d8d93  addi (27, 27, 4)  # product[18] a=80000000 b=80000001
000004c4  004da023  sw (4, 27, 0)  # product[18] a=80000000 b=80000001
000004c8  004d8d93  addi (27, 27, 4)  # product[18] a=80000000 b=80000001
000004cc  005da023  sw (5, 27, 0)  # product[18] a=80000000 b=80000001
000004d0  004d8d93  addi (27, 27, 4)  # product[18] a=80000000 b=80000001
000004d4  006da023  sw (6, 27, 0)  # product[18] a=80000000 b=80000001
000004d8  004d8d93  addi (27, 27, 4)  # product[18] a=80000000 b=80000001
000004dc  800000b7  lui (1, 524288)  # product[19] a=80000000 b=fffffffe
000004e0  00008093  addi (1, 1, 0)  # product[19] a=80000000 b=fffffffe
000004e4  00000137  lui (2, 0)  # product[19] a=80000000 b=fffffffe
000004e8  ffe10113  addi (2, 2, -2)  # product[19] a=80000000 b=fffffffe
000004ec  022081b3  mul (3, 1, 2)  # product[19] a=80000000 b=fffffffe
000004f0  02209233  mulh (4, 1, 2)  # product[19] a=80000000 b=fffffffe
000004f4  0220a2b3  mulhsu (5, 1, 2)  # product[19] a=80000000 b=fffffffe
000004f8  0220b333  mulhu (6, 1, 2)  # product[19] a=80000000 b=fffffffe
000004fc  003da023  sw (3, 27, 0)  # product[19] a=80000000 b=fffffffe
00000500  004d8d93  addi (27, 27, 4)  # product[19] a=80000000 b=fffffffe
00000504  004da023  sw (4, 27, 0)  # product[19] a=80000000 b=fffffffe
00000508  004d8d93  addi (27, 27, 4)  # product[19] a=80000000 b=fffffffe
0000050c  005da023  sw (5, 27, 0)  # product[19] a=80000000 b=fffffffe
00000510  004d8d93  addi (27, 27, 4)  # product[19] a=80000000 b=fffffffe
00000514  006da023  sw (6, 27, 0)  # product[19] a=80000000 b=fffffffe
00000518  004d8d93  addi (27, 27, 4)  # product[19] a=80000000 b=fffffffe
0000051c  800000b7  lui (1, 524288)  # product[20] a=80000000 b=ffffffff
00000520  00008093  addi (1, 1, 0)  # product[20] a=80000000 b=ffffffff
00000524  00000137  lui (2, 0)  # product[20] a=80000000 b=ffffffff
00000528  fff10113  addi (2, 2, -1)  # product[20] a=80000000 b=ffffffff
0000052c  022081b3  mul (3, 1, 2)  # product[20] a=80000000 b=ffffffff
00000530  02209233  mulh (4, 1, 2)  # product[20] a=80000000 b=ffffffff
00000534  0220a2b3  mulhsu (5, 1, 2)  # product[20] a=80000000 b=ffffffff
00000538  0220b333  mulhu (6, 1, 2)  # product[20] a=80000000 b=ffffffff
0000053c  003da023  sw (3, 27, 0)  # product[20] a=80000000 b=ffffffff
00000540  004d8d93  addi (27, 27, 4)  # product[20] a=80000000 b=ffffffff
00000544  004da023  sw (4, 27, 0)  # product[20] a=80000000 b=ffffffff
00000548  004d8d93  addi (27, 27, 4)  # product[20] a=80000000 b=ffffffff
0000054c  005da023  sw (5, 27, 0)  # product[20] a=80000000 b=ffffffff
00000550  004d8d93  addi (27, 27, 4)  # product[20] a=80000000 b=ffffffff
00000554  006da023  sw (6, 27, 0)  # product[20] a=80000000 b=ffffffff
00000558  004d8d93  addi (27, 27, 4)  # product[20] a=80000000 b=ffffffff
0000055c  800000b7  lui (1, 524288)  # product[21] a=80000000 b=55555555
00000560  00008093  addi (1, 1, 0)  # product[21] a=80000000 b=55555555
00000564  55555137  lui (2, 349525)  # product[21] a=80000000 b=55555555
00000568  55510113  addi (2, 2, 1365)  # product[21] a=80000000 b=55555555
0000056c  022081b3  mul (3, 1, 2)  # product[21] a=80000000 b=55555555
00000570  02209233  mulh (4, 1, 2)  # product[21] a=80000000 b=55555555
00000574  0220a2b3  mulhsu (5, 1, 2)  # product[21] a=80000000 b=55555555
00000578  0220b333  mulhu (6, 1, 2)  # product[21] a=80000000 b=55555555
0000057c  003da023  sw (3, 27, 0)  # product[21] a=80000000 b=55555555
00000580  004d8d93  addi (27, 27, 4)  # product[21] a=80000000 b=55555555
00000584  004da023  sw (4, 27, 0)  # product[21] a=80000000 b=55555555
00000588  004d8d93  addi (27, 27, 4)  # product[21] a=80000000 b=55555555
0000058c  005da023  sw (5, 27, 0)  # product[21] a=80000000 b=55555555
00000590  004d8d93  addi (27, 27, 4)  # product[21] a=80000000 b=55555555
00000594  006da023  sw (6, 27, 0)  # product[21] a=80000000 b=55555555
00000598  004d8d93  addi (27, 27, 4)  # product[21] a=80000000 b=55555555
0000059c  800000b7  lui (1, 524288)  # product[22] a=80000000 b=aaaaaaaa
000005a0  00008093  addi (1, 1, 0)  # product[22] a=80000000 b=aaaaaaaa
000005a4  aaaab137  lui (2, 699051)  # product[22] a=80000000 b=aaaaaaaa
000005a8  aaa10113  addi (2, 2, -1366)  # product[22] a=80000000 b=aaaaaaaa
000005ac  022081b3  mul (3, 1, 2)  # product[22] a=80000000 b=aaaaaaaa
000005b0  02209233  mulh (4, 1, 2)  # product[22] a=80000000 b=aaaaaaaa
000005b4  0220a2b3  mulhsu (5, 1, 2)  # product[22] a=80000000 b=aaaaaaaa
000005b8  0220b333  mulhu (6, 1, 2)  # product[22] a=80000000 b=aaaaaaaa
000005bc  003da023  sw (3, 27, 0)  # product[22] a=80000000 b=aaaaaaaa
000005c0  004d8d93  addi (27, 27, 4)  # product[22] a=80000000 b=aaaaaaaa
000005c4  004da023  sw (4, 27, 0)  # product[22] a=80000000 b=aaaaaaaa
000005c8  004d8d93  addi (27, 27, 4)  # product[22] a=80000000 b=aaaaaaaa
000005cc  005da023  sw (5, 27, 0)  # product[22] a=80000000 b=aaaaaaaa
000005d0  004d8d93  addi (27, 27, 4)  # product[22] a=80000000 b=aaaaaaaa
000005d4  006da023  sw (6, 27, 0)  # product[22] a=80000000 b=aaaaaaaa
000005d8  004d8d93  addi (27, 27, 4)  # product[22] a=80000000 b=aaaaaaaa
000005dc  800000b7  lui (1, 524288)  # product[23] a=80000000 b=01010101
000005e0  00008093  addi (1, 1, 0)  # product[23] a=80000000 b=01010101
000005e4  01010137  lui (2, 4112)  # product[23] a=80000000 b=01010101
000005e8  10110113  addi (2, 2, 257)  # product[23] a=80000000 b=01010101
000005ec  022081b3  mul (3, 1, 2)  # product[23] a=80000000 b=01010101
000005f0  02209233  mulh (4, 1, 2)  # product[23] a=80000000 b=01010101
000005f4  0220a2b3  mulhsu (5, 1, 2)  # product[23] a=80000000 b=01010101
000005f8  0220b333  mulhu (6, 1, 2)  # product[23] a=80000000 b=01010101
000005fc  003da023  sw (3, 27, 0)  # product[23] a=80000000 b=01010101
00000600  004d8d93  addi (27, 27, 4)  # product[23] a=80000000 b=01010101
00000604  004da023  sw (4, 27, 0)  # product[23] a=80000000 b=01010101
00000608  004d8d93  addi (27, 27, 4)  # product[23] a=80000000 b=01010101
0000060c  005da023  sw (5, 27, 0)  # product[23] a=80000000 b=01010101
00000610  004d8d93  addi (27, 27, 4)  # product[23] a=80000000 b=01010101
00000614  006da023  sw (6, 27, 0)  # product[23] a=80000000 b=01010101
00000618  004d8d93  addi (27, 27, 4)  # product[23] a=80000000 b=01010101
0000061c  800000b7  lui (1, 524288)  # product[24] a=80000001 b=00000000
00000620  00108093  addi (1, 1, 1)  # product[24] a=80000001 b=00000000
00000624  00000137  lui (2, 0)  # product[24] a=80000001 b=00000000
00000628  00010113  addi (2, 2, 0)  # product[24] a=80000001 b=00000000
0000062c  022081b3  mul (3, 1, 2)  # product[24] a=80000001 b=00000000
00000630  02209233  mulh (4, 1, 2)  # product[24] a=80000001 b=00000000
00000634  0220a2b3  mulhsu (5, 1, 2)  # product[24] a=80000001 b=00000000
00000638  0220b333  mulhu (6, 1, 2)  # product[24] a=80000001 b=00000000
0000063c  003da023  sw (3, 27, 0)  # product[24] a=80000001 b=00000000
00000640  004d8d93  addi (27, 27, 4)  # product[24] a=80000001 b=00000000
00000644  004da023  sw (4, 27, 0)  # product[24] a=80000001 b=00000000
00000648  004d8d93  addi (27, 27, 4)  # product[24] a=80000001 b=00000000
0000064c  005da023  sw (5, 27, 0)  # product[24] a=80000001 b=00000000
00000650  004d8d93  addi (27, 27, 4)  # product[24] a=80000001 b=00000000
00000654  006da023  sw (6, 27, 0)  # product[24] a=80000001 b=00000000
00000658  004d8d93  addi (27, 27, 4)  # product[24] a=80000001 b=00000000
0000065c  800000b7  lui (1, 524288)  # product[25] a=80000001 b=00000001
00000660  00108093  addi (1, 1, 1)  # product[25] a=80000001 b=00000001
00000664  00000137  lui (2, 0)  # product[25] a=80000001 b=00000001
00000668  00110113  addi (2, 2, 1)  # product[25] a=80000001 b=00000001
0000066c  022081b3  mul (3, 1, 2)  # product[25] a=80000001 b=00000001
00000670  02209233  mulh (4, 1, 2)  # product[25] a=80000001 b=00000001
00000674  0220a2b3  mulhsu (5, 1, 2)  # product[25] a=80000001 b=00000001
00000678  0220b333  mulhu (6, 1, 2)  # product[25] a=80000001 b=00000001
0000067c  003da023  sw (3, 27, 0)  # product[25] a=80000001 b=00000001
00000680  004d8d93  addi (27, 27, 4)  # product[25] a=80000001 b=00000001
00000684  004da023  sw (4, 27, 0)  # product[25] a=80000001 b=00000001
00000688  004d8d93  addi (27, 27, 4)  # product[25] a=80000001 b=00000001
0000068c  005da023  sw (5, 27, 0)  # product[25] a=80000001 b=00000001
00000690  004d8d93  addi (27, 27, 4)  # product[25] a=80000001 b=00000001
00000694  006da023  sw (6, 27, 0)  # product[25] a=80000001 b=00000001
00000698  004d8d93  addi (27, 27, 4)  # product[25] a=80000001 b=00000001
0000069c  800000b7  lui (1, 524288)  # product[26] a=80000001 b=00000002
000006a0  00108093  addi (1, 1, 1)  # product[26] a=80000001 b=00000002
000006a4  00000137  lui (2, 0)  # product[26] a=80000001 b=00000002
000006a8  00210113  addi (2, 2, 2)  # product[26] a=80000001 b=00000002
000006ac  022081b3  mul (3, 1, 2)  # product[26] a=80000001 b=00000002
000006b0  02209233  mulh (4, 1, 2)  # product[26] a=80000001 b=00000002
000006b4  0220a2b3  mulhsu (5, 1, 2)  # product[26] a=80000001 b=00000002
000006b8  0220b333  mulhu (6, 1, 2)  # product[26] a=80000001 b=00000002
000006bc  003da023  sw (3, 27, 0)  # product[26] a=80000001 b=00000002
000006c0  004d8d93  addi (27, 27, 4)  # product[26] a=80000001 b=00000002
000006c4  004da023  sw (4, 27, 0)  # product[26] a=80000001 b=00000002
000006c8  004d8d93  addi (27, 27, 4)  # product[26] a=80000001 b=00000002
000006cc  005da023  sw (5, 27, 0)  # product[26] a=80000001 b=00000002
000006d0  004d8d93  addi (27, 27, 4)  # product[26] a=80000001 b=00000002
000006d4  006da023  sw (6, 27, 0)  # product[26] a=80000001 b=00000002
000006d8  004d8d93  addi (27, 27, 4)  # product[26] a=80000001 b=00000002
000006dc  800000b7  lui (1, 524288)  # product[27] a=80000001 b=00000003
000006e0  00108093  addi (1, 1, 1)  # product[27] a=80000001 b=00000003
000006e4  00000137  lui (2, 0)  # product[27] a=80000001 b=00000003
000006e8  00310113  addi (2, 2, 3)  # product[27] a=80000001 b=00000003
000006ec  022081b3  mul (3, 1, 2)  # product[27] a=80000001 b=00000003
000006f0  02209233  mulh (4, 1, 2)  # product[27] a=80000001 b=00000003
000006f4  0220a2b3  mulhsu (5, 1, 2)  # product[27] a=80000001 b=00000003
000006f8  0220b333  mulhu (6, 1, 2)  # product[27] a=80000001 b=00000003
000006fc  003da023  sw (3, 27, 0)  # product[27] a=80000001 b=00000003
00000700  004d8d93  addi (27, 27, 4)  # product[27] a=80000001 b=00000003
00000704  004da023  sw (4, 27, 0)  # product[27] a=80000001 b=00000003
00000708  004d8d93  addi (27, 27, 4)  # product[27] a=80000001 b=00000003
0000070c  005da023  sw (5, 27, 0)  # product[27] a=80000001 b=00000003
00000710  004d8d93  addi (27, 27, 4)  # product[27] a=80000001 b=00000003
00000714  006da023  sw (6, 27, 0)  # product[27] a=80000001 b=00000003
00000718  004d8d93  addi (27, 27, 4)  # product[27] a=80000001 b=00000003
0000071c  800000b7  lui (1, 524288)  # product[28] a=80000001 b=0000001f
00000720  00108093  addi (1, 1, 1)  # product[28] a=80000001 b=0000001f
00000724  00000137  lui (2, 0)  # product[28] a=80000001 b=0000001f
00000728  01f10113  addi (2, 2, 31)  # product[28] a=80000001 b=0000001f
0000072c  022081b3  mul (3, 1, 2)  # product[28] a=80000001 b=0000001f
00000730  02209233  mulh (4, 1, 2)  # product[28] a=80000001 b=0000001f
00000734  0220a2b3  mulhsu (5, 1, 2)  # product[28] a=80000001 b=0000001f
00000738  0220b333  mulhu (6, 1, 2)  # product[28] a=80000001 b=0000001f
0000073c  003da023  sw (3, 27, 0)  # product[28] a=80000001 b=0000001f
00000740  004d8d93  addi (27, 27, 4)  # product[28] a=80000001 b=0000001f
00000744  004da023  sw (4, 27, 0)  # product[28] a=80000001 b=0000001f
00000748  004d8d93  addi (27, 27, 4)  # product[28] a=80000001 b=0000001f
0000074c  005da023  sw (5, 27, 0)  # product[28] a=80000001 b=0000001f
00000750  004d8d93  addi (27, 27, 4)  # product[28] a=80000001 b=0000001f
00000754  006da023  sw (6, 27, 0)  # product[28] a=80000001 b=0000001f
00000758  004d8d93  addi (27, 27, 4)  # product[28] a=80000001 b=0000001f
0000075c  800000b7  lui (1, 524288)  # product[29] a=80000001 b=00000020
00000760  00108093  addi (1, 1, 1)  # product[29] a=80000001 b=00000020
00000764  00000137  lui (2, 0)  # product[29] a=80000001 b=00000020
00000768  02010113  addi (2, 2, 32)  # product[29] a=80000001 b=00000020
0000076c  022081b3  mul (3, 1, 2)  # product[29] a=80000001 b=00000020
00000770  02209233  mulh (4, 1, 2)  # product[29] a=80000001 b=00000020
00000774  0220a2b3  mulhsu (5, 1, 2)  # product[29] a=80000001 b=00000020
00000778  0220b333  mulhu (6, 1, 2)  # product[29] a=80000001 b=00000020
0000077c  003da023  sw (3, 27, 0)  # product[29] a=80000001 b=00000020
00000780  004d8d93  addi (27, 27, 4)  # product[29] a=80000001 b=00000020
00000784  004da023  sw (4, 27, 0)  # product[29] a=80000001 b=00000020
00000788  004d8d93  addi (27, 27, 4)  # product[29] a=80000001 b=00000020
0000078c  005da023  sw (5, 27, 0)  # product[29] a=80000001 b=00000020
00000790  004d8d93  addi (27, 27, 4)  # product[29] a=80000001 b=00000020
00000794  006da023  sw (6, 27, 0)  # product[29] a=80000001 b=00000020
00000798  004d8d93  addi (27, 27, 4)  # product[29] a=80000001 b=00000020
0000079c  800000b7  lui (1, 524288)  # product[30] a=80000001 b=00007fff
000007a0  00108093  addi (1, 1, 1)  # product[30] a=80000001 b=00007fff
000007a4  00008137  lui (2, 8)  # product[30] a=80000001 b=00007fff
000007a8  fff10113  addi (2, 2, -1)  # product[30] a=80000001 b=00007fff
000007ac  022081b3  mul (3, 1, 2)  # product[30] a=80000001 b=00007fff
000007b0  02209233  mulh (4, 1, 2)  # product[30] a=80000001 b=00007fff
000007b4  0220a2b3  mulhsu (5, 1, 2)  # product[30] a=80000001 b=00007fff
000007b8  0220b333  mulhu (6, 1, 2)  # product[30] a=80000001 b=00007fff
000007bc  003da023  sw (3, 27, 0)  # product[30] a=80000001 b=00007fff
000007c0  004d8d93  addi (27, 27, 4)  # product[30] a=80000001 b=00007fff
000007c4  004da023  sw (4, 27, 0)  # product[30] a=80000001 b=00007fff
000007c8  004d8d93  addi (27, 27, 4)  # product[30] a=80000001 b=00007fff
000007cc  005da023  sw (5, 27, 0)  # product[30] a=80000001 b=00007fff
000007d0  004d8d93  addi (27, 27, 4)  # product[30] a=80000001 b=00007fff
000007d4  006da023  sw (6, 27, 0)  # product[30] a=80000001 b=00007fff
000007d8  004d8d93  addi (27, 27, 4)  # product[30] a=80000001 b=00007fff
000007dc  800000b7  lui (1, 524288)  # product[31] a=80000001 b=00008000
000007e0  00108093  addi (1, 1, 1)  # product[31] a=80000001 b=00008000
000007e4  00008137  lui (2, 8)  # product[31] a=80000001 b=00008000
000007e8  00010113  addi (2, 2, 0)  # product[31] a=80000001 b=00008000
000007ec  022081b3  mul (3, 1, 2)  # product[31] a=80000001 b=00008000
000007f0  02209233  mulh (4, 1, 2)  # product[31] a=80000001 b=00008000
000007f4  0220a2b3  mulhsu (5, 1, 2)  # product[31] a=80000001 b=00008000
000007f8  0220b333  mulhu (6, 1, 2)  # product[31] a=80000001 b=00008000
000007fc  003da023  sw (3, 27, 0)  # product[31] a=80000001 b=00008000
00000800  004d8d93  addi (27, 27, 4)  # product[31] a=80000001 b=00008000
00000804  004da023  sw (4, 27, 0)  # product[31] a=80000001 b=00008000
00000808  004d8d93  addi (27, 27, 4)  # product[31] a=80000001 b=00008000
0000080c  005da023  sw (5, 27, 0)  # product[31] a=80000001 b=00008000
00000810  004d8d93  addi (27, 27, 4)  # product[31] a=80000001 b=00008000
00000814  006da023  sw (6, 27, 0)  # product[31] a=80000001 b=00008000
00000818  004d8d93  addi (27, 27, 4)  # product[31] a=80000001 b=00008000
0000081c  800000b7  lui (1, 524288)  # product[32] a=80000001 b=0000ffff
00000820  00108093  addi (1, 1, 1)  # product[32] a=80000001 b=0000ffff
00000824  00010137  lui (2, 16)  # product[32] a=80000001 b=0000ffff
00000828  fff10113  addi (2, 2, -1)  # product[32] a=80000001 b=0000ffff
0000082c  022081b3  mul (3, 1, 2)  # product[32] a=80000001 b=0000ffff
00000830  02209233  mulh (4, 1, 2)  # product[32] a=80000001 b=0000ffff
00000834  0220a2b3  mulhsu (5, 1, 2)  # product[32] a=80000001 b=0000ffff
00000838  0220b333  mulhu (6, 1, 2)  # product[32] a=80000001 b=0000ffff
0000083c  003da023  sw (3, 27, 0)  # product[32] a=80000001 b=0000ffff
00000840  004d8d93  addi (27, 27, 4)  # product[32] a=80000001 b=0000ffff
00000844  004da023  sw (4, 27, 0)  # product[32] a=80000001 b=0000ffff
00000848  004d8d93  addi (27, 27, 4)  # product[32] a=80000001 b=0000ffff
0000084c  005da023  sw (5, 27, 0)  # product[32] a=80000001 b=0000ffff
00000850  004d8d93  addi (27, 27, 4)  # product[32] a=80000001 b=0000ffff
00000854  006da023  sw (6, 27, 0)  # product[32] a=80000001 b=0000ffff
00000858  004d8d93  addi (27, 27, 4)  # product[32] a=80000001 b=0000ffff
0000085c  800000b7  lui (1, 524288)  # product[33] a=80000001 b=00010000
00000860  00108093  addi (1, 1, 1)  # product[33] a=80000001 b=00010000
00000864  00010137  lui (2, 16)  # product[33] a=80000001 b=00010000
00000868  00010113  addi (2, 2, 0)  # product[33] a=80000001 b=00010000
0000086c  022081b3  mul (3, 1, 2)  # product[33] a=80000001 b=00010000
00000870  02209233  mulh (4, 1, 2)  # product[33] a=80000001 b=00010000
00000874  0220a2b3  mulhsu (5, 1, 2)  # product[33] a=80000001 b=00010000
00000878  0220b333  mulhu (6, 1, 2)  # product[33] a=80000001 b=00010000
0000087c  003da023  sw (3, 27, 0)  # product[33] a=80000001 b=00010000
00000880  004d8d93  addi (27, 27, 4)  # product[33] a=80000001 b=00010000
00000884  004da023  sw (4, 27, 0)  # product[33] a=80000001 b=00010000
00000888  004d8d93  addi (27, 27, 4)  # product[33] a=80000001 b=00010000
0000088c  005da023  sw (5, 27, 0)  # product[33] a=80000001 b=00010000
00000890  004d8d93  addi (27, 27, 4)  # product[33] a=80000001 b=00010000
00000894  006da023  sw (6, 27, 0)  # product[33] a=80000001 b=00010000
00000898  004d8d93  addi (27, 27, 4)  # product[33] a=80000001 b=00010000
0000089c  800000b7  lui (1, 524288)  # product[34] a=80000001 b=7fffffff
000008a0  00108093  addi (1, 1, 1)  # product[34] a=80000001 b=7fffffff
000008a4  80000137  lui (2, 524288)  # product[34] a=80000001 b=7fffffff
000008a8  fff10113  addi (2, 2, -1)  # product[34] a=80000001 b=7fffffff
000008ac  022081b3  mul (3, 1, 2)  # product[34] a=80000001 b=7fffffff
000008b0  02209233  mulh (4, 1, 2)  # product[34] a=80000001 b=7fffffff
000008b4  0220a2b3  mulhsu (5, 1, 2)  # product[34] a=80000001 b=7fffffff
000008b8  0220b333  mulhu (6, 1, 2)  # product[34] a=80000001 b=7fffffff
000008bc  003da023  sw (3, 27, 0)  # product[34] a=80000001 b=7fffffff
000008c0  004d8d93  addi (27, 27, 4)  # product[34] a=80000001 b=7fffffff
000008c4  004da023  sw (4, 27, 0)  # product[34] a=80000001 b=7fffffff
000008c8  004d8d93  addi (27, 27, 4)  # product[34] a=80000001 b=7fffffff
000008cc  005da023  sw (5, 27, 0)  # product[34] a=80000001 b=7fffffff
000008d0  004d8d93  addi (27, 27, 4)  # product[34] a=80000001 b=7fffffff
000008d4  006da023  sw (6, 27, 0)  # product[34] a=80000001 b=7fffffff
000008d8  004d8d93  addi (27, 27, 4)  # product[34] a=80000001 b=7fffffff
000008dc  800000b7  lui (1, 524288)  # product[35] a=80000001 b=80000000
000008e0  00108093  addi (1, 1, 1)  # product[35] a=80000001 b=80000000
000008e4  80000137  lui (2, 524288)  # product[35] a=80000001 b=80000000
000008e8  00010113  addi (2, 2, 0)  # product[35] a=80000001 b=80000000
000008ec  022081b3  mul (3, 1, 2)  # product[35] a=80000001 b=80000000
000008f0  02209233  mulh (4, 1, 2)  # product[35] a=80000001 b=80000000
000008f4  0220a2b3  mulhsu (5, 1, 2)  # product[35] a=80000001 b=80000000
000008f8  0220b333  mulhu (6, 1, 2)  # product[35] a=80000001 b=80000000
000008fc  003da023  sw (3, 27, 0)  # product[35] a=80000001 b=80000000
00000900  004d8d93  addi (27, 27, 4)  # product[35] a=80000001 b=80000000
00000904  004da023  sw (4, 27, 0)  # product[35] a=80000001 b=80000000
00000908  004d8d93  addi (27, 27, 4)  # product[35] a=80000001 b=80000000
0000090c  005da023  sw (5, 27, 0)  # product[35] a=80000001 b=80000000
00000910  004d8d93  addi (27, 27, 4)  # product[35] a=80000001 b=80000000
00000914  006da023  sw (6, 27, 0)  # product[35] a=80000001 b=80000000
00000918  004d8d93  addi (27, 27, 4)  # product[35] a=80000001 b=80000000
0000091c  800000b7  lui (1, 524288)  # product[36] a=80000001 b=80000001
00000920  00108093  addi (1, 1, 1)  # product[36] a=80000001 b=80000001
00000924  80000137  lui (2, 524288)  # product[36] a=80000001 b=80000001
00000928  00110113  addi (2, 2, 1)  # product[36] a=80000001 b=80000001
0000092c  022081b3  mul (3, 1, 2)  # product[36] a=80000001 b=80000001
00000930  02209233  mulh (4, 1, 2)  # product[36] a=80000001 b=80000001
00000934  0220a2b3  mulhsu (5, 1, 2)  # product[36] a=80000001 b=80000001
00000938  0220b333  mulhu (6, 1, 2)  # product[36] a=80000001 b=80000001
0000093c  003da023  sw (3, 27, 0)  # product[36] a=80000001 b=80000001
00000940  004d8d93  addi (27, 27, 4)  # product[36] a=80000001 b=80000001
00000944  004da023  sw (4, 27, 0)  # product[36] a=80000001 b=80000001
00000948  004d8d93  addi (27, 27, 4)  # product[36] a=80000001 b=80000001
0000094c  005da023  sw (5, 27, 0)  # product[36] a=80000001 b=80000001
00000950  004d8d93  addi (27, 27, 4)  # product[36] a=80000001 b=80000001
00000954  006da023  sw (6, 27, 0)  # product[36] a=80000001 b=80000001
00000958  004d8d93  addi (27, 27, 4)  # product[36] a=80000001 b=80000001
0000095c  800000b7  lui (1, 524288)  # product[37] a=80000001 b=fffffffe
00000960  00108093  addi (1, 1, 1)  # product[37] a=80000001 b=fffffffe
00000964  00000137  lui (2, 0)  # product[37] a=80000001 b=fffffffe
00000968  ffe10113  addi (2, 2, -2)  # product[37] a=80000001 b=fffffffe
0000096c  022081b3  mul (3, 1, 2)  # product[37] a=80000001 b=fffffffe
00000970  02209233  mulh (4, 1, 2)  # product[37] a=80000001 b=fffffffe
00000974  0220a2b3  mulhsu (5, 1, 2)  # product[37] a=80000001 b=fffffffe
00000978  0220b333  mulhu (6, 1, 2)  # product[37] a=80000001 b=fffffffe
0000097c  003da023  sw (3, 27, 0)  # product[37] a=80000001 b=fffffffe
00000980  004d8d93  addi (27, 27, 4)  # product[37] a=80000001 b=fffffffe
00000984  004da023  sw (4, 27, 0)  # product[37] a=80000001 b=fffffffe
00000988  004d8d93  addi (27, 27, 4)  # product[37] a=80000001 b=fffffffe
0000098c  005da023  sw (5, 27, 0)  # product[37] a=80000001 b=fffffffe
00000990  004d8d93  addi (27, 27, 4)  # product[37] a=80000001 b=fffffffe
00000994  006da023  sw (6, 27, 0)  # product[37] a=80000001 b=fffffffe
00000998  004d8d93  addi (27, 27, 4)  # product[37] a=80000001 b=fffffffe
0000099c  800000b7  lui (1, 524288)  # product[38] a=80000001 b=ffffffff
000009a0  00108093  addi (1, 1, 1)  # product[38] a=80000001 b=ffffffff
000009a4  00000137  lui (2, 0)  # product[38] a=80000001 b=ffffffff
000009a8  fff10113  addi (2, 2, -1)  # product[38] a=80000001 b=ffffffff
000009ac  022081b3  mul (3, 1, 2)  # product[38] a=80000001 b=ffffffff
000009b0  02209233  mulh (4, 1, 2)  # product[38] a=80000001 b=ffffffff
000009b4  0220a2b3  mulhsu (5, 1, 2)  # product[38] a=80000001 b=ffffffff
000009b8  0220b333  mulhu (6, 1, 2)  # product[38] a=80000001 b=ffffffff
000009bc  003da023  sw (3, 27, 0)  # product[38] a=80000001 b=ffffffff
000009c0  004d8d93  addi (27, 27, 4)  # product[38] a=80000001 b=ffffffff
000009c4  004da023  sw (4, 27, 0)  # product[38] a=80000001 b=ffffffff
000009c8  004d8d93  addi (27, 27, 4)  # product[38] a=80000001 b=ffffffff
000009cc  005da023  sw (5, 27, 0)  # product[38] a=80000001 b=ffffffff
000009d0  004d8d93  addi (27, 27, 4)  # product[38] a=80000001 b=ffffffff
000009d4  006da023  sw (6, 27, 0)  # product[38] a=80000001 b=ffffffff
000009d8  004d8d93  addi (27, 27, 4)  # product[38] a=80000001 b=ffffffff
000009dc  800000b7  lui (1, 524288)  # product[39] a=80000001 b=55555555
000009e0  00108093  addi (1, 1, 1)  # product[39] a=80000001 b=55555555
000009e4  55555137  lui (2, 349525)  # product[39] a=80000001 b=55555555
000009e8  55510113  addi (2, 2, 1365)  # product[39] a=80000001 b=55555555
000009ec  022081b3  mul (3, 1, 2)  # product[39] a=80000001 b=55555555
000009f0  02209233  mulh (4, 1, 2)  # product[39] a=80000001 b=55555555
000009f4  0220a2b3  mulhsu (5, 1, 2)  # product[39] a=80000001 b=55555555
000009f8  0220b333  mulhu (6, 1, 2)  # product[39] a=80000001 b=55555555
000009fc  003da023  sw (3, 27, 0)  # product[39] a=80000001 b=55555555
00000a00  004d8d93  addi (27, 27, 4)  # product[39] a=80000001 b=55555555
00000a04  004da023  sw (4, 27, 0)  # product[39] a=80000001 b=55555555
00000a08  004d8d93  addi (27, 27, 4)  # product[39] a=80000001 b=55555555
00000a0c  005da023  sw (5, 27, 0)  # product[39] a=80000001 b=55555555
00000a10  004d8d93  addi (27, 27, 4)  # product[39] a=80000001 b=55555555
00000a14  006da023  sw (6, 27, 0)  # product[39] a=80000001 b=55555555
00000a18  004d8d93  addi (27, 27, 4)  # product[39] a=80000001 b=55555555
00000a1c  800000b7  lui (1, 524288)  # product[40] a=80000001 b=aaaaaaaa
00000a20  00108093  addi (1, 1, 1)  # product[40] a=80000001 b=aaaaaaaa
00000a24  aaaab137  lui (2, 699051)  # product[40] a=80000001 b=aaaaaaaa
00000a28  aaa10113  addi (2, 2, -1366)  # product[40] a=80000001 b=aaaaaaaa
00000a2c  022081b3  mul (3, 1, 2)  # product[40] a=80000001 b=aaaaaaaa
00000a30  02209233  mulh (4, 1, 2)  # product[40] a=80000001 b=aaaaaaaa
00000a34  0220a2b3  mulhsu (5, 1, 2)  # product[40] a=80000001 b=aaaaaaaa
00000a38  0220b333  mulhu (6, 1, 2)  # product[40] a=80000001 b=aaaaaaaa
00000a3c  003da023  sw (3, 27, 0)  # product[40] a=80000001 b=aaaaaaaa
00000a40  004d8d93  addi (27, 27, 4)  # product[40] a=80000001 b=aaaaaaaa
00000a44  004da023  sw (4, 27, 0)  # product[40] a=80000001 b=aaaaaaaa
00000a48  004d8d93  addi (27, 27, 4)  # product[40] a=80000001 b=aaaaaaaa
00000a4c  005da023  sw (5, 27, 0)  # product[40] a=80000001 b=aaaaaaaa
00000a50  004d8d93  addi (27, 27, 4)  # product[40] a=80000001 b=aaaaaaaa
00000a54  006da023  sw (6, 27, 0)  # product[40] a=80000001 b=aaaaaaaa
00000a58  004d8d93  addi (27, 27, 4)  # product[40] a=80000001 b=aaaaaaaa
00000a5c  800000b7  lui (1, 524288)  # product[41] a=80000001 b=01010101
00000a60  00108093  addi (1, 1, 1)  # product[41] a=80000001 b=01010101
00000a64  01010137  lui (2, 4112)  # product[41] a=80000001 b=01010101
00000a68  10110113  addi (2, 2, 257)  # product[41] a=80000001 b=01010101
00000a6c  022081b3  mul (3, 1, 2)  # product[41] a=80000001 b=01010101
00000a70  02209233  mulh (4, 1, 2)  # product[41] a=80000001 b=01010101
00000a74  0220a2b3  mulhsu (5, 1, 2)  # product[41] a=80000001 b=01010101
00000a78  0220b333  mulhu (6, 1, 2)  # product[41] a=80000001 b=01010101
00000a7c  003da023  sw (3, 27, 0)  # product[41] a=80000001 b=01010101
00000a80  004d8d93  addi (27, 27, 4)  # product[41] a=80000001 b=01010101
00000a84  004da023  sw (4, 27, 0)  # product[41] a=80000001 b=01010101
00000a88  004d8d93  addi (27, 27, 4)  # product[41] a=80000001 b=01010101
00000a8c  005da023  sw (5, 27, 0)  # product[41] a=80000001 b=01010101
00000a90  004d8d93  addi (27, 27, 4)  # product[41] a=80000001 b=01010101
00000a94  006da023  sw (6, 27, 0)  # product[41] a=80000001 b=01010101
00000a98  004d8d93  addi (27, 27, 4)  # product[41] a=80000001 b=01010101
00000a9c  000000b7  lui (1, 0)  # product[42] a=fffffffe b=00000000
00000aa0  ffe08093  addi (1, 1, -2)  # product[42] a=fffffffe b=00000000
00000aa4  00000137  lui (2, 0)  # product[42] a=fffffffe b=00000000
00000aa8  00010113  addi (2, 2, 0)  # product[42] a=fffffffe b=00000000
00000aac  022081b3  mul (3, 1, 2)  # product[42] a=fffffffe b=00000000
00000ab0  02209233  mulh (4, 1, 2)  # product[42] a=fffffffe b=00000000
00000ab4  0220a2b3  mulhsu (5, 1, 2)  # product[42] a=fffffffe b=00000000
00000ab8  0220b333  mulhu (6, 1, 2)  # product[42] a=fffffffe b=00000000
00000abc  003da023  sw (3, 27, 0)  # product[42] a=fffffffe b=00000000
00000ac0  004d8d93  addi (27, 27, 4)  # product[42] a=fffffffe b=00000000
00000ac4  004da023  sw (4, 27, 0)  # product[42] a=fffffffe b=00000000
00000ac8  004d8d93  addi (27, 27, 4)  # product[42] a=fffffffe b=00000000
00000acc  005da023  sw (5, 27, 0)  # product[42] a=fffffffe b=00000000
00000ad0  004d8d93  addi (27, 27, 4)  # product[42] a=fffffffe b=00000000
00000ad4  006da023  sw (6, 27, 0)  # product[42] a=fffffffe b=00000000
00000ad8  004d8d93  addi (27, 27, 4)  # product[42] a=fffffffe b=00000000
00000adc  000000b7  lui (1, 0)  # product[43] a=fffffffe b=00000001
00000ae0  ffe08093  addi (1, 1, -2)  # product[43] a=fffffffe b=00000001
00000ae4  00000137  lui (2, 0)  # product[43] a=fffffffe b=00000001
00000ae8  00110113  addi (2, 2, 1)  # product[43] a=fffffffe b=00000001
00000aec  022081b3  mul (3, 1, 2)  # product[43] a=fffffffe b=00000001
00000af0  02209233  mulh (4, 1, 2)  # product[43] a=fffffffe b=00000001
00000af4  0220a2b3  mulhsu (5, 1, 2)  # product[43] a=fffffffe b=00000001
00000af8  0220b333  mulhu (6, 1, 2)  # product[43] a=fffffffe b=00000001
00000afc  003da023  sw (3, 27, 0)  # product[43] a=fffffffe b=00000001
00000b00  004d8d93  addi (27, 27, 4)  # product[43] a=fffffffe b=00000001
00000b04  004da023  sw (4, 27, 0)  # product[43] a=fffffffe b=00000001
00000b08  004d8d93  addi (27, 27, 4)  # product[43] a=fffffffe b=00000001
00000b0c  005da023  sw (5, 27, 0)  # product[43] a=fffffffe b=00000001
00000b10  004d8d93  addi (27, 27, 4)  # product[43] a=fffffffe b=00000001
00000b14  006da023  sw (6, 27, 0)  # product[43] a=fffffffe b=00000001
00000b18  004d8d93  addi (27, 27, 4)  # product[43] a=fffffffe b=00000001
00000b1c  000000b7  lui (1, 0)  # product[44] a=fffffffe b=00000002
00000b20  ffe08093  addi (1, 1, -2)  # product[44] a=fffffffe b=00000002
00000b24  00000137  lui (2, 0)  # product[44] a=fffffffe b=00000002
00000b28  00210113  addi (2, 2, 2)  # product[44] a=fffffffe b=00000002
00000b2c  022081b3  mul (3, 1, 2)  # product[44] a=fffffffe b=00000002
00000b30  02209233  mulh (4, 1, 2)  # product[44] a=fffffffe b=00000002
00000b34  0220a2b3  mulhsu (5, 1, 2)  # product[44] a=fffffffe b=00000002
00000b38  0220b333  mulhu (6, 1, 2)  # product[44] a=fffffffe b=00000002
00000b3c  003da023  sw (3, 27, 0)  # product[44] a=fffffffe b=00000002
00000b40  004d8d93  addi (27, 27, 4)  # product[44] a=fffffffe b=00000002
00000b44  004da023  sw (4, 27, 0)  # product[44] a=fffffffe b=00000002
00000b48  004d8d93  addi (27, 27, 4)  # product[44] a=fffffffe b=00000002
00000b4c  005da023  sw (5, 27, 0)  # product[44] a=fffffffe b=00000002
00000b50  004d8d93  addi (27, 27, 4)  # product[44] a=fffffffe b=00000002
00000b54  006da023  sw (6, 27, 0)  # product[44] a=fffffffe b=00000002
00000b58  004d8d93  addi (27, 27, 4)  # product[44] a=fffffffe b=00000002
00000b5c  000000b7  lui (1, 0)  # product[45] a=fffffffe b=00000003
00000b60  ffe08093  addi (1, 1, -2)  # product[45] a=fffffffe b=00000003
00000b64  00000137  lui (2, 0)  # product[45] a=fffffffe b=00000003
00000b68  00310113  addi (2, 2, 3)  # product[45] a=fffffffe b=00000003
00000b6c  022081b3  mul (3, 1, 2)  # product[45] a=fffffffe b=00000003
00000b70  02209233  mulh (4, 1, 2)  # product[45] a=fffffffe b=00000003
00000b74  0220a2b3  mulhsu (5, 1, 2)  # product[45] a=fffffffe b=00000003
00000b78  0220b333  mulhu (6, 1, 2)  # product[45] a=fffffffe b=00000003
00000b7c  003da023  sw (3, 27, 0)  # product[45] a=fffffffe b=00000003
00000b80  004d8d93  addi (27, 27, 4)  # product[45] a=fffffffe b=00000003
00000b84  004da023  sw (4, 27, 0)  # product[45] a=fffffffe b=00000003
00000b88  004d8d93  addi (27, 27, 4)  # product[45] a=fffffffe b=00000003
00000b8c  005da023  sw (5, 27, 0)  # product[45] a=fffffffe b=00000003
00000b90  004d8d93  addi (27, 27, 4)  # product[45] a=fffffffe b=00000003
00000b94  006da023  sw (6, 27, 0)  # product[45] a=fffffffe b=00000003
00000b98  004d8d93  addi (27, 27, 4)  # product[45] a=fffffffe b=00000003
00000b9c  000000b7  lui (1, 0)  # product[46] a=fffffffe b=0000001f
00000ba0  ffe08093  addi (1, 1, -2)  # product[46] a=fffffffe b=0000001f
00000ba4  00000137  lui (2, 0)  # product[46] a=fffffffe b=0000001f
00000ba8  01f10113  addi (2, 2, 31)  # product[46] a=fffffffe b=0000001f
00000bac  022081b3  mul (3, 1, 2)  # product[46] a=fffffffe b=0000001f
00000bb0  02209233  mulh (4, 1, 2)  # product[46] a=fffffffe b=0000001f
00000bb4  0220a2b3  mulhsu (5, 1, 2)  # product[46] a=fffffffe b=0000001f
00000bb8  0220b333  mulhu (6, 1, 2)  # product[46] a=fffffffe b=0000001f
00000bbc  003da023  sw (3, 27, 0)  # product[46] a=fffffffe b=0000001f
00000bc0  004d8d93  addi (27, 27, 4)  # product[46] a=fffffffe b=0000001f
00000bc4  004da023  sw (4, 27, 0)  # product[46] a=fffffffe b=0000001f
00000bc8  004d8d93  addi (27, 27, 4)  # product[46] a=fffffffe b=0000001f
00000bcc  005da023  sw (5, 27, 0)  # product[46] a=fffffffe b=0000001f
00000bd0  004d8d93  addi (27, 27, 4)  # product[46] a=fffffffe b=0000001f
00000bd4  006da023  sw (6, 27, 0)  # product[46] a=fffffffe b=0000001f
00000bd8  004d8d93  addi (27, 27, 4)  # product[46] a=fffffffe b=0000001f
00000bdc  000000b7  lui (1, 0)  # product[47] a=fffffffe b=00000020
00000be0  ffe08093  addi (1, 1, -2)  # product[47] a=fffffffe b=00000020
00000be4  00000137  lui (2, 0)  # product[47] a=fffffffe b=00000020
00000be8  02010113  addi (2, 2, 32)  # product[47] a=fffffffe b=00000020
00000bec  022081b3  mul (3, 1, 2)  # product[47] a=fffffffe b=00000020
00000bf0  02209233  mulh (4, 1, 2)  # product[47] a=fffffffe b=00000020
00000bf4  0220a2b3  mulhsu (5, 1, 2)  # product[47] a=fffffffe b=00000020
00000bf8  0220b333  mulhu (6, 1, 2)  # product[47] a=fffffffe b=00000020
00000bfc  003da023  sw (3, 27, 0)  # product[47] a=fffffffe b=00000020
00000c00  004d8d93  addi (27, 27, 4)  # product[47] a=fffffffe b=00000020
00000c04  004da023  sw (4, 27, 0)  # product[47] a=fffffffe b=00000020
00000c08  004d8d93  addi (27, 27, 4)  # product[47] a=fffffffe b=00000020
00000c0c  005da023  sw (5, 27, 0)  # product[47] a=fffffffe b=00000020
00000c10  004d8d93  addi (27, 27, 4)  # product[47] a=fffffffe b=00000020
00000c14  006da023  sw (6, 27, 0)  # product[47] a=fffffffe b=00000020
00000c18  004d8d93  addi (27, 27, 4)  # product[47] a=fffffffe b=00000020
00000c1c  000000b7  lui (1, 0)  # product[48] a=fffffffe b=00007fff
00000c20  ffe08093  addi (1, 1, -2)  # product[48] a=fffffffe b=00007fff
00000c24  00008137  lui (2, 8)  # product[48] a=fffffffe b=00007fff
00000c28  fff10113  addi (2, 2, -1)  # product[48] a=fffffffe b=00007fff
00000c2c  022081b3  mul (3, 1, 2)  # product[48] a=fffffffe b=00007fff
00000c30  02209233  mulh (4, 1, 2)  # product[48] a=fffffffe b=00007fff
00000c34  0220a2b3  mulhsu (5, 1, 2)  # product[48] a=fffffffe b=00007fff
00000c38  0220b333  mulhu (6, 1, 2)  # product[48] a=fffffffe b=00007fff
00000c3c  003da023  sw (3, 27, 0)  # product[48] a=fffffffe b=00007fff
00000c40  004d8d93  addi (27, 27, 4)  # product[48] a=fffffffe b=00007fff
00000c44  004da023  sw (4, 27, 0)  # product[48] a=fffffffe b=00007fff
00000c48  004d8d93  addi (27, 27, 4)  # product[48] a=fffffffe b=00007fff
00000c4c  005da023  sw (5, 27, 0)  # product[48] a=fffffffe b=00007fff
00000c50  004d8d93  addi (27, 27, 4)  # product[48] a=fffffffe b=00007fff
00000c54  006da023  sw (6, 27, 0)  # product[48] a=fffffffe b=00007fff
00000c58  004d8d93  addi (27, 27, 4)  # product[48] a=fffffffe b=00007fff
00000c5c  000000b7  lui (1, 0)  # product[49] a=fffffffe b=00008000
00000c60  ffe08093  addi (1, 1, -2)  # product[49] a=fffffffe b=00008000
00000c64  00008137  lui (2, 8)  # product[49] a=fffffffe b=00008000
00000c68  00010113  addi (2, 2, 0)  # product[49] a=fffffffe b=00008000
00000c6c  022081b3  mul (3, 1, 2)  # product[49] a=fffffffe b=00008000
00000c70  02209233  mulh (4, 1, 2)  # product[49] a=fffffffe b=00008000
00000c74  0220a2b3  mulhsu (5, 1, 2)  # product[49] a=fffffffe b=00008000
00000c78  0220b333  mulhu (6, 1, 2)  # product[49] a=fffffffe b=00008000
00000c7c  003da023  sw (3, 27, 0)  # product[49] a=fffffffe b=00008000
00000c80  004d8d93  addi (27, 27, 4)  # product[49] a=fffffffe b=00008000
00000c84  004da023  sw (4, 27, 0)  # product[49] a=fffffffe b=00008000
00000c88  004d8d93  addi (27, 27, 4)  # product[49] a=fffffffe b=00008000
00000c8c  005da023  sw (5, 27, 0)  # product[49] a=fffffffe b=00008000
00000c90  004d8d93  addi (27, 27, 4)  # product[49] a=fffffffe b=00008000
00000c94  006da023  sw (6, 27, 0)  # product[49] a=fffffffe b=00008000
00000c98  004d8d93  addi (27, 27, 4)  # product[49] a=fffffffe b=00008000
00000c9c  000000b7  lui (1, 0)  # product[50] a=fffffffe b=0000ffff
00000ca0  ffe08093  addi (1, 1, -2)  # product[50] a=fffffffe b=0000ffff
00000ca4  00010137  lui (2, 16)  # product[50] a=fffffffe b=0000ffff
00000ca8  fff10113  addi (2, 2, -1)  # product[50] a=fffffffe b=0000ffff
00000cac  022081b3  mul (3, 1, 2)  # product[50] a=fffffffe b=0000ffff
00000cb0  02209233  mulh (4, 1, 2)  # product[50] a=fffffffe b=0000ffff
00000cb4  0220a2b3  mulhsu (5, 1, 2)  # product[50] a=fffffffe b=0000ffff
00000cb8  0220b333  mulhu (6, 1, 2)  # product[50] a=fffffffe b=0000ffff
00000cbc  003da023  sw (3, 27, 0)  # product[50] a=fffffffe b=0000ffff
00000cc0  004d8d93  addi (27, 27, 4)  # product[50] a=fffffffe b=0000ffff
00000cc4  004da023  sw (4, 27, 0)  # product[50] a=fffffffe b=0000ffff
00000cc8  004d8d93  addi (27, 27, 4)  # product[50] a=fffffffe b=0000ffff
00000ccc  005da023  sw (5, 27, 0)  # product[50] a=fffffffe b=0000ffff
00000cd0  004d8d93  addi (27, 27, 4)  # product[50] a=fffffffe b=0000ffff
00000cd4  006da023  sw (6, 27, 0)  # product[50] a=fffffffe b=0000ffff
00000cd8  004d8d93  addi (27, 27, 4)  # product[50] a=fffffffe b=0000ffff
00000cdc  000000b7  lui (1, 0)  # product[51] a=fffffffe b=00010000
00000ce0  ffe08093  addi (1, 1, -2)  # product[51] a=fffffffe b=00010000
00000ce4  00010137  lui (2, 16)  # product[51] a=fffffffe b=00010000
00000ce8  00010113  addi (2, 2, 0)  # product[51] a=fffffffe b=00010000
00000cec  022081b3  mul (3, 1, 2)  # product[51] a=fffffffe b=00010000
00000cf0  02209233  mulh (4, 1, 2)  # product[51] a=fffffffe b=00010000
00000cf4  0220a2b3  mulhsu (5, 1, 2)  # product[51] a=fffffffe b=00010000
00000cf8  0220b333  mulhu (6, 1, 2)  # product[51] a=fffffffe b=00010000
00000cfc  003da023  sw (3, 27, 0)  # product[51] a=fffffffe b=00010000
00000d00  004d8d93  addi (27, 27, 4)  # product[51] a=fffffffe b=00010000
00000d04  004da023  sw (4, 27, 0)  # product[51] a=fffffffe b=00010000
00000d08  004d8d93  addi (27, 27, 4)  # product[51] a=fffffffe b=00010000
00000d0c  005da023  sw (5, 27, 0)  # product[51] a=fffffffe b=00010000
00000d10  004d8d93  addi (27, 27, 4)  # product[51] a=fffffffe b=00010000
00000d14  006da023  sw (6, 27, 0)  # product[51] a=fffffffe b=00010000
00000d18  004d8d93  addi (27, 27, 4)  # product[51] a=fffffffe b=00010000
00000d1c  000000b7  lui (1, 0)  # product[52] a=fffffffe b=7fffffff
00000d20  ffe08093  addi (1, 1, -2)  # product[52] a=fffffffe b=7fffffff
00000d24  80000137  lui (2, 524288)  # product[52] a=fffffffe b=7fffffff
00000d28  fff10113  addi (2, 2, -1)  # product[52] a=fffffffe b=7fffffff
00000d2c  022081b3  mul (3, 1, 2)  # product[52] a=fffffffe b=7fffffff
00000d30  02209233  mulh (4, 1, 2)  # product[52] a=fffffffe b=7fffffff
00000d34  0220a2b3  mulhsu (5, 1, 2)  # product[52] a=fffffffe b=7fffffff
00000d38  0220b333  mulhu (6, 1, 2)  # product[52] a=fffffffe b=7fffffff
00000d3c  003da023  sw (3, 27, 0)  # product[52] a=fffffffe b=7fffffff
00000d40  004d8d93  addi (27, 27, 4)  # product[52] a=fffffffe b=7fffffff
00000d44  004da023  sw (4, 27, 0)  # product[52] a=fffffffe b=7fffffff
00000d48  004d8d93  addi (27, 27, 4)  # product[52] a=fffffffe b=7fffffff
00000d4c  005da023  sw (5, 27, 0)  # product[52] a=fffffffe b=7fffffff
00000d50  004d8d93  addi (27, 27, 4)  # product[52] a=fffffffe b=7fffffff
00000d54  006da023  sw (6, 27, 0)  # product[52] a=fffffffe b=7fffffff
00000d58  004d8d93  addi (27, 27, 4)  # product[52] a=fffffffe b=7fffffff
00000d5c  000000b7  lui (1, 0)  # product[53] a=fffffffe b=80000000
00000d60  ffe08093  addi (1, 1, -2)  # product[53] a=fffffffe b=80000000
00000d64  80000137  lui (2, 524288)  # product[53] a=fffffffe b=80000000
00000d68  00010113  addi (2, 2, 0)  # product[53] a=fffffffe b=80000000
00000d6c  022081b3  mul (3, 1, 2)  # product[53] a=fffffffe b=80000000
00000d70  02209233  mulh (4, 1, 2)  # product[53] a=fffffffe b=80000000
00000d74  0220a2b3  mulhsu (5, 1, 2)  # product[53] a=fffffffe b=80000000
00000d78  0220b333  mulhu (6, 1, 2)  # product[53] a=fffffffe b=80000000
00000d7c  003da023  sw (3, 27, 0)  # product[53] a=fffffffe b=80000000
00000d80  004d8d93  addi (27, 27, 4)  # product[53] a=fffffffe b=80000000
00000d84  004da023  sw (4, 27, 0)  # product[53] a=fffffffe b=80000000
00000d88  004d8d93  addi (27, 27, 4)  # product[53] a=fffffffe b=80000000
00000d8c  005da023  sw (5, 27, 0)  # product[53] a=fffffffe b=80000000
00000d90  004d8d93  addi (27, 27, 4)  # product[53] a=fffffffe b=80000000
00000d94  006da023  sw (6, 27, 0)  # product[53] a=fffffffe b=80000000
00000d98  004d8d93  addi (27, 27, 4)  # product[53] a=fffffffe b=80000000
00000d9c  000000b7  lui (1, 0)  # product[54] a=fffffffe b=80000001
00000da0  ffe08093  addi (1, 1, -2)  # product[54] a=fffffffe b=80000001
00000da4  80000137  lui (2, 524288)  # product[54] a=fffffffe b=80000001
00000da8  00110113  addi (2, 2, 1)  # product[54] a=fffffffe b=80000001
00000dac  022081b3  mul (3, 1, 2)  # product[54] a=fffffffe b=80000001
00000db0  02209233  mulh (4, 1, 2)  # product[54] a=fffffffe b=80000001
00000db4  0220a2b3  mulhsu (5, 1, 2)  # product[54] a=fffffffe b=80000001
00000db8  0220b333  mulhu (6, 1, 2)  # product[54] a=fffffffe b=80000001
00000dbc  003da023  sw (3, 27, 0)  # product[54] a=fffffffe b=80000001
00000dc0  004d8d93  addi (27, 27, 4)  # product[54] a=fffffffe b=80000001
00000dc4  004da023  sw (4, 27, 0)  # product[54] a=fffffffe b=80000001
00000dc8  004d8d93  addi (27, 27, 4)  # product[54] a=fffffffe b=80000001
00000dcc  005da023  sw (5, 27, 0)  # product[54] a=fffffffe b=80000001
00000dd0  004d8d93  addi (27, 27, 4)  # product[54] a=fffffffe b=80000001
00000dd4  006da023  sw (6, 27, 0)  # product[54] a=fffffffe b=80000001
00000dd8  004d8d93  addi (27, 27, 4)  # product[54] a=fffffffe b=80000001
00000ddc  000000b7  lui (1, 0)  # product[55] a=fffffffe b=fffffffe
00000de0  ffe08093  addi (1, 1, -2)  # product[55] a=fffffffe b=fffffffe
00000de4  00000137  lui (2, 0)  # product[55] a=fffffffe b=fffffffe
00000de8  ffe10113  addi (2, 2, -2)  # product[55] a=fffffffe b=fffffffe
00000dec  022081b3  mul (3, 1, 2)  # product[55] a=fffffffe b=fffffffe
00000df0  02209233  mulh (4, 1, 2)  # product[55] a=fffffffe b=fffffffe
00000df4  0220a2b3  mulhsu (5, 1, 2)  # product[55] a=fffffffe b=fffffffe
00000df8  0220b333  mulhu (6, 1, 2)  # product[55] a=fffffffe b=fffffffe
00000dfc  003da023  sw (3, 27, 0)  # product[55] a=fffffffe b=fffffffe
00000e00  004d8d93  addi (27, 27, 4)  # product[55] a=fffffffe b=fffffffe
00000e04  004da023  sw (4, 27, 0)  # product[55] a=fffffffe b=fffffffe
00000e08  004d8d93  addi (27, 27, 4)  # product[55] a=fffffffe b=fffffffe
00000e0c  005da023  sw (5, 27, 0)  # product[55] a=fffffffe b=fffffffe
00000e10  004d8d93  addi (27, 27, 4)  # product[55] a=fffffffe b=fffffffe
00000e14  006da023  sw (6, 27, 0)  # product[55] a=fffffffe b=fffffffe
00000e18  004d8d93  addi (27, 27, 4)  # product[55] a=fffffffe b=fffffffe
00000e1c  000000b7  lui (1, 0)  # product[56] a=fffffffe b=ffffffff
00000e20  ffe08093  addi (1, 1, -2)  # product[56] a=fffffffe b=ffffffff
00000e24  00000137  lui (2, 0)  # product[56] a=fffffffe b=ffffffff
00000e28  fff10113  addi (2, 2, -1)  # product[56] a=fffffffe b=ffffffff
00000e2c  022081b3  mul (3, 1, 2)  # product[56] a=fffffffe b=ffffffff
00000e30  02209233  mulh (4, 1, 2)  # product[56] a=fffffffe b=ffffffff
00000e34  0220a2b3  mulhsu (5, 1, 2)  # product[56] a=fffffffe b=ffffffff
00000e38  0220b333  mulhu (6, 1, 2)  # product[56] a=fffffffe b=ffffffff
00000e3c  003da023  sw (3, 27, 0)  # product[56] a=fffffffe b=ffffffff
00000e40  004d8d93  addi (27, 27, 4)  # product[56] a=fffffffe b=ffffffff
00000e44  004da023  sw (4, 27, 0)  # product[56] a=fffffffe b=ffffffff
00000e48  004d8d93  addi (27, 27, 4)  # product[56] a=fffffffe b=ffffffff
00000e4c  005da023  sw (5, 27, 0)  # product[56] a=fffffffe b=ffffffff
00000e50  004d8d93  addi (27, 27, 4)  # product[56] a=fffffffe b=ffffffff
00000e54  006da023  sw (6, 27, 0)  # product[56] a=fffffffe b=ffffffff
00000e58  004d8d93  addi (27, 27, 4)  # product[56] a=fffffffe b=ffffffff
00000e5c  000000b7  lui (1, 0)  # product[57] a=fffffffe b=55555555
00000e60  ffe08093  addi (1, 1, -2)  # product[57] a=fffffffe b=55555555
00000e64  55555137  lui (2, 349525)  # product[57] a=fffffffe b=55555555
00000e68  55510113  addi (2, 2, 1365)  # product[57] a=fffffffe b=55555555
00000e6c  022081b3  mul (3, 1, 2)  # product[57] a=fffffffe b=55555555
00000e70  02209233  mulh (4, 1, 2)  # product[57] a=fffffffe b=55555555
00000e74  0220a2b3  mulhsu (5, 1, 2)  # product[57] a=fffffffe b=55555555
00000e78  0220b333  mulhu (6, 1, 2)  # product[57] a=fffffffe b=55555555
00000e7c  003da023  sw (3, 27, 0)  # product[57] a=fffffffe b=55555555
00000e80  004d8d93  addi (27, 27, 4)  # product[57] a=fffffffe b=55555555
00000e84  004da023  sw (4, 27, 0)  # product[57] a=fffffffe b=55555555
00000e88  004d8d93  addi (27, 27, 4)  # product[57] a=fffffffe b=55555555
00000e8c  005da023  sw (5, 27, 0)  # product[57] a=fffffffe b=55555555
00000e90  004d8d93  addi (27, 27, 4)  # product[57] a=fffffffe b=55555555
00000e94  006da023  sw (6, 27, 0)  # product[57] a=fffffffe b=55555555
00000e98  004d8d93  addi (27, 27, 4)  # product[57] a=fffffffe b=55555555
00000e9c  000000b7  lui (1, 0)  # product[58] a=fffffffe b=aaaaaaaa
00000ea0  ffe08093  addi (1, 1, -2)  # product[58] a=fffffffe b=aaaaaaaa
00000ea4  aaaab137  lui (2, 699051)  # product[58] a=fffffffe b=aaaaaaaa
00000ea8  aaa10113  addi (2, 2, -1366)  # product[58] a=fffffffe b=aaaaaaaa
00000eac  022081b3  mul (3, 1, 2)  # product[58] a=fffffffe b=aaaaaaaa
00000eb0  02209233  mulh (4, 1, 2)  # product[58] a=fffffffe b=aaaaaaaa
00000eb4  0220a2b3  mulhsu (5, 1, 2)  # product[58] a=fffffffe b=aaaaaaaa
00000eb8  0220b333  mulhu (6, 1, 2)  # product[58] a=fffffffe b=aaaaaaaa
00000ebc  003da023  sw (3, 27, 0)  # product[58] a=fffffffe b=aaaaaaaa
00000ec0  004d8d93  addi (27, 27, 4)  # product[58] a=fffffffe b=aaaaaaaa
00000ec4  004da023  sw (4, 27, 0)  # product[58] a=fffffffe b=aaaaaaaa
00000ec8  004d8d93  addi (27, 27, 4)  # product[58] a=fffffffe b=aaaaaaaa
00000ecc  005da023  sw (5, 27, 0)  # product[58] a=fffffffe b=aaaaaaaa
00000ed0  004d8d93  addi (27, 27, 4)  # product[58] a=fffffffe b=aaaaaaaa
00000ed4  006da023  sw (6, 27, 0)  # product[58] a=fffffffe b=aaaaaaaa
00000ed8  004d8d93  addi (27, 27, 4)  # product[58] a=fffffffe b=aaaaaaaa
00000edc  000000b7  lui (1, 0)  # product[59] a=fffffffe b=01010101
00000ee0  ffe08093  addi (1, 1, -2)  # product[59] a=fffffffe b=01010101
00000ee4  01010137  lui (2, 4112)  # product[59] a=fffffffe b=01010101
00000ee8  10110113  addi (2, 2, 257)  # product[59] a=fffffffe b=01010101
00000eec  022081b3  mul (3, 1, 2)  # product[59] a=fffffffe b=01010101
00000ef0  02209233  mulh (4, 1, 2)  # product[59] a=fffffffe b=01010101
00000ef4  0220a2b3  mulhsu (5, 1, 2)  # product[59] a=fffffffe b=01010101
00000ef8  0220b333  mulhu (6, 1, 2)  # product[59] a=fffffffe b=01010101
00000efc  003da023  sw (3, 27, 0)  # product[59] a=fffffffe b=01010101
00000f00  004d8d93  addi (27, 27, 4)  # product[59] a=fffffffe b=01010101
00000f04  004da023  sw (4, 27, 0)  # product[59] a=fffffffe b=01010101
00000f08  004d8d93  addi (27, 27, 4)  # product[59] a=fffffffe b=01010101
00000f0c  005da023  sw (5, 27, 0)  # product[59] a=fffffffe b=01010101
00000f10  004d8d93  addi (27, 27, 4)  # product[59] a=fffffffe b=01010101
00000f14  006da023  sw (6, 27, 0)  # product[59] a=fffffffe b=01010101
00000f18  004d8d93  addi (27, 27, 4)  # product[59] a=fffffffe b=01010101
00000f1c  000000b7  lui (1, 0)  # product[60] a=ffffffff b=00000000
00000f20  fff08093  addi (1, 1, -1)  # product[60] a=ffffffff b=00000000
00000f24  00000137  lui (2, 0)  # product[60] a=ffffffff b=00000000
00000f28  00010113  addi (2, 2, 0)  # product[60] a=ffffffff b=00000000
00000f2c  022081b3  mul (3, 1, 2)  # product[60] a=ffffffff b=00000000
00000f30  02209233  mulh (4, 1, 2)  # product[60] a=ffffffff b=00000000
00000f34  0220a2b3  mulhsu (5, 1, 2)  # product[60] a=ffffffff b=00000000
00000f38  0220b333  mulhu (6, 1, 2)  # product[60] a=ffffffff b=00000000
00000f3c  003da023  sw (3, 27, 0)  # product[60] a=ffffffff b=00000000
00000f40  004d8d93  addi (27, 27, 4)  # product[60] a=ffffffff b=00000000
00000f44  004da023  sw (4, 27, 0)  # product[60] a=ffffffff b=00000000
00000f48  004d8d93  addi (27, 27, 4)  # product[60] a=ffffffff b=00000000
00000f4c  005da023  sw (5, 27, 0)  # product[60] a=ffffffff b=00000000
00000f50  004d8d93  addi (27, 27, 4)  # product[60] a=ffffffff b=00000000
00000f54  006da023  sw (6, 27, 0)  # product[60] a=ffffffff b=00000000
00000f58  004d8d93  addi (27, 27, 4)  # product[60] a=ffffffff b=00000000
00000f5c  000000b7  lui (1, 0)  # product[61] a=ffffffff b=00000001
00000f60  fff08093  addi (1, 1, -1)  # product[61] a=ffffffff b=00000001
00000f64  00000137  lui (2, 0)  # product[61] a=ffffffff b=00000001
00000f68  00110113  addi (2, 2, 1)  # product[61] a=ffffffff b=00000001
00000f6c  022081b3  mul (3, 1, 2)  # product[61] a=ffffffff b=00000001
00000f70  02209233  mulh (4, 1, 2)  # product[61] a=ffffffff b=00000001
00000f74  0220a2b3  mulhsu (5, 1, 2)  # product[61] a=ffffffff b=00000001
00000f78  0220b333  mulhu (6, 1, 2)  # product[61] a=ffffffff b=00000001
00000f7c  003da023  sw (3, 27, 0)  # product[61] a=ffffffff b=00000001
00000f80  004d8d93  addi (27, 27, 4)  # product[61] a=ffffffff b=00000001
00000f84  004da023  sw (4, 27, 0)  # product[61] a=ffffffff b=00000001
00000f88  004d8d93  addi (27, 27, 4)  # product[61] a=ffffffff b=00000001
00000f8c  005da023  sw (5, 27, 0)  # product[61] a=ffffffff b=00000001
00000f90  004d8d93  addi (27, 27, 4)  # product[61] a=ffffffff b=00000001
00000f94  006da023  sw (6, 27, 0)  # product[61] a=ffffffff b=00000001
00000f98  004d8d93  addi (27, 27, 4)  # product[61] a=ffffffff b=00000001
00000f9c  000000b7  lui (1, 0)  # product[62] a=ffffffff b=00000002
00000fa0  fff08093  addi (1, 1, -1)  # product[62] a=ffffffff b=00000002
00000fa4  00000137  lui (2, 0)  # product[62] a=ffffffff b=00000002
00000fa8  00210113  addi (2, 2, 2)  # product[62] a=ffffffff b=00000002
00000fac  022081b3  mul (3, 1, 2)  # product[62] a=ffffffff b=00000002
00000fb0  02209233  mulh (4, 1, 2)  # product[62] a=ffffffff b=00000002
00000fb4  0220a2b3  mulhsu (5, 1, 2)  # product[62] a=ffffffff b=00000002
00000fb8  0220b333  mulhu (6, 1, 2)  # product[62] a=ffffffff b=00000002
00000fbc  003da023  sw (3, 27, 0)  # product[62] a=ffffffff b=00000002
00000fc0  004d8d93  addi (27, 27, 4)  # product[62] a=ffffffff b=00000002
00000fc4  004da023  sw (4, 27, 0)  # product[62] a=ffffffff b=00000002
00000fc8  004d8d93  addi (27, 27, 4)  # product[62] a=ffffffff b=00000002
00000fcc  005da023  sw (5, 27, 0)  # product[62] a=ffffffff b=00000002
00000fd0  004d8d93  addi (27, 27, 4)  # product[62] a=ffffffff b=00000002
00000fd4  006da023  sw (6, 27, 0)  # product[62] a=ffffffff b=00000002
00000fd8  004d8d93  addi (27, 27, 4)  # product[62] a=ffffffff b=00000002
00000fdc  000000b7  lui (1, 0)  # product[63] a=ffffffff b=00000003
00000fe0  fff08093  addi (1, 1, -1)  # product[63] a=ffffffff b=00000003
00000fe4  00000137  lui (2, 0)  # product[63] a=ffffffff b=00000003
00000fe8  00310113  addi (2, 2, 3)  # product[63] a=ffffffff b=00000003
00000fec  022081b3  mul (3, 1, 2)  # product[63] a=ffffffff b=00000003
00000ff0  02209233  mulh (4, 1, 2)  # product[63] a=ffffffff b=00000003
00000ff4  0220a2b3  mulhsu (5, 1, 2)  # product[63] a=ffffffff b=00000003
00000ff8  0220b333  mulhu (6, 1, 2)  # product[63] a=ffffffff b=00000003
00000ffc  003da023  sw (3, 27, 0)  # product[63] a=ffffffff b=00000003
00001000  004d8d93  addi (27, 27, 4)  # product[63] a=ffffffff b=00000003
00001004  004da023  sw (4, 27, 0)  # product[63] a=ffffffff b=00000003
00001008  004d8d93  addi (27, 27, 4)  # product[63] a=ffffffff b=00000003
0000100c  005da023  sw (5, 27, 0)  # product[63] a=ffffffff b=00000003
00001010  004d8d93  addi (27, 27, 4)  # product[63] a=ffffffff b=00000003
00001014  006da023  sw (6, 27, 0)  # product[63] a=ffffffff b=00000003
00001018  004d8d93  addi (27, 27, 4)  # product[63] a=ffffffff b=00000003
0000101c  000000b7  lui (1, 0)  # product[64] a=ffffffff b=0000001f
00001020  fff08093  addi (1, 1, -1)  # product[64] a=ffffffff b=0000001f
00001024  00000137  lui (2, 0)  # product[64] a=ffffffff b=0000001f
00001028  01f10113  addi (2, 2, 31)  # product[64] a=ffffffff b=0000001f
0000102c  022081b3  mul (3, 1, 2)  # product[64] a=ffffffff b=0000001f
00001030  02209233  mulh (4, 1, 2)  # product[64] a=ffffffff b=0000001f
00001034  0220a2b3  mulhsu (5, 1, 2)  # product[64] a=ffffffff b=0000001f
00001038  0220b333  mulhu (6, 1, 2)  # product[64] a=ffffffff b=0000001f
0000103c  003da023  sw (3, 27, 0)  # product[64] a=ffffffff b=0000001f
00001040  004d8d93  addi (27, 27, 4)  # product[64] a=ffffffff b=0000001f
00001044  004da023  sw (4, 27, 0)  # product[64] a=ffffffff b=0000001f
00001048  004d8d93  addi (27, 27, 4)  # product[64] a=ffffffff b=0000001f
0000104c  005da023  sw (5, 27, 0)  # product[64] a=ffffffff b=0000001f
00001050  004d8d93  addi (27, 27, 4)  # product[64] a=ffffffff b=0000001f
00001054  006da023  sw (6, 27, 0)  # product[64] a=ffffffff b=0000001f
00001058  004d8d93  addi (27, 27, 4)  # product[64] a=ffffffff b=0000001f
0000105c  000000b7  lui (1, 0)  # product[65] a=ffffffff b=00000020
00001060  fff08093  addi (1, 1, -1)  # product[65] a=ffffffff b=00000020
00001064  00000137  lui (2, 0)  # product[65] a=ffffffff b=00000020
00001068  02010113  addi (2, 2, 32)  # product[65] a=ffffffff b=00000020
0000106c  022081b3  mul (3, 1, 2)  # product[65] a=ffffffff b=00000020
00001070  02209233  mulh (4, 1, 2)  # product[65] a=ffffffff b=00000020
00001074  0220a2b3  mulhsu (5, 1, 2)  # product[65] a=ffffffff b=00000020
00001078  0220b333  mulhu (6, 1, 2)  # product[65] a=ffffffff b=00000020
0000107c  003da023  sw (3, 27, 0)  # product[65] a=ffffffff b=00000020
00001080  004d8d93  addi (27, 27, 4)  # product[65] a=ffffffff b=00000020
00001084  004da023  sw (4, 27, 0)  # product[65] a=ffffffff b=00000020
00001088  004d8d93  addi (27, 27, 4)  # product[65] a=ffffffff b=00000020
0000108c  005da023  sw (5, 27, 0)  # product[65] a=ffffffff b=00000020
00001090  004d8d93  addi (27, 27, 4)  # product[65] a=ffffffff b=00000020
00001094  006da023  sw (6, 27, 0)  # product[65] a=ffffffff b=00000020
00001098  004d8d93  addi (27, 27, 4)  # product[65] a=ffffffff b=00000020
0000109c  000000b7  lui (1, 0)  # product[66] a=ffffffff b=00007fff
000010a0  fff08093  addi (1, 1, -1)  # product[66] a=ffffffff b=00007fff
000010a4  00008137  lui (2, 8)  # product[66] a=ffffffff b=00007fff
000010a8  fff10113  addi (2, 2, -1)  # product[66] a=ffffffff b=00007fff
000010ac  022081b3  mul (3, 1, 2)  # product[66] a=ffffffff b=00007fff
000010b0  02209233  mulh (4, 1, 2)  # product[66] a=ffffffff b=00007fff
000010b4  0220a2b3  mulhsu (5, 1, 2)  # product[66] a=ffffffff b=00007fff
000010b8  0220b333  mulhu (6, 1, 2)  # product[66] a=ffffffff b=00007fff
000010bc  003da023  sw (3, 27, 0)  # product[66] a=ffffffff b=00007fff
000010c0  004d8d93  addi (27, 27, 4)  # product[66] a=ffffffff b=00007fff
000010c4  004da023  sw (4, 27, 0)  # product[66] a=ffffffff b=00007fff
000010c8  004d8d93  addi (27, 27, 4)  # product[66] a=ffffffff b=00007fff
000010cc  005da023  sw (5, 27, 0)  # product[66] a=ffffffff b=00007fff
000010d0  004d8d93  addi (27, 27, 4)  # product[66] a=ffffffff b=00007fff
000010d4  006da023  sw (6, 27, 0)  # product[66] a=ffffffff b=00007fff
000010d8  004d8d93  addi (27, 27, 4)  # product[66] a=ffffffff b=00007fff
000010dc  000000b7  lui (1, 0)  # product[67] a=ffffffff b=00008000
000010e0  fff08093  addi (1, 1, -1)  # product[67] a=ffffffff b=00008000
000010e4  00008137  lui (2, 8)  # product[67] a=ffffffff b=00008000
000010e8  00010113  addi (2, 2, 0)  # product[67] a=ffffffff b=00008000
000010ec  022081b3  mul (3, 1, 2)  # product[67] a=ffffffff b=00008000
000010f0  02209233  mulh (4, 1, 2)  # product[67] a=ffffffff b=00008000
000010f4  0220a2b3  mulhsu (5, 1, 2)  # product[67] a=ffffffff b=00008000
000010f8  0220b333  mulhu (6, 1, 2)  # product[67] a=ffffffff b=00008000
000010fc  003da023  sw (3, 27, 0)  # product[67] a=ffffffff b=00008000
00001100  004d8d93  addi (27, 27, 4)  # product[67] a=ffffffff b=00008000
00001104  004da023  sw (4, 27, 0)  # product[67] a=ffffffff b=00008000
00001108  004d8d93  addi (27, 27, 4)  # product[67] a=ffffffff b=00008000
0000110c  005da023  sw (5, 27, 0)  # product[67] a=ffffffff b=00008000
00001110  004d8d93  addi (27, 27, 4)  # product[67] a=ffffffff b=00008000
00001114  006da023  sw (6, 27, 0)  # product[67] a=ffffffff b=00008000
00001118  004d8d93  addi (27, 27, 4)  # product[67] a=ffffffff b=00008000
0000111c  000000b7  lui (1, 0)  # product[68] a=ffffffff b=0000ffff
00001120  fff08093  addi (1, 1, -1)  # product[68] a=ffffffff b=0000ffff
00001124  00010137  lui (2, 16)  # product[68] a=ffffffff b=0000ffff
00001128  fff10113  addi (2, 2, -1)  # product[68] a=ffffffff b=0000ffff
0000112c  022081b3  mul (3, 1, 2)  # product[68] a=ffffffff b=0000ffff
00001130  02209233  mulh (4, 1, 2)  # product[68] a=ffffffff b=0000ffff
00001134  0220a2b3  mulhsu (5, 1, 2)  # product[68] a=ffffffff b=0000ffff
00001138  0220b333  mulhu (6, 1, 2)  # product[68] a=ffffffff b=0000ffff
0000113c  003da023  sw (3, 27, 0)  # product[68] a=ffffffff b=0000ffff
00001140  004d8d93  addi (27, 27, 4)  # product[68] a=ffffffff b=0000ffff
00001144  004da023  sw (4, 27, 0)  # product[68] a=ffffffff b=0000ffff
00001148  004d8d93  addi (27, 27, 4)  # product[68] a=ffffffff b=0000ffff
0000114c  005da023  sw (5, 27, 0)  # product[68] a=ffffffff b=0000ffff
00001150  004d8d93  addi (27, 27, 4)  # product[68] a=ffffffff b=0000ffff
00001154  006da023  sw (6, 27, 0)  # product[68] a=ffffffff b=0000ffff
00001158  004d8d93  addi (27, 27, 4)  # product[68] a=ffffffff b=0000ffff
0000115c  000000b7  lui (1, 0)  # product[69] a=ffffffff b=00010000
00001160  fff08093  addi (1, 1, -1)  # product[69] a=ffffffff b=00010000
00001164  00010137  lui (2, 16)  # product[69] a=ffffffff b=00010000
00001168  00010113  addi (2, 2, 0)  # product[69] a=ffffffff b=00010000
0000116c  022081b3  mul (3, 1, 2)  # product[69] a=ffffffff b=00010000
00001170  02209233  mulh (4, 1, 2)  # product[69] a=ffffffff b=00010000
00001174  0220a2b3  mulhsu (5, 1, 2)  # product[69] a=ffffffff b=00010000
00001178  0220b333  mulhu (6, 1, 2)  # product[69] a=ffffffff b=00010000
0000117c  003da023  sw (3, 27, 0)  # product[69] a=ffffffff b=00010000
00001180  004d8d93  addi (27, 27, 4)  # product[69] a=ffffffff b=00010000
00001184  004da023  sw (4, 27, 0)  # product[69] a=ffffffff b=00010000
00001188  004d8d93  addi (27, 27, 4)  # product[69] a=ffffffff b=00010000
0000118c  005da023  sw (5, 27, 0)  # product[69] a=ffffffff b=00010000
00001190  004d8d93  addi (27, 27, 4)  # product[69] a=ffffffff b=00010000
00001194  006da023  sw (6, 27, 0)  # product[69] a=ffffffff b=00010000
00001198  004d8d93  addi (27, 27, 4)  # product[69] a=ffffffff b=00010000
0000119c  000000b7  lui (1, 0)  # product[70] a=ffffffff b=7fffffff
000011a0  fff08093  addi (1, 1, -1)  # product[70] a=ffffffff b=7fffffff
000011a4  80000137  lui (2, 524288)  # product[70] a=ffffffff b=7fffffff
000011a8  fff10113  addi (2, 2, -1)  # product[70] a=ffffffff b=7fffffff
000011ac  022081b3  mul (3, 1, 2)  # product[70] a=ffffffff b=7fffffff
000011b0  02209233  mulh (4, 1, 2)  # product[70] a=ffffffff b=7fffffff
000011b4  0220a2b3  mulhsu (5, 1, 2)  # product[70] a=ffffffff b=7fffffff
000011b8  0220b333  mulhu (6, 1, 2)  # product[70] a=ffffffff b=7fffffff
000011bc  003da023  sw (3, 27, 0)  # product[70] a=ffffffff b=7fffffff
000011c0  004d8d93  addi (27, 27, 4)  # product[70] a=ffffffff b=7fffffff
000011c4  004da023  sw (4, 27, 0)  # product[70] a=ffffffff b=7fffffff
000011c8  004d8d93  addi (27, 27, 4)  # product[70] a=ffffffff b=7fffffff
000011cc  005da023  sw (5, 27, 0)  # product[70] a=ffffffff b=7fffffff
000011d0  004d8d93  addi (27, 27, 4)  # product[70] a=ffffffff b=7fffffff
000011d4  006da023  sw (6, 27, 0)  # product[70] a=ffffffff b=7fffffff
000011d8  004d8d93  addi (27, 27, 4)  # product[70] a=ffffffff b=7fffffff
000011dc  000000b7  lui (1, 0)  # product[71] a=ffffffff b=80000000
000011e0  fff08093  addi (1, 1, -1)  # product[71] a=ffffffff b=80000000
000011e4  80000137  lui (2, 524288)  # product[71] a=ffffffff b=80000000
000011e8  00010113  addi (2, 2, 0)  # product[71] a=ffffffff b=80000000
000011ec  022081b3  mul (3, 1, 2)  # product[71] a=ffffffff b=80000000
000011f0  02209233  mulh (4, 1, 2)  # product[71] a=ffffffff b=80000000
000011f4  0220a2b3  mulhsu (5, 1, 2)  # product[71] a=ffffffff b=80000000
000011f8  0220b333  mulhu (6, 1, 2)  # product[71] a=ffffffff b=80000000
000011fc  003da023  sw (3, 27, 0)  # product[71] a=ffffffff b=80000000
00001200  004d8d93  addi (27, 27, 4)  # product[71] a=ffffffff b=80000000
00001204  004da023  sw (4, 27, 0)  # product[71] a=ffffffff b=80000000
00001208  004d8d93  addi (27, 27, 4)  # product[71] a=ffffffff b=80000000
0000120c  005da023  sw (5, 27, 0)  # product[71] a=ffffffff b=80000000
00001210  004d8d93  addi (27, 27, 4)  # product[71] a=ffffffff b=80000000
00001214  006da023  sw (6, 27, 0)  # product[71] a=ffffffff b=80000000
00001218  004d8d93  addi (27, 27, 4)  # product[71] a=ffffffff b=80000000
0000121c  000000b7  lui (1, 0)  # product[72] a=ffffffff b=80000001
00001220  fff08093  addi (1, 1, -1)  # product[72] a=ffffffff b=80000001
00001224  80000137  lui (2, 524288)  # product[72] a=ffffffff b=80000001
00001228  00110113  addi (2, 2, 1)  # product[72] a=ffffffff b=80000001
0000122c  022081b3  mul (3, 1, 2)  # product[72] a=ffffffff b=80000001
00001230  02209233  mulh (4, 1, 2)  # product[72] a=ffffffff b=80000001
00001234  0220a2b3  mulhsu (5, 1, 2)  # product[72] a=ffffffff b=80000001
00001238  0220b333  mulhu (6, 1, 2)  # product[72] a=ffffffff b=80000001
0000123c  003da023  sw (3, 27, 0)  # product[72] a=ffffffff b=80000001
00001240  004d8d93  addi (27, 27, 4)  # product[72] a=ffffffff b=80000001
00001244  004da023  sw (4, 27, 0)  # product[72] a=ffffffff b=80000001
00001248  004d8d93  addi (27, 27, 4)  # product[72] a=ffffffff b=80000001
0000124c  005da023  sw (5, 27, 0)  # product[72] a=ffffffff b=80000001
00001250  004d8d93  addi (27, 27, 4)  # product[72] a=ffffffff b=80000001
00001254  006da023  sw (6, 27, 0)  # product[72] a=ffffffff b=80000001
00001258  004d8d93  addi (27, 27, 4)  # product[72] a=ffffffff b=80000001
0000125c  000000b7  lui (1, 0)  # product[73] a=ffffffff b=fffffffe
00001260  fff08093  addi (1, 1, -1)  # product[73] a=ffffffff b=fffffffe
00001264  00000137  lui (2, 0)  # product[73] a=ffffffff b=fffffffe
00001268  ffe10113  addi (2, 2, -2)  # product[73] a=ffffffff b=fffffffe
0000126c  022081b3  mul (3, 1, 2)  # product[73] a=ffffffff b=fffffffe
00001270  02209233  mulh (4, 1, 2)  # product[73] a=ffffffff b=fffffffe
00001274  0220a2b3  mulhsu (5, 1, 2)  # product[73] a=ffffffff b=fffffffe
00001278  0220b333  mulhu (6, 1, 2)  # product[73] a=ffffffff b=fffffffe
0000127c  003da023  sw (3, 27, 0)  # product[73] a=ffffffff b=fffffffe
00001280  004d8d93  addi (27, 27, 4)  # product[73] a=ffffffff b=fffffffe
00001284  004da023  sw (4, 27, 0)  # product[73] a=ffffffff b=fffffffe
00001288  004d8d93  addi (27, 27, 4)  # product[73] a=ffffffff b=fffffffe
0000128c  005da023  sw (5, 27, 0)  # product[73] a=ffffffff b=fffffffe
00001290  004d8d93  addi (27, 27, 4)  # product[73] a=ffffffff b=fffffffe
00001294  006da023  sw (6, 27, 0)  # product[73] a=ffffffff b=fffffffe
00001298  004d8d93  addi (27, 27, 4)  # product[73] a=ffffffff b=fffffffe
0000129c  000000b7  lui (1, 0)  # product[74] a=ffffffff b=ffffffff
000012a0  fff08093  addi (1, 1, -1)  # product[74] a=ffffffff b=ffffffff
000012a4  00000137  lui (2, 0)  # product[74] a=ffffffff b=ffffffff
000012a8  fff10113  addi (2, 2, -1)  # product[74] a=ffffffff b=ffffffff
000012ac  022081b3  mul (3, 1, 2)  # product[74] a=ffffffff b=ffffffff
000012b0  02209233  mulh (4, 1, 2)  # product[74] a=ffffffff b=ffffffff
000012b4  0220a2b3  mulhsu (5, 1, 2)  # product[74] a=ffffffff b=ffffffff
000012b8  0220b333  mulhu (6, 1, 2)  # product[74] a=ffffffff b=ffffffff
000012bc  003da023  sw (3, 27, 0)  # product[74] a=ffffffff b=ffffffff
000012c0  004d8d93  addi (27, 27, 4)  # product[74] a=ffffffff b=ffffffff
000012c4  004da023  sw (4, 27, 0)  # product[74] a=ffffffff b=ffffffff
000012c8  004d8d93  addi (27, 27, 4)  # product[74] a=ffffffff b=ffffffff
000012cc  005da023  sw (5, 27, 0)  # product[74] a=ffffffff b=ffffffff
000012d0  004d8d93  addi (27, 27, 4)  # product[74] a=ffffffff b=ffffffff
000012d4  006da023  sw (6, 27, 0)  # product[74] a=ffffffff b=ffffffff
000012d8  004d8d93  addi (27, 27, 4)  # product[74] a=ffffffff b=ffffffff
000012dc  000000b7  lui (1, 0)  # product[75] a=ffffffff b=55555555
000012e0  fff08093  addi (1, 1, -1)  # product[75] a=ffffffff b=55555555
000012e4  55555137  lui (2, 349525)  # product[75] a=ffffffff b=55555555
000012e8  55510113  addi (2, 2, 1365)  # product[75] a=ffffffff b=55555555
000012ec  022081b3  mul (3, 1, 2)  # product[75] a=ffffffff b=55555555
000012f0  02209233  mulh (4, 1, 2)  # product[75] a=ffffffff b=55555555
000012f4  0220a2b3  mulhsu (5, 1, 2)  # product[75] a=ffffffff b=55555555
000012f8  0220b333  mulhu (6, 1, 2)  # product[75] a=ffffffff b=55555555
000012fc  003da023  sw (3, 27, 0)  # product[75] a=ffffffff b=55555555
00001300  004d8d93  addi (27, 27, 4)  # product[75] a=ffffffff b=55555555
00001304  004da023  sw (4, 27, 0)  # product[75] a=ffffffff b=55555555
00001308  004d8d93  addi (27, 27, 4)  # product[75] a=ffffffff b=55555555
0000130c  005da023  sw (5, 27, 0)  # product[75] a=ffffffff b=55555555
00001310  004d8d93  addi (27, 27, 4)  # product[75] a=ffffffff b=55555555
00001314  006da023  sw (6, 27, 0)  # product[75] a=ffffffff b=55555555
00001318  004d8d93  addi (27, 27, 4)  # product[75] a=ffffffff b=55555555
0000131c  000000b7  lui (1, 0)  # product[76] a=ffffffff b=aaaaaaaa
00001320  fff08093  addi (1, 1, -1)  # product[76] a=ffffffff b=aaaaaaaa
00001324  aaaab137  lui (2, 699051)  # product[76] a=ffffffff b=aaaaaaaa
00001328  aaa10113  addi (2, 2, -1366)  # product[76] a=ffffffff b=aaaaaaaa
0000132c  022081b3  mul (3, 1, 2)  # product[76] a=ffffffff b=aaaaaaaa
00001330  02209233  mulh (4, 1, 2)  # product[76] a=ffffffff b=aaaaaaaa
00001334  0220a2b3  mulhsu (5, 1, 2)  # product[76] a=ffffffff b=aaaaaaaa
00001338  0220b333  mulhu (6, 1, 2)  # product[76] a=ffffffff b=aaaaaaaa
0000133c  003da023  sw (3, 27, 0)  # product[76] a=ffffffff b=aaaaaaaa
00001340  004d8d93  addi (27, 27, 4)  # product[76] a=ffffffff b=aaaaaaaa
00001344  004da023  sw (4, 27, 0)  # product[76] a=ffffffff b=aaaaaaaa
00001348  004d8d93  addi (27, 27, 4)  # product[76] a=ffffffff b=aaaaaaaa
0000134c  005da023  sw (5, 27, 0)  # product[76] a=ffffffff b=aaaaaaaa
00001350  004d8d93  addi (27, 27, 4)  # product[76] a=ffffffff b=aaaaaaaa
00001354  006da023  sw (6, 27, 0)  # product[76] a=ffffffff b=aaaaaaaa
00001358  004d8d93  addi (27, 27, 4)  # product[76] a=ffffffff b=aaaaaaaa
0000135c  000000b7  lui (1, 0)  # product[77] a=ffffffff b=01010101
00001360  fff08093  addi (1, 1, -1)  # product[77] a=ffffffff b=01010101
00001364  01010137  lui (2, 4112)  # product[77] a=ffffffff b=01010101
00001368  10110113  addi (2, 2, 257)  # product[77] a=ffffffff b=01010101
0000136c  022081b3  mul (3, 1, 2)  # product[77] a=ffffffff b=01010101
00001370  02209233  mulh (4, 1, 2)  # product[77] a=ffffffff b=01010101
00001374  0220a2b3  mulhsu (5, 1, 2)  # product[77] a=ffffffff b=01010101
00001378  0220b333  mulhu (6, 1, 2)  # product[77] a=ffffffff b=01010101
0000137c  003da023  sw (3, 27, 0)  # product[77] a=ffffffff b=01010101
00001380  004d8d93  addi (27, 27, 4)  # product[77] a=ffffffff b=01010101
00001384  004da023  sw (4, 27, 0)  # product[77] a=ffffffff b=01010101
00001388  004d8d93  addi (27, 27, 4)  # product[77] a=ffffffff b=01010101
0000138c  005da023  sw (5, 27, 0)  # product[77] a=ffffffff b=01010101
00001390  004d8d93  addi (27, 27, 4)  # product[77] a=ffffffff b=01010101
00001394  006da023  sw (6, 27, 0)  # product[77] a=ffffffff b=01010101
00001398  004d8d93  addi (27, 27, 4)  # product[77] a=ffffffff b=01010101
0000139c  555550b7  lui (1, 349525)  # product[78] a=55555555 b=00000000
000013a0  55508093  addi (1, 1, 1365)  # product[78] a=55555555 b=00000000
000013a4  00000137  lui (2, 0)  # product[78] a=55555555 b=00000000
000013a8  00010113  addi (2, 2, 0)  # product[78] a=55555555 b=00000000
000013ac  022081b3  mul (3, 1, 2)  # product[78] a=55555555 b=00000000
000013b0  02209233  mulh (4, 1, 2)  # product[78] a=55555555 b=00000000
000013b4  0220a2b3  mulhsu (5, 1, 2)  # product[78] a=55555555 b=00000000
000013b8  0220b333  mulhu (6, 1, 2)  # product[78] a=55555555 b=00000000
000013bc  003da023  sw (3, 27, 0)  # product[78] a=55555555 b=00000000
000013c0  004d8d93  addi (27, 27, 4)  # product[78] a=55555555 b=00000000
000013c4  004da023  sw (4, 27, 0)  # product[78] a=55555555 b=00000000
000013c8  004d8d93  addi (27, 27, 4)  # product[78] a=55555555 b=00000000
000013cc  005da023  sw (5, 27, 0)  # product[78] a=55555555 b=00000000
000013d0  004d8d93  addi (27, 27, 4)  # product[78] a=55555555 b=00000000
000013d4  006da023  sw (6, 27, 0)  # product[78] a=55555555 b=00000000
000013d8  004d8d93  addi (27, 27, 4)  # product[78] a=55555555 b=00000000
000013dc  555550b7  lui (1, 349525)  # product[79] a=55555555 b=00000001
000013e0  55508093  addi (1, 1, 1365)  # product[79] a=55555555 b=00000001
000013e4  00000137  lui (2, 0)  # product[79] a=55555555 b=00000001
000013e8  00110113  addi (2, 2, 1)  # product[79] a=55555555 b=00000001
000013ec  022081b3  mul (3, 1, 2)  # product[79] a=55555555 b=00000001
000013f0  02209233  mulh (4, 1, 2)  # product[79] a=55555555 b=00000001
000013f4  0220a2b3  mulhsu (5, 1, 2)  # product[79] a=55555555 b=00000001
000013f8  0220b333  mulhu (6, 1, 2)  # product[79] a=55555555 b=00000001
000013fc  003da023  sw (3, 27, 0)  # product[79] a=55555555 b=00000001
00001400  004d8d93  addi (27, 27, 4)  # product[79] a=55555555 b=00000001
00001404  004da023  sw (4, 27, 0)  # product[79] a=55555555 b=00000001
00001408  004d8d93  addi (27, 27, 4)  # product[79] a=55555555 b=00000001
0000140c  005da023  sw (5, 27, 0)  # product[79] a=55555555 b=00000001
00001410  004d8d93  addi (27, 27, 4)  # product[79] a=55555555 b=00000001
00001414  006da023  sw (6, 27, 0)  # product[79] a=55555555 b=00000001
00001418  004d8d93  addi (27, 27, 4)  # product[79] a=55555555 b=00000001
0000141c  555550b7  lui (1, 349525)  # product[80] a=55555555 b=00000002
00001420  55508093  addi (1, 1, 1365)  # product[80] a=55555555 b=00000002
00001424  00000137  lui (2, 0)  # product[80] a=55555555 b=00000002
00001428  00210113  addi (2, 2, 2)  # product[80] a=55555555 b=00000002
0000142c  022081b3  mul (3, 1, 2)  # product[80] a=55555555 b=00000002
00001430  02209233  mulh (4, 1, 2)  # product[80] a=55555555 b=00000002
00001434  0220a2b3  mulhsu (5, 1, 2)  # product[80] a=55555555 b=00000002
00001438  0220b333  mulhu (6, 1, 2)  # product[80] a=55555555 b=00000002
0000143c  003da023  sw (3, 27, 0)  # product[80] a=55555555 b=00000002
00001440  004d8d93  addi (27, 27, 4)  # product[80] a=55555555 b=00000002
00001444  004da023  sw (4, 27, 0)  # product[80] a=55555555 b=00000002
00001448  004d8d93  addi (27, 27, 4)  # product[80] a=55555555 b=00000002
0000144c  005da023  sw (5, 27, 0)  # product[80] a=55555555 b=00000002
00001450  004d8d93  addi (27, 27, 4)  # product[80] a=55555555 b=00000002
00001454  006da023  sw (6, 27, 0)  # product[80] a=55555555 b=00000002
00001458  004d8d93  addi (27, 27, 4)  # product[80] a=55555555 b=00000002
0000145c  555550b7  lui (1, 349525)  # product[81] a=55555555 b=00000003
00001460  55508093  addi (1, 1, 1365)  # product[81] a=55555555 b=00000003
00001464  00000137  lui (2, 0)  # product[81] a=55555555 b=00000003
00001468  00310113  addi (2, 2, 3)  # product[81] a=55555555 b=00000003
0000146c  022081b3  mul (3, 1, 2)  # product[81] a=55555555 b=00000003
00001470  02209233  mulh (4, 1, 2)  # product[81] a=55555555 b=00000003
00001474  0220a2b3  mulhsu (5, 1, 2)  # product[81] a=55555555 b=00000003
00001478  0220b333  mulhu (6, 1, 2)  # product[81] a=55555555 b=00000003
0000147c  003da023  sw (3, 27, 0)  # product[81] a=55555555 b=00000003
00001480  004d8d93  addi (27, 27, 4)  # product[81] a=55555555 b=00000003
00001484  004da023  sw (4, 27, 0)  # product[81] a=55555555 b=00000003
00001488  004d8d93  addi (27, 27, 4)  # product[81] a=55555555 b=00000003
0000148c  005da023  sw (5, 27, 0)  # product[81] a=55555555 b=00000003
00001490  004d8d93  addi (27, 27, 4)  # product[81] a=55555555 b=00000003
00001494  006da023  sw (6, 27, 0)  # product[81] a=55555555 b=00000003
00001498  004d8d93  addi (27, 27, 4)  # product[81] a=55555555 b=00000003
0000149c  555550b7  lui (1, 349525)  # product[82] a=55555555 b=0000001f
000014a0  55508093  addi (1, 1, 1365)  # product[82] a=55555555 b=0000001f
000014a4  00000137  lui (2, 0)  # product[82] a=55555555 b=0000001f
000014a8  01f10113  addi (2, 2, 31)  # product[82] a=55555555 b=0000001f
000014ac  022081b3  mul (3, 1, 2)  # product[82] a=55555555 b=0000001f
000014b0  02209233  mulh (4, 1, 2)  # product[82] a=55555555 b=0000001f
000014b4  0220a2b3  mulhsu (5, 1, 2)  # product[82] a=55555555 b=0000001f
000014b8  0220b333  mulhu (6, 1, 2)  # product[82] a=55555555 b=0000001f
000014bc  003da023  sw (3, 27, 0)  # product[82] a=55555555 b=0000001f
000014c0  004d8d93  addi (27, 27, 4)  # product[82] a=55555555 b=0000001f
000014c4  004da023  sw (4, 27, 0)  # product[82] a=55555555 b=0000001f
000014c8  004d8d93  addi (27, 27, 4)  # product[82] a=55555555 b=0000001f
000014cc  005da023  sw (5, 27, 0)  # product[82] a=55555555 b=0000001f
000014d0  004d8d93  addi (27, 27, 4)  # product[82] a=55555555 b=0000001f
000014d4  006da023  sw (6, 27, 0)  # product[82] a=55555555 b=0000001f
000014d8  004d8d93  addi (27, 27, 4)  # product[82] a=55555555 b=0000001f
000014dc  555550b7  lui (1, 349525)  # product[83] a=55555555 b=00000020
000014e0  55508093  addi (1, 1, 1365)  # product[83] a=55555555 b=00000020
000014e4  00000137  lui (2, 0)  # product[83] a=55555555 b=00000020
000014e8  02010113  addi (2, 2, 32)  # product[83] a=55555555 b=00000020
000014ec  022081b3  mul (3, 1, 2)  # product[83] a=55555555 b=00000020
000014f0  02209233  mulh (4, 1, 2)  # product[83] a=55555555 b=00000020
000014f4  0220a2b3  mulhsu (5, 1, 2)  # product[83] a=55555555 b=00000020
000014f8  0220b333  mulhu (6, 1, 2)  # product[83] a=55555555 b=00000020
000014fc  003da023  sw (3, 27, 0)  # product[83] a=55555555 b=00000020
00001500  004d8d93  addi (27, 27, 4)  # product[83] a=55555555 b=00000020
00001504  004da023  sw (4, 27, 0)  # product[83] a=55555555 b=00000020
00001508  004d8d93  addi (27, 27, 4)  # product[83] a=55555555 b=00000020
0000150c  005da023  sw (5, 27, 0)  # product[83] a=55555555 b=00000020
00001510  004d8d93  addi (27, 27, 4)  # product[83] a=55555555 b=00000020
00001514  006da023  sw (6, 27, 0)  # product[83] a=55555555 b=00000020
00001518  004d8d93  addi (27, 27, 4)  # product[83] a=55555555 b=00000020
0000151c  555550b7  lui (1, 349525)  # product[84] a=55555555 b=00007fff
00001520  55508093  addi (1, 1, 1365)  # product[84] a=55555555 b=00007fff
00001524  00008137  lui (2, 8)  # product[84] a=55555555 b=00007fff
00001528  fff10113  addi (2, 2, -1)  # product[84] a=55555555 b=00007fff
0000152c  022081b3  mul (3, 1, 2)  # product[84] a=55555555 b=00007fff
00001530  02209233  mulh (4, 1, 2)  # product[84] a=55555555 b=00007fff
00001534  0220a2b3  mulhsu (5, 1, 2)  # product[84] a=55555555 b=00007fff
00001538  0220b333  mulhu (6, 1, 2)  # product[84] a=55555555 b=00007fff
0000153c  003da023  sw (3, 27, 0)  # product[84] a=55555555 b=00007fff
00001540  004d8d93  addi (27, 27, 4)  # product[84] a=55555555 b=00007fff
00001544  004da023  sw (4, 27, 0)  # product[84] a=55555555 b=00007fff
00001548  004d8d93  addi (27, 27, 4)  # product[84] a=55555555 b=00007fff
0000154c  005da023  sw (5, 27, 0)  # product[84] a=55555555 b=00007fff
00001550  004d8d93  addi (27, 27, 4)  # product[84] a=55555555 b=00007fff
00001554  006da023  sw (6, 27, 0)  # product[84] a=55555555 b=00007fff
00001558  004d8d93  addi (27, 27, 4)  # product[84] a=55555555 b=00007fff
0000155c  555550b7  lui (1, 349525)  # product[85] a=55555555 b=00008000
00001560  55508093  addi (1, 1, 1365)  # product[85] a=55555555 b=00008000
00001564  00008137  lui (2, 8)  # product[85] a=55555555 b=00008000
00001568  00010113  addi (2, 2, 0)  # product[85] a=55555555 b=00008000
0000156c  022081b3  mul (3, 1, 2)  # product[85] a=55555555 b=00008000
00001570  02209233  mulh (4, 1, 2)  # product[85] a=55555555 b=00008000
00001574  0220a2b3  mulhsu (5, 1, 2)  # product[85] a=55555555 b=00008000
00001578  0220b333  mulhu (6, 1, 2)  # product[85] a=55555555 b=00008000
0000157c  003da023  sw (3, 27, 0)  # product[85] a=55555555 b=00008000
00001580  004d8d93  addi (27, 27, 4)  # product[85] a=55555555 b=00008000
00001584  004da023  sw (4, 27, 0)  # product[85] a=55555555 b=00008000
00001588  004d8d93  addi (27, 27, 4)  # product[85] a=55555555 b=00008000
0000158c  005da023  sw (5, 27, 0)  # product[85] a=55555555 b=00008000
00001590  004d8d93  addi (27, 27, 4)  # product[85] a=55555555 b=00008000
00001594  006da023  sw (6, 27, 0)  # product[85] a=55555555 b=00008000
00001598  004d8d93  addi (27, 27, 4)  # product[85] a=55555555 b=00008000
0000159c  555550b7  lui (1, 349525)  # product[86] a=55555555 b=0000ffff
000015a0  55508093  addi (1, 1, 1365)  # product[86] a=55555555 b=0000ffff
000015a4  00010137  lui (2, 16)  # product[86] a=55555555 b=0000ffff
000015a8  fff10113  addi (2, 2, -1)  # product[86] a=55555555 b=0000ffff
000015ac  022081b3  mul (3, 1, 2)  # product[86] a=55555555 b=0000ffff
000015b0  02209233  mulh (4, 1, 2)  # product[86] a=55555555 b=0000ffff
000015b4  0220a2b3  mulhsu (5, 1, 2)  # product[86] a=55555555 b=0000ffff
000015b8  0220b333  mulhu (6, 1, 2)  # product[86] a=55555555 b=0000ffff
000015bc  003da023  sw (3, 27, 0)  # product[86] a=55555555 b=0000ffff
000015c0  004d8d93  addi (27, 27, 4)  # product[86] a=55555555 b=0000ffff
000015c4  004da023  sw (4, 27, 0)  # product[86] a=55555555 b=0000ffff
000015c8  004d8d93  addi (27, 27, 4)  # product[86] a=55555555 b=0000ffff
000015cc  005da023  sw (5, 27, 0)  # product[86] a=55555555 b=0000ffff
000015d0  004d8d93  addi (27, 27, 4)  # product[86] a=55555555 b=0000ffff
000015d4  006da023  sw (6, 27, 0)  # product[86] a=55555555 b=0000ffff
000015d8  004d8d93  addi (27, 27, 4)  # product[86] a=55555555 b=0000ffff
000015dc  555550b7  lui (1, 349525)  # product[87] a=55555555 b=00010000
000015e0  55508093  addi (1, 1, 1365)  # product[87] a=55555555 b=00010000
000015e4  00010137  lui (2, 16)  # product[87] a=55555555 b=00010000
000015e8  00010113  addi (2, 2, 0)  # product[87] a=55555555 b=00010000
000015ec  022081b3  mul (3, 1, 2)  # product[87] a=55555555 b=00010000
000015f0  02209233  mulh (4, 1, 2)  # product[87] a=55555555 b=00010000
000015f4  0220a2b3  mulhsu (5, 1, 2)  # product[87] a=55555555 b=00010000
000015f8  0220b333  mulhu (6, 1, 2)  # product[87] a=55555555 b=00010000
000015fc  003da023  sw (3, 27, 0)  # product[87] a=55555555 b=00010000
00001600  004d8d93  addi (27, 27, 4)  # product[87] a=55555555 b=00010000
00001604  004da023  sw (4, 27, 0)  # product[87] a=55555555 b=00010000
00001608  004d8d93  addi (27, 27, 4)  # product[87] a=55555555 b=00010000
0000160c  005da023  sw (5, 27, 0)  # product[87] a=55555555 b=00010000
00001610  004d8d93  addi (27, 27, 4)  # product[87] a=55555555 b=00010000
00001614  006da023  sw (6, 27, 0)  # product[87] a=55555555 b=00010000
00001618  004d8d93  addi (27, 27, 4)  # product[87] a=55555555 b=00010000
0000161c  555550b7  lui (1, 349525)  # product[88] a=55555555 b=7fffffff
00001620  55508093  addi (1, 1, 1365)  # product[88] a=55555555 b=7fffffff
00001624  80000137  lui (2, 524288)  # product[88] a=55555555 b=7fffffff
00001628  fff10113  addi (2, 2, -1)  # product[88] a=55555555 b=7fffffff
0000162c  022081b3  mul (3, 1, 2)  # product[88] a=55555555 b=7fffffff
00001630  02209233  mulh (4, 1, 2)  # product[88] a=55555555 b=7fffffff
00001634  0220a2b3  mulhsu (5, 1, 2)  # product[88] a=55555555 b=7fffffff
00001638  0220b333  mulhu (6, 1, 2)  # product[88] a=55555555 b=7fffffff
0000163c  003da023  sw (3, 27, 0)  # product[88] a=55555555 b=7fffffff
00001640  004d8d93  addi (27, 27, 4)  # product[88] a=55555555 b=7fffffff
00001644  004da023  sw (4, 27, 0)  # product[88] a=55555555 b=7fffffff
00001648  004d8d93  addi (27, 27, 4)  # product[88] a=55555555 b=7fffffff
0000164c  005da023  sw (5, 27, 0)  # product[88] a=55555555 b=7fffffff
00001650  004d8d93  addi (27, 27, 4)  # product[88] a=55555555 b=7fffffff
00001654  006da023  sw (6, 27, 0)  # product[88] a=55555555 b=7fffffff
00001658  004d8d93  addi (27, 27, 4)  # product[88] a=55555555 b=7fffffff
0000165c  555550b7  lui (1, 349525)  # product[89] a=55555555 b=80000000
00001660  55508093  addi (1, 1, 1365)  # product[89] a=55555555 b=80000000
00001664  80000137  lui (2, 524288)  # product[89] a=55555555 b=80000000
00001668  00010113  addi (2, 2, 0)  # product[89] a=55555555 b=80000000
0000166c  022081b3  mul (3, 1, 2)  # product[89] a=55555555 b=80000000
00001670  02209233  mulh (4, 1, 2)  # product[89] a=55555555 b=80000000
00001674  0220a2b3  mulhsu (5, 1, 2)  # product[89] a=55555555 b=80000000
00001678  0220b333  mulhu (6, 1, 2)  # product[89] a=55555555 b=80000000
0000167c  003da023  sw (3, 27, 0)  # product[89] a=55555555 b=80000000
00001680  004d8d93  addi (27, 27, 4)  # product[89] a=55555555 b=80000000
00001684  004da023  sw (4, 27, 0)  # product[89] a=55555555 b=80000000
00001688  004d8d93  addi (27, 27, 4)  # product[89] a=55555555 b=80000000
0000168c  005da023  sw (5, 27, 0)  # product[89] a=55555555 b=80000000
00001690  004d8d93  addi (27, 27, 4)  # product[89] a=55555555 b=80000000
00001694  006da023  sw (6, 27, 0)  # product[89] a=55555555 b=80000000
00001698  004d8d93  addi (27, 27, 4)  # product[89] a=55555555 b=80000000
0000169c  555550b7  lui (1, 349525)  # product[90] a=55555555 b=80000001
000016a0  55508093  addi (1, 1, 1365)  # product[90] a=55555555 b=80000001
000016a4  80000137  lui (2, 524288)  # product[90] a=55555555 b=80000001
000016a8  00110113  addi (2, 2, 1)  # product[90] a=55555555 b=80000001
000016ac  022081b3  mul (3, 1, 2)  # product[90] a=55555555 b=80000001
000016b0  02209233  mulh (4, 1, 2)  # product[90] a=55555555 b=80000001
000016b4  0220a2b3  mulhsu (5, 1, 2)  # product[90] a=55555555 b=80000001
000016b8  0220b333  mulhu (6, 1, 2)  # product[90] a=55555555 b=80000001
000016bc  003da023  sw (3, 27, 0)  # product[90] a=55555555 b=80000001
000016c0  004d8d93  addi (27, 27, 4)  # product[90] a=55555555 b=80000001
000016c4  004da023  sw (4, 27, 0)  # product[90] a=55555555 b=80000001
000016c8  004d8d93  addi (27, 27, 4)  # product[90] a=55555555 b=80000001
000016cc  005da023  sw (5, 27, 0)  # product[90] a=55555555 b=80000001
000016d0  004d8d93  addi (27, 27, 4)  # product[90] a=55555555 b=80000001
000016d4  006da023  sw (6, 27, 0)  # product[90] a=55555555 b=80000001
000016d8  004d8d93  addi (27, 27, 4)  # product[90] a=55555555 b=80000001
000016dc  555550b7  lui (1, 349525)  # product[91] a=55555555 b=fffffffe
000016e0  55508093  addi (1, 1, 1365)  # product[91] a=55555555 b=fffffffe
000016e4  00000137  lui (2, 0)  # product[91] a=55555555 b=fffffffe
000016e8  ffe10113  addi (2, 2, -2)  # product[91] a=55555555 b=fffffffe
000016ec  022081b3  mul (3, 1, 2)  # product[91] a=55555555 b=fffffffe
000016f0  02209233  mulh (4, 1, 2)  # product[91] a=55555555 b=fffffffe
000016f4  0220a2b3  mulhsu (5, 1, 2)  # product[91] a=55555555 b=fffffffe
000016f8  0220b333  mulhu (6, 1, 2)  # product[91] a=55555555 b=fffffffe
000016fc  003da023  sw (3, 27, 0)  # product[91] a=55555555 b=fffffffe
00001700  004d8d93  addi (27, 27, 4)  # product[91] a=55555555 b=fffffffe
00001704  004da023  sw (4, 27, 0)  # product[91] a=55555555 b=fffffffe
00001708  004d8d93  addi (27, 27, 4)  # product[91] a=55555555 b=fffffffe
0000170c  005da023  sw (5, 27, 0)  # product[91] a=55555555 b=fffffffe
00001710  004d8d93  addi (27, 27, 4)  # product[91] a=55555555 b=fffffffe
00001714  006da023  sw (6, 27, 0)  # product[91] a=55555555 b=fffffffe
00001718  004d8d93  addi (27, 27, 4)  # product[91] a=55555555 b=fffffffe
0000171c  555550b7  lui (1, 349525)  # product[92] a=55555555 b=ffffffff
00001720  55508093  addi (1, 1, 1365)  # product[92] a=55555555 b=ffffffff
00001724  00000137  lui (2, 0)  # product[92] a=55555555 b=ffffffff
00001728  fff10113  addi (2, 2, -1)  # product[92] a=55555555 b=ffffffff
0000172c  022081b3  mul (3, 1, 2)  # product[92] a=55555555 b=ffffffff
00001730  02209233  mulh (4, 1, 2)  # product[92] a=55555555 b=ffffffff
00001734  0220a2b3  mulhsu (5, 1, 2)  # product[92] a=55555555 b=ffffffff
00001738  0220b333  mulhu (6, 1, 2)  # product[92] a=55555555 b=ffffffff
0000173c  003da023  sw (3, 27, 0)  # product[92] a=55555555 b=ffffffff
00001740  004d8d93  addi (27, 27, 4)  # product[92] a=55555555 b=ffffffff
00001744  004da023  sw (4, 27, 0)  # product[92] a=55555555 b=ffffffff
00001748  004d8d93  addi (27, 27, 4)  # product[92] a=55555555 b=ffffffff
0000174c  005da023  sw (5, 27, 0)  # product[92] a=55555555 b=ffffffff
00001750  004d8d93  addi (27, 27, 4)  # product[92] a=55555555 b=ffffffff
00001754  006da023  sw (6, 27, 0)  # product[92] a=55555555 b=ffffffff
00001758  004d8d93  addi (27, 27, 4)  # product[92] a=55555555 b=ffffffff
0000175c  555550b7  lui (1, 349525)  # product[93] a=55555555 b=55555555
00001760  55508093  addi (1, 1, 1365)  # product[93] a=55555555 b=55555555
00001764  55555137  lui (2, 349525)  # product[93] a=55555555 b=55555555
00001768  55510113  addi (2, 2, 1365)  # product[93] a=55555555 b=55555555
0000176c  022081b3  mul (3, 1, 2)  # product[93] a=55555555 b=55555555
00001770  02209233  mulh (4, 1, 2)  # product[93] a=55555555 b=55555555
00001774  0220a2b3  mulhsu (5, 1, 2)  # product[93] a=55555555 b=55555555
00001778  0220b333  mulhu (6, 1, 2)  # product[93] a=55555555 b=55555555
0000177c  003da023  sw (3, 27, 0)  # product[93] a=55555555 b=55555555
00001780  004d8d93  addi (27, 27, 4)  # product[93] a=55555555 b=55555555
00001784  004da023  sw (4, 27, 0)  # product[93] a=55555555 b=55555555
00001788  004d8d93  addi (27, 27, 4)  # product[93] a=55555555 b=55555555
0000178c  005da023  sw (5, 27, 0)  # product[93] a=55555555 b=55555555
00001790  004d8d93  addi (27, 27, 4)  # product[93] a=55555555 b=55555555
00001794  006da023  sw (6, 27, 0)  # product[93] a=55555555 b=55555555
00001798  004d8d93  addi (27, 27, 4)  # product[93] a=55555555 b=55555555
0000179c  555550b7  lui (1, 349525)  # product[94] a=55555555 b=aaaaaaaa
000017a0  55508093  addi (1, 1, 1365)  # product[94] a=55555555 b=aaaaaaaa
000017a4  aaaab137  lui (2, 699051)  # product[94] a=55555555 b=aaaaaaaa
000017a8  aaa10113  addi (2, 2, -1366)  # product[94] a=55555555 b=aaaaaaaa
000017ac  022081b3  mul (3, 1, 2)  # product[94] a=55555555 b=aaaaaaaa
000017b0  02209233  mulh (4, 1, 2)  # product[94] a=55555555 b=aaaaaaaa
000017b4  0220a2b3  mulhsu (5, 1, 2)  # product[94] a=55555555 b=aaaaaaaa
000017b8  0220b333  mulhu (6, 1, 2)  # product[94] a=55555555 b=aaaaaaaa
000017bc  003da023  sw (3, 27, 0)  # product[94] a=55555555 b=aaaaaaaa
000017c0  004d8d93  addi (27, 27, 4)  # product[94] a=55555555 b=aaaaaaaa
000017c4  004da023  sw (4, 27, 0)  # product[94] a=55555555 b=aaaaaaaa
000017c8  004d8d93  addi (27, 27, 4)  # product[94] a=55555555 b=aaaaaaaa
000017cc  005da023  sw (5, 27, 0)  # product[94] a=55555555 b=aaaaaaaa
000017d0  004d8d93  addi (27, 27, 4)  # product[94] a=55555555 b=aaaaaaaa
000017d4  006da023  sw (6, 27, 0)  # product[94] a=55555555 b=aaaaaaaa
000017d8  004d8d93  addi (27, 27, 4)  # product[94] a=55555555 b=aaaaaaaa
000017dc  555550b7  lui (1, 349525)  # product[95] a=55555555 b=01010101
000017e0  55508093  addi (1, 1, 1365)  # product[95] a=55555555 b=01010101
000017e4  01010137  lui (2, 4112)  # product[95] a=55555555 b=01010101
000017e8  10110113  addi (2, 2, 257)  # product[95] a=55555555 b=01010101
000017ec  022081b3  mul (3, 1, 2)  # product[95] a=55555555 b=01010101
000017f0  02209233  mulh (4, 1, 2)  # product[95] a=55555555 b=01010101
000017f4  0220a2b3  mulhsu (5, 1, 2)  # product[95] a=55555555 b=01010101
000017f8  0220b333  mulhu (6, 1, 2)  # product[95] a=55555555 b=01010101
000017fc  003da023  sw (3, 27, 0)  # product[95] a=55555555 b=01010101
00001800  004d8d93  addi (27, 27, 4)  # product[95] a=55555555 b=01010101
00001804  004da023  sw (4, 27, 0)  # product[95] a=55555555 b=01010101
00001808  004d8d93  addi (27, 27, 4)  # product[95] a=55555555 b=01010101
0000180c  005da023  sw (5, 27, 0)  # product[95] a=55555555 b=01010101
00001810  004d8d93  addi (27, 27, 4)  # product[95] a=55555555 b=01010101
00001814  006da023  sw (6, 27, 0)  # product[95] a=55555555 b=01010101
00001818  004d8d93  addi (27, 27, 4)  # product[95] a=55555555 b=01010101
0000181c  600ddc37  lui (24, 393437)  # completion
00001820  afec0c13  addi (24, 24, -1282)  # completion
00001824  00008bb7  lui (23, 8)  # completion
00001828  ffcb8b93  addi (23, 23, -4)  # completion
0000182c  018ba023  sw (24, 23, 0)  # completion
00001830  0000006f  jal (0, 'done')  # completion
