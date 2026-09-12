
D:\aaa1verilog_project\rv32i_cpu\benchmark\embench\build\wikisort\wikisort.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
       0:	00008117          	auipc	sp,0x8
       4:	f0010113          	addi	sp,sp,-256 # 7f00 <__stack_top>
       8:	00002297          	auipc	t0,0x2
       c:	d9c28293          	addi	t0,t0,-612 # 1da4 <seed>
      10:	00003317          	auipc	t1,0x3
      14:	a1830313          	addi	t1,t1,-1512 # 2a28 <__bss_end>
      18:	0062f863          	bgeu	t0,t1,28 <_start+0x28>
      1c:	0002a023          	sw	zero,0(t0)
      20:	00428293          	addi	t0,t0,4
      24:	ff5ff06f          	j	18 <_start+0x18>
      28:	030000ef          	jal	58 <main>
      2c:	0000006f          	j	2c <_start+0x2c>

00000030 <start_trigger>:
      30:	454d0737          	lui	a4,0x454d0
      34:	000087b7          	lui	a5,0x8
      38:	00170713          	addi	a4,a4,1 # 454d0001 <__stack_top+0x454c8101>
      3c:	fee7aa23          	sw	a4,-12(a5) # 7ff4 <__stack_top+0xf4>
      40:	00008067          	ret

00000044 <stop_trigger>:
      44:	454d0737          	lui	a4,0x454d0
      48:	000087b7          	lui	a5,0x8
      4c:	00270713          	addi	a4,a4,2 # 454d0002 <__stack_top+0x454c8102>
      50:	fee7aa23          	sw	a4,-12(a5) # 7ff4 <__stack_top+0xf4>
      54:	00008067          	ret

00000058 <main>:
      58:	fe010113          	addi	sp,sp,-32
      5c:	00112e23          	sw	ra,28(sp)
      60:	00812c23          	sw	s0,24(sp)
      64:	00008437          	lui	s0,0x8
      68:	fe042623          	sw	zero,-20(s0) # 7fec <__stack_top+0xec>
      6c:	454d0737          	lui	a4,0x454d0
      70:	fe042a23          	sw	zero,-12(s0)
      74:	fee42c23          	sw	a4,-8(s0)
      78:	6cd010ef          	jal	1f44 <initialise_benchmark>
      7c:	00000513          	li	a0,0
      80:	6c9010ef          	jal	1f48 <warm_caches>
      84:	fadff0ef          	jal	30 <start_trigger>
      88:	6cd010ef          	jal	1f54 <benchmark>
      8c:	00a12623          	sw	a0,12(sp)
      90:	fb5ff0ef          	jal	44 <stop_trigger>
      94:	00c12503          	lw	a0,12(sp)
      98:	635010ef          	jal	1ecc <verify_benchmark>
      9c:	00c12683          	lw	a3,12(sp)
      a0:	dead07b7          	lui	a5,0xdead0
      a4:	00100713          	li	a4,1
      a8:	fed42623          	sw	a3,-20(s0)
      ac:	00e787b3          	add	a5,a5,a4
      b0:	00e51663          	bne	a0,a4,bc <main+0x64>
      b4:	600dd7b7          	lui	a5,0x600dd
      b8:	afe78793          	addi	a5,a5,-1282 # 600dcafe <__stack_top+0x600d4bfe>
      bc:	00008737          	lui	a4,0x8
      c0:	fef72c23          	sw	a5,-8(a4) # 7ff8 <__stack_top+0xf8>
      c4:	00000013          	nop
      c8:	00000013          	nop
      cc:	ff9ff06f          	j	c4 <main+0x6c>

000000d0 <memcpy>:
      d0:	02060063          	beqz	a2,f0 <memcpy+0x20>
      d4:	00c50633          	add	a2,a0,a2
      d8:	00050793          	mv	a5,a0
      dc:	0005c703          	lbu	a4,0(a1)
      e0:	00178793          	addi	a5,a5,1
      e4:	00158593          	addi	a1,a1,1
      e8:	fee78fa3          	sb	a4,-1(a5)
      ec:	fef618e3          	bne	a2,a5,dc <memcpy+0xc>
      f0:	00008067          	ret

000000f4 <memmove>:
      f4:	02b57463          	bgeu	a0,a1,11c <memmove+0x28>
      f8:	02060463          	beqz	a2,120 <memmove+0x2c>
      fc:	00c50633          	add	a2,a0,a2
     100:	00050793          	mv	a5,a0
     104:	0005c703          	lbu	a4,0(a1)
     108:	00178793          	addi	a5,a5,1
     10c:	00158593          	addi	a1,a1,1
     110:	fee78fa3          	sb	a4,-1(a5)
     114:	fef618e3          	bne	a2,a5,104 <memmove+0x10>
     118:	00008067          	ret
     11c:	00a5e463          	bltu	a1,a0,124 <memmove+0x30>
     120:	00008067          	ret
     124:	fe060ee3          	beqz	a2,120 <memmove+0x2c>
     128:	00c585b3          	add	a1,a1,a2
     12c:	00c50633          	add	a2,a0,a2
     130:	fff5c783          	lbu	a5,-1(a1)
     134:	fff60613          	addi	a2,a2,-1
     138:	fff58593          	addi	a1,a1,-1
     13c:	00f60023          	sb	a5,0(a2)
     140:	fec518e3          	bne	a0,a2,130 <memmove+0x3c>
     144:	00008067          	ret

00000148 <memcmp>:
     148:	02060663          	beqz	a2,174 <memcmp+0x2c>
     14c:	00c50633          	add	a2,a0,a2
     150:	0080006f          	j	158 <memcmp+0x10>
     154:	02c50063          	beq	a0,a2,174 <memcmp+0x2c>
     158:	00054783          	lbu	a5,0(a0)
     15c:	0005c703          	lbu	a4,0(a1)
     160:	00150513          	addi	a0,a0,1
     164:	00158593          	addi	a1,a1,1
     168:	fee786e3          	beq	a5,a4,154 <memcmp+0xc>
     16c:	40e78533          	sub	a0,a5,a4
     170:	00008067          	ret
     174:	00000513          	li	a0,0
     178:	00008067          	ret

0000017c <sqrt>:
     17c:	ff010113          	addi	sp,sp,-16
     180:	00000613          	li	a2,0
     184:	00000693          	li	a3,0
     188:	00812423          	sw	s0,8(sp)
     18c:	00912223          	sw	s1,4(sp)
     190:	00112623          	sw	ra,12(sp)
     194:	00050413          	mv	s0,a0
     198:	00058493          	mv	s1,a1
     19c:	5dd010ef          	jal	1f78 <__ledf2>
     1a0:	06a05a63          	blez	a0,214 <sqrt+0x98>
     1a4:	00040513          	mv	a0,s0
     1a8:	00048593          	mv	a1,s1
     1ac:	765010ef          	jal	2110 <__fixunsdfsi>
     1b0:	400007b7          	lui	a5,0x40000
     1b4:	00050713          	mv	a4,a0
     1b8:	00f57a63          	bgeu	a0,a5,1cc <sqrt+0x50>
     1bc:	400007b7          	lui	a5,0x40000
     1c0:	0027d793          	srli	a5,a5,0x2
     1c4:	fef76ee3          	bltu	a4,a5,1c0 <sqrt+0x44>
     1c8:	04078a63          	beqz	a5,21c <sqrt+0xa0>
     1cc:	00000513          	li	a0,0
     1d0:	00f506b3          	add	a3,a0,a5
     1d4:	00155513          	srli	a0,a0,0x1
     1d8:	00d76663          	bltu	a4,a3,1e4 <sqrt+0x68>
     1dc:	40d70733          	sub	a4,a4,a3
     1e0:	00f50533          	add	a0,a0,a5
     1e4:	0027d793          	srli	a5,a5,0x2
     1e8:	fe0794e3          	bnez	a5,1d0 <sqrt+0x54>
     1ec:	074020ef          	jal	2260 <__floatunsidf>
     1f0:	00c12083          	lw	ra,12(sp)
     1f4:	00812403          	lw	s0,8(sp)
     1f8:	00050713          	mv	a4,a0
     1fc:	00058793          	mv	a5,a1
     200:	00412483          	lw	s1,4(sp)
     204:	00070513          	mv	a0,a4
     208:	00078593          	mv	a1,a5
     20c:	01010113          	addi	sp,sp,16
     210:	00008067          	ret
     214:	00000713          	li	a4,0
     218:	fa5ff06f          	j	1bc <sqrt+0x40>
     21c:	00c12083          	lw	ra,12(sp)
     220:	00812403          	lw	s0,8(sp)
     224:	00000713          	li	a4,0
     228:	00412483          	lw	s1,4(sp)
     22c:	00070513          	mv	a0,a4
     230:	00078593          	mv	a1,a5
     234:	01010113          	addi	sp,sp,16
     238:	00008067          	ret

0000023c <rand_beebs>:
     23c:	00002637          	lui	a2,0x2
     240:	da462703          	lw	a4,-604(a2) # 1da4 <seed>
     244:	000036b7          	lui	a3,0x3
     248:	03968693          	addi	a3,a3,57 # 3039 <__bss_end+0x611>
     24c:	00871793          	slli	a5,a4,0x8
     250:	40e787b3          	sub	a5,a5,a4
     254:	00379793          	slli	a5,a5,0x3
     258:	00e787b3          	add	a5,a5,a4
     25c:	00779793          	slli	a5,a5,0x7
     260:	00e787b3          	add	a5,a5,a4
     264:	00379793          	slli	a5,a5,0x3
     268:	40e787b3          	sub	a5,a5,a4
     26c:	00579593          	slli	a1,a5,0x5
     270:	00b78533          	add	a0,a5,a1
     274:	00251513          	slli	a0,a0,0x2
     278:	40e50533          	sub	a0,a0,a4
     27c:	00251513          	slli	a0,a0,0x2
     280:	00e50533          	add	a0,a0,a4
     284:	00d50533          	add	a0,a0,a3
     288:	00151513          	slli	a0,a0,0x1
     28c:	00155513          	srli	a0,a0,0x1
     290:	daa62223          	sw	a0,-604(a2)
     294:	01055513          	srli	a0,a0,0x10
     298:	00008067          	ret

0000029c <srand_beebs>:
     29c:	000027b7          	lui	a5,0x2
     2a0:	daa7a223          	sw	a0,-604(a5) # 1da4 <seed>
     2a4:	00008067          	ret

000002a8 <TestCompare>:
     2a8:	ff010113          	addi	sp,sp,-16
     2ac:	00c52533          	slt	a0,a0,a2
     2b0:	01010113          	addi	sp,sp,16
     2b4:	00008067          	ret

000002b8 <TestingAscending>:
     2b8:	00008067          	ret

000002bc <TestingDescending>:
     2bc:	40a58533          	sub	a0,a1,a0
     2c0:	00008067          	ret

000002c4 <TestingEqual>:
     2c4:	3e800513          	li	a0,1000
     2c8:	00008067          	ret

000002cc <TestingRandom>:
     2cc:	f71ff06f          	j	23c <rand_beebs>

000002d0 <TestingMostlyDescending>:
     2d0:	ff010113          	addi	sp,sp,-16
     2d4:	00812423          	sw	s0,8(sp)
     2d8:	00112623          	sw	ra,12(sp)
     2dc:	40a58433          	sub	s0,a1,a0
     2e0:	f5dff0ef          	jal	23c <rand_beebs>
     2e4:	00151793          	slli	a5,a0,0x1
     2e8:	00a787b3          	add	a5,a5,a0
     2ec:	00279793          	slli	a5,a5,0x2
     2f0:	00a787b3          	add	a5,a5,a0
     2f4:	00679713          	slli	a4,a5,0x6
     2f8:	40f70733          	sub	a4,a4,a5
     2fc:	00271713          	slli	a4,a4,0x2
     300:	00a70733          	add	a4,a4,a0
     304:	00e71793          	slli	a5,a4,0xe
     308:	40e787b3          	sub	a5,a5,a4
     30c:	00379793          	slli	a5,a5,0x3
     310:	00a787b3          	add	a5,a5,a0
     314:	00c12083          	lw	ra,12(sp)
     318:	00878533          	add	a0,a5,s0
     31c:	00812403          	lw	s0,8(sp)
     320:	ffe50513          	addi	a0,a0,-2
     324:	01010113          	addi	sp,sp,16
     328:	00008067          	ret

0000032c <TestingMostlyAscending>:
     32c:	ff010113          	addi	sp,sp,-16
     330:	00812423          	sw	s0,8(sp)
     334:	00112623          	sw	ra,12(sp)
     338:	00050413          	mv	s0,a0
     33c:	f01ff0ef          	jal	23c <rand_beebs>
     340:	00151793          	slli	a5,a0,0x1
     344:	00a787b3          	add	a5,a5,a0
     348:	00279793          	slli	a5,a5,0x2
     34c:	00a787b3          	add	a5,a5,a0
     350:	00679713          	slli	a4,a5,0x6
     354:	40f70733          	sub	a4,a4,a5
     358:	00271713          	slli	a4,a4,0x2
     35c:	00a70733          	add	a4,a4,a0
     360:	00e71793          	slli	a5,a4,0xe
     364:	40e787b3          	sub	a5,a5,a4
     368:	00379793          	slli	a5,a5,0x3
     36c:	00a78533          	add	a0,a5,a0
     370:	00c12083          	lw	ra,12(sp)
     374:	00850533          	add	a0,a0,s0
     378:	00812403          	lw	s0,8(sp)
     37c:	ffe50513          	addi	a0,a0,-2
     380:	01010113          	addi	sp,sp,16
     384:	00008067          	ret

00000388 <TestingJittered>:
     388:	ff010113          	addi	sp,sp,-16
     38c:	00812423          	sw	s0,8(sp)
     390:	00112623          	sw	ra,12(sp)
     394:	00050413          	mv	s0,a0
     398:	ea5ff0ef          	jal	23c <rand_beebs>
     39c:	00c12083          	lw	ra,12(sp)
     3a0:	00040513          	mv	a0,s0
     3a4:	00812403          	lw	s0,8(sp)
     3a8:	01010113          	addi	sp,sp,16
     3ac:	00008067          	ret

000003b0 <TestingMostlyEqual>:
     3b0:	ff010113          	addi	sp,sp,-16
     3b4:	00112623          	sw	ra,12(sp)
     3b8:	e85ff0ef          	jal	23c <rand_beebs>
     3bc:	41f55793          	srai	a5,a0,0x1f
     3c0:	01e7d793          	srli	a5,a5,0x1e
     3c4:	00c12083          	lw	ra,12(sp)
     3c8:	00f50533          	add	a0,a0,a5
     3cc:	00357513          	andi	a0,a0,3
     3d0:	40f50533          	sub	a0,a0,a5
     3d4:	3e850513          	addi	a0,a0,1000
     3d8:	01010113          	addi	sp,sp,16
     3dc:	00008067          	ret

000003e0 <TestingPathological>:
     3e0:	00050793          	mv	a5,a0
     3e4:	02050663          	beqz	a0,410 <TestingPathological+0x30>
     3e8:	01f5d713          	srli	a4,a1,0x1f
     3ec:	00b70733          	add	a4,a4,a1
     3f0:	40175713          	srai	a4,a4,0x1
     3f4:	00b00513          	li	a0,11
     3f8:	00e7ce63          	blt	a5,a4,414 <TestingPathological+0x34>
     3fc:	fff58593          	addi	a1,a1,-1
     400:	40b787b3          	sub	a5,a5,a1
     404:	0017b793          	seqz	a5,a5
     408:	00978513          	addi	a0,a5,9
     40c:	00008067          	ret
     410:	00a00513          	li	a0,10
     414:	00008067          	ret

