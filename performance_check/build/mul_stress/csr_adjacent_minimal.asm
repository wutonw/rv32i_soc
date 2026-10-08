00000000  00000013  addi (0, 0, 0)  # setup
00000004  00001db7  lui (27, 1)  # setup
00000008  000d8d93  addi (27, 27, 0)  # setup
0000000c  00000d37  lui (26, 0)  # setup
00000010  400d0d13  addi (26, 26, 1024)  # setup
00000014  00000cb7  lui (25, 0)  # setup
00000018  600c8c93  addi (25, 25, 1536)  # setup
0000001c  000000b7  lui (1, 0)  # minimal: 3 * 7 = 21, not ordinary ALU 3 + 7 = 10
00000020  00308093  addi (1, 1, 3)  # minimal: 3 * 7 = 21, not ordinary ALU 3 + 7 = 10
00000024  00000137  lui (2, 0)  # minimal: 3 * 7 = 21, not ordinary ALU 3 + 7 = 10
00000028  00710113  addi (2, 2, 7)  # minimal: 3 * 7 = 21, not ordinary ALU 3 + 7 = 10
0000002c  022081b3  mul (3, 1, 2)  # minimal: 3 * 7 = 21, not ordinary ALU 3 + 7 = 10
00000030  30419073  csrrw (0, 3, 772)  # minimal: 3 * 7 = 21, not ordinary ALU 3 + 7 = 10
00000034  304022f3  csrrs (5, 0, 772)  # minimal: 3 * 7 = 21, not ordinary ALU 3 + 7 = 10
00000038  005da023  sw (5, 27, 0)  # minimal: 3 * 7 = 21, not ordinary ALU 3 + 7 = 10
0000003c  004d8d93  addi (27, 27, 4)  # minimal: 3 * 7 = 21, not ordinary ALU 3 + 7 = 10
00000040  600ddc37  lui (24, 393437)  # completion
00000044  afec0c13  addi (24, 24, -1282)  # completion
00000048  00008bb7  lui (23, 8)  # completion
0000004c  ffcb8b93  addi (23, 23, -4)  # completion
00000050  018ba023  sw (24, 23, 0)  # completion
00000054  0000006f  jal (0, 'done')  # completion
