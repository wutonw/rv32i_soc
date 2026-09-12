
D:\aaa1verilog_project\rv32i_cpu\benchmark\embench\build\matmult-int\matmult-int.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00008117          	auipc	sp,0x8
   4:	f0010113          	addi	sp,sp,-256 # 7f00 <__stack_top>
   8:	00001297          	auipc	t0,0x1
   c:	63828293          	addi	t0,t0,1592 # 1640 <ResultArray>
  10:	00003317          	auipc	t1,0x3
  14:	57430313          	addi	t1,t1,1396 # 3584 <__bss_end>
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
  78:	298000ef          	jal	310 <initialise_benchmark>
  7c:	00000513          	li	a0,0
  80:	284000ef          	jal	304 <warm_caches>
  84:	fadff0ef          	jal	30 <start_trigger>
  88:	258000ef          	jal	2e0 <benchmark>
  8c:	00a12623          	sw	a0,12(sp)
  90:	fb5ff0ef          	jal	44 <stop_trigger>
  94:	00c12503          	lw	a0,12(sp)
  98:	340000ef          	jal	3d8 <verify_benchmark>
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

000000f4 <memcmp>:
  f4:	02060663          	beqz	a2,120 <memcmp+0x2c>
  f8:	00c50633          	add	a2,a0,a2
  fc:	0080006f          	j	104 <memcmp+0x10>
 100:	02c50063          	beq	a0,a2,120 <memcmp+0x2c>
 104:	00054783          	lbu	a5,0(a0)
 108:	0005c703          	lbu	a4,0(a1)
 10c:	00150513          	addi	a0,a0,1
 110:	00158593          	addi	a1,a1,1
 114:	fee786e3          	beq	a5,a4,100 <memcmp+0xc>
 118:	40e78533          	sub	a0,a5,a4
 11c:	00008067          	ret
 120:	00000513          	li	a0,0
 124:	00008067          	ret

00000128 <Multiply>:
 128:	fc010113          	addi	sp,sp,-64
 12c:	03612023          	sw	s6,32(sp)
 130:	01712e23          	sw	s7,28(sp)
 134:	01812c23          	sw	s8,24(sp)
 138:	01912a23          	sw	s9,20(sp)
 13c:	01a12823          	sw	s10,16(sp)
 140:	01b12623          	sw	s11,12(sp)
 144:	02112e23          	sw	ra,60(sp)
 148:	02812c23          	sw	s0,56(sp)
 14c:	02912a23          	sw	s1,52(sp)
 150:	03212823          	sw	s2,48(sp)
 154:	03312623          	sw	s3,44(sp)
 158:	03412423          	sw	s4,40(sp)
 15c:	03512223          	sw	s5,36(sp)
 160:	00058c13          	mv	s8,a1
 164:	00050d93          	mv	s11,a0
 168:	00060d13          	mv	s10,a2
 16c:	69058b13          	addi	s6,a1,1680
 170:	00000b93          	li	s7,0
 174:	64000c93          	li	s9,1600
 178:	017d0a33          	add	s4,s10,s7
 17c:	640c0993          	addi	s3,s8,1600
 180:	017d8ab3          	add	s5,s11,s7
 184:	000a2023          	sw	zero,0(s4)
 188:	000a8913          	mv	s2,s5
 18c:	9c098413          	addi	s0,s3,-1600
 190:	00000493          	li	s1,0
 194:	00042583          	lw	a1,0(s0)
 198:	00092503          	lw	a0,0(s2)
 19c:	05040413          	addi	s0,s0,80
 1a0:	00490913          	addi	s2,s2,4
 1a4:	29c000ef          	jal	440 <__mulsi3>
 1a8:	00a484b3          	add	s1,s1,a0
 1ac:	009a2023          	sw	s1,0(s4)
 1b0:	ff3412e3          	bne	s0,s3,194 <Multiply+0x6c>
 1b4:	00440993          	addi	s3,s0,4
 1b8:	004a0a13          	addi	s4,s4,4
 1bc:	fd3b14e3          	bne	s6,s3,184 <Multiply+0x5c>
 1c0:	050b8b93          	addi	s7,s7,80
 1c4:	fb9b9ae3          	bne	s7,s9,178 <Multiply+0x50>
 1c8:	03c12083          	lw	ra,60(sp)
 1cc:	03812403          	lw	s0,56(sp)
 1d0:	03412483          	lw	s1,52(sp)
 1d4:	03012903          	lw	s2,48(sp)
 1d8:	02c12983          	lw	s3,44(sp)
 1dc:	02812a03          	lw	s4,40(sp)
 1e0:	02412a83          	lw	s5,36(sp)
 1e4:	02012b03          	lw	s6,32(sp)
 1e8:	01c12b83          	lw	s7,28(sp)
 1ec:	01812c03          	lw	s8,24(sp)
 1f0:	01412c83          	lw	s9,20(sp)
 1f4:	01012d03          	lw	s10,16(sp)
 1f8:	00c12d83          	lw	s11,12(sp)
 1fc:	04010113          	addi	sp,sp,64
 200:	00008067          	ret