00000418 <BinaryFirst>:
     418:	fc010113          	addi	sp,sp,-64
     41c:	02912a23          	sw	s1,52(sp)
     420:	03412423          	sw	s4,40(sp)
     424:	03512223          	sw	s5,36(sp)
     428:	03612023          	sw	s6,32(sp)
     42c:	01712e23          	sw	s7,28(sp)
     430:	02112e23          	sw	ra,60(sp)
     434:	00c12423          	sw	a2,8(sp)
     438:	00d12623          	sw	a3,12(sp)
     43c:	fff68b13          	addi	s6,a3,-1
     440:	00060493          	mv	s1,a2
     444:	00050a13          	mv	s4,a0
     448:	00058b93          	mv	s7,a1
     44c:	00070a93          	mv	s5,a4
     450:	05665e63          	bge	a2,s6,4ac <BinaryFirst+0x94>
     454:	03312623          	sw	s3,44(sp)
     458:	00359993          	slli	s3,a1,0x3
     45c:	03212823          	sw	s2,48(sp)
     460:	02812c23          	sw	s0,56(sp)
     464:	013509b3          	add	s3,a0,s3
     468:	000b0913          	mv	s2,s6
     46c:	40990433          	sub	s0,s2,s1
     470:	40145413          	srai	s0,s0,0x1
     474:	00940433          	add	s0,s0,s1
     478:	00341793          	slli	a5,s0,0x3
     47c:	00fa07b3          	add	a5,s4,a5
     480:	0007a503          	lw	a0,0(a5)
     484:	0047a583          	lw	a1,4(a5)
     488:	0009a603          	lw	a2,0(s3)
     48c:	0049a683          	lw	a3,4(s3)
     490:	000a80e7          	jalr	s5
     494:	06050663          	beqz	a0,500 <BinaryFirst+0xe8>
     498:	00140493          	addi	s1,s0,1
     49c:	fd24c8e3          	blt	s1,s2,46c <BinaryFirst+0x54>
     4a0:	03812403          	lw	s0,56(sp)
     4a4:	03012903          	lw	s2,48(sp)
     4a8:	02c12983          	lw	s3,44(sp)
     4ac:	029b1863          	bne	s6,s1,4dc <BinaryFirst+0xc4>
     4b0:	00349793          	slli	a5,s1,0x3
     4b4:	003b9b93          	slli	s7,s7,0x3
     4b8:	017a0bb3          	add	s7,s4,s7
     4bc:	00fa0a33          	add	s4,s4,a5
     4c0:	000ba603          	lw	a2,0(s7)
     4c4:	004ba683          	lw	a3,4(s7)
     4c8:	000a2503          	lw	a0,0(s4)
     4cc:	004a2583          	lw	a1,4(s4)
     4d0:	000a80e7          	jalr	s5
     4d4:	00a03533          	snez	a0,a0
     4d8:	00a484b3          	add	s1,s1,a0
     4dc:	03c12083          	lw	ra,60(sp)
     4e0:	02812a03          	lw	s4,40(sp)
     4e4:	02412a83          	lw	s5,36(sp)
     4e8:	02012b03          	lw	s6,32(sp)
     4ec:	01c12b83          	lw	s7,28(sp)
     4f0:	00048513          	mv	a0,s1
     4f4:	03412483          	lw	s1,52(sp)
     4f8:	04010113          	addi	sp,sp,64
     4fc:	00008067          	ret
     500:	00040913          	mv	s2,s0
     504:	f724c4e3          	blt	s1,s2,46c <BinaryFirst+0x54>
     508:	f99ff06f          	j	4a0 <BinaryFirst+0x88>

0000050c <BinaryLast>:
     50c:	fc010113          	addi	sp,sp,-64
     510:	02912a23          	sw	s1,52(sp)
     514:	03412423          	sw	s4,40(sp)
     518:	03512223          	sw	s5,36(sp)
     51c:	03612023          	sw	s6,32(sp)
     520:	01712e23          	sw	s7,28(sp)
     524:	02112e23          	sw	ra,60(sp)
     528:	00c12423          	sw	a2,8(sp)
     52c:	00d12623          	sw	a3,12(sp)
     530:	fff68b13          	addi	s6,a3,-1
     534:	00060493          	mv	s1,a2
     538:	00050a13          	mv	s4,a0
     53c:	00058b93          	mv	s7,a1
     540:	00070a93          	mv	s5,a4
     544:	05665e63          	bge	a2,s6,5a0 <BinaryLast+0x94>
     548:	03312623          	sw	s3,44(sp)
     54c:	00359993          	slli	s3,a1,0x3
     550:	03212823          	sw	s2,48(sp)
     554:	02812c23          	sw	s0,56(sp)
     558:	013509b3          	add	s3,a0,s3
     55c:	000b0913          	mv	s2,s6
     560:	40990433          	sub	s0,s2,s1
     564:	40145413          	srai	s0,s0,0x1
     568:	00940433          	add	s0,s0,s1
     56c:	00341793          	slli	a5,s0,0x3
     570:	00fa07b3          	add	a5,s4,a5
     574:	0007a603          	lw	a2,0(a5)
     578:	0047a683          	lw	a3,4(a5)
     57c:	0009a503          	lw	a0,0(s3)
     580:	0049a583          	lw	a1,4(s3)
     584:	000a80e7          	jalr	s5
     588:	06051663          	bnez	a0,5f4 <BinaryLast+0xe8>
     58c:	00140493          	addi	s1,s0,1
     590:	fd24c8e3          	blt	s1,s2,560 <BinaryLast+0x54>
     594:	03812403          	lw	s0,56(sp)
     598:	03012903          	lw	s2,48(sp)
     59c:	02c12983          	lw	s3,44(sp)
     5a0:	029b1863          	bne	s6,s1,5d0 <BinaryLast+0xc4>
     5a4:	00349793          	slli	a5,s1,0x3
     5a8:	003b9b93          	slli	s7,s7,0x3
     5ac:	017a0bb3          	add	s7,s4,s7
     5b0:	00fa0a33          	add	s4,s4,a5
     5b4:	000ba503          	lw	a0,0(s7)
     5b8:	004ba583          	lw	a1,4(s7)
     5bc:	000a2603          	lw	a2,0(s4)
     5c0:	004a2683          	lw	a3,4(s4)
     5c4:	000a80e7          	jalr	s5
     5c8:	00153513          	seqz	a0,a0
     5cc:	00a484b3          	add	s1,s1,a0
     5d0:	03c12083          	lw	ra,60(sp)
     5d4:	02812a03          	lw	s4,40(sp)
     5d8:	02412a83          	lw	s5,36(sp)
     5dc:	02012b03          	lw	s6,32(sp)
     5e0:	01c12b83          	lw	s7,28(sp)
     5e4:	00048513          	mv	a0,s1
     5e8:	03412483          	lw	s1,52(sp)
     5ec:	04010113          	addi	sp,sp,64
     5f0:	00008067          	ret
     5f4:	00040913          	mv	s2,s0
     5f8:	f724c4e3          	blt	s1,s2,560 <BinaryLast+0x54>
     5fc:	f99ff06f          	j	594 <BinaryLast+0x88>

00000600 <InsertionSort>:
     600:	fb010113          	addi	sp,sp,-80
     604:	03612823          	sw	s6,48(sp)
     608:	00158b13          	addi	s6,a1,1
     60c:	03512a23          	sw	s5,52(sp)
     610:	03812423          	sw	s8,40(sp)
     614:	003b1a93          	slli	s5,s6,0x3
     618:	00359793          	slli	a5,a1,0x3
     61c:	04112623          	sw	ra,76(sp)
     620:	00b12423          	sw	a1,8(sp)
     624:	00c12623          	sw	a2,12(sp)
     628:	01550ab3          	add	s5,a0,s5
     62c:	00f50c33          	add	s8,a0,a5
     630:	0acb5e63          	bge	s6,a2,6ec <InsertionSort+0xec>
     634:	03312e23          	sw	s3,60(sp)
     638:	03412c23          	sw	s4,56(sp)
     63c:	03712623          	sw	s7,44(sp)
     640:	04812423          	sw	s0,72(sp)
     644:	04912223          	sw	s1,68(sp)
     648:	05212023          	sw	s2,64(sp)
     64c:	00058993          	mv	s3,a1
     650:	00060b93          	mv	s7,a2
     654:	00068a13          	mv	s4,a3
     658:	000aa683          	lw	a3,0(s5)
     65c:	004aa703          	lw	a4,4(s5)
     660:	000a8793          	mv	a5,s5
     664:	00d12c23          	sw	a3,24(sp)
     668:	00e12e23          	sw	a4,28(sp)
     66c:	000a8493          	mv	s1,s5
     670:	000b0913          	mv	s2,s6
     674:	0169ce63          	blt	s3,s6,690 <InsertionSort+0x90>
     678:	0400006f          	j	6b8 <InsertionSort+0xb8>
     67c:	ff842703          	lw	a4,-8(s0)
     680:	ffc42783          	lw	a5,-4(s0)
     684:	00e42023          	sw	a4,0(s0)
     688:	00f42223          	sw	a5,4(s0)
     68c:	07298c63          	beq	s3,s2,704 <InsertionSort+0x104>
     690:	00048413          	mv	s0,s1
     694:	01812503          	lw	a0,24(sp)
     698:	01c12583          	lw	a1,28(sp)
     69c:	ff84a603          	lw	a2,-8(s1)
     6a0:	ffc4a683          	lw	a3,-4(s1)
     6a4:	ff848493          	addi	s1,s1,-8
     6a8:	fff90913          	addi	s2,s2,-1
     6ac:	000a00e7          	jalr	s4
     6b0:	00040793          	mv	a5,s0
     6b4:	fc0514e3          	bnez	a0,67c <InsertionSort+0x7c>
     6b8:	01812683          	lw	a3,24(sp)
     6bc:	01c12703          	lw	a4,28(sp)
     6c0:	001b0b13          	addi	s6,s6,1
     6c4:	00d7a023          	sw	a3,0(a5)
     6c8:	00e7a223          	sw	a4,4(a5)
     6cc:	008a8a93          	addi	s5,s5,8
     6d0:	f96b94e3          	bne	s7,s6,658 <InsertionSort+0x58>
     6d4:	04812403          	lw	s0,72(sp)
     6d8:	04412483          	lw	s1,68(sp)
     6dc:	04012903          	lw	s2,64(sp)
     6e0:	03c12983          	lw	s3,60(sp)
     6e4:	03812a03          	lw	s4,56(sp)
     6e8:	02c12b83          	lw	s7,44(sp)
     6ec:	04c12083          	lw	ra,76(sp)
     6f0:	03412a83          	lw	s5,52(sp)
     6f4:	03012b03          	lw	s6,48(sp)
     6f8:	02812c03          	lw	s8,40(sp)
     6fc:	05010113          	addi	sp,sp,80
     700:	00008067          	ret
     704:	01812683          	lw	a3,24(sp)
     708:	01c12703          	lw	a4,28(sp)
     70c:	000c0793          	mv	a5,s8
     710:	001b0b13          	addi	s6,s6,1
     714:	00d7a023          	sw	a3,0(a5)
     718:	00e7a223          	sw	a4,4(a5)
     71c:	008a8a93          	addi	s5,s5,8
     720:	f36b9ce3          	bne	s7,s6,658 <InsertionSort+0x58>
     724:	fb1ff06f          	j	6d4 <InsertionSort+0xd4>

00000728 <Reverse>:
     728:	ff010113          	addi	sp,sp,-16
     72c:	00b12423          	sw	a1,8(sp)
     730:	00c12623          	sw	a2,12(sp)
     734:	40b60733          	sub	a4,a2,a1
     738:	00100793          	li	a5,1
     73c:	06e7d063          	bge	a5,a4,79c <Reverse+0x74>
     740:	01f75793          	srli	a5,a4,0x1f
     744:	00e787b3          	add	a5,a5,a4
     748:	4017d793          	srai	a5,a5,0x1
     74c:	00f585b3          	add	a1,a1,a5
     750:	00359593          	slli	a1,a1,0x3
     754:	00379793          	slli	a5,a5,0x3
     758:	00361613          	slli	a2,a2,0x3
     75c:	00b505b3          	add	a1,a0,a1
     760:	40f507b3          	sub	a5,a0,a5
     764:	ff858713          	addi	a4,a1,-8
     768:	00c787b3          	add	a5,a5,a2
     76c:	00c50533          	add	a0,a0,a2
     770:	0007a583          	lw	a1,0(a5)
     774:	00072603          	lw	a2,0(a4)
     778:	00472683          	lw	a3,4(a4)
     77c:	00b72023          	sw	a1,0(a4)
     780:	0047a583          	lw	a1,4(a5)
     784:	00878793          	addi	a5,a5,8
     788:	ff870713          	addi	a4,a4,-8
     78c:	00b72623          	sw	a1,12(a4)
     790:	fec7ac23          	sw	a2,-8(a5)
     794:	fed7ae23          	sw	a3,-4(a5)
     798:	fca79ce3          	bne	a5,a0,770 <Reverse+0x48>
     79c:	01010113          	addi	sp,sp,16
     7a0:	00008067          	ret

000007a4 <Rotate>:
     7a4:	fc010113          	addi	sp,sp,-64
     7a8:	02112e23          	sw	ra,60(sp)
     7ac:	00c12c23          	sw	a2,24(sp)
     7b0:	00d12e23          	sw	a3,28(sp)
     7b4:	10d60663          	beq	a2,a3,8c0 <Rotate+0x11c>
     7b8:	02812c23          	sw	s0,56(sp)
     7bc:	00058813          	mv	a6,a1
     7c0:	00c58333          	add	t1,a1,a2
     7c4:	0e05c063          	bltz	a1,8a4 <Rotate+0x100>
     7c8:	40668e33          	sub	t3,a3,t1
     7cc:	00050413          	mv	s0,a0
     7d0:	00060893          	mv	a7,a2
     7d4:	050e5663          	bge	t3,a6,820 <Rotate+0x7c>
     7d8:	0fc7da63          	bge	a5,t3,8cc <Rotate+0x128>
     7dc:	00088593          	mv	a1,a7
     7e0:	00030613          	mv	a2,t1
     7e4:	00040513          	mv	a0,s0
     7e8:	00d12223          	sw	a3,4(sp)
     7ec:	00612023          	sw	t1,0(sp)
     7f0:	f39ff0ef          	jal	728 <Reverse>
     7f4:	00012583          	lw	a1,0(sp)
     7f8:	00412603          	lw	a2,4(sp)
     7fc:	00040513          	mv	a0,s0
     800:	f29ff0ef          	jal	728 <Reverse>
     804:	00040513          	mv	a0,s0
     808:	03812403          	lw	s0,56(sp)
     80c:	01812583          	lw	a1,24(sp)
     810:	01c12603          	lw	a2,28(sp)
     814:	03c12083          	lw	ra,60(sp)
     818:	04010113          	addi	sp,sp,64
     81c:	f0dff06f          	j	728 <Reverse>
     820:	fb07cee3          	blt	a5,a6,7dc <Rotate+0x38>
     824:	00361793          	slli	a5,a2,0x3
     828:	00f507b3          	add	a5,a0,a5
     82c:	00381813          	slli	a6,a6,0x3
     830:	00078593          	mv	a1,a5
     834:	00c12623          	sw	a2,12(sp)
     838:	00070513          	mv	a0,a4
     83c:	00080613          	mv	a2,a6
     840:	01c12a23          	sw	t3,20(sp)
     844:	00612823          	sw	t1,16(sp)
     848:	00f12023          	sw	a5,0(sp)
     84c:	01012423          	sw	a6,8(sp)
     850:	00e12223          	sw	a4,4(sp)
     854:	87dff0ef          	jal	d0 <memcpy>
     858:	01012303          	lw	t1,16(sp)
     85c:	01412e03          	lw	t3,20(sp)
     860:	00012503          	lw	a0,0(sp)
     864:	00331313          	slli	t1,t1,0x3
     868:	003e1613          	slli	a2,t3,0x3
     86c:	006405b3          	add	a1,s0,t1
     870:	01c12023          	sw	t3,0(sp)
     874:	881ff0ef          	jal	f4 <memmove>
     878:	00012e03          	lw	t3,0(sp)
     87c:	00c12883          	lw	a7,12(sp)
     880:	00412583          	lw	a1,4(sp)
     884:	01c88633          	add	a2,a7,t3
     888:	00361613          	slli	a2,a2,0x3
     88c:	00c40533          	add	a0,s0,a2
     890:	00812603          	lw	a2,8(sp)
     894:	03812403          	lw	s0,56(sp)
     898:	03c12083          	lw	ra,60(sp)
     89c:	04010113          	addi	sp,sp,64
     8a0:	831ff06f          	j	d0 <memcpy>
     8a4:	00d58333          	add	t1,a1,a3
     8a8:	40c30833          	sub	a6,t1,a2
     8ac:	40668e33          	sub	t3,a3,t1
     8b0:	00050413          	mv	s0,a0
     8b4:	00060893          	mv	a7,a2
     8b8:	f30e40e3          	blt	t3,a6,7d8 <Rotate+0x34>
     8bc:	f65ff06f          	j	820 <Rotate+0x7c>
     8c0:	03c12083          	lw	ra,60(sp)
     8c4:	04010113          	addi	sp,sp,64
     8c8:	00008067          	ret
     8cc:	003e1e13          	slli	t3,t3,0x3
     8d0:	00331313          	slli	t1,t1,0x3
     8d4:	006505b3          	add	a1,a0,t1
     8d8:	00c12623          	sw	a2,12(sp)
     8dc:	00070513          	mv	a0,a4
     8e0:	000e0613          	mv	a2,t3
     8e4:	00d12823          	sw	a3,16(sp)
     8e8:	01012023          	sw	a6,0(sp)
     8ec:	01c12423          	sw	t3,8(sp)
     8f0:	00e12223          	sw	a4,4(sp)
     8f4:	fdcff0ef          	jal	d0 <memcpy>
     8f8:	00012803          	lw	a6,0(sp)
     8fc:	00c12883          	lw	a7,12(sp)
     900:	01012683          	lw	a3,16(sp)
     904:	00381613          	slli	a2,a6,0x3
     908:	00389893          	slli	a7,a7,0x3
     90c:	410686b3          	sub	a3,a3,a6
     910:	011408b3          	add	a7,s0,a7
     914:	00369693          	slli	a3,a3,0x3
     918:	00088593          	mv	a1,a7
     91c:	00d40533          	add	a0,s0,a3
     920:	01112023          	sw	a7,0(sp)
     924:	fd0ff0ef          	jal	f4 <memmove>
     928:	00812603          	lw	a2,8(sp)
     92c:	00412583          	lw	a1,4(sp)
     930:	00012503          	lw	a0,0(sp)
     934:	f61ff06f          	j	894 <Rotate+0xf0>

00000938 <WikiMerge>:
     938:	f9010113          	addi	sp,sp,-112
     93c:	02c12623          	sw	a2,44(sp)
     940:	02d12023          	sw	a3,32(sp)
     944:	00068613          	mv	a2,a3
     948:	00d12a23          	sw	a3,20(sp)
     94c:	07412683          	lw	a3,116(sp)
     950:	05512a23          	sw	s5,84(sp)
     954:	05912223          	sw	s9,68(sp)
     958:	40c70ab3          	sub	s5,a4,a2
     95c:	40f80cb3          	sub	s9,a6,a5
     960:	06812423          	sw	s0,104(sp)
     964:	06912223          	sw	s1,100(sp)
     968:	05612823          	sw	s6,80(sp)
     96c:	02e12223          	sw	a4,36(sp)
     970:	00f12823          	sw	a5,16(sp)
     974:	00f12c23          	sw	a5,24(sp)
     978:	01902733          	sgtz	a4,s9
     97c:	015027b3          	sgtz	a5,s5
     980:	06112623          	sw	ra,108(sp)
     984:	05312e23          	sw	s3,92(sp)
     988:	01012e23          	sw	a6,28(sp)
     98c:	02b12423          	sw	a1,40(sp)
     990:	07012483          	lw	s1,112(sp)
     994:	00050413          	mv	s0,a0
     998:	00088b13          	mv	s6,a7
     99c:	00e7f7b3          	and	a5,a5,a4
     9a0:	0556c463          	blt	a3,s5,9e8 <WikiMerge+0xb0>
     9a4:	00361993          	slli	s3,a2,0x3
     9a8:	003a9a93          	slli	s5,s5,0x3
     9ac:	013509b3          	add	s3,a0,s3
     9b0:	01548ab3          	add	s5,s1,s5
     9b4:	14079863          	bnez	a5,b04 <WikiMerge+0x1cc>
     9b8:	06812403          	lw	s0,104(sp)
     9bc:	06c12083          	lw	ra,108(sp)
     9c0:	05012b03          	lw	s6,80(sp)
     9c4:	04412c83          	lw	s9,68(sp)
     9c8:	409a8633          	sub	a2,s5,s1
     9cc:	00048593          	mv	a1,s1
     9d0:	05412a83          	lw	s5,84(sp)
     9d4:	06412483          	lw	s1,100(sp)
     9d8:	00098513          	mv	a0,s3
     9dc:	05c12983          	lw	s3,92(sp)
     9e0:	07010113          	addi	sp,sp,112
     9e4:	eecff06f          	j	d0 <memcpy>
     9e8:	00b12623          	sw	a1,12(sp)
     9ec:	06079e63          	bnez	a5,a68 <WikiMerge+0x130>
     9f0:	05505a63          	blez	s5,a44 <WikiMerge+0x10c>
     9f4:	00c12783          	lw	a5,12(sp)
     9f8:	00fa8ab3          	add	s5,s5,a5
     9fc:	00379593          	slli	a1,a5,0x3
     a00:	01412783          	lw	a5,20(sp)
     a04:	003a9a93          	slli	s5,s5,0x3
     a08:	01540ab3          	add	s5,s0,s5
     a0c:	00379993          	slli	s3,a5,0x3
     a10:	00b405b3          	add	a1,s0,a1
     a14:	013406b3          	add	a3,s0,s3
     a18:	0006a603          	lw	a2,0(a3)
     a1c:	0005a703          	lw	a4,0(a1)
     a20:	0045a783          	lw	a5,4(a1)
     a24:	00c5a023          	sw	a2,0(a1)
     a28:	0046a603          	lw	a2,4(a3)
     a2c:	00858593          	addi	a1,a1,8
     a30:	00868693          	addi	a3,a3,8
     a34:	fec5ae23          	sw	a2,-4(a1)
     a38:	fee6ac23          	sw	a4,-8(a3)
     a3c:	fef6ae23          	sw	a5,-4(a3)
     a40:	fd559ce3          	bne	a1,s5,a18 <WikiMerge+0xe0>
     a44:	06c12083          	lw	ra,108(sp)
     a48:	06812403          	lw	s0,104(sp)
     a4c:	06412483          	lw	s1,100(sp)
     a50:	05c12983          	lw	s3,92(sp)
     a54:	05412a83          	lw	s5,84(sp)
     a58:	05012b03          	lw	s6,80(sp)
     a5c:	04412c83          	lw	s9,68(sp)
     a60:	07010113          	addi	sp,sp,112
     a64:	00008067          	ret
     a68:	01412783          	lw	a5,20(sp)
     a6c:	05812423          	sw	s8,72(sp)
     a70:	01012c03          	lw	s8,16(sp)
     a74:	03b12e23          	sw	s11,60(sp)
     a78:	00379d93          	slli	s11,a5,0x3
     a7c:	05412c23          	sw	s4,88(sp)
     a80:	05712623          	sw	s7,76(sp)
     a84:	07212023          	sw	s2,96(sp)
     a88:	05a12023          	sw	s10,64(sp)
     a8c:	01b50db3          	add	s11,a0,s11
     a90:	00000993          	li	s3,0
     a94:	00000a13          	li	s4,0
     a98:	00000493          	li	s1,0
     a9c:	00058b93          	mv	s7,a1
     aa0:	003c1913          	slli	s2,s8,0x3
     aa4:	003b9d13          	slli	s10,s7,0x3
     aa8:	01240933          	add	s2,s0,s2
     aac:	01a40d33          	add	s10,s0,s10
     ab0:	000d2603          	lw	a2,0(s10)
     ab4:	004d2683          	lw	a3,4(s10)
     ab8:	00092503          	lw	a0,0(s2)
     abc:	00492583          	lw	a1,4(s2)
     ac0:	00198993          	addi	s3,s3,1
     ac4:	000b00e7          	jalr	s6
     ac8:	000da603          	lw	a2,0(s11)
     acc:	004da683          	lw	a3,4(s11)
     ad0:	0c051263          	bnez	a0,b94 <WikiMerge+0x25c>
     ad4:	000d2583          	lw	a1,0(s10)
     ad8:	00c12783          	lw	a5,12(sp)
     adc:	00148493          	addi	s1,s1,1
     ae0:	00bda023          	sw	a1,0(s11)
     ae4:	004d2583          	lw	a1,4(s10)
     ae8:	00f48bb3          	add	s7,s1,a5
     aec:	00bda223          	sw	a1,4(s11)
     af0:	00cd2023          	sw	a2,0(s10)
     af4:	00dd2223          	sw	a3,4(s10)
     af8:	0754d063          	bge	s1,s5,b58 <WikiMerge+0x220>
     afc:	008d8d93          	addi	s11,s11,8
     b00:	fa1ff06f          	j	aa0 <WikiMerge+0x168>
     b04:	01012783          	lw	a5,16(sp)
     b08:	05412c23          	sw	s4,88(sp)
     b0c:	00381813          	slli	a6,a6,0x3
     b10:	00379a13          	slli	s4,a5,0x3
     b14:	01450a33          	add	s4,a0,s4
     b18:	01050433          	add	s0,a0,a6
     b1c:	0004a603          	lw	a2,0(s1)
     b20:	0044a683          	lw	a3,4(s1)
     b24:	000a2503          	lw	a0,0(s4)
     b28:	004a2583          	lw	a1,4(s4)
     b2c:	00898993          	addi	s3,s3,8
     b30:	000b00e7          	jalr	s6
     b34:	04051063          	bnez	a0,b74 <WikiMerge+0x23c>
     b38:	0004a783          	lw	a5,0(s1)
     b3c:	00848493          	addi	s1,s1,8
     b40:	fef9ac23          	sw	a5,-8(s3)
     b44:	ffc4a783          	lw	a5,-4(s1)
     b48:	fef9ae23          	sw	a5,-4(s3)
     b4c:	fc9a98e3          	bne	s5,s1,b1c <WikiMerge+0x1e4>
     b50:	05812a03          	lw	s4,88(sp)
     b54:	e65ff06f          	j	9b8 <WikiMerge+0x80>
     b58:	06012903          	lw	s2,96(sp)
     b5c:	05812a03          	lw	s4,88(sp)
     b60:	04c12b83          	lw	s7,76(sp)
     b64:	04812c03          	lw	s8,72(sp)
     b68:	04012d03          	lw	s10,64(sp)
     b6c:	03c12d83          	lw	s11,60(sp)
     b70:	ed5ff06f          	j	a44 <WikiMerge+0x10c>
     b74:	000a2783          	lw	a5,0(s4)
     b78:	008a0a13          	addi	s4,s4,8
     b7c:	fef9ac23          	sw	a5,-8(s3)
     b80:	ffca2783          	lw	a5,-4(s4)
     b84:	fef9ae23          	sw	a5,-4(s3)
     b88:	f9441ae3          	bne	s0,s4,b1c <WikiMerge+0x1e4>
     b8c:	05812a03          	lw	s4,88(sp)
     b90:	e29ff06f          	j	9b8 <WikiMerge+0x80>
     b94:	00092583          	lw	a1,0(s2)
     b98:	01012783          	lw	a5,16(sp)
     b9c:	001a0a13          	addi	s4,s4,1
     ba0:	00bda023          	sw	a1,0(s11)
     ba4:	00492583          	lw	a1,4(s2)
     ba8:	00fa0c33          	add	s8,s4,a5
     bac:	00bda223          	sw	a1,4(s11)
     bb0:	00c92023          	sw	a2,0(s2)
     bb4:	00d92223          	sw	a3,4(s2)
     bb8:	f59a42e3          	blt	s4,s9,afc <WikiMerge+0x1c4>
     bbc:	01412783          	lw	a5,20(sp)
     bc0:	01712623          	sw	s7,12(sp)
     bc4:	06012903          	lw	s2,96(sp)
     bc8:	013787b3          	add	a5,a5,s3
     bcc:	05812a03          	lw	s4,88(sp)
     bd0:	04c12b83          	lw	s7,76(sp)
     bd4:	04812c03          	lw	s8,72(sp)
     bd8:	04012d03          	lw	s10,64(sp)
     bdc:	03c12d83          	lw	s11,60(sp)
     be0:	00f12a23          	sw	a5,20(sp)
     be4:	409a8ab3          	sub	s5,s5,s1
     be8:	e09ff06f          	j	9f0 <WikiMerge+0xb8>