00000204 <benchmark_body.isra.0>:
 204:	0c058c63          	beqz	a1,2dc <benchmark_body.isra.0+0xd8>
 208:	fd010113          	addi	sp,sp,-48
 20c:	02912223          	sw	s1,36(sp)
 210:	03212023          	sw	s2,32(sp)
 214:	01412c23          	sw	s4,24(sp)
 218:	01512a23          	sw	s5,20(sp)
 21c:	01612823          	sw	s6,16(sp)
 220:	00003937          	lui	s2,0x3
 224:	00003b37          	lui	s6,0x3
 228:	00002ab7          	lui	s5,0x2
 22c:	000024b7          	lui	s1,0x2
 230:	00001a37          	lui	s4,0x1
 234:	01312e23          	sw	s3,28(sp)
 238:	01712623          	sw	s7,12(sp)
 23c:	01812423          	sw	s8,8(sp)
 240:	02112623          	sw	ra,44(sp)
 244:	02812423          	sw	s0,40(sp)
 248:	00050b93          	mv	s7,a0
 24c:	00058993          	mv	s3,a1
 250:	f40b0b13          	addi	s6,s6,-192 # 2f40 <ArrayA_ref>
 254:	90090913          	addi	s2,s2,-1792 # 2900 <ArrayA>
 258:	2c0a8a93          	addi	s5,s5,704 # 22c0 <ArrayB_ref>
 25c:	c8048493          	addi	s1,s1,-896 # 1c80 <ArrayB>
 260:	640a0a13          	addi	s4,s4,1600 # 1640 <ResultArray>
 264:	00000c13          	li	s8,0
 268:	00000413          	li	s0,0
 26c:	64000613          	li	a2,1600
 270:	000b0593          	mv	a1,s6
 274:	00090513          	mv	a0,s2
 278:	e59ff0ef          	jal	d0 <memcpy>
 27c:	000a8593          	mv	a1,s5
 280:	64000613          	li	a2,1600
 284:	00048513          	mv	a0,s1
 288:	e49ff0ef          	jal	d0 <memcpy>
 28c:	000a0613          	mv	a2,s4
 290:	00048593          	mv	a1,s1
 294:	00090513          	mv	a0,s2
 298:	00140413          	addi	s0,s0,1
 29c:	e8dff0ef          	jal	128 <Multiply>
 2a0:	fd3416e3          	bne	s0,s3,26c <benchmark_body.isra.0+0x68>
 2a4:	001c0c13          	addi	s8,s8,1
 2a8:	fd8b90e3          	bne	s7,s8,268 <benchmark_body.isra.0+0x64>
 2ac:	02c12083          	lw	ra,44(sp)
 2b0:	02812403          	lw	s0,40(sp)
 2b4:	02412483          	lw	s1,36(sp)
 2b8:	02012903          	lw	s2,32(sp)
 2bc:	01c12983          	lw	s3,28(sp)
 2c0:	01812a03          	lw	s4,24(sp)
 2c4:	01412a83          	lw	s5,20(sp)
 2c8:	01012b03          	lw	s6,16(sp)
 2cc:	00c12b83          	lw	s7,12(sp)
 2d0:	00812c03          	lw	s8,8(sp)
 2d4:	03010113          	addi	sp,sp,48
 2d8:	00008067          	ret
 2dc:	00008067          	ret

000002e0 <benchmark>:
 2e0:	ff010113          	addi	sp,sp,-16
 2e4:	00200513          	li	a0,2
 2e8:	00100593          	li	a1,1
 2ec:	00112623          	sw	ra,12(sp)
 2f0:	f15ff0ef          	jal	204 <benchmark_body.isra.0>
 2f4:	00c12083          	lw	ra,12(sp)
 2f8:	00000513          	li	a0,0
 2fc:	01010113          	addi	sp,sp,16
 300:	00008067          	ret