00000bec <WikiSort>:
     bec:	eb010113          	addi	sp,sp,-336
     bf0:	14112623          	sw	ra,332(sp)
     bf4:	14812423          	sw	s0,328(sp)
     bf8:	14912223          	sw	s1,324(sp)
     bfc:	15212023          	sw	s2,320(sp)
     c00:	13312e23          	sw	s3,316(sp)
     c04:	13412c23          	sw	s4,312(sp)
     c08:	13512a23          	sw	s5,308(sp)
     c0c:	13612823          	sw	s6,304(sp)
     c10:	13712623          	sw	s7,300(sp)
     c14:	13812423          	sw	s8,296(sp)
     c18:	13912223          	sw	s9,292(sp)
     c1c:	13a12023          	sw	s10,288(sp)
     c20:	11b12e23          	sw	s11,284(sp)
     c24:	02000713          	li	a4,32
     c28:	80010113          	addi	sp,sp,-2048
     c2c:	80010113          	addi	sp,sp,-2048
     c30:	00058793          	mv	a5,a1
     c34:	00060693          	mv	a3,a2
     c38:	00b74463          	blt	a4,a1,c40 <WikiSort+0x54>
     c3c:	0ac0106f          	j	1ce8 <__clz_tab+0x44>
     c40:	04b12a23          	sw	a1,84(sp)
     c44:	05412703          	lw	a4,84(sp)
     c48:	4015d793          	srai	a5,a1,0x1
     c4c:	05412b03          	lw	s6,84(sp)
     c50:	00e7e7b3          	or	a5,a5,a4
     c54:	4027d713          	srai	a4,a5,0x2
     c58:	00e7e7b3          	or	a5,a5,a4
     c5c:	4047d713          	srai	a4,a5,0x4
     c60:	00e7e7b3          	or	a5,a5,a4
     c64:	4087d713          	srai	a4,a5,0x8
     c68:	00e7e7b3          	or	a5,a5,a4
     c6c:	4107d713          	srai	a4,a5,0x10
     c70:	00e7e7b3          	or	a5,a5,a4
     c74:	4017d713          	srai	a4,a5,0x1
     c78:	40e78a33          	sub	s4,a5,a4
     c7c:	404a5793          	srai	a5,s4,0x4
     c80:	00078593          	mv	a1,a5
     c84:	00050c93          	mv	s9,a0
     c88:	000b0513          	mv	a0,s6
     c8c:	00078913          	mv	s2,a5
     c90:	02f12623          	sw	a5,44(sp)
     c94:	00060d93          	mv	s11,a2
     c98:	6ec010ef          	jal	2384 <__modsi3>
     c9c:	00050993          	mv	s3,a0
     ca0:	00090593          	mv	a1,s2
     ca4:	000b0513          	mv	a0,s6
     ca8:	03312a23          	sw	s3,52(sp)
     cac:	654010ef          	jal	2300 <__divsi3>
     cb0:	02a12c23          	sw	a0,56(sp)
     cb4:	11010d13          	addi	s10,sp,272
     cb8:	00000793          	li	a5,0
     cbc:	00000493          	li	s1,0
     cc0:	00050a93          	mv	s5,a0
     cc4:	0080006f          	j	ccc <WikiSort+0xe0>
     cc8:	00040793          	mv	a5,s0
     ccc:	013484b3          	add	s1,s1,s3
     cd0:	000d8693          	mv	a3,s11
     cd4:	00078593          	mv	a1,a5
     cd8:	000c8513          	mv	a0,s9
     cdc:	00fa8433          	add	s0,s5,a5
     ce0:	0124c663          	blt	s1,s2,cec <WikiSort+0x100>
     ce4:	412484b3          	sub	s1,s1,s2
     ce8:	00140413          	addi	s0,s0,1
     cec:	00040613          	mv	a2,s0
     cf0:	fafd2423          	sw	a5,-88(s10)
     cf4:	fa8d2623          	sw	s0,-84(s10)
     cf8:	909ff0ef          	jal	600 <InsertionSort>
     cfc:	fd6446e3          	blt	s0,s6,cc8 <WikiSort+0xdc>
     d00:	200007b7          	lui	a5,0x20000
     d04:	fff78793          	addi	a5,a5,-1 # 1fffffff <__stack_top+0x1fff80ff>
     d08:	01000493          	li	s1,16
     d0c:	02f12423          	sw	a5,40(sp)
     d10:	6744dc63          	bge	s1,s4,1388 <WikiSort+0x79c>
     d14:	000c8793          	mv	a5,s9
     d18:	000d0c93          	mv	s9,s10
     d1c:	00078d13          	mv	s10,a5
     d20:	03812403          	lw	s0,56(sp)
     d24:	00000993          	li	s3,0
     d28:	00040513          	mv	a0,s0
     d2c:	454010ef          	jal	2180 <__floatsidf>
     d30:	c4cff0ef          	jal	17c <sqrt>
     d34:	35c010ef          	jal	2090 <__fixdfsi>
     d38:	00050913          	mv	s2,a0
     d3c:	00050593          	mv	a1,a0
     d40:	00040513          	mv	a0,s0
     d44:	5bc010ef          	jal	2300 <__divsi3>
     d48:	00150713          	addi	a4,a0,1
     d4c:	000d0793          	mv	a5,s10
     d50:	04e12c23          	sw	a4,88(sp)
     d54:	00391713          	slli	a4,s2,0x3
     d58:	000c8d13          	mv	s10,s9
     d5c:	04e12623          	sw	a4,76(sp)
     d60:	02012823          	sw	zero,48(sp)
     d64:	02012e23          	sw	zero,60(sp)
     d68:	06012c23          	sw	zero,120(sp)
     d6c:	02012223          	sw	zero,36(sp)
     d70:	04012423          	sw	zero,72(sp)
     d74:	02012023          	sw	zero,32(sp)
     d78:	06a12423          	sw	a0,104(sp)
     d7c:	06012023          	sw	zero,96(sp)
     d80:	06012623          	sw	zero,108(sp)
     d84:	06912823          	sw	s1,112(sp)
     d88:	06012223          	sw	zero,100(sp)
     d8c:	07412a23          	sw	s4,116(sp)
     d90:	00078c93          	mv	s9,a5
     d94:	02012783          	lw	a5,32(sp)
     d98:	03412703          	lw	a4,52(sp)
     d9c:	00e78bb3          	add	s7,a5,a4
     da0:	03812783          	lw	a5,56(sp)
     da4:	00f984b3          	add	s1,s3,a5
     da8:	02c12783          	lw	a5,44(sp)
     dac:	00fbc663          	blt	s7,a5,db8 <WikiSort+0x1cc>
     db0:	40fb8bb3          	sub	s7,s7,a5
     db4:	00148493          	addi	s1,s1,1
     db8:	03412783          	lw	a5,52(sp)
     dbc:	00fb87b3          	add	a5,s7,a5
     dc0:	02f12023          	sw	a5,32(sp)
     dc4:	03812783          	lw	a5,56(sp)
     dc8:	02012703          	lw	a4,32(sp)
     dcc:	00f48c33          	add	s8,s1,a5
     dd0:	02c12783          	lw	a5,44(sp)
     dd4:	00f74c63          	blt	a4,a5,dec <WikiSort+0x200>
     dd8:	00070793          	mv	a5,a4
     ddc:	02c12703          	lw	a4,44(sp)
     de0:	001c0c13          	addi	s8,s8,1
     de4:	40e787b3          	sub	a5,a5,a4
     de8:	02f12023          	sw	a5,32(sp)
     dec:	02812783          	lw	a5,40(sp)
     df0:	00399413          	slli	s0,s3,0x3
     df4:	008c8733          	add	a4,s9,s0
     df8:	00fc0a33          	add	s4,s8,a5
     dfc:	003a1793          	slli	a5,s4,0x3
     e00:	00f12823          	sw	a5,16(sp)
     e04:	00fc87b3          	add	a5,s9,a5
     e08:	0007a503          	lw	a0,0(a5)
     e0c:	0047a583          	lw	a1,4(a5)
     e10:	00072603          	lw	a2,0(a4)
     e14:	00472683          	lw	a3,4(a4)
     e18:	00e12a23          	sw	a4,20(sp)
     e1c:	000d80e7          	jalr	s11
     e20:	04812783          	lw	a5,72(sp)
     e24:	02412703          	lw	a4,36(sp)
     e28:	40e787b3          	sub	a5,a5,a4
     e2c:	04f12223          	sw	a5,68(sp)
     e30:	40051c63          	bnez	a0,1248 <WikiSort+0x65c>
     e34:	00349793          	slli	a5,s1,0x3
     e38:	00fc87b3          	add	a5,s9,a5
     e3c:	ff87a603          	lw	a2,-8(a5)
     e40:	ffc7a683          	lw	a3,-4(a5)
     e44:	0007a503          	lw	a0,0(a5)
     e48:	0047a583          	lw	a1,4(a5)
     e4c:	000d80e7          	jalr	s11
     e50:	40050e63          	beqz	a0,126c <WikiSort+0x680>
     e54:	41348733          	sub	a4,s1,s3
     e58:	20000793          	li	a5,512
     e5c:	02e7dae3          	bge	a5,a4,1690 <WikiSort+0xaa4>
     e60:	04412783          	lw	a5,68(sp)
     e64:	05812023          	sw	s8,64(sp)
     e68:	5af05e63          	blez	a5,1424 <WikiSort+0x838>
     e6c:	00070513          	mv	a0,a4
     e70:	00090593          	mv	a1,s2
     e74:	510010ef          	jal	2384 <__modsi3>
     e78:	01350b33          	add	s6,a0,s3
     e7c:	001b0693          	addi	a3,s6,1
     e80:	0096d4e3          	bge	a3,s1,1688 <WikiSort+0xa9c>
     e84:	02412783          	lw	a5,36(sp)
     e88:	04c12303          	lw	t1,76(sp)
     e8c:	003b1613          	slli	a2,s6,0x3
     e90:	00379793          	slli	a5,a5,0x3
     e94:	00fc87b3          	add	a5,s9,a5
     e98:	00cc8733          	add	a4,s9,a2
     e9c:	00872883          	lw	a7,8(a4)
     ea0:	0007a803          	lw	a6,0(a5)
     ea4:	0047a583          	lw	a1,4(a5)
     ea8:	0117a023          	sw	a7,0(a5)
     eac:	00c72883          	lw	a7,12(a4)
     eb0:	012686b3          	add	a3,a3,s2
     eb4:	00878793          	addi	a5,a5,8
     eb8:	ff17ae23          	sw	a7,-4(a5)
     ebc:	01072423          	sw	a6,8(a4)
     ec0:	00b72623          	sw	a1,12(a4)
     ec4:	00670733          	add	a4,a4,t1
     ec8:	fc96cae3          	blt	a3,s1,e9c <WikiSort+0x2b0>
     ecc:	04012783          	lw	a5,64(sp)
     ed0:	40978ab3          	sub	s5,a5,s1
     ed4:	01595463          	bge	s2,s5,edc <WikiSort+0x2f0>
     ed8:	00090a93          	mv	s5,s2
     edc:	00cc86b3          	add	a3,s9,a2
     ee0:	009a87b3          	add	a5,s5,s1
     ee4:	0006a703          	lw	a4,0(a3)
     ee8:	00f12823          	sw	a5,16(sp)
     eec:	0046a783          	lw	a5,4(a3)
     ef0:	f8ed2823          	sw	a4,-112(s10)
     ef4:	f8fd2a23          	sw	a5,-108(s10)
     ef8:	20000793          	li	a5,512
     efc:	4ea7c263          	blt	a5,a0,13e0 <WikiSort+0x7f4>
     f00:	01412583          	lw	a1,20(sp)
     f04:	00351613          	slli	a2,a0,0x3
     f08:	000d0513          	mv	a0,s10
     f0c:	9c4ff0ef          	jal	d0 <memcpy>
     f10:	03012783          	lw	a5,48(sp)
     f14:	00379613          	slli	a2,a5,0x3
     f18:	00cc87b3          	add	a5,s9,a2
     f1c:	00000b93          	li	s7,0
     f20:	05812e23          	sw	s8,92(sp)
     f24:	04f12823          	sw	a5,80(sp)
     f28:	00912a23          	sw	s1,20(sp)
     f2c:	00012c23          	sw	zero,24(sp)
     f30:	000b8713          	mv	a4,s7
     f34:	000b0413          	mv	s0,s6
     f38:	000b0c13          	mv	s8,s6
     f3c:	21775e63          	bge	a4,s7,1158 <WikiSort+0x56c>
     f40:	02812783          	lw	a5,40(sp)
     f44:	f90d2603          	lw	a2,-112(s10)
     f48:	f94d2683          	lw	a3,-108(s10)
     f4c:	00fb87b3          	add	a5,s7,a5
     f50:	00379793          	slli	a5,a5,0x3
     f54:	00fc87b3          	add	a5,s9,a5
     f58:	0007a503          	lw	a0,0(a5)
     f5c:	0047a583          	lw	a1,4(a5)
     f60:	00e12e23          	sw	a4,28(sp)
     f64:	000d80e7          	jalr	s11
     f68:	01c12703          	lw	a4,28(sp)
     f6c:	1e051663          	bnez	a0,1158 <WikiSort+0x56c>
     f70:	00070613          	mv	a2,a4
     f74:	f8ed2423          	sw	a4,-120(s10)
     f78:	000b8693          	mv	a3,s7
     f7c:	000d8713          	mv	a4,s11
     f80:	00040593          	mv	a1,s0
     f84:	000c8513          	mv	a0,s9
     f88:	f97d2623          	sw	s7,-116(s10)
     f8c:	c8cff0ef          	jal	418 <BinaryFirst>
     f90:	00050813          	mv	a6,a0
     f94:	40ab8ab3          	sub	s5,s7,a0
     f98:	43205a63          	blez	s2,13cc <WikiSort+0x7e0>
     f9c:	01690a33          	add	s4,s2,s6
     fa0:	00341713          	slli	a4,s0,0x3
     fa4:	003a1513          	slli	a0,s4,0x3
     fa8:	003b1413          	slli	s0,s6,0x3
     fac:	00ec8733          	add	a4,s9,a4
     fb0:	00ac8533          	add	a0,s9,a0
     fb4:	008c87b3          	add	a5,s9,s0
     fb8:	00072583          	lw	a1,0(a4)
     fbc:	0007a603          	lw	a2,0(a5)
     fc0:	0047a683          	lw	a3,4(a5)
     fc4:	00b7a023          	sw	a1,0(a5)
     fc8:	00472583          	lw	a1,4(a4)
     fcc:	00878793          	addi	a5,a5,8
     fd0:	00870713          	addi	a4,a4,8
     fd4:	feb7ae23          	sw	a1,-4(a5)
     fd8:	fec72c23          	sw	a2,-8(a4)
     fdc:	fed72e23          	sw	a3,-4(a4)
     fe0:	fcf51ce3          	bne	a0,a5,fb8 <WikiSort+0x3cc>
     fe4:	02412703          	lw	a4,36(sp)
     fe8:	01812783          	lw	a5,24(sp)
     fec:	f93d2023          	sw	s3,-128(s10)
     ff0:	000d8893          	mv	a7,s11
     ff4:	00e787b3          	add	a5,a5,a4
     ff8:	00379793          	slli	a5,a5,0x3
     ffc:	00fc87b3          	add	a5,s9,a5
    1000:	0007a683          	lw	a3,0(a5)
    1004:	003b1713          	slli	a4,s6,0x3
    1008:	00ec8733          	add	a4,s9,a4
    100c:	00872603          	lw	a2,8(a4)
    1010:	00d72423          	sw	a3,8(a4)
    1014:	0047a583          	lw	a1,4(a5)
    1018:	00c72683          	lw	a3,12(a4)
    101c:	000c8513          	mv	a0,s9
    1020:	00b72623          	sw	a1,12(a4)
    1024:	00c7a023          	sw	a2,0(a5)
    1028:	03012583          	lw	a1,48(sp)
    102c:	03c12603          	lw	a2,60(sp)
    1030:	00d7a223          	sw	a3,4(a5)
    1034:	00098693          	mv	a3,s3
    1038:	20000993          	li	s3,512
    103c:	01312223          	sw	s3,4(sp)
    1040:	01a12023          	sw	s10,0(sp)
    1044:	fd0d2e23          	sw	a6,-36(s10)
    1048:	000c0793          	mv	a5,s8
    104c:	000c0713          	mv	a4,s8
    1050:	fd8d2c23          	sw	s8,-40(s10)
    1054:	f6bd2c23          	sw	a1,-136(s10)
    1058:	f6cd2e23          	sw	a2,-132(s10)
    105c:	f98d2223          	sw	s8,-124(s10)
    1060:	01012e23          	sw	a6,28(sp)
    1064:	8d5ff0ef          	jal	938 <WikiMerge>
    1068:	01c12803          	lw	a6,28(sp)
    106c:	1929ce63          	blt	s3,s2,1208 <WikiSort+0x61c>
    1070:	04c12603          	lw	a2,76(sp)
    1074:	008c85b3          	add	a1,s9,s0
    1078:	000d0513          	mv	a0,s10
    107c:	01012e23          	sw	a6,28(sp)
    1080:	850ff0ef          	jal	d0 <memcpy>
    1084:	01c12803          	lw	a6,28(sp)
    1088:	05505663          	blez	s5,10d4 <WikiSort+0x4e8>
    108c:	415a0733          	sub	a4,s4,s5
    1090:	00381793          	slli	a5,a6,0x3
    1094:	003b9e13          	slli	t3,s7,0x3
    1098:	00371713          	slli	a4,a4,0x3
    109c:	00fc87b3          	add	a5,s9,a5
    10a0:	01cc8e33          	add	t3,s9,t3
    10a4:	00ec8733          	add	a4,s9,a4
    10a8:	00072583          	lw	a1,0(a4)
    10ac:	0007a603          	lw	a2,0(a5)
    10b0:	0047a683          	lw	a3,4(a5)
    10b4:	00b7a023          	sw	a1,0(a5)
    10b8:	00472583          	lw	a1,4(a4)
    10bc:	00878793          	addi	a5,a5,8
    10c0:	00870713          	addi	a4,a4,8
    10c4:	feb7ae23          	sw	a1,-4(a5)
    10c8:	fec72c23          	sw	a2,-8(a4)
    10cc:	fed72e23          	sw	a3,-4(a4)
    10d0:	fdc79ce3          	bne	a5,t3,10a8 <WikiSort+0x4bc>
    10d4:	415b09b3          	sub	s3,s6,s5
    10d8:	01298c33          	add	s8,s3,s2
    10dc:	1e9a0463          	beq	s4,s1,12c4 <WikiSort+0x6d8>
    10e0:	01812783          	lw	a5,24(sp)
    10e4:	001a0413          	addi	s0,s4,1
    10e8:	00890b33          	add	s6,s2,s0
    10ec:	00178793          	addi	a5,a5,1
    10f0:	00f12c23          	sw	a5,24(sp)
    10f4:	015c0bb3          	add	s7,s8,s5
    10f8:	2e9b5063          	bge	s6,s1,13d8 <WikiSort+0x7ec>
    10fc:	00341713          	slli	a4,s0,0x3
    1100:	003b1793          	slli	a5,s6,0x3
    1104:	00ec8733          	add	a4,s9,a4
    1108:	00fc87b3          	add	a5,s9,a5
    110c:	00072603          	lw	a2,0(a4)
    1110:	00472683          	lw	a3,4(a4)
    1114:	0007a503          	lw	a0,0(a5)
    1118:	0047a583          	lw	a1,4(a5)
    111c:	000d80e7          	jalr	s11
    1120:	00050463          	beqz	a0,1128 <WikiSort+0x53c>
    1124:	000b0413          	mv	s0,s6
    1128:	012b0b33          	add	s6,s6,s2
    112c:	fc9b48e3          	blt	s6,s1,10fc <WikiSort+0x510>
    1130:	fff40413          	addi	s0,s0,-1
    1134:	00341793          	slli	a5,s0,0x3
    1138:	00fc87b3          	add	a5,s9,a5
    113c:	0007a703          	lw	a4,0(a5)
    1140:	0047a783          	lw	a5,4(a5)
    1144:	000a0b13          	mv	s6,s4
    1148:	f8ed2823          	sw	a4,-112(s10)
    114c:	f8fd2a23          	sw	a5,-108(s10)
    1150:	000c0713          	mv	a4,s8
    1154:	df7746e3          	blt	a4,s7,f40 <WikiSort+0x354>
    1158:	01012783          	lw	a5,16(sp)
    115c:	01412683          	lw	a3,20(sp)
    1160:	e0d788e3          	beq	a5,a3,f70 <WikiSort+0x384>
    1164:	01012783          	lw	a5,16(sp)
    1168:	01412703          	lw	a4,20(sp)
    116c:	40e78a33          	sub	s4,a5,a4
    1170:	112a4663          	blt	s4,s2,127c <WikiSort+0x690>
    1174:	01690a33          	add	s4,s2,s6
    1178:	05205663          	blez	s2,11c4 <WikiSort+0x5d8>
    117c:	01412703          	lw	a4,20(sp)
    1180:	003a1513          	slli	a0,s4,0x3
    1184:	003b1793          	slli	a5,s6,0x3
    1188:	00371713          	slli	a4,a4,0x3
    118c:	00ac8533          	add	a0,s9,a0
    1190:	00fc87b3          	add	a5,s9,a5
    1194:	00ec8733          	add	a4,s9,a4
    1198:	00072583          	lw	a1,0(a4)
    119c:	0007a603          	lw	a2,0(a5)
    11a0:	0047a683          	lw	a3,4(a5)
    11a4:	00b7a023          	sw	a1,0(a5)
    11a8:	00472583          	lw	a1,4(a4)
    11ac:	00878793          	addi	a5,a5,8
    11b0:	00870713          	addi	a4,a4,8
    11b4:	feb7ae23          	sw	a1,-4(a5)
    11b8:	fec72c23          	sw	a2,-8(a4)
    11bc:	fed72e23          	sw	a3,-4(a4)
    11c0:	fcf51ce3          	bne	a0,a5,1198 <WikiSort+0x5ac>
    11c4:	000a0b93          	mv	s7,s4
    11c8:	01641463          	bne	s0,s6,11d0 <WikiSort+0x5e4>
    11cc:	00048413          	mv	s0,s1
    11d0:	01012783          	lw	a5,16(sp)
    11d4:	04012703          	lw	a4,64(sp)
    11d8:	012484b3          	add	s1,s1,s2
    11dc:	00f907b3          	add	a5,s2,a5
    11e0:	00f12823          	sw	a5,16(sp)
    11e4:	01412783          	lw	a5,20(sp)
    11e8:	012787b3          	add	a5,a5,s2
    11ec:	00f12a23          	sw	a5,20(sp)
    11f0:	01012783          	lw	a5,16(sp)
    11f4:	00f75463          	bge	a4,a5,11fc <WikiSort+0x610>
    11f8:	00e12823          	sw	a4,16(sp)
    11fc:	000b0713          	mv	a4,s6
    1200:	000a0b13          	mv	s6,s4
    1204:	d39ff06f          	j	f3c <WikiSort+0x350>
    1208:	05012783          	lw	a5,80(sp)
    120c:	003a1593          	slli	a1,s4,0x3
    1210:	008c8f33          	add	t5,s9,s0
    1214:	00bc85b3          	add	a1,s9,a1
    1218:	0007a603          	lw	a2,0(a5)
    121c:	000f2683          	lw	a3,0(t5)
    1220:	004f2703          	lw	a4,4(t5)
    1224:	00cf2023          	sw	a2,0(t5)
    1228:	0047a603          	lw	a2,4(a5)
    122c:	008f0f13          	addi	t5,t5,8
    1230:	00878793          	addi	a5,a5,8
    1234:	fecf2e23          	sw	a2,-4(t5)
    1238:	fed7ac23          	sw	a3,-8(a5)
    123c:	fee7ae23          	sw	a4,-4(a5)
    1240:	fde59ce3          	bne	a1,t5,1218 <WikiSort+0x62c>
    1244:	e45ff06f          	j	1088 <WikiSort+0x49c>
    1248:	413485b3          	sub	a1,s1,s3
    124c:	00098613          	mv	a2,s3
    1250:	20000793          	li	a5,512
    1254:	000d0713          	mv	a4,s10
    1258:	000c0693          	mv	a3,s8
    125c:	000c8513          	mv	a0,s9
    1260:	fb3d2823          	sw	s3,-80(s10)
    1264:	fb8d2a23          	sw	s8,-76(s10)
    1268:	d3cff0ef          	jal	7a4 <Rotate>
    126c:	05412783          	lw	a5,84(sp)
    1270:	0afc5463          	bge	s8,a5,1318 <WikiSort+0x72c>
    1274:	000c0993          	mv	s3,s8
    1278:	b1dff06f          	j	d94 <WikiSort+0x1a8>
    127c:	01012683          	lw	a3,16(sp)
    1280:	01412583          	lw	a1,20(sp)
    1284:	00000793          	li	a5,0
    1288:	000d0713          	mv	a4,s10
    128c:	000b0613          	mv	a2,s6
    1290:	40d585b3          	sub	a1,a1,a3
    1294:	000c8513          	mv	a0,s9
    1298:	ff6d2023          	sw	s6,-32(s10)
    129c:	fedd2223          	sw	a3,-28(s10)
    12a0:	d04ff0ef          	jal	7a4 <Rotate>
    12a4:	01412783          	lw	a5,20(sp)
    12a8:	014b0bb3          	add	s7,s6,s4
    12ac:	000b0713          	mv	a4,s6
    12b0:	014484b3          	add	s1,s1,s4
    12b4:	01440433          	add	s0,s0,s4
    12b8:	00f12823          	sw	a5,16(sp)
    12bc:	000b8b13          	mv	s6,s7
    12c0:	c7dff06f          	j	f3c <WikiSort+0x350>
    12c4:	20000793          	li	a5,512
    12c8:	f78d2583          	lw	a1,-136(s10)
    12cc:	f7cd2603          	lw	a2,-132(s10)
    12d0:	00f12223          	sw	a5,4(sp)
    12d4:	04012783          	lw	a5,64(sp)
    12d8:	000c0a13          	mv	s4,s8
    12dc:	01a12023          	sw	s10,0(sp)
    12e0:	00078813          	mv	a6,a5
    12e4:	fefd2623          	sw	a5,-20(s10)
    12e8:	00098693          	mv	a3,s3
    12ec:	000a0793          	mv	a5,s4
    12f0:	f93d2023          	sw	s3,-128(s10)
    12f4:	000d8893          	mv	a7,s11
    12f8:	000a0713          	mv	a4,s4
    12fc:	ff4d2423          	sw	s4,-24(s10)
    1300:	f94d2223          	sw	s4,-124(s10)
    1304:	000c8513          	mv	a0,s9
    1308:	05c12c03          	lw	s8,92(sp)
    130c:	e2cff0ef          	jal	938 <WikiMerge>
    1310:	05412783          	lw	a5,84(sp)
    1314:	f6fc40e3          	blt	s8,a5,1274 <WikiSort+0x688>
    1318:	000c8793          	mv	a5,s9
    131c:	000d0c93          	mv	s9,s10
    1320:	00078d13          	mv	s10,a5
    1324:	04412783          	lw	a5,68(sp)
    1328:	06012883          	lw	a7,96(sp)
    132c:	06c12283          	lw	t0,108(sp)
    1330:	07012483          	lw	s1,112(sp)
    1334:	06412803          	lw	a6,100(sp)
    1338:	07412a03          	lw	s4,116(sp)
    133c:	60f04263          	bgtz	a5,1940 <WikiSort+0xd54>
    1340:	03412783          	lw	a5,52(sp)
    1344:	00179793          	slli	a5,a5,0x1
    1348:	02f12a23          	sw	a5,52(sp)
    134c:	03812783          	lw	a5,56(sp)
    1350:	03412703          	lw	a4,52(sp)
    1354:	00179793          	slli	a5,a5,0x1
    1358:	02f12c23          	sw	a5,56(sp)
    135c:	02c12783          	lw	a5,44(sp)
    1360:	02f74063          	blt	a4,a5,1380 <WikiSort+0x794>
    1364:	03412783          	lw	a5,52(sp)
    1368:	02c12703          	lw	a4,44(sp)
    136c:	40e787b3          	sub	a5,a5,a4
    1370:	02f12a23          	sw	a5,52(sp)
    1374:	03812783          	lw	a5,56(sp)
    1378:	00178793          	addi	a5,a5,1
    137c:	02f12c23          	sw	a5,56(sp)
    1380:	00149493          	slli	s1,s1,0x1
    1384:	9944cee3          	blt	s1,s4,d20 <WikiSort+0x134>
    1388:	000012b7          	lui	t0,0x1
    138c:	00510133          	add	sp,sp,t0
    1390:	14c12083          	lw	ra,332(sp)
    1394:	14812403          	lw	s0,328(sp)
    1398:	14412483          	lw	s1,324(sp)
    139c:	14012903          	lw	s2,320(sp)
    13a0:	13c12983          	lw	s3,316(sp)
    13a4:	13812a03          	lw	s4,312(sp)
    13a8:	13412a83          	lw	s5,308(sp)
    13ac:	13012b03          	lw	s6,304(sp)
    13b0:	12c12b83          	lw	s7,300(sp)
    13b4:	12812c03          	lw	s8,296(sp)
    13b8:	12412c83          	lw	s9,292(sp)
    13bc:	12012d03          	lw	s10,288(sp)
    13c0:	11c12d83          	lw	s11,284(sp)
    13c4:	15010113          	addi	sp,sp,336
    13c8:	00008067          	ret
    13cc:	003b1413          	slli	s0,s6,0x3
    13d0:	01690a33          	add	s4,s2,s6
    13d4:	c11ff06f          	j	fe4 <WikiSort+0x3f8>
    13d8:	000a0413          	mv	s0,s4
    13dc:	d59ff06f          	j	1134 <WikiSort+0x548>
    13e0:	03012703          	lw	a4,48(sp)
    13e4:	00399793          	slli	a5,s3,0x3
    13e8:	00fc87b3          	add	a5,s9,a5
    13ec:	00371613          	slli	a2,a4,0x3
    13f0:	00cc8733          	add	a4,s9,a2
    13f4:	00072803          	lw	a6,0(a4)
    13f8:	0007a503          	lw	a0,0(a5)
    13fc:	0047a583          	lw	a1,4(a5)
    1400:	0107a023          	sw	a6,0(a5)
    1404:	00472803          	lw	a6,4(a4)
    1408:	00878793          	addi	a5,a5,8
    140c:	00870713          	addi	a4,a4,8
    1410:	ff07ae23          	sw	a6,-4(a5)
    1414:	fea72c23          	sw	a0,-8(a4)
    1418:	feb72e23          	sw	a1,-4(a4)
    141c:	fcf69ce3          	bne	a3,a5,13f4 <WikiSort+0x808>
    1420:	af9ff06f          	j	f18 <WikiSort+0x32c>
    1424:	00198b13          	addi	s6,s3,1
    1428:	089b52e3          	bge	s6,s1,1cac <__clz_tab+0x8>
    142c:	01412a83          	lw	s5,20(sp)
    1430:	06812b83          	lw	s7,104(sp)
    1434:	00090793          	mv	a5,s2
    1438:	00100a13          	li	s4,1
    143c:	000b0913          	mv	s2,s6
    1440:	00e12c23          	sw	a4,24(sp)
    1444:	00078b13          	mv	s6,a5
    1448:	000a8413          	mv	s0,s5
    144c:	00042503          	lw	a0,0(s0)
    1450:	00442583          	lw	a1,4(s0)
    1454:	008aa603          	lw	a2,8(s5)
    1458:	00caa683          	lw	a3,12(s5)
    145c:	008a8a93          	addi	s5,s5,8
    1460:	000d80e7          	jalr	s11
    1464:	00051e63          	bnez	a0,1480 <WikiSort+0x894>
    1468:	00042603          	lw	a2,0(s0)
    146c:	00442683          	lw	a3,4(s0)
    1470:	000aa503          	lw	a0,0(s5)
    1474:	004aa583          	lw	a1,4(s5)
    1478:	000d80e7          	jalr	s11
    147c:	00050863          	beqz	a0,148c <WikiSort+0x8a0>
    1480:	001a0413          	addi	s0,s4,1
    1484:	274b8463          	beq	s7,s4,16ec <WikiSort+0xb00>
    1488:	00040a13          	mv	s4,s0
    148c:	00190913          	addi	s2,s2,1
    1490:	fa991ce3          	bne	s2,s1,1448 <WikiSort+0x85c>
    1494:	000b0793          	mv	a5,s6
    1498:	00090b13          	mv	s6,s2
    149c:	00078913          	mv	s2,a5
    14a0:	05812783          	lw	a5,88(sp)
    14a4:	20000693          	li	a3,512
    14a8:	01812703          	lw	a4,24(sp)
    14ac:	0cf6cae3          	blt	a3,a5,1d80 <__clz_tab+0xdc>
    14b0:	05812783          	lw	a5,88(sp)
    14b4:	60fa1463          	bne	s4,a5,1abc <WikiSort+0xed0>
    14b8:	05812783          	lw	a5,88(sp)
    14bc:	05812583          	lw	a1,88(sp)
    14c0:	07812e23          	sw	s8,124(sp)
    14c4:	013787b3          	add	a5,a5,s3
    14c8:	00379413          	slli	s0,a5,0x3
    14cc:	04f12423          	sw	a5,72(sp)
    14d0:	008c87b3          	add	a5,s9,s0
    14d4:	00f12a23          	sw	a5,20(sp)
    14d8:	04812783          	lw	a5,72(sp)
    14dc:	03312823          	sw	s3,48(sp)
    14e0:	03312e23          	sw	s3,60(sp)
    14e4:	06f12023          	sw	a5,96(sp)
    14e8:	40f48733          	sub	a4,s1,a5
    14ec:	000c0793          	mv	a5,s8
    14f0:	003b1a93          	slli	s5,s6,0x3
    14f4:	00912c23          	sw	s1,24(sp)
    14f8:	01212e23          	sw	s2,28(sp)
    14fc:	015c8ab3          	add	s5,s9,s5
    1500:	00e12823          	sw	a4,16(sp)
    1504:	00000493          	li	s1,0
    1508:	00078b93          	mv	s7,a5
    150c:	000b0913          	mv	s2,s6
    1510:	00058a13          	mv	s4,a1
    1514:	ff8a8413          	addi	s0,s5,-8
    1518:	03390a63          	beq	s2,s3,154c <WikiSort+0x960>
    151c:	000aa603          	lw	a2,0(s5)
    1520:	004aa683          	lw	a3,4(s5)
    1524:	ff8aa503          	lw	a0,-8(s5)
    1528:	00442583          	lw	a1,4(s0)
    152c:	000d80e7          	jalr	s11
    1530:	00051e63          	bnez	a0,154c <WikiSort+0x960>
    1534:	ff8aa603          	lw	a2,-8(s5)
    1538:	00442683          	lw	a3,4(s0)
    153c:	000aa503          	lw	a0,0(s5)
    1540:	004aa583          	lw	a1,4(s5)
    1544:	000d80e7          	jalr	s11
    1548:	02050863          	beqz	a0,1578 <WikiSort+0x98c>
    154c:	001b0693          	addi	a3,s6,1
    1550:	00190613          	addi	a2,s2,1
    1554:	409005b3          	neg	a1,s1
    1558:	20000793          	li	a5,512
    155c:	000d0713          	mv	a4,s10
    1560:	000c8513          	mv	a0,s9
    1564:	fcdd2623          	sw	a3,-52(s10)
    1568:	fccd2423          	sw	a2,-56(s10)
    156c:	00990b33          	add	s6,s2,s1
    1570:	a34ff0ef          	jal	7a4 <Rotate>
    1574:	00148493          	addi	s1,s1,1
    1578:	fff90913          	addi	s2,s2,-1
    157c:	00040a93          	mv	s5,s0
    1580:	f944cae3          	blt	s1,s4,1514 <WikiSort+0x928>
    1584:	05812683          	lw	a3,88(sp)
    1588:	01012703          	lw	a4,16(sp)
    158c:	01812483          	lw	s1,24(sp)
    1590:	01c12903          	lw	s2,28(sp)
    1594:	000b8793          	mv	a5,s7
    1598:	04d12223          	sw	a3,68(sp)
    159c:	03312223          	sw	s3,36(sp)
    15a0:	07c12683          	lw	a3,124(sp)
    15a4:	40f68433          	sub	s0,a3,a5
    15a8:	fffc0693          	addi	a3,s8,-1
    15ac:	0a805663          	blez	s0,1658 <WikiSort+0xa6c>
    15b0:	00379a93          	slli	s5,a5,0x3
    15b4:	00912823          	sw	s1,16(sp)
    15b8:	01312c23          	sw	s3,24(sp)
    15bc:	01212e23          	sw	s2,28(sp)
    15c0:	015c89b3          	add	s3,s9,s5
    15c4:	00000493          	li	s1,0
    15c8:	00070b93          	mv	s7,a4
    15cc:	00078a93          	mv	s5,a5
    15d0:	00078913          	mv	s2,a5
    15d4:	00068b13          	mv	s6,a3
    15d8:	00898a13          	addi	s4,s3,8
    15dc:	03690a63          	beq	s2,s6,1610 <WikiSort+0xa24>
    15e0:	0089a603          	lw	a2,8(s3)
    15e4:	004a2683          	lw	a3,4(s4)
    15e8:	0009a503          	lw	a0,0(s3)
    15ec:	0049a583          	lw	a1,4(s3)
    15f0:	000d80e7          	jalr	s11
    15f4:	00051e63          	bnez	a0,1610 <WikiSort+0xa24>
    15f8:	0009a603          	lw	a2,0(s3)
    15fc:	0049a683          	lw	a3,4(s3)
    1600:	0089a503          	lw	a0,8(s3)
    1604:	004a2583          	lw	a1,4(s4)
    1608:	000d80e7          	jalr	s11
    160c:	02050863          	beqz	a0,163c <WikiSort+0xa50>
    1610:	000a8613          	mv	a2,s5
    1614:	00048593          	mv	a1,s1
    1618:	20000793          	li	a5,512
    161c:	000d0713          	mv	a4,s10
    1620:	00090693          	mv	a3,s2
    1624:	000c8513          	mv	a0,s9
    1628:	fd5d2823          	sw	s5,-48(s10)
    162c:	fd2d2a23          	sw	s2,-44(s10)
    1630:	40990ab3          	sub	s5,s2,s1
    1634:	970ff0ef          	jal	7a4 <Rotate>
    1638:	00148493          	addi	s1,s1,1
    163c:	00190913          	addi	s2,s2,1
    1640:	000a0993          	mv	s3,s4
    1644:	f884cae3          	blt	s1,s0,15d8 <WikiSort+0x9ec>
    1648:	01012483          	lw	s1,16(sp)
    164c:	01812983          	lw	s3,24(sp)
    1650:	01c12903          	lw	s2,28(sp)
    1654:	000b8713          	mv	a4,s7
    1658:	07312c23          	sw	s3,120(sp)
    165c:	06012983          	lw	s3,96(sp)
    1660:	408c07b3          	sub	a5,s8,s0
    1664:	00070513          	mv	a0,a4
    1668:	00090593          	mv	a1,s2
    166c:	06f12223          	sw	a5,100(sp)
    1670:	04f12023          	sw	a5,64(sp)
    1674:	07812623          	sw	s8,108(sp)
    1678:	50d000ef          	jal	2384 <__modsi3>
    167c:	01350b33          	add	s6,a0,s3
    1680:	001b0693          	addi	a3,s6,1
    1684:	8096c0e3          	blt	a3,s1,e84 <WikiSort+0x298>
    1688:	003b1613          	slli	a2,s6,0x3
    168c:	841ff06f          	j	ecc <WikiSort+0x2e0>
    1690:	01412583          	lw	a1,20(sp)
    1694:	00371613          	slli	a2,a4,0x3
    1698:	000d0513          	mv	a0,s10
    169c:	a35fe0ef          	jal	d0 <memcpy>
    16a0:	20000793          	li	a5,512
    16a4:	00f12223          	sw	a5,4(sp)
    16a8:	01a12023          	sw	s10,0(sp)
    16ac:	00098693          	mv	a3,s3
    16b0:	f93d2c23          	sw	s3,-104(s10)
    16b4:	000d8893          	mv	a7,s11
    16b8:	00048793          	mv	a5,s1
    16bc:	00048713          	mv	a4,s1
    16c0:	000c0813          	mv	a6,s8
    16c4:	000c8513          	mv	a0,s9
    16c8:	00000593          	li	a1,0
    16cc:	fa0d2c23          	sw	zero,-72(s10)
    16d0:	fa0d2e23          	sw	zero,-68(s10)
    16d4:	f89d2e23          	sw	s1,-100(s10)
    16d8:	fa9d2023          	sw	s1,-96(s10)
    16dc:	00000613          	li	a2,0
    16e0:	fb8d2223          	sw	s8,-92(s10)
    16e4:	a54ff0ef          	jal	938 <WikiMerge>
    16e8:	b85ff06f          	j	126c <WikiSort+0x680>
    16ec:	000b0793          	mv	a5,s6
    16f0:	00090b13          	mv	s6,s2
    16f4:	00078913          	mv	s2,a5
    16f8:	05812783          	lw	a5,88(sp)
    16fc:	20000693          	li	a3,512
    1700:	01812703          	lw	a4,24(sp)
    1704:	daf6dae3          	bge	a3,a5,14b8 <WikiSort+0x8cc>
    1708:	001b0a13          	addi	s4,s6,1
    170c:	089a5663          	bge	s4,s1,1798 <WikiSort+0xbac>
    1710:	04812023          	sw	s0,64(sp)
    1714:	06812403          	lw	s0,104(sp)
    1718:	003b1a93          	slli	s5,s6,0x3
    171c:	01312e23          	sw	s3,28(sp)
    1720:	00000b93          	li	s7,0
    1724:	015c89b3          	add	s3,s9,s5
    1728:	00e12c23          	sw	a4,24(sp)
    172c:	00090a93          	mv	s5,s2
    1730:	000a0913          	mv	s2,s4
    1734:	00098a13          	mv	s4,s3
    1738:	000a2503          	lw	a0,0(s4)
    173c:	004a2583          	lw	a1,4(s4)
    1740:	0089a603          	lw	a2,8(s3)
    1744:	00c9a683          	lw	a3,12(s3)
    1748:	00898993          	addi	s3,s3,8
    174c:	000d80e7          	jalr	s11
    1750:	00051e63          	bnez	a0,176c <WikiSort+0xb80>
    1754:	000a2603          	lw	a2,0(s4)
    1758:	004a2683          	lw	a3,4(s4)
    175c:	0009a503          	lw	a0,0(s3)
    1760:	0049a583          	lw	a1,4(s3)
    1764:	000d80e7          	jalr	s11
    1768:	00050663          	beqz	a0,1774 <WikiSort+0xb88>
    176c:	43740c63          	beq	s0,s7,1ba4 <WikiSort+0xfb8>
    1770:	001b8b93          	addi	s7,s7,1
    1774:	00190913          	addi	s2,s2,1
    1778:	fa991ee3          	bne	s2,s1,1734 <WikiSort+0xb48>
    177c:	05812783          	lw	a5,88(sp)
    1780:	00090a13          	mv	s4,s2
    1784:	01812703          	lw	a4,24(sp)
    1788:	01c12983          	lw	s3,28(sp)
    178c:	04012403          	lw	s0,64(sp)
    1790:	000a8913          	mv	s2,s5
    1794:	42fb8863          	beq	s7,a5,1bc4 <WikiSort+0xfd8>
    1798:	05812783          	lw	a5,88(sp)
    179c:	ffec0a93          	addi	s5,s8,-2
    17a0:	46878463          	beq	a5,s0,1c08 <WikiSort+0x101c>
    17a4:	069ac663          	blt	s5,s1,1810 <WikiSort+0xc24>
    17a8:	01012783          	lw	a5,16(sp)
    17ac:	06812403          	lw	s0,104(sp)
    17b0:	00070b93          	mv	s7,a4
    17b4:	00fc8a33          	add	s4,s9,a5
    17b8:	ff8a0b13          	addi	s6,s4,-8
    17bc:	01212823          	sw	s2,16(sp)
    17c0:	00100a13          	li	s4,1
    17c4:	00cb2683          	lw	a3,12(s6)
    17c8:	008b2603          	lw	a2,8(s6)
    17cc:	000b2503          	lw	a0,0(s6)
    17d0:	004b2583          	lw	a1,4(s6)
    17d4:	000d80e7          	jalr	s11
    17d8:	00051e63          	bnez	a0,17f4 <WikiSort+0xc08>
    17dc:	00cb2583          	lw	a1,12(s6)
    17e0:	000b2603          	lw	a2,0(s6)
    17e4:	004b2683          	lw	a3,4(s6)
    17e8:	008b2503          	lw	a0,8(s6)
    17ec:	000d80e7          	jalr	s11
    17f0:	00050663          	beqz	a0,17fc <WikiSort+0xc10>
    17f4:	01440a63          	beq	s0,s4,1808 <WikiSort+0xc1c>
    17f8:	001a0a13          	addi	s4,s4,1
    17fc:	fffa8a93          	addi	s5,s5,-1
    1800:	ff8b0b13          	addi	s6,s6,-8
    1804:	fc9ad0e3          	bge	s5,s1,17c4 <WikiSort+0xbd8>
    1808:	01012903          	lw	s2,16(sp)
    180c:	000b8713          	mv	a4,s7
    1810:	fffa8793          	addi	a5,s5,-1
    1814:	1097c863          	blt	a5,s1,1924 <WikiSort+0xd38>
    1818:	003a9a13          	slli	s4,s5,0x3
    181c:	06812a83          	lw	s5,104(sp)
    1820:	01212823          	sw	s2,16(sp)
    1824:	014c8a33          	add	s4,s9,s4
    1828:	00000b13          	li	s6,0
    182c:	00070b93          	mv	s7,a4
    1830:	00078913          	mv	s2,a5
    1834:	000a0413          	mv	s0,s4
    1838:	00042603          	lw	a2,0(s0)
    183c:	00442683          	lw	a3,4(s0)
    1840:	ff8a2503          	lw	a0,-8(s4)
    1844:	ffca2583          	lw	a1,-4(s4)
    1848:	ff8a0a13          	addi	s4,s4,-8
    184c:	000d80e7          	jalr	s11
    1850:	00051e63          	bnez	a0,186c <WikiSort+0xc80>
    1854:	000a2603          	lw	a2,0(s4)
    1858:	004a2683          	lw	a3,4(s4)
    185c:	00042503          	lw	a0,0(s0)
    1860:	00442583          	lw	a1,4(s0)
    1864:	000d80e7          	jalr	s11
    1868:	00050663          	beqz	a0,1874 <WikiSort+0xc88>
    186c:	476a8463          	beq	s5,s6,1cd4 <__clz_tab+0x30>
    1870:	001b0b13          	addi	s6,s6,1
    1874:	fff90913          	addi	s2,s2,-1
    1878:	fa995ee3          	bge	s2,s1,1834 <WikiSort+0xc48>
    187c:	00090793          	mv	a5,s2
    1880:	01012903          	lw	s2,16(sp)
    1884:	000b8713          	mv	a4,s7
    1888:	05812683          	lw	a3,88(sp)
    188c:	08db1c63          	bne	s6,a3,1924 <WikiSort+0xd38>
    1890:	40dc06b3          	sub	a3,s8,a3
    1894:	02d12223          	sw	a3,36(sp)
    1898:	416686b3          	sub	a3,a3,s6
    189c:	02d12823          	sw	a3,48(sp)
    18a0:	02412683          	lw	a3,36(sp)
    18a4:	001b1413          	slli	s0,s6,0x1
    18a8:	05612223          	sw	s6,68(sp)
    18ac:	02d12e23          	sw	a3,60(sp)
    18b0:	07312023          	sw	s3,96(sp)
    18b4:	05812423          	sw	s8,72(sp)
    18b8:	fffc0693          	addi	a3,s8,-1
    18bc:	cf5ff06f          	j	15b0 <WikiSort+0x9c4>
    18c0:	fa9d2023          	sw	s1,-96(s10)
    18c4:	fb8d2223          	sw	s8,-92(s10)
    18c8:	b51fe0ef          	jal	418 <BinaryFirst>
    18cc:	00050413          	mv	s0,a0
    18d0:	00098613          	mv	a2,s3
    18d4:	00050693          	mv	a3,a0
    18d8:	40a485b3          	sub	a1,s1,a0
    18dc:	000d0713          	mv	a4,s10
    18e0:	000c8513          	mv	a0,s9
    18e4:	20000793          	li	a5,512
    18e8:	fd3d2023          	sw	s3,-64(s10)
    18ec:	fc8d2223          	sw	s0,-60(s10)
    18f0:	40940a33          	sub	s4,s0,s1
    18f4:	eb1fe0ef          	jal	7a4 <Rotate>
    18f8:	013a05b3          	add	a1,s4,s3
    18fc:	00098613          	mv	a2,s3
    1900:	00048693          	mv	a3,s1
    1904:	000d8713          	mv	a4,s11
    1908:	000c8513          	mv	a0,s9
    190c:	f93d2c23          	sw	s3,-104(s10)
    1910:	f89d2e23          	sw	s1,-100(s10)
    1914:	bf9fe0ef          	jal	50c <BinaryLast>
    1918:	00050993          	mv	s3,a0
    191c:	948558e3          	bge	a0,s0,126c <WikiSort+0x680>
    1920:	00040493          	mv	s1,s0
    1924:	000d8713          	mv	a4,s11
    1928:	00048613          	mv	a2,s1
    192c:	000c0693          	mv	a3,s8
    1930:	00098593          	mv	a1,s3
    1934:	000c8513          	mv	a0,s9
    1938:	f984c4e3          	blt	s1,s8,18c0 <WikiSort+0xcd4>
    193c:	931ff06f          	j	126c <WikiSort+0x680>
    1940:	03012783          	lw	a5,48(sp)
    1944:	000d8693          	mv	a3,s11
    1948:	000d0513          	mv	a0,s10
    194c:	00078593          	mv	a1,a5
    1950:	f6fca823          	sw	a5,-144(s9)
    1954:	03c12783          	lw	a5,60(sp)
    1958:	01012c23          	sw	a6,24(sp)
    195c:	00512a23          	sw	t0,20(sp)
    1960:	00078613          	mv	a2,a5
    1964:	01112823          	sw	a7,16(sp)
    1968:	f6fcaa23          	sw	a5,-140(s9)
    196c:	c95fe0ef          	jal	600 <InsertionSort>
    1970:	01012883          	lw	a7,16(sp)
    1974:	07812783          	lw	a5,120(sp)
    1978:	01412283          	lw	t0,20(sp)
    197c:	01812803          	lw	a6,24(sp)
    1980:	00078913          	mv	s2,a5
    1984:	00088413          	mv	s0,a7
    1988:	00088b13          	mv	s6,a7
    198c:	00028a93          	mv	s5,t0
    1990:	00080993          	mv	s3,a6
    1994:	0517d063          	bge	a5,a7,19d4 <WikiSort+0xde8>
    1998:	00391713          	slli	a4,s2,0x3
    199c:	003b1793          	slli	a5,s6,0x3
    19a0:	00ed0733          	add	a4,s10,a4
    19a4:	00fd07b3          	add	a5,s10,a5
    19a8:	0d698c63          	beq	s3,s6,1a80 <WikiSort+0xe94>
    19ac:	00072603          	lw	a2,0(a4)
    19b0:	00472683          	lw	a3,4(a4)
    19b4:	0007a503          	lw	a0,0(a5)
    19b8:	0047a583          	lw	a1,4(a5)
    19bc:	000d80e7          	jalr	s11
    19c0:	0c050063          	beqz	a0,1a80 <WikiSort+0xe94>
    19c4:	001b0b13          	addi	s6,s6,1
    19c8:	fc8948e3          	blt	s2,s0,1998 <WikiSort+0xdac>
    19cc:	000a8293          	mv	t0,s5
    19d0:	00098813          	mv	a6,s3
    19d4:	00080413          	mv	s0,a6
    19d8:	965854e3          	bge	a6,t0,1340 <WikiSort+0x754>
    19dc:	02812903          	lw	s2,40(sp)
    19e0:	00028b13          	mv	s6,t0
    19e4:	00080a93          	mv	s5,a6
    19e8:	07812983          	lw	s3,120(sp)
    19ec:	012a8733          	add	a4,s5,s2
    19f0:	012b07b3          	add	a5,s6,s2
    19f4:	00371713          	slli	a4,a4,0x3
    19f8:	00379793          	slli	a5,a5,0x3
    19fc:	00ed0733          	add	a4,s10,a4
    1a00:	00fd07b3          	add	a5,s10,a5
    1a04:	05598063          	beq	s3,s5,1a44 <WikiSort+0xe58>
    1a08:	00072603          	lw	a2,0(a4)
    1a0c:	00472683          	lw	a3,4(a4)
    1a10:	0007a503          	lw	a0,0(a5)
    1a14:	0047a583          	lw	a1,4(a5)
    1a18:	000d80e7          	jalr	s11
    1a1c:	02050463          	beqz	a0,1a44 <WikiSort+0xe58>
    1a20:	fffa8a93          	addi	s5,s5,-1
    1a24:	91645ee3          	bge	s0,s6,1340 <WikiSort+0x754>
    1a28:	012a8733          	add	a4,s5,s2
    1a2c:	012b07b3          	add	a5,s6,s2
    1a30:	00371713          	slli	a4,a4,0x3
    1a34:	00379793          	slli	a5,a5,0x3
    1a38:	00ed0733          	add	a4,s10,a4
    1a3c:	00fd07b3          	add	a5,s10,a5
    1a40:	fd5994e3          	bne	s3,s5,1a08 <WikiSort+0xe1c>
    1a44:	41540433          	sub	s0,s0,s5
    1a48:	00040593          	mv	a1,s0
    1a4c:	00140413          	addi	s0,s0,1
    1a50:	000b0693          	mv	a3,s6
    1a54:	ff6cae23          	sw	s6,-4(s9)
    1a58:	20000793          	li	a5,512
    1a5c:	000c8713          	mv	a4,s9
    1a60:	000a8613          	mv	a2,s5
    1a64:	000d0513          	mv	a0,s10
    1a68:	408b0b33          	sub	s6,s6,s0
    1a6c:	000a8413          	mv	s0,s5
    1a70:	ff5cac23          	sw	s5,-8(s9)
    1a74:	d31fe0ef          	jal	7a4 <Rotate>
    1a78:	fb6448e3          	blt	s0,s6,1a28 <WikiSort+0xe3c>
    1a7c:	8c5ff06f          	j	1340 <WikiSort+0x754>
    1a80:	416405b3          	sub	a1,s0,s6
    1a84:	408b0433          	sub	s0,s6,s0
    1a88:	00140413          	addi	s0,s0,1
    1a8c:	00090613          	mv	a2,s2
    1a90:	ff2ca823          	sw	s2,-16(s9)
    1a94:	20000793          	li	a5,512
    1a98:	000c8713          	mv	a4,s9
    1a9c:	000b0693          	mv	a3,s6
    1aa0:	000d0513          	mv	a0,s10
    1aa4:	00890933          	add	s2,s2,s0
    1aa8:	000b0413          	mv	s0,s6
    1aac:	ff6caa23          	sw	s6,-12(s9)
    1ab0:	cf5fe0ef          	jal	7a4 <Rotate>
    1ab4:	ee8942e3          	blt	s2,s0,1998 <WikiSort+0xdac>
    1ab8:	f15ff06f          	j	19cc <WikiSort+0xde0>
    1abc:	ffec0793          	addi	a5,s8,-2
    1ac0:	2897c663          	blt	a5,s1,1d4c <__clz_tab+0xa8>
    1ac4:	01012683          	lw	a3,16(sp)
    1ac8:	06812b03          	lw	s6,104(sp)
    1acc:	00100a93          	li	s5,1
    1ad0:	00dc8a33          	add	s4,s9,a3
    1ad4:	ff8a0a13          	addi	s4,s4,-8
    1ad8:	00070b93          	mv	s7,a4
    1adc:	00078413          	mv	s0,a5
    1ae0:	01212823          	sw	s2,16(sp)
    1ae4:	00ca2683          	lw	a3,12(s4)
    1ae8:	008a2603          	lw	a2,8(s4)
    1aec:	000a2503          	lw	a0,0(s4)
    1af0:	004a2583          	lw	a1,4(s4)
    1af4:	000d80e7          	jalr	s11
    1af8:	00051e63          	bnez	a0,1b14 <WikiSort+0xf28>
    1afc:	00ca2583          	lw	a1,12(s4)
    1b00:	000a2603          	lw	a2,0(s4)
    1b04:	004a2683          	lw	a3,4(s4)
    1b08:	008a2503          	lw	a0,8(s4)
    1b0c:	000d80e7          	jalr	s11
    1b10:	00050663          	beqz	a0,1b1c <WikiSort+0xf30>
    1b14:	055b0863          	beq	s6,s5,1b64 <WikiSort+0xf78>
    1b18:	001a8a93          	addi	s5,s5,1
    1b1c:	fff40413          	addi	s0,s0,-1
    1b20:	ff8a0a13          	addi	s4,s4,-8
    1b24:	fc9450e3          	bge	s0,s1,1ae4 <WikiSort+0xef8>
    1b28:	05812683          	lw	a3,88(sp)
    1b2c:	01012903          	lw	s2,16(sp)
    1b30:	000b8713          	mv	a4,s7
    1b34:	00040793          	mv	a5,s0
    1b38:	04da8263          	beq	s5,a3,1b7c <WikiSort+0xf90>
    1b3c:	05812683          	lw	a3,88(sp)
    1b40:	dedac2e3          	blt	s5,a3,1924 <WikiSort+0xd38>
    1b44:	00fa86b3          	add	a3,s5,a5
    1b48:	04d12423          	sw	a3,72(sp)
    1b4c:	05512223          	sw	s5,68(sp)
    1b50:	07312023          	sw	s3,96(sp)
    1b54:	02f12223          	sw	a5,36(sp)
    1b58:	03312823          	sw	s3,48(sp)
    1b5c:	03312e23          	sw	s3,60(sp)
    1b60:	a41ff06f          	j	15a0 <WikiSort+0x9b4>
    1b64:	05812683          	lw	a3,88(sp)
    1b68:	001a8a93          	addi	s5,s5,1
    1b6c:	01012903          	lw	s2,16(sp)
    1b70:	000b8713          	mv	a4,s7
    1b74:	00040793          	mv	a5,s0
    1b78:	fcda92e3          	bne	s5,a3,1b3c <WikiSort+0xf50>
    1b7c:	40dc06b3          	sub	a3,s8,a3
    1b80:	02d12223          	sw	a3,36(sp)
    1b84:	05512223          	sw	s5,68(sp)
    1b88:	07312023          	sw	s3,96(sp)
    1b8c:	03312823          	sw	s3,48(sp)
    1b90:	03312e23          	sw	s3,60(sp)
    1b94:	000a8413          	mv	s0,s5
    1b98:	05812423          	sw	s8,72(sp)
    1b9c:	fffc0693          	addi	a3,s8,-1
    1ba0:	a11ff06f          	j	15b0 <WikiSort+0x9c4>
    1ba4:	05812783          	lw	a5,88(sp)
    1ba8:	001b8b93          	addi	s7,s7,1
    1bac:	00090a13          	mv	s4,s2
    1bb0:	01812703          	lw	a4,24(sp)
    1bb4:	01c12983          	lw	s3,28(sp)
    1bb8:	04012403          	lw	s0,64(sp)
    1bbc:	000a8913          	mv	s2,s5
    1bc0:	bcfb9ce3          	bne	s7,a5,1798 <WikiSort+0xbac>
    1bc4:	00179593          	slli	a1,a5,0x1
    1bc8:	013587b3          	add	a5,a1,s3
    1bcc:	00379413          	slli	s0,a5,0x3
    1bd0:	02f12e23          	sw	a5,60(sp)
    1bd4:	013b87b3          	add	a5,s7,s3
    1bd8:	02f12823          	sw	a5,48(sp)
    1bdc:	008c87b3          	add	a5,s9,s0
    1be0:	00f12a23          	sw	a5,20(sp)
    1be4:	013587b3          	add	a5,a1,s3
    1be8:	06f12023          	sw	a5,96(sp)
    1bec:	40f48733          	sub	a4,s1,a5
    1bf0:	03012783          	lw	a5,48(sp)
    1bf4:	000a0b13          	mv	s6,s4
    1bf8:	07812e23          	sw	s8,124(sp)
    1bfc:	04f12423          	sw	a5,72(sp)
    1c00:	000c0793          	mv	a5,s8
    1c04:	8edff06f          	j	14f0 <WikiSort+0x904>
    1c08:	01012783          	lw	a5,16(sp)
    1c0c:	00100a13          	li	s4,1
    1c10:	00fc8433          	add	s0,s9,a5
    1c14:	ff840413          	addi	s0,s0,-8
    1c18:	d09ac6e3          	blt	s5,s1,1924 <WikiSort+0xd38>
    1c1c:	00c42683          	lw	a3,12(s0)
    1c20:	00842603          	lw	a2,8(s0)
    1c24:	00042503          	lw	a0,0(s0)
    1c28:	00442583          	lw	a1,4(s0)
    1c2c:	000d80e7          	jalr	s11
    1c30:	00051e63          	bnez	a0,1c4c <WikiSort+0x1060>
    1c34:	00c42583          	lw	a1,12(s0)
    1c38:	00042603          	lw	a2,0(s0)
    1c3c:	00442683          	lw	a3,4(s0)
    1c40:	00842503          	lw	a0,8(s0)
    1c44:	000d80e7          	jalr	s11
    1c48:	00050863          	beqz	a0,1c58 <WikiSort+0x106c>
    1c4c:	06812783          	lw	a5,104(sp)
    1c50:	0f478663          	beq	a5,s4,1d3c <__clz_tab+0x98>
    1c54:	001a0a13          	addi	s4,s4,1
    1c58:	fffa8a93          	addi	s5,s5,-1
    1c5c:	ff840413          	addi	s0,s0,-8
    1c60:	fa9adee3          	bge	s5,s1,1c1c <WikiSort+0x1030>
    1c64:	05812783          	lw	a5,88(sp)
    1c68:	cafa1ee3          	bne	s4,a5,1924 <WikiSort+0xd38>
    1c6c:	013787b3          	add	a5,a5,s3
    1c70:	00379413          	slli	s0,a5,0x3
    1c74:	04f12423          	sw	a5,72(sp)
    1c78:	008c87b3          	add	a5,s9,s0
    1c7c:	00f12a23          	sw	a5,20(sp)
    1c80:	04812783          	lw	a5,72(sp)
    1c84:	414c06b3          	sub	a3,s8,s4
    1c88:	02d12823          	sw	a3,48(sp)
    1c8c:	06f12023          	sw	a5,96(sp)
    1c90:	40f48733          	sub	a4,s1,a5
    1c94:	015a07b3          	add	a5,s4,s5
    1c98:	06f12e23          	sw	a5,124(sp)
    1c9c:	000a0593          	mv	a1,s4
    1ca0:	000a8793          	mv	a5,s5
    1ca4:	03812e23          	sw	s8,60(sp)
    1ca8:	849ff06f          	j	14f0 <WikiSort+0x904>
    1cac:	05812783          	lw	a5,88(sp)
    1cb0:	20000693          	li	a3,512
    1cb4:	ffec0a93          	addi	s5,s8,-2
    1cb8:	aef6c6e3          	blt	a3,a5,17a4 <WikiSort+0xbb8>
    1cbc:	05812783          	lw	a5,88(sp)
    1cc0:	00100a93          	li	s5,1
    1cc4:	ff578a63          	beq	a5,s5,14b8 <WikiSort+0x8cc>
    1cc8:	ffec0793          	addi	a5,s8,-2
    1ccc:	de97dce3          	bge	a5,s1,1ac4 <WikiSort+0xed8>
    1cd0:	e6dff06f          	j	1b3c <WikiSort+0xf50>
    1cd4:	00090793          	mv	a5,s2
    1cd8:	000b8713          	mv	a4,s7
    1cdc:	01012903          	lw	s2,16(sp)
    1ce0:	001b0b13          	addi	s6,s6,1
    1ce4:	ba5ff06f          	j	1888 <WikiSort+0xc9c>
    1ce8:	10012823          	sw	zero,272(sp)
    1cec:	10f12a23          	sw	a5,276(sp)
    1cf0:	000012b7          	lui	t0,0x1
    1cf4:	00510133          	add	sp,sp,t0
    1cf8:	14c12083          	lw	ra,332(sp)
    1cfc:	14812403          	lw	s0,328(sp)
    1d00:	14412483          	lw	s1,324(sp)
    1d04:	14012903          	lw	s2,320(sp)
    1d08:	13c12983          	lw	s3,316(sp)
    1d0c:	13812a03          	lw	s4,312(sp)
    1d10:	13412a83          	lw	s5,308(sp)
    1d14:	13012b03          	lw	s6,304(sp)
    1d18:	12c12b83          	lw	s7,300(sp)
    1d1c:	12812c03          	lw	s8,296(sp)
    1d20:	12412c83          	lw	s9,292(sp)
    1d24:	12012d03          	lw	s10,288(sp)
    1d28:	11c12d83          	lw	s11,284(sp)
    1d2c:	00058613          	mv	a2,a1
    1d30:	15010113          	addi	sp,sp,336
    1d34:	00000593          	li	a1,0
    1d38:	8c9fe06f          	j	600 <InsertionSort>
    1d3c:	05812783          	lw	a5,88(sp)
    1d40:	001a0a13          	addi	s4,s4,1
    1d44:	befa10e3          	bne	s4,a5,1924 <WikiSort+0xd38>
    1d48:	f25ff06f          	j	1c6c <WikiSort+0x1080>
    1d4c:	05812683          	lw	a3,88(sp)
    1d50:	00100a93          	li	s5,1
    1d54:	df5694e3          	bne	a3,s5,1b3c <WikiSort+0xf50>
    1d58:	05812603          	lw	a2,88(sp)
    1d5c:	fffc0693          	addi	a3,s8,-1
    1d60:	02d12223          	sw	a3,36(sp)
    1d64:	04c12223          	sw	a2,68(sp)
    1d68:	07312023          	sw	s3,96(sp)
    1d6c:	03312823          	sw	s3,48(sp)
    1d70:	03312e23          	sw	s3,60(sp)
    1d74:	00060413          	mv	s0,a2
    1d78:	05812423          	sw	s8,72(sp)
    1d7c:	835ff06f          	j	15b0 <WikiSort+0x9c4>
    1d80:	000a0413          	mv	s0,s4
    1d84:	a15ff06f          	j	1798 <WikiSort+0xbac>

00001d88 <benchmark_body.isra.0>:
    1d88:	000017b7          	lui	a5,0x1
    1d8c:	00078793          	mv	a5,a5
    1d90:	0007ae83          	lw	t4,0(a5) # 1000 <WikiSort+0x414>
    1d94:	0047ae03          	lw	t3,4(a5)
    1d98:	0087a303          	lw	t1,8(a5)
    1d9c:	00c7a883          	lw	a7,12(a5)
    1da0:	0107a803          	lw	a6,16(a5)
    1da4:	0147a603          	lw	a2,20(a5)
    1da8:	0187a683          	lw	a3,24(a5)
    1dac:	01c7a703          	lw	a4,28(a5)
    1db0:	0207a783          	lw	a5,32(a5)
    1db4:	fa010113          	addi	sp,sp,-96
    1db8:	04112e23          	sw	ra,92(sp)
    1dbc:	01d12623          	sw	t4,12(sp)
    1dc0:	01c12823          	sw	t3,16(sp)
    1dc4:	00612a23          	sw	t1,20(sp)
    1dc8:	01112c23          	sw	a7,24(sp)
    1dcc:	01012e23          	sw	a6,28(sp)
    1dd0:	02c12023          	sw	a2,32(sp)
    1dd4:	02d12223          	sw	a3,36(sp)
    1dd8:	02e12423          	sw	a4,40(sp)
    1ddc:	02f12623          	sw	a5,44(sp)
    1de0:	0e058063          	beqz	a1,1ec0 <array1+0x118>
    1de4:	05512223          	sw	s5,68(sp)
    1de8:	05612023          	sw	s6,64(sp)
    1dec:	00002ab7          	lui	s5,0x2
    1df0:	05212823          	sw	s2,80(sp)
    1df4:	03712e23          	sw	s7,60(sp)
    1df8:	03812c23          	sw	s8,56(sp)
    1dfc:	03912a23          	sw	s9,52(sp)
    1e00:	04812c23          	sw	s0,88(sp)
    1e04:	04912a23          	sw	s1,84(sp)
    1e08:	05312623          	sw	s3,76(sp)
    1e0c:	05412423          	sw	s4,72(sp)
    1e10:	03a12823          	sw	s10,48(sp)
    1e14:	00050c93          	mv	s9,a0
    1e18:	00058b93          	mv	s7,a1
    1e1c:	2a800b13          	li	s6,680
    1e20:	da8a8a93          	addi	s5,s5,-600 # 1da8 <array1>
    1e24:	00000c13          	li	s8,0
    1e28:	19000913          	li	s2,400
    1e2c:	00000d13          	li	s10,0
    1e30:	00000513          	li	a0,0
    1e34:	c68fe0ef          	jal	29c <srand_beebs>
    1e38:	00c10a13          	addi	s4,sp,12
    1e3c:	000a2983          	lw	s3,0(s4)
    1e40:	000a8493          	mv	s1,s5
    1e44:	00000413          	li	s0,0
    1e48:	00040513          	mv	a0,s0
    1e4c:	19000593          	li	a1,400
    1e50:	000980e7          	jalr	s3
    1e54:	00a4a023          	sw	a0,0(s1)
    1e58:	0084a223          	sw	s0,4(s1)
    1e5c:	00140413          	addi	s0,s0,1
    1e60:	00848493          	addi	s1,s1,8
    1e64:	ff2412e3          	bne	s0,s2,1e48 <array1+0xa0>
    1e68:	000b0613          	mv	a2,s6
    1e6c:	00090593          	mv	a1,s2
    1e70:	000a8513          	mv	a0,s5
    1e74:	d79fe0ef          	jal	bec <WikiSort>
    1e78:	004a0a13          	addi	s4,s4,4
    1e7c:	03010793          	addi	a5,sp,48
    1e80:	fafa1ee3          	bne	s4,a5,1e3c <array1+0x94>
    1e84:	001d0d13          	addi	s10,s10,1
    1e88:	fb7d14e3          	bne	s10,s7,1e30 <array1+0x88>
    1e8c:	001c0c13          	addi	s8,s8,1
    1e90:	f98c9ee3          	bne	s9,s8,1e2c <array1+0x84>
    1e94:	05812403          	lw	s0,88(sp)
    1e98:	05412483          	lw	s1,84(sp)
    1e9c:	05012903          	lw	s2,80(sp)
    1ea0:	04c12983          	lw	s3,76(sp)
    1ea4:	04812a03          	lw	s4,72(sp)
    1ea8:	04412a83          	lw	s5,68(sp)
    1eac:	04012b03          	lw	s6,64(sp)
    1eb0:	03c12b83          	lw	s7,60(sp)
    1eb4:	03812c03          	lw	s8,56(sp)
    1eb8:	03412c83          	lw	s9,52(sp)
    1ebc:	03012d03          	lw	s10,48(sp)
    1ec0:	05c12083          	lw	ra,92(sp)
    1ec4:	06010113          	addi	sp,sp,96
    1ec8:	00008067          	ret