00000304 <warm_caches>:
 304:	00050593          	mv	a1,a0
 308:	00100513          	li	a0,1
 30c:	ef9ff06f          	j	204 <benchmark_body.isra.0>

00000310 <initialise_benchmark>:
 310:	ff010113          	addi	sp,sp,-16
 314:	01212023          	sw	s2,0(sp)
 318:	00003937          	lui	s2,0x3
 31c:	f4090913          	addi	s2,s2,-192 # 2f40 <ArrayA_ref>
 320:	00912223          	sw	s1,4(sp)
 324:	00112623          	sw	ra,12(sp)
 328:	05090493          	addi	s1,s2,80
 32c:	00812423          	sw	s0,8(sp)
 330:	69090913          	addi	s2,s2,1680
 334:	00000513          	li	a0,0
 338:	fb048413          	addi	s0,s1,-80
 33c:	00551793          	slli	a5,a0,0x5
 340:	00a787b3          	add	a5,a5,a0
 344:	00279793          	slli	a5,a5,0x2
 348:	00a78533          	add	a0,a5,a0
 34c:	000025b7          	lui	a1,0x2
 350:	05150513          	addi	a0,a0,81
 354:	f9f58593          	addi	a1,a1,-97 # 1f9f <ArrayB+0x31f>
 358:	190000ef          	jal	4e8 <__modsi3>
 35c:	00a42023          	sw	a0,0(s0)
 360:	00440413          	addi	s0,s0,4
 364:	fc941ce3          	bne	s0,s1,33c <initialise_benchmark+0x2c>
 368:	05040493          	addi	s1,s0,80
 36c:	fd2496e3          	bne	s1,s2,338 <initialise_benchmark+0x28>
 370:	00002937          	lui	s2,0x2
 374:	2c090913          	addi	s2,s2,704 # 22c0 <ArrayB_ref>
 378:	05090493          	addi	s1,s2,80
 37c:	69090913          	addi	s2,s2,1680
 380:	fb048413          	addi	s0,s1,-80
 384:	00551793          	slli	a5,a0,0x5
 388:	00a787b3          	add	a5,a5,a0
 38c:	00279793          	slli	a5,a5,0x2
 390:	00a78533          	add	a0,a5,a0
 394:	000025b7          	lui	a1,0x2
 398:	05150513          	addi	a0,a0,81
 39c:	f9f58593          	addi	a1,a1,-97 # 1f9f <ArrayB+0x31f>
 3a0:	148000ef          	jal	4e8 <__modsi3>
 3a4:	00a42023          	sw	a0,0(s0)
 3a8:	00440413          	addi	s0,s0,4
 3ac:	fc849ce3          	bne	s1,s0,384 <initialise_benchmark+0x74>
 3b0:	05048493          	addi	s1,s1,80
 3b4:	fc9916e3          	bne	s2,s1,380 <initialise_benchmark+0x70>
 3b8:	00c12083          	lw	ra,12(sp)
 3bc:	00812403          	lw	s0,8(sp)
 3c0:	000037b7          	lui	a5,0x3
 3c4:	58a7a023          	sw	a0,1408(a5) # 3580 <Seed>
 3c8:	00412483          	lw	s1,4(sp)
 3cc:	00012903          	lw	s2,0(sp)
 3d0:	01010113          	addi	sp,sp,16
 3d4:	00008067          	ret

000003d8 <verify_benchmark>:
 3d8:	000017b7          	lui	a5,0x1
 3dc:	9b010113          	addi	sp,sp,-1616
 3e0:	00078793          	mv	a5,a5
 3e4:	64112623          	sw	ra,1612(sp)
 3e8:	64078693          	addi	a3,a5,1600 # 1640 <ResultArray>
 3ec:	00010713          	mv	a4,sp
 3f0:	0007a803          	lw	a6,0(a5)
 3f4:	0047a503          	lw	a0,4(a5)
 3f8:	0087a583          	lw	a1,8(a5)
 3fc:	00c7a603          	lw	a2,12(a5)
 400:	01072023          	sw	a6,0(a4)
 404:	00a72223          	sw	a0,4(a4)
 408:	00b72423          	sw	a1,8(a4)
 40c:	00c72623          	sw	a2,12(a4)
 410:	01078793          	addi	a5,a5,16
 414:	01070713          	addi	a4,a4,16
 418:	fcd79ce3          	bne	a5,a3,3f0 <verify_benchmark+0x18>
 41c:	00001537          	lui	a0,0x1
 420:	00010593          	mv	a1,sp
 424:	64050513          	addi	a0,a0,1600 # 1640 <ResultArray>
 428:	64000613          	li	a2,1600
 42c:	cc9ff0ef          	jal	f4 <memcmp>
 430:	64c12083          	lw	ra,1612(sp)
 434:	00153513          	seqz	a0,a0
 438:	65010113          	addi	sp,sp,1616
 43c:	00008067          	ret