00001ecc <verify_benchmark>:
    1ecc:	000017b7          	lui	a5,0x1
    1ed0:	81010113          	addi	sp,sp,-2032
    1ed4:	02478793          	addi	a5,a5,36 # 1024 <WikiSort+0x438>
    1ed8:	7e112623          	sw	ra,2028(sp)
    1edc:	7ff78693          	addi	a3,a5,2047
    1ee0:	b6010113          	addi	sp,sp,-1184
    1ee4:	48168693          	addi	a3,a3,1153
    1ee8:	00010713          	mv	a4,sp
    1eec:	0007a803          	lw	a6,0(a5)
    1ef0:	0047a503          	lw	a0,4(a5)
    1ef4:	0087a583          	lw	a1,8(a5)
    1ef8:	00c7a603          	lw	a2,12(a5)
    1efc:	01072023          	sw	a6,0(a4)
    1f00:	00a72223          	sw	a0,4(a4)
    1f04:	00b72423          	sw	a1,8(a4)
    1f08:	00c72623          	sw	a2,12(a4)
    1f0c:	01078793          	addi	a5,a5,16
    1f10:	01070713          	addi	a4,a4,16
    1f14:	fcd79ce3          	bne	a5,a3,1eec <verify_benchmark+0x20>
    1f18:	00002537          	lui	a0,0x2
    1f1c:	00001637          	lui	a2,0x1
    1f20:	00010593          	mv	a1,sp
    1f24:	c8060613          	addi	a2,a2,-896 # c80 <WikiSort+0x94>
    1f28:	da850513          	addi	a0,a0,-600 # 1da8 <array1>
    1f2c:	a1cfe0ef          	jal	148 <memcmp>
    1f30:	4a010113          	addi	sp,sp,1184
    1f34:	7ec12083          	lw	ra,2028(sp)
    1f38:	00153513          	seqz	a0,a0
    1f3c:	7f010113          	addi	sp,sp,2032
    1f40:	00008067          	ret