00000440 <__mulsi3>:
 440:	00050613          	mv	a2,a0
 444:	00000513          	li	a0,0
 448:	0015f693          	andi	a3,a1,1
 44c:	00068463          	beqz	a3,454 <__mulsi3+0x14>
 450:	00c50533          	add	a0,a0,a2
 454:	0015d593          	srli	a1,a1,0x1
 458:	00161613          	slli	a2,a2,0x1
 45c:	fe0596e3          	bnez	a1,448 <__mulsi3+0x8>
 460:	00008067          	ret

00000464 <__divsi3>:
 464:	06054063          	bltz	a0,4c4 <__umodsi3+0x10>
 468:	0605c663          	bltz	a1,4d4 <__umodsi3+0x20>

0000046c <__hidden___udivsi3>:
 46c:	00058613          	mv	a2,a1
 470:	00050593          	mv	a1,a0
 474:	fff00513          	li	a0,-1
 478:	02060c63          	beqz	a2,4b0 <__hidden___udivsi3+0x44>
 47c:	00100693          	li	a3,1
 480:	00b67a63          	bgeu	a2,a1,494 <__hidden___udivsi3+0x28>
 484:	00c05863          	blez	a2,494 <__hidden___udivsi3+0x28>
 488:	00161613          	slli	a2,a2,0x1
 48c:	00169693          	slli	a3,a3,0x1
 490:	feb66ae3          	bltu	a2,a1,484 <__hidden___udivsi3+0x18>
 494:	00000513          	li	a0,0
 498:	00c5e663          	bltu	a1,a2,4a4 <__hidden___udivsi3+0x38>
 49c:	40c585b3          	sub	a1,a1,a2
 4a0:	00d56533          	or	a0,a0,a3
 4a4:	0016d693          	srli	a3,a3,0x1
 4a8:	00165613          	srli	a2,a2,0x1
 4ac:	fe0696e3          	bnez	a3,498 <__hidden___udivsi3+0x2c>
 4b0:	00008067          	ret

000004b4 <__umodsi3>:
 4b4:	00008293          	mv	t0,ra
 4b8:	fb5ff0ef          	jal	46c <__hidden___udivsi3>
 4bc:	00058513          	mv	a0,a1
 4c0:	00028067          	jr	t0
 4c4:	40a00533          	neg	a0,a0
 4c8:	00b04863          	bgtz	a1,4d8 <__umodsi3+0x24>
 4cc:	40b005b3          	neg	a1,a1
 4d0:	f9dff06f          	j	46c <__hidden___udivsi3>
 4d4:	40b005b3          	neg	a1,a1
 4d8:	00008293          	mv	t0,ra
 4dc:	f91ff0ef          	jal	46c <__hidden___udivsi3>
 4e0:	40a00533          	neg	a0,a0
 4e4:	00028067          	jr	t0

000004e8 <__modsi3>:
 4e8:	00008293          	mv	t0,ra
 4ec:	0005ca63          	bltz	a1,500 <__modsi3+0x18>
 4f0:	00054c63          	bltz	a0,508 <__modsi3+0x20>
 4f4:	f79ff0ef          	jal	46c <__hidden___udivsi3>
 4f8:	00058513          	mv	a0,a1
 4fc:	00028067          	jr	t0
 500:	40b005b3          	neg	a1,a1
 504:	fe0558e3          	bgez	a0,4f4 <__modsi3+0xc>
 508:	40a00533          	neg	a0,a0
 50c:	f61ff0ef          	jal	46c <__hidden___udivsi3>
 510:	40b00533          	neg	a0,a1
 514:	00028067          	jr	t0