00001f44 <initialise_benchmark>:
    1f44:	00008067          	ret

00001f48 <warm_caches>:
    1f48:	00050593          	mv	a1,a0
    1f4c:	00100513          	li	a0,1
    1f50:	e39ff06f          	j	1d88 <benchmark_body.isra.0>

00001f54 <benchmark>:
    1f54:	ff010113          	addi	sp,sp,-16
    1f58:	00200513          	li	a0,2
    1f5c:	00100593          	li	a1,1
    1f60:	00112623          	sw	ra,12(sp)
    1f64:	e25ff0ef          	jal	1d88 <benchmark_body.isra.0>
    1f68:	00c12083          	lw	ra,12(sp)
    1f6c:	00000513          	li	a0,0
    1f70:	01010113          	addi	sp,sp,16
    1f74:	00008067          	ret

00001f78 <__ledf2>:
    1f78:	0145d813          	srli	a6,a1,0x14
    1f7c:	001007b7          	lui	a5,0x100
    1f80:	0146d713          	srli	a4,a3,0x14
    1f84:	fff78793          	addi	a5,a5,-1 # fffff <__stack_top+0xf80ff>
    1f88:	7ff00893          	li	a7,2047
    1f8c:	7ff87813          	andi	a6,a6,2047
    1f90:	00b7f333          	and	t1,a5,a1
    1f94:	01177733          	and	a4,a4,a7
    1f98:	00d7f7b3          	and	a5,a5,a3
    1f9c:	01f5d593          	srli	a1,a1,0x1f
    1fa0:	01f6d693          	srli	a3,a3,0x1f
    1fa4:	05180e63          	beq	a6,a7,2000 <__ledf2+0x88>
    1fa8:	03170663          	beq	a4,a7,1fd4 <__ledf2+0x5c>
    1fac:	08081663          	bnez	a6,2038 <__ledf2+0xc0>
    1fb0:	00a36833          	or	a6,t1,a0
    1fb4:	0a071663          	bnez	a4,2060 <__ledf2+0xe8>
    1fb8:	00c7e8b3          	or	a7,a5,a2
    1fbc:	0a088e63          	beqz	a7,2078 <__ledf2+0x100>
    1fc0:	0c081463          	bnez	a6,2088 <__ledf2+0x110>
    1fc4:	00169713          	slli	a4,a3,0x1
    1fc8:	fff70713          	addi	a4,a4,-1
    1fcc:	00070513          	mv	a0,a4
    1fd0:	00008067          	ret
    1fd4:	00c7e7b3          	or	a5,a5,a2
    1fd8:	00200713          	li	a4,2
    1fdc:	fe0798e3          	bnez	a5,1fcc <__ledf2+0x54>
    1fe0:	00081663          	bnez	a6,1fec <__ledf2+0x74>
    1fe4:	00a36333          	or	t1,t1,a0
    1fe8:	fc030ee3          	beqz	t1,1fc4 <__ledf2+0x4c>
    1fec:	04d58063          	beq	a1,a3,202c <__ledf2+0xb4>
    1ff0:	40b005b3          	neg	a1,a1
    1ff4:	0015e713          	ori	a4,a1,1
    1ff8:	00070513          	mv	a0,a4
    1ffc:	00008067          	ret
    2000:	00a368b3          	or	a7,t1,a0
    2004:	06089463          	bnez	a7,206c <__ledf2+0xf4>
    2008:	ff0714e3          	bne	a4,a6,1ff0 <__ledf2+0x78>
    200c:	00c7e833          	or	a6,a5,a2
    2010:	00200713          	li	a4,2
    2014:	fa081ce3          	bnez	a6,1fcc <__ledf2+0x54>
    2018:	00100713          	li	a4,1
    201c:	fcd59ae3          	bne	a1,a3,1ff0 <__ledf2+0x78>
    2020:	00f36663          	bltu	t1,a5,202c <__ledf2+0xb4>
    2024:	04c57e63          	bgeu	a0,a2,2080 <__ledf2+0x108>
    2028:	04070c63          	beqz	a4,2080 <__ledf2+0x108>
    202c:	00159713          	slli	a4,a1,0x1
    2030:	fff70713          	addi	a4,a4,-1
    2034:	f99ff06f          	j	1fcc <__ledf2+0x54>
    2038:	fa070ce3          	beqz	a4,1ff0 <__ledf2+0x78>
    203c:	fad59ae3          	bne	a1,a3,1ff0 <__ledf2+0x78>
    2040:	fb0748e3          	blt	a4,a6,1ff0 <__ledf2+0x78>
    2044:	fee844e3          	blt	a6,a4,202c <__ledf2+0xb4>
    2048:	fa67e4e3          	bltu	a5,t1,1ff0 <__ledf2+0x78>
    204c:	40f30733          	sub	a4,t1,a5
    2050:	00173713          	seqz	a4,a4
    2054:	fca676e3          	bgeu	a2,a0,2020 <__ledf2+0xa8>
    2058:	f8071ce3          	bnez	a4,1ff0 <__ledf2+0x78>
    205c:	fc5ff06f          	j	2020 <__ledf2+0xa8>
    2060:	f60802e3          	beqz	a6,1fc4 <__ledf2+0x4c>
    2064:	f8d596e3          	bne	a1,a3,1ff0 <__ledf2+0x78>
    2068:	fc5ff06f          	j	202c <__ledf2+0xb4>
    206c:	00200713          	li	a4,2
    2070:	00070513          	mv	a0,a4
    2074:	00008067          	ret
    2078:	f4080ae3          	beqz	a6,1fcc <__ledf2+0x54>
    207c:	f75ff06f          	j	1ff0 <__ledf2+0x78>
    2080:	00000713          	li	a4,0
    2084:	f49ff06f          	j	1fcc <__ledf2+0x54>
    2088:	f6d594e3          	bne	a1,a3,1ff0 <__ledf2+0x78>
    208c:	fbdff06f          	j	2048 <__ledf2+0xd0>

00002090 <__fixdfsi>:
    2090:	0145d793          	srli	a5,a1,0x14
    2094:	001006b7          	lui	a3,0x100
    2098:	fff68713          	addi	a4,a3,-1 # fffff <__stack_top+0xf80ff>
    209c:	7ff7f793          	andi	a5,a5,2047
    20a0:	3fe00613          	li	a2,1022
    20a4:	00b77733          	and	a4,a4,a1
    20a8:	01f5d593          	srli	a1,a1,0x1f
    20ac:	00f65e63          	bge	a2,a5,20c8 <__fixdfsi+0x38>
    20b0:	41d00613          	li	a2,1053
    20b4:	00f65e63          	bge	a2,a5,20d0 <__fixdfsi+0x40>
    20b8:	80000537          	lui	a0,0x80000
    20bc:	fff50513          	addi	a0,a0,-1 # 7fffffff <__stack_top+0x7fff80ff>
    20c0:	00a58533          	add	a0,a1,a0
    20c4:	00008067          	ret
    20c8:	00000513          	li	a0,0
    20cc:	00008067          	ret
    20d0:	41300613          	li	a2,1043
    20d4:	00d76733          	or	a4,a4,a3
    20d8:	00f64e63          	blt	a2,a5,20f4 <__fixdfsi+0x64>
    20dc:	40f60633          	sub	a2,a2,a5
    20e0:	00c75733          	srl	a4,a4,a2
    20e4:	40e00533          	neg	a0,a4
    20e8:	fe0592e3          	bnez	a1,20cc <__fixdfsi+0x3c>
    20ec:	00070513          	mv	a0,a4
    20f0:	00008067          	ret
    20f4:	43300693          	li	a3,1075
    20f8:	40f686b3          	sub	a3,a3,a5
    20fc:	bed78793          	addi	a5,a5,-1043
    2100:	00d55533          	srl	a0,a0,a3
    2104:	00f71733          	sll	a4,a4,a5
    2108:	00a76733          	or	a4,a4,a0
    210c:	fd9ff06f          	j	20e4 <__fixdfsi+0x54>

00002110 <__fixunsdfsi>:
    2110:	0145d793          	srli	a5,a1,0x14
    2114:	7ff7f793          	andi	a5,a5,2047
    2118:	00100637          	lui	a2,0x100
    211c:	fff60713          	addi	a4,a2,-1 # fffff <__stack_top+0xf80ff>
    2120:	3ff7a693          	slti	a3,a5,1023
    2124:	00b77733          	and	a4,a4,a1
    2128:	01f5d593          	srli	a1,a1,0x1f
    212c:	00069463          	bnez	a3,2134 <__fixunsdfsi+0x24>
    2130:	00058863          	beqz	a1,2140 <__fixunsdfsi+0x30>
    2134:	00000693          	li	a3,0
    2138:	00068513          	mv	a0,a3
    213c:	00008067          	ret
    2140:	41e00593          	li	a1,1054
    2144:	fff00693          	li	a3,-1
    2148:	fef5c8e3          	blt	a1,a5,2138 <__fixunsdfsi+0x28>
    214c:	41300693          	li	a3,1043
    2150:	00c76733          	or	a4,a4,a2
    2154:	02f6d063          	bge	a3,a5,2174 <__fixunsdfsi+0x64>
    2158:	43300693          	li	a3,1075
    215c:	40f686b3          	sub	a3,a3,a5
    2160:	bed78793          	addi	a5,a5,-1043
    2164:	00d55533          	srl	a0,a0,a3
    2168:	00f71733          	sll	a4,a4,a5
    216c:	00a766b3          	or	a3,a4,a0
    2170:	fc9ff06f          	j	2138 <__fixunsdfsi+0x28>
    2174:	40f686b3          	sub	a3,a3,a5
    2178:	00d756b3          	srl	a3,a4,a3
    217c:	fbdff06f          	j	2138 <__fixunsdfsi+0x28>

00002180 <__floatsidf>:
    2180:	06050e63          	beqz	a0,21fc <__floatsidf+0x7c>
    2184:	41f55793          	srai	a5,a0,0x1f
    2188:	00a7c6b3          	xor	a3,a5,a0
    218c:	40f686b3          	sub	a3,a3,a5
    2190:	fe010113          	addi	sp,sp,-32
    2194:	01f55713          	srli	a4,a0,0x1f
    2198:	00068513          	mv	a0,a3
    219c:	00d12623          	sw	a3,12(sp)
    21a0:	00e12423          	sw	a4,8(sp)
    21a4:	00112e23          	sw	ra,28(sp)
    21a8:	20c000ef          	jal	23b4 <__clzsi2>
    21ac:	41e00793          	li	a5,1054
    21b0:	40a787b3          	sub	a5,a5,a0
    21b4:	00a00613          	li	a2,10
    21b8:	00812703          	lw	a4,8(sp)
    21bc:	00c12683          	lw	a3,12(sp)
    21c0:	7ff7f793          	andi	a5,a5,2047
    21c4:	06a65063          	bge	a2,a0,2224 <__floatsidf+0xa4>
    21c8:	ff550513          	addi	a0,a0,-11
    21cc:	00a69633          	sll	a2,a3,a0
    21d0:	01c12083          	lw	ra,28(sp)
    21d4:	00c61613          	slli	a2,a2,0xc
    21d8:	00c65613          	srli	a2,a2,0xc
    21dc:	01479793          	slli	a5,a5,0x14
    21e0:	00000693          	li	a3,0
    21e4:	00c7e7b3          	or	a5,a5,a2
    21e8:	01f71713          	slli	a4,a4,0x1f
    21ec:	00068513          	mv	a0,a3
    21f0:	00e7e5b3          	or	a1,a5,a4
    21f4:	02010113          	addi	sp,sp,32
    21f8:	00008067          	ret
    21fc:	00000793          	li	a5,0
    2200:	00000613          	li	a2,0
    2204:	00000713          	li	a4,0
    2208:	01479793          	slli	a5,a5,0x14
    220c:	00000693          	li	a3,0
    2210:	00c7e7b3          	or	a5,a5,a2
    2214:	01f71713          	slli	a4,a4,0x1f
    2218:	00068513          	mv	a0,a3
    221c:	00e7e5b3          	or	a1,a5,a4
    2220:	00008067          	ret
    2224:	00b00613          	li	a2,11
    2228:	40a60633          	sub	a2,a2,a0
    222c:	00c6d633          	srl	a2,a3,a2
    2230:	01c12083          	lw	ra,28(sp)
    2234:	00c61613          	slli	a2,a2,0xc
    2238:	01550513          	addi	a0,a0,21
    223c:	00c65613          	srli	a2,a2,0xc
    2240:	01479793          	slli	a5,a5,0x14
    2244:	00a696b3          	sll	a3,a3,a0
    2248:	00c7e7b3          	or	a5,a5,a2
    224c:	01f71713          	slli	a4,a4,0x1f
    2250:	00068513          	mv	a0,a3
    2254:	00e7e5b3          	or	a1,a5,a4
    2258:	02010113          	addi	sp,sp,32
    225c:	00008067          	ret

00002260 <__floatunsidf>:
    2260:	04050c63          	beqz	a0,22b8 <__floatunsidf+0x58>
    2264:	fe010113          	addi	sp,sp,-32
    2268:	00112e23          	sw	ra,28(sp)
    226c:	00a12623          	sw	a0,12(sp)
    2270:	144000ef          	jal	23b4 <__clzsi2>
    2274:	41e00713          	li	a4,1054
    2278:	40a70733          	sub	a4,a4,a0
    227c:	00a00693          	li	a3,10
    2280:	00c12783          	lw	a5,12(sp)
    2284:	7ff77713          	andi	a4,a4,2047
    2288:	04a6d263          	bge	a3,a0,22cc <__floatunsidf+0x6c>
    228c:	ff550513          	addi	a0,a0,-11
    2290:	00a796b3          	sll	a3,a5,a0
    2294:	01c12083          	lw	ra,28(sp)
    2298:	00c69693          	slli	a3,a3,0xc
    229c:	00c6d693          	srli	a3,a3,0xc
    22a0:	00000793          	li	a5,0
    22a4:	01471713          	slli	a4,a4,0x14
    22a8:	00078513          	mv	a0,a5
    22ac:	00d765b3          	or	a1,a4,a3
    22b0:	02010113          	addi	sp,sp,32
    22b4:	00008067          	ret
    22b8:	00000713          	li	a4,0
    22bc:	00000693          	li	a3,0
    22c0:	01471713          	slli	a4,a4,0x14
    22c4:	00d765b3          	or	a1,a4,a3
    22c8:	00008067          	ret
    22cc:	00b00693          	li	a3,11
    22d0:	40a686b3          	sub	a3,a3,a0
    22d4:	01c12083          	lw	ra,28(sp)
    22d8:	00d7d6b3          	srl	a3,a5,a3
    22dc:	01550613          	addi	a2,a0,21
    22e0:	00c69693          	slli	a3,a3,0xc
    22e4:	00c6d693          	srli	a3,a3,0xc
    22e8:	00c797b3          	sll	a5,a5,a2
    22ec:	01471713          	slli	a4,a4,0x14
    22f0:	00078513          	mv	a0,a5
    22f4:	00d765b3          	or	a1,a4,a3
    22f8:	02010113          	addi	sp,sp,32
    22fc:	00008067          	ret

00002300 <__divsi3>:
    2300:	06054063          	bltz	a0,2360 <__umodsi3+0x10>
    2304:	0605c663          	bltz	a1,2370 <__umodsi3+0x20>

00002308 <__hidden___udivsi3>:
    2308:	00058613          	mv	a2,a1
    230c:	00050593          	mv	a1,a0
    2310:	fff00513          	li	a0,-1
    2314:	02060c63          	beqz	a2,234c <__hidden___udivsi3+0x44>
    2318:	00100693          	li	a3,1
    231c:	00b67a63          	bgeu	a2,a1,2330 <__hidden___udivsi3+0x28>
    2320:	00c05863          	blez	a2,2330 <__hidden___udivsi3+0x28>
    2324:	00161613          	slli	a2,a2,0x1
    2328:	00169693          	slli	a3,a3,0x1
    232c:	feb66ae3          	bltu	a2,a1,2320 <__hidden___udivsi3+0x18>
    2330:	00000513          	li	a0,0
    2334:	00c5e663          	bltu	a1,a2,2340 <__hidden___udivsi3+0x38>
    2338:	40c585b3          	sub	a1,a1,a2
    233c:	00d56533          	or	a0,a0,a3
    2340:	0016d693          	srli	a3,a3,0x1
    2344:	00165613          	srli	a2,a2,0x1
    2348:	fe0696e3          	bnez	a3,2334 <__hidden___udivsi3+0x2c>
    234c:	00008067          	ret

00002350 <__umodsi3>:
    2350:	00008293          	mv	t0,ra
    2354:	fb5ff0ef          	jal	2308 <__hidden___udivsi3>
    2358:	00058513          	mv	a0,a1
    235c:	00028067          	jr	t0 # 1000 <WikiSort+0x414>
    2360:	40a00533          	neg	a0,a0
    2364:	00b04863          	bgtz	a1,2374 <__umodsi3+0x24>
    2368:	40b005b3          	neg	a1,a1
    236c:	f9dff06f          	j	2308 <__hidden___udivsi3>
    2370:	40b005b3          	neg	a1,a1
    2374:	00008293          	mv	t0,ra
    2378:	f91ff0ef          	jal	2308 <__hidden___udivsi3>
    237c:	40a00533          	neg	a0,a0
    2380:	00028067          	jr	t0

00002384 <__modsi3>:
    2384:	00008293          	mv	t0,ra
    2388:	0005ca63          	bltz	a1,239c <__modsi3+0x18>
    238c:	00054c63          	bltz	a0,23a4 <__modsi3+0x20>
    2390:	f79ff0ef          	jal	2308 <__hidden___udivsi3>
    2394:	00058513          	mv	a0,a1
    2398:	00028067          	jr	t0
    239c:	40b005b3          	neg	a1,a1
    23a0:	fe0558e3          	bgez	a0,2390 <__modsi3+0xc>
    23a4:	40a00533          	neg	a0,a0
    23a8:	f61ff0ef          	jal	2308 <__hidden___udivsi3>
    23ac:	40b00533          	neg	a0,a1
    23b0:	00028067          	jr	t0

000023b4 <__clzsi2>:
    23b4:	000107b7          	lui	a5,0x10
    23b8:	02f57a63          	bgeu	a0,a5,23ec <__clzsi2+0x38>
    23bc:	10053793          	sltiu	a5,a0,256
    23c0:	0017b793          	seqz	a5,a5
    23c4:	00379793          	slli	a5,a5,0x3
    23c8:	02000713          	li	a4,32
    23cc:	40f70733          	sub	a4,a4,a5
    23d0:	00f55533          	srl	a0,a0,a5
    23d4:	00000797          	auipc	a5,0x0
    23d8:	8d078793          	addi	a5,a5,-1840 # 1ca4 <__clz_tab>
    23dc:	00a787b3          	add	a5,a5,a0
    23e0:	0007c503          	lbu	a0,0(a5)
    23e4:	40a70533          	sub	a0,a4,a0
    23e8:	00008067          	ret
    23ec:	010007b7          	lui	a5,0x1000
    23f0:	02f57463          	bgeu	a0,a5,2418 <__clzsi2+0x64>
    23f4:	01000713          	li	a4,16
    23f8:	00070793          	mv	a5,a4
    23fc:	00f55533          	srl	a0,a0,a5
    2400:	00000797          	auipc	a5,0x0
    2404:	8a478793          	addi	a5,a5,-1884 # 1ca4 <__clz_tab>
    2408:	00a787b3          	add	a5,a5,a0
    240c:	0007c503          	lbu	a0,0(a5)
    2410:	40a70533          	sub	a0,a4,a0
    2414:	00008067          	ret
    2418:	01800793          	li	a5,24
    241c:	00f55533          	srl	a0,a0,a5
    2420:	00000797          	auipc	a5,0x0
    2424:	88478793          	addi	a5,a5,-1916 # 1ca4 <__clz_tab>
    2428:	00a787b3          	add	a5,a5,a0
    242c:	0007c503          	lbu	a0,0(a5)
    2430:	00800713          	li	a4,8
    2434:	40a70533          	sub	a0,a4,a0
    2438:	00008067          	ret
