
D:\aaa1verilog_project\rv32i_cpu\benchmark\embench\build\aha-mont64\aha-mont64.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00008117          	auipc	sp,0x8
   4:	f0010113          	addi	sp,sp,-256 # 7f00 <__stack_top>
   8:	00001297          	auipc	t0,0x1
   c:	01028293          	addi	t0,t0,16 # 1018 <in_m>
  10:	00001317          	auipc	t1,0x1
  14:	02030313          	addi	t1,t1,32 # 1030 <__bss_end>
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
  78:	255000ef          	jal	acc <initialise_benchmark>
  7c:	00000513          	li	a0,0
  80:	235000ef          	jal	ab4 <warm_caches>
  84:	fadff0ef          	jal	30 <start_trigger>
  88:	239000ef          	jal	ac0 <benchmark>
  8c:	00a12623          	sw	a0,12(sp)
  90:	fb5ff0ef          	jal	44 <stop_trigger>
  94:	00c12503          	lw	a0,12(sp)
  98:	281000ef          	jal	b18 <verify_benchmark>
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

000000d0 <montmul>:
  d0:	fd010113          	addi	sp,sp,-48
  d4:	01412c23          	sw	s4,24(sp)
  d8:	01612823          	sw	s6,16(sp)
  dc:	00058a13          	mv	s4,a1
  e0:	00068b13          	mv	s6,a3
  e4:	00000593          	li	a1,0
  e8:	00000693          	li	a3,0
  ec:	02112623          	sw	ra,44(sp)
  f0:	02812423          	sw	s0,40(sp)
  f4:	02912223          	sw	s1,36(sp)
  f8:	00060413          	mv	s0,a2
  fc:	00078493          	mv	s1,a5
 100:	03212023          	sw	s2,32(sp)
 104:	01312e23          	sw	s3,28(sp)
 108:	00070913          	mv	s2,a4
 10c:	01512a23          	sw	s5,20(sp)
 110:	01712623          	sw	s7,12(sp)
 114:	01812423          	sw	s8,8(sp)
 118:	00050b93          	mv	s7,a0
 11c:	00080c13          	mv	s8,a6
 120:	01912223          	sw	s9,4(sp)
 124:	01a12023          	sw	s10,0(sp)
 128:	00088c93          	mv	s9,a7
 12c:	219000ef          	jal	b44 <__muldi3>
 130:	00050993          	mv	s3,a0
 134:	00040613          	mv	a2,s0
 138:	00058a93          	mv	s5,a1
 13c:	000a0513          	mv	a0,s4
 140:	00000693          	li	a3,0
 144:	00000593          	li	a1,0
 148:	1fd000ef          	jal	b44 <__muldi3>
 14c:	01550ab3          	add	s5,a0,s5
 150:	00aab533          	sltu	a0,s5,a0
 154:	00b50433          	add	s0,a0,a1
 158:	000b0613          	mv	a2,s6
 15c:	000b8513          	mv	a0,s7
 160:	00000693          	li	a3,0
 164:	00000593          	li	a1,0
 168:	1dd000ef          	jal	b44 <__muldi3>
 16c:	01550ab3          	add	s5,a0,s5
 170:	000b0613          	mv	a2,s6
 174:	00aabb33          	sltu	s6,s5,a0
 178:	00bb0b33          	add	s6,s6,a1
 17c:	000a0513          	mv	a0,s4
 180:	00000693          	li	a3,0
 184:	00000593          	li	a1,0
 188:	1bd000ef          	jal	b44 <__muldi3>
 18c:	00a40533          	add	a0,s0,a0
 190:	00853433          	sltu	s0,a0,s0
 194:	01650b33          	add	s6,a0,s6
 198:	00b40433          	add	s0,s0,a1
 19c:	00ab3533          	sltu	a0,s6,a0
 1a0:	00850a33          	add	s4,a0,s0
 1a4:	000c8593          	mv	a1,s9
 1a8:	000c0513          	mv	a0,s8
 1ac:	00098613          	mv	a2,s3
 1b0:	000a8693          	mv	a3,s5
 1b4:	191000ef          	jal	b44 <__muldi3>
 1b8:	00058c93          	mv	s9,a1
 1bc:	00090613          	mv	a2,s2
 1c0:	00000693          	li	a3,0
 1c4:	00000593          	li	a1,0
 1c8:	00050c13          	mv	s8,a0
 1cc:	179000ef          	jal	b44 <__muldi3>
 1d0:	00050b93          	mv	s7,a0
 1d4:	00058413          	mv	s0,a1
 1d8:	00090613          	mv	a2,s2
 1dc:	00000693          	li	a3,0
 1e0:	000c8513          	mv	a0,s9
 1e4:	00000593          	li	a1,0
 1e8:	15d000ef          	jal	b44 <__muldi3>
 1ec:	00850433          	add	s0,a0,s0
 1f0:	00a43533          	sltu	a0,s0,a0
 1f4:	00b50d33          	add	s10,a0,a1
 1f8:	00048613          	mv	a2,s1
 1fc:	000c0513          	mv	a0,s8
 200:	00000693          	li	a3,0
 204:	00000593          	li	a1,0
 208:	13d000ef          	jal	b44 <__muldi3>
 20c:	01798c33          	add	s8,s3,s7
 210:	00850433          	add	s0,a0,s0
 214:	017c3bb3          	sltu	s7,s8,s7
 218:	00a437b3          	sltu	a5,s0,a0
 21c:	015b8bb3          	add	s7,s7,s5
 220:	00000693          	li	a3,0
 224:	008b8bb3          	add	s7,s7,s0
 228:	000c8513          	mv	a0,s9
 22c:	00b78433          	add	s0,a5,a1
 230:	00048613          	mv	a2,s1
 234:	00000593          	li	a1,0
 238:	10d000ef          	jal	b44 <__muldi3>
 23c:	016507b3          	add	a5,a0,s6
 240:	01a78733          	add	a4,a5,s10
 244:	00a7b533          	sltu	a0,a5,a0
 248:	014585b3          	add	a1,a1,s4
 24c:	00f736b3          	sltu	a3,a4,a5
 250:	00b50533          	add	a0,a0,a1
 254:	008707b3          	add	a5,a4,s0
 258:	00a686b3          	add	a3,a3,a0
 25c:	00e7b733          	sltu	a4,a5,a4
 260:	00d70733          	add	a4,a4,a3
 264:	0d5be463          	bltu	s7,s5,32c <montmul+0x25c>
 268:	00070613          	mv	a2,a4
 26c:	00078593          	mv	a1,a5
 270:	0b7a8c63          	beq	s5,s7,328 <montmul+0x258>
 274:	014647b3          	xor	a5,a2,s4
 278:	0165c6b3          	xor	a3,a1,s6
 27c:	00f6e6b3          	or	a3,a3,a5
 280:	0016b693          	seqz	a3,a3
 284:	00100793          	li	a5,1
 288:	015be663          	bltu	s7,s5,294 <montmul+0x1c4>
 28c:	0b7a8863          	beq	s5,s7,33c <montmul+0x26c>
 290:	00000793          	li	a5,0
 294:	00f6f6b3          	and	a3,a3,a5
 298:	00100793          	li	a5,1
 29c:	01466663          	bltu	a2,s4,2a8 <montmul+0x1d8>
 2a0:	0aca0463          	beq	s4,a2,348 <montmul+0x278>
 2a4:	00000793          	li	a5,0
 2a8:	00100713          	li	a4,1
 2ac:	06966a63          	bltu	a2,s1,320 <montmul+0x250>
 2b0:	06c48663          	beq	s1,a2,31c <montmul+0x24c>
 2b4:	00e7e7b3          	or	a5,a5,a4
 2b8:	00f6e6b3          	or	a3,a3,a5
 2bc:	01f69793          	slli	a5,a3,0x1f
 2c0:	41f7d513          	srai	a0,a5,0x1f
 2c4:	01f69793          	slli	a5,a3,0x1f
 2c8:	02c12083          	lw	ra,44(sp)
 2cc:	02812403          	lw	s0,40(sp)
 2d0:	01257533          	and	a0,a0,s2
 2d4:	41f7d693          	srai	a3,a5,0x1f
 2d8:	40a58533          	sub	a0,a1,a0
 2dc:	0096f6b3          	and	a3,a3,s1
 2e0:	00a5b5b3          	sltu	a1,a1,a0
 2e4:	40d60633          	sub	a2,a2,a3
 2e8:	02412483          	lw	s1,36(sp)
 2ec:	02012903          	lw	s2,32(sp)
 2f0:	01c12983          	lw	s3,28(sp)
 2f4:	01812a03          	lw	s4,24(sp)
 2f8:	01412a83          	lw	s5,20(sp)
 2fc:	01012b03          	lw	s6,16(sp)
 300:	00c12b83          	lw	s7,12(sp)
 304:	00812c03          	lw	s8,8(sp)
 308:	00412c83          	lw	s9,4(sp)
 30c:	00012d03          	lw	s10,0(sp)
 310:	40b605b3          	sub	a1,a2,a1
 314:	03010113          	addi	sp,sp,48
 318:	00008067          	ret
 31c:	f925fce3          	bgeu	a1,s2,2b4 <montmul+0x1e4>
 320:	00000713          	li	a4,0
 324:	f91ff06f          	j	2b4 <montmul+0x1e4>
 328:	f53c76e3          	bgeu	s8,s3,274 <montmul+0x1a4>
 32c:	00178593          	addi	a1,a5,1
 330:	00f5b7b3          	sltu	a5,a1,a5
 334:	00e78633          	add	a2,a5,a4
 338:	f3dff06f          	j	274 <montmul+0x1a4>
 33c:	f53c6ce3          	bltu	s8,s3,294 <montmul+0x1c4>
 340:	00000793          	li	a5,0
 344:	f51ff06f          	j	294 <montmul+0x1c4>
 348:	f765e0e3          	bltu	a1,s6,2a8 <montmul+0x1d8>
 34c:	00000793          	li	a5,0
 350:	f59ff06f          	j	2a8 <montmul+0x1d8>

00000354 <benchmark_body>:
 354:	74058c63          	beqz	a1,aac <benchmark_body+0x758>
 358:	00001837          	lui	a6,0x1
 35c:	02082783          	lw	a5,32(a6) # 1020 <in_b>
 360:	f6010113          	addi	sp,sp,-160
 364:	00001737          	lui	a4,0x1
 368:	00f12c23          	sw	a5,24(sp)
 36c:	02872783          	lw	a5,40(a4) # 1028 <in_a>
 370:	02482803          	lw	a6,36(a6)
 374:	02c72703          	lw	a4,44(a4)
 378:	00f12e23          	sw	a5,28(sp)
 37c:	07712e23          	sw	s7,124(sp)
 380:	01812603          	lw	a2,24(sp)
 384:	00050b93          	mv	s7,a0
 388:	01c12503          	lw	a0,28(sp)
 38c:	000017b7          	lui	a5,0x1
 390:	02b12e23          	sw	a1,60(sp)
 394:	00000693          	li	a3,0
 398:	00000593          	li	a1,0
 39c:	08812c23          	sw	s0,152(sp)
 3a0:	09212823          	sw	s2,144(sp)
 3a4:	09412423          	sw	s4,136(sp)
 3a8:	07812c23          	sw	s8,120(sp)
 3ac:	07912a23          	sw	s9,116(sp)
 3b0:	07b12623          	sw	s11,108(sp)
 3b4:	01c7a403          	lw	s0,28(a5) # 101c <in_m+0x4>
 3b8:	0187a903          	lw	s2,24(a5)
 3bc:	08112e23          	sw	ra,156(sp)
 3c0:	08912a23          	sw	s1,148(sp)
 3c4:	09312623          	sw	s3,140(sp)
 3c8:	09512223          	sw	s5,132(sp)
 3cc:	09612023          	sw	s6,128(sp)
 3d0:	07a12823          	sw	s10,112(sp)
 3d4:	03012023          	sw	a6,32(sp)
 3d8:	02e12223          	sw	a4,36(sp)
 3dc:	768000ef          	jal	b44 <__muldi3>
 3e0:	02a12c23          	sw	a0,56(sp)
 3e4:	00058c13          	mv	s8,a1
 3e8:	00000a13          	li	s4,0
 3ec:	04000d93          	li	s11,64
 3f0:	80000cb7          	lui	s9,0x80000
 3f4:	02412b03          	lw	s6,36(sp)
 3f8:	01812603          	lw	a2,24(sp)
 3fc:	00000693          	li	a3,0
 400:	000b0513          	mv	a0,s6
 404:	00000593          	li	a1,0
 408:	73c000ef          	jal	b44 <__muldi3>
 40c:	01850d33          	add	s10,a0,s8
 410:	02012a83          	lw	s5,32(sp)
 414:	00ad3533          	sltu	a0,s10,a0
 418:	00b504b3          	add	s1,a0,a1
 41c:	01c12503          	lw	a0,28(sp)
 420:	000a8613          	mv	a2,s5
 424:	00000693          	li	a3,0
 428:	00000593          	li	a1,0
 42c:	718000ef          	jal	b44 <__muldi3>
 430:	01a507b3          	add	a5,a0,s10
 434:	02f12823          	sw	a5,48(sp)
 438:	00a7b7b3          	sltu	a5,a5,a0
 43c:	00b789b3          	add	s3,a5,a1
 440:	000a8613          	mv	a2,s5
 444:	00000693          	li	a3,0
 448:	000b0513          	mv	a0,s6
 44c:	00000593          	li	a1,0
 450:	6f4000ef          	jal	b44 <__muldi3>
 454:	00a486b3          	add	a3,s1,a0
 458:	0096b4b3          	sltu	s1,a3,s1
 45c:	013687b3          	add	a5,a3,s3
 460:	00d7b6b3          	sltu	a3,a5,a3
 464:	00b484b3          	add	s1,s1,a1
 468:	00968733          	add	a4,a3,s1
 46c:	02e12a23          	sw	a4,52(sp)
 470:	00000a93          	li	s5,0
 474:	05412223          	sw	s4,68(sp)
 478:	05812423          	sw	s8,72(sp)
 47c:	04f12023          	sw	a5,64(sp)
 480:	05712623          	sw	s7,76(sp)
 484:	03812603          	lw	a2,56(sp)
 488:	03012683          	lw	a3,48(sp)
 48c:	04012a03          	lw	s4,64(sp)
 490:	03412983          	lw	s3,52(sp)
 494:	00000813          	li	a6,0
 498:	01fa5713          	srli	a4,s4,0x1f
 49c:	00199793          	slli	a5,s3,0x1
 4a0:	00f707b3          	add	a5,a4,a5
 4a4:	001a1a13          	slli	s4,s4,0x1
 4a8:	01f6d713          	srli	a4,a3,0x1f
 4ac:	41f9d593          	srai	a1,s3,0x1f
 4b0:	01476a33          	or	s4,a4,s4
 4b4:	00169713          	slli	a4,a3,0x1
 4b8:	01f65693          	srli	a3,a2,0x1f
 4bc:	00e68733          	add	a4,a3,a4
 4c0:	00f5e533          	or	a0,a1,a5
 4c4:	00078993          	mv	s3,a5
 4c8:	00180813          	addi	a6,a6,1
 4cc:	00161613          	slli	a2,a2,0x1
 4d0:	0145e5b3          	or	a1,a1,s4
 4d4:	00070693          	mv	a3,a4
 4d8:	02856863          	bltu	a0,s0,508 <benchmark_body+0x1b4>
 4dc:	412a08b3          	sub	a7,s4,s2
 4e0:	00a41463          	bne	s0,a0,4e8 <benchmark_body+0x194>
 4e4:	0325e263          	bltu	a1,s2,508 <benchmark_body+0x1b4>
 4e8:	00160593          	addi	a1,a2,1
 4ec:	011a39b3          	sltu	s3,s4,a7
 4f0:	00c5b633          	sltu	a2,a1,a2
 4f4:	408787b3          	sub	a5,a5,s0
 4f8:	00e606b3          	add	a3,a2,a4
 4fc:	00088a13          	mv	s4,a7
 500:	413789b3          	sub	s3,a5,s3
 504:	00058613          	mv	a2,a1
 508:	f9b818e3          	bne	a6,s11,498 <benchmark_body+0x144>
 50c:	000a0613          	mv	a2,s4
 510:	00000693          	li	a3,0
 514:	000a0513          	mv	a0,s4
 518:	00000593          	li	a1,0
 51c:	628000ef          	jal	b44 <__muldi3>
 520:	00058b93          	mv	s7,a1
 524:	000a0613          	mv	a2,s4
 528:	00000693          	li	a3,0
 52c:	00050493          	mv	s1,a0
 530:	00000593          	li	a1,0
 534:	00098513          	mv	a0,s3
 538:	60c000ef          	jal	b44 <__muldi3>
 53c:	00ab87b3          	add	a5,s7,a0
 540:	00a78b33          	add	s6,a5,a0
 544:	00ab3833          	sltu	a6,s6,a0
 548:	0177b7b3          	sltu	a5,a5,s7
 54c:	00b80a33          	add	s4,a6,a1
 550:	00098613          	mv	a2,s3
 554:	00098513          	mv	a0,s3
 558:	00000693          	li	a3,0
 55c:	00b789b3          	add	s3,a5,a1
 560:	00000593          	li	a1,0
 564:	5e0000ef          	jal	b44 <__muldi3>
 568:	00a986b3          	add	a3,s3,a0
 56c:	0136b7b3          	sltu	a5,a3,s3
 570:	01468a33          	add	s4,a3,s4
 574:	00b787b3          	add	a5,a5,a1
 578:	00da36b3          	sltu	a3,s4,a3
 57c:	00f689b3          	add	s3,a3,a5
 580:	00000593          	li	a1,0
 584:	01fa5713          	srli	a4,s4,0x1f
 588:	00199793          	slli	a5,s3,0x1
 58c:	00f707b3          	add	a5,a4,a5
 590:	001a1a13          	slli	s4,s4,0x1
 594:	01fb5713          	srli	a4,s6,0x1f
 598:	41f9d693          	srai	a3,s3,0x1f
 59c:	01f4d613          	srli	a2,s1,0x1f
 5a0:	01476a33          	or	s4,a4,s4
 5a4:	001b1713          	slli	a4,s6,0x1
 5a8:	00e60733          	add	a4,a2,a4
 5ac:	00f6e633          	or	a2,a3,a5
 5b0:	00078993          	mv	s3,a5
 5b4:	00158593          	addi	a1,a1,1
 5b8:	00149493          	slli	s1,s1,0x1
 5bc:	0146e6b3          	or	a3,a3,s4
 5c0:	00070b13          	mv	s6,a4
 5c4:	02866863          	bltu	a2,s0,5f4 <benchmark_body+0x2a0>
 5c8:	412a0533          	sub	a0,s4,s2
 5cc:	00c41463          	bne	s0,a2,5d4 <benchmark_body+0x280>
 5d0:	0326e263          	bltu	a3,s2,5f4 <benchmark_body+0x2a0>
 5d4:	00148693          	addi	a3,s1,1
 5d8:	00aa39b3          	sltu	s3,s4,a0
 5dc:	0096b4b3          	sltu	s1,a3,s1
 5e0:	408787b3          	sub	a5,a5,s0
 5e4:	00e48b33          	add	s6,s1,a4
 5e8:	00050a13          	mv	s4,a0
 5ec:	413789b3          	sub	s3,a5,s3
 5f0:	00068493          	mv	s1,a3
 5f4:	f9b598e3          	bne	a1,s11,584 <benchmark_body+0x230>
 5f8:	000a0613          	mv	a2,s4
 5fc:	00000693          	li	a3,0
 600:	000a0513          	mv	a0,s4
 604:	00000593          	li	a1,0
 608:	53c000ef          	jal	b44 <__muldi3>
 60c:	00058b13          	mv	s6,a1
 610:	000a0613          	mv	a2,s4
 614:	00000693          	li	a3,0
 618:	00050a13          	mv	s4,a0
 61c:	00000593          	li	a1,0
 620:	00098513          	mv	a0,s3
 624:	520000ef          	jal	b44 <__muldi3>
 628:	00ab07b3          	add	a5,s6,a0
 62c:	00a788b3          	add	a7,a5,a0
 630:	00a8b833          	sltu	a6,a7,a0
 634:	0167b7b3          	sltu	a5,a5,s6
 638:	00b784b3          	add	s1,a5,a1
 63c:	00b80b33          	add	s6,a6,a1
 640:	00098613          	mv	a2,s3
 644:	00098513          	mv	a0,s3
 648:	00000693          	li	a3,0
 64c:	00000593          	li	a1,0
 650:	00088993          	mv	s3,a7
 654:	4f0000ef          	jal	b44 <__muldi3>
 658:	00a486b3          	add	a3,s1,a0
 65c:	0096b7b3          	sltu	a5,a3,s1
 660:	01668e33          	add	t3,a3,s6
 664:	00de36b3          	sltu	a3,t3,a3
 668:	00b787b3          	add	a5,a5,a1
 66c:	00f684b3          	add	s1,a3,a5
 670:	00000d13          	li	s10,0
 674:	01fe5713          	srli	a4,t3,0x1f
 678:	00149793          	slli	a5,s1,0x1
 67c:	00f707b3          	add	a5,a4,a5
 680:	001e1e13          	slli	t3,t3,0x1
 684:	01f9d713          	srli	a4,s3,0x1f
 688:	41f4d693          	srai	a3,s1,0x1f
 68c:	01fa5613          	srli	a2,s4,0x1f
 690:	01c76e33          	or	t3,a4,t3
 694:	00199713          	slli	a4,s3,0x1
 698:	00e60733          	add	a4,a2,a4
 69c:	00f6e633          	or	a2,a3,a5
 6a0:	00078493          	mv	s1,a5
 6a4:	001d0d13          	addi	s10,s10,1
 6a8:	001a1a13          	slli	s4,s4,0x1
 6ac:	01c6e6b3          	or	a3,a3,t3
 6b0:	00070993          	mv	s3,a4
 6b4:	02866863          	bltu	a2,s0,6e4 <benchmark_body+0x390>
 6b8:	412e05b3          	sub	a1,t3,s2
 6bc:	00c41463          	bne	s0,a2,6c4 <benchmark_body+0x370>
 6c0:	0326e263          	bltu	a3,s2,6e4 <benchmark_body+0x390>
 6c4:	001a0693          	addi	a3,s4,1
 6c8:	00be34b3          	sltu	s1,t3,a1
 6cc:	0146ba33          	sltu	s4,a3,s4
 6d0:	408787b3          	sub	a5,a5,s0
 6d4:	00ea09b3          	add	s3,s4,a4
 6d8:	00058e13          	mv	t3,a1
 6dc:	409784b3          	sub	s1,a5,s1
 6e0:	00068a13          	mv	s4,a3
 6e4:	f9bd18e3          	bne	s10,s11,674 <benchmark_body+0x320>
 6e8:	00000513          	li	a0,0
 6ec:	00000593          	li	a1,0
 6f0:	00100613          	li	a2,1
 6f4:	00000693          	li	a3,0
 6f8:	0200006f          	j	718 <benchmark_body+0x3c4>
 6fc:	01f69813          	slli	a6,a3,0x1f
 700:	00165713          	srli	a4,a2,0x1
 704:	0016d793          	srli	a5,a3,0x1
 708:	fffd0d13          	addi	s10,s10,-1
 70c:	00e80633          	add	a2,a6,a4
 710:	00078693          	mv	a3,a5
 714:	060d0263          	beqz	s10,778 <benchmark_body+0x424>
 718:	00d44733          	xor	a4,s0,a3
 71c:	00c947b3          	xor	a5,s2,a2
 720:	01f71813          	slli	a6,a4,0x1f
 724:	0017d793          	srli	a5,a5,0x1
 728:	00f807b3          	add	a5,a6,a5
 72c:	01f59f93          	slli	t6,a1,0x1f
 730:	00c978b3          	and	a7,s2,a2
 734:	00155f13          	srli	t5,a0,0x1
 738:	0015de93          	srli	t4,a1,0x1
 73c:	00167813          	andi	a6,a2,1
 740:	00d47333          	and	t1,s0,a3
 744:	00f887b3          	add	a5,a7,a5
 748:	00175713          	srli	a4,a4,0x1
 74c:	01ef8533          	add	a0,t6,t5
 750:	000e8593          	mv	a1,t4
 754:	fa0804e3          	beqz	a6,6fc <benchmark_body+0x3a8>
 758:	0117b8b3          	sltu	a7,a5,a7
 75c:	00e30333          	add	t1,t1,a4
 760:	00078613          	mv	a2,a5
 764:	fffd0d13          	addi	s10,s10,-1
 768:	019e87b3          	add	a5,t4,s9
 76c:	006886b3          	add	a3,a7,t1
 770:	00078593          	mv	a1,a5
 774:	fa0d12e3          	bnez	s10,718 <benchmark_body+0x3c4>
 778:	04c12823          	sw	a2,80(sp)
 77c:	04d12a23          	sw	a3,84(sp)
 780:	04a12c23          	sw	a0,88(sp)
 784:	04b12e23          	sw	a1,92(sp)
 788:	05012603          	lw	a2,80(sp)
 78c:	05412683          	lw	a3,84(sp)
 790:	05812783          	lw	a5,88(sp)
 794:	05c12803          	lw	a6,92(sp)
 798:	01c12503          	lw	a0,28(sp)
 79c:	02412583          	lw	a1,36(sp)
 7a0:	02f12423          	sw	a5,40(sp)
 7a4:	03012623          	sw	a6,44(sp)
 7a8:	00000e93          	li	t4,0
 7ac:	00000613          	li	a2,0
 7b0:	00000693          	li	a3,0
 7b4:	01f55713          	srli	a4,a0,0x1f
 7b8:	00159793          	slli	a5,a1,0x1
 7bc:	00f707b3          	add	a5,a4,a5
 7c0:	00151513          	slli	a0,a0,0x1
 7c4:	01f6d713          	srli	a4,a3,0x1f
 7c8:	41f5d813          	srai	a6,a1,0x1f
 7cc:	00a76533          	or	a0,a4,a0
 7d0:	00169713          	slli	a4,a3,0x1
 7d4:	01f65693          	srli	a3,a2,0x1f
 7d8:	00e68733          	add	a4,a3,a4
 7dc:	00f868b3          	or	a7,a6,a5
 7e0:	00078593          	mv	a1,a5
 7e4:	001e8e93          	addi	t4,t4,1
 7e8:	00161613          	slli	a2,a2,0x1
 7ec:	00a86833          	or	a6,a6,a0
 7f0:	00070693          	mv	a3,a4
 7f4:	0288e863          	bltu	a7,s0,824 <benchmark_body+0x4d0>
 7f8:	41250333          	sub	t1,a0,s2
 7fc:	01141463          	bne	s0,a7,804 <benchmark_body+0x4b0>
 800:	03286263          	bltu	a6,s2,824 <benchmark_body+0x4d0>
 804:	006535b3          	sltu	a1,a0,t1
 808:	408787b3          	sub	a5,a5,s0
 80c:	40b785b3          	sub	a1,a5,a1
 810:	00160793          	addi	a5,a2,1
 814:	00c7b633          	sltu	a2,a5,a2
 818:	00e606b3          	add	a3,a2,a4
 81c:	00030513          	mv	a0,t1
 820:	00078613          	mv	a2,a5
 824:	f9be98e3          	bne	t4,s11,7b4 <benchmark_body+0x460>
 828:	01812603          	lw	a2,24(sp)
 82c:	02012683          	lw	a3,32(sp)
 830:	00000f93          	li	t6,0
 834:	00000893          	li	a7,0
 838:	00000813          	li	a6,0
 83c:	01f65713          	srli	a4,a2,0x1f
 840:	00169793          	slli	a5,a3,0x1
 844:	00f707b3          	add	a5,a4,a5
 848:	00161613          	slli	a2,a2,0x1
 84c:	01f85713          	srli	a4,a6,0x1f
 850:	41f6d313          	srai	t1,a3,0x1f
 854:	00c76633          	or	a2,a4,a2
 858:	01f8d693          	srli	a3,a7,0x1f
 85c:	00181713          	slli	a4,a6,0x1
 860:	00e68733          	add	a4,a3,a4
 864:	00f36eb3          	or	t4,t1,a5
 868:	00078693          	mv	a3,a5
 86c:	001f8f93          	addi	t6,t6,1
 870:	00189893          	slli	a7,a7,0x1
 874:	00c36333          	or	t1,t1,a2
 878:	00070813          	mv	a6,a4
 87c:	028ee863          	bltu	t4,s0,8ac <benchmark_body+0x558>
 880:	41260f33          	sub	t5,a2,s2
 884:	01d41463          	bne	s0,t4,88c <benchmark_body+0x538>
 888:	03236263          	bltu	t1,s2,8ac <benchmark_body+0x558>
 88c:	01e636b3          	sltu	a3,a2,t5
 890:	408787b3          	sub	a5,a5,s0
 894:	40d786b3          	sub	a3,a5,a3
 898:	00188793          	addi	a5,a7,1
 89c:	0117b833          	sltu	a6,a5,a7
 8a0:	000f0613          	mv	a2,t5
 8a4:	00e80833          	add	a6,a6,a4
 8a8:	00078893          	mv	a7,a5
 8ac:	f9bf98e3          	bne	t6,s11,83c <benchmark_body+0x4e8>
 8b0:	05812803          	lw	a6,88(sp)
 8b4:	05c12883          	lw	a7,92(sp)
 8b8:	00090713          	mv	a4,s2
 8bc:	00040793          	mv	a5,s0
 8c0:	01c12a23          	sw	t3,20(sp)
 8c4:	80dff0ef          	jal	d0 <montmul>
 8c8:	05812803          	lw	a6,88(sp)
 8cc:	05c12883          	lw	a7,92(sp)
 8d0:	00050613          	mv	a2,a0
 8d4:	00058693          	mv	a3,a1
 8d8:	00090713          	mv	a4,s2
 8dc:	00040793          	mv	a5,s0
 8e0:	ff0ff0ef          	jal	d0 <montmul>
 8e4:	05812803          	lw	a6,88(sp)
 8e8:	05c12883          	lw	a7,92(sp)
 8ec:	00090713          	mv	a4,s2
 8f0:	00050613          	mv	a2,a0
 8f4:	00058693          	mv	a3,a1
 8f8:	00040793          	mv	a5,s0
 8fc:	fd4ff0ef          	jal	d0 <montmul>
 900:	05012783          	lw	a5,80(sp)
 904:	05412803          	lw	a6,84(sp)
 908:	00058c13          	mv	s8,a1
 90c:	00f12423          	sw	a5,8(sp)
 910:	00812603          	lw	a2,8(sp)
 914:	00000693          	li	a3,0
 918:	00000593          	li	a1,0
 91c:	01012623          	sw	a6,12(sp)
 920:	00050b93          	mv	s7,a0
 924:	220000ef          	jal	b44 <__muldi3>
 928:	00812603          	lw	a2,8(sp)
 92c:	00058993          	mv	s3,a1
 930:	00000693          	li	a3,0
 934:	00050a13          	mv	s4,a0
 938:	00000593          	li	a1,0
 93c:	000c0513          	mv	a0,s8
 940:	204000ef          	jal	b44 <__muldi3>
 944:	013509b3          	add	s3,a0,s3
 948:	00c12603          	lw	a2,12(sp)
 94c:	00a9b533          	sltu	a0,s3,a0
 950:	00b50b33          	add	s6,a0,a1
 954:	00000693          	li	a3,0
 958:	000b8513          	mv	a0,s7
 95c:	00000593          	li	a1,0
 960:	1e4000ef          	jal	b44 <__muldi3>
 964:	013507b3          	add	a5,a0,s3
 968:	00c12603          	lw	a2,12(sp)
 96c:	00a7b533          	sltu	a0,a5,a0
 970:	00b509b3          	add	s3,a0,a1
 974:	00000693          	li	a3,0
 978:	000c0513          	mv	a0,s8
 97c:	00000593          	li	a1,0
 980:	00078b93          	mv	s7,a5
 984:	1c0000ef          	jal	b44 <__muldi3>
 988:	00ab07b3          	add	a5,s6,a0
 98c:	0167b6b3          	sltu	a3,a5,s6
 990:	01412e03          	lw	t3,20(sp)
 994:	01378b33          	add	s6,a5,s3
 998:	00fb37b3          	sltu	a5,s6,a5
 99c:	00b686b3          	add	a3,a3,a1
 9a0:	00d789b3          	add	s3,a5,a3
 9a4:	01fb5713          	srli	a4,s6,0x1f
 9a8:	00199793          	slli	a5,s3,0x1
 9ac:	00f707b3          	add	a5,a4,a5
 9b0:	001b1b13          	slli	s6,s6,0x1
 9b4:	01fbd713          	srli	a4,s7,0x1f
 9b8:	41f9d693          	srai	a3,s3,0x1f
 9bc:	01fa5613          	srli	a2,s4,0x1f
 9c0:	01676b33          	or	s6,a4,s6
 9c4:	001b9713          	slli	a4,s7,0x1
 9c8:	00e60733          	add	a4,a2,a4
 9cc:	00f6e633          	or	a2,a3,a5
 9d0:	00078993          	mv	s3,a5
 9d4:	001d0d13          	addi	s10,s10,1
 9d8:	001a1a13          	slli	s4,s4,0x1
 9dc:	0166e6b3          	or	a3,a3,s6
 9e0:	00070b93          	mv	s7,a4
 9e4:	02866863          	bltu	a2,s0,a14 <benchmark_body+0x6c0>
 9e8:	412b05b3          	sub	a1,s6,s2
 9ec:	00c41463          	bne	s0,a2,9f4 <benchmark_body+0x6a0>
 9f0:	0326e263          	bltu	a3,s2,a14 <benchmark_body+0x6c0>
 9f4:	00bb39b3          	sltu	s3,s6,a1
 9f8:	408787b3          	sub	a5,a5,s0
 9fc:	413789b3          	sub	s3,a5,s3
 a00:	001a0793          	addi	a5,s4,1
 a04:	0147ba33          	sltu	s4,a5,s4
 a08:	00ea0bb3          	add	s7,s4,a4
 a0c:	00058b13          	mv	s6,a1
 a10:	00078a13          	mv	s4,a5
 a14:	f9bd18e3          	bne	s10,s11,9a4 <benchmark_body+0x650>
 a18:	03c12783          	lw	a5,60(sp)
 a1c:	001a8a93          	addi	s5,s5,1
 a20:	a75792e3          	bne	a5,s5,484 <benchmark_body+0x130>
 a24:	04412a03          	lw	s4,68(sp)
 a28:	04c12b83          	lw	s7,76(sp)
 a2c:	04812c03          	lw	s8,72(sp)
 a30:	001a0a13          	addi	s4,s4,1
 a34:	9d4b90e3          	bne	s7,s4,3f4 <benchmark_body+0xa0>
 a38:	02812503          	lw	a0,40(sp)
 a3c:	02c12583          	lw	a1,44(sp)
 a40:	00090613          	mv	a2,s2
 a44:	00040693          	mv	a3,s0
 a48:	016e4933          	xor	s2,t3,s6
 a4c:	0f8000ef          	jal	b44 <__muldi3>
 a50:	0134c4b3          	xor	s1,s1,s3
 a54:	00b57733          	and	a4,a0,a1
 a58:	00996933          	or	s2,s2,s1
 a5c:	09c12083          	lw	ra,156(sp)
 a60:	09812403          	lw	s0,152(sp)
 a64:	00170713          	addi	a4,a4,1
 a68:	012037b3          	snez	a5,s2
 a6c:	00e03733          	snez	a4,a4
 a70:	00f767b3          	or	a5,a4,a5
 a74:	09412483          	lw	s1,148(sp)
 a78:	09012903          	lw	s2,144(sp)
 a7c:	08c12983          	lw	s3,140(sp)
 a80:	08812a03          	lw	s4,136(sp)
 a84:	08412a83          	lw	s5,132(sp)
 a88:	08012b03          	lw	s6,128(sp)
 a8c:	07c12b83          	lw	s7,124(sp)
 a90:	07812c03          	lw	s8,120(sp)
 a94:	07412c83          	lw	s9,116(sp)
 a98:	07012d03          	lw	s10,112(sp)
 a9c:	06c12d83          	lw	s11,108(sp)
 aa0:	00078513          	mv	a0,a5
 aa4:	0a010113          	addi	sp,sp,160
 aa8:	00008067          	ret
 aac:	00078513          	mv	a0,a5
 ab0:	00008067          	ret

00000ab4 <warm_caches>:
 ab4:	00050593          	mv	a1,a0
 ab8:	00100513          	li	a0,1
 abc:	899ff06f          	j	354 <benchmark_body>

00000ac0 <benchmark>:
 ac0:	00100593          	li	a1,1
 ac4:	00200513          	li	a0,2
 ac8:	88dff06f          	j	354 <benchmark_body>

00000acc <initialise_benchmark>:
 acc:	000016b7          	lui	a3,0x1
 ad0:	00001737          	lui	a4,0x1
 ad4:	000017b7          	lui	a5,0x1
 ad8:	0006a303          	lw	t1,0(a3) # 1000 <__muldi3+0x4bc>
 adc:	0046a383          	lw	t2,4(a3)
 ae0:	00872503          	lw	a0,8(a4) # 1008 <__muldi3+0x4c4>
 ae4:	00c72583          	lw	a1,12(a4)
 ae8:	0107a603          	lw	a2,16(a5) # 1010 <__muldi3+0x4cc>
 aec:	0147a683          	lw	a3,20(a5)
 af0:	00001837          	lui	a6,0x1
 af4:	00001737          	lui	a4,0x1
 af8:	000017b7          	lui	a5,0x1
 afc:	00682c23          	sw	t1,24(a6) # 1018 <in_m>
 b00:	00782e23          	sw	t2,28(a6)
 b04:	02a72023          	sw	a0,32(a4) # 1020 <in_b>
 b08:	02b72223          	sw	a1,36(a4)
 b0c:	02c7a423          	sw	a2,40(a5) # 1028 <in_a>
 b10:	02d7a623          	sw	a3,44(a5)
 b14:	00008067          	ret

00000b18 <verify_benchmark>:
 b18:	00153513          	seqz	a0,a0
 b1c:	00008067          	ret

00000b20 <__mulsi3>:
 b20:	00050613          	mv	a2,a0
 b24:	00000513          	li	a0,0
 b28:	0015f693          	andi	a3,a1,1
 b2c:	00068463          	beqz	a3,b34 <__mulsi3+0x14>
 b30:	00c50533          	add	a0,a0,a2
 b34:	0015d593          	srli	a1,a1,0x1
 b38:	00161613          	slli	a2,a2,0x1
 b3c:	fe0596e3          	bnez	a1,b28 <__mulsi3+0x8>
 b40:	00008067          	ret

00000b44 <__muldi3>:
 b44:	ff010113          	addi	sp,sp,-16
 b48:	00068293          	mv	t0,a3
 b4c:	00112623          	sw	ra,12(sp)
 b50:	00050393          	mv	t2,a0
 b54:	00050693          	mv	a3,a0
 b58:	00060713          	mv	a4,a2
 b5c:	00000793          	li	a5,0
 b60:	00000313          	li	t1,0
 b64:	00000813          	li	a6,0
 b68:	00d808b3          	add	a7,a6,a3
 b6c:	00177e93          	andi	t4,a4,1
 b70:	00f30f33          	add	t5,t1,a5
 b74:	01f6de13          	srli	t3,a3,0x1f
 b78:	00175713          	srli	a4,a4,0x1
 b7c:	0108bfb3          	sltu	t6,a7,a6
 b80:	00179793          	slli	a5,a5,0x1
 b84:	000e8663          	beqz	t4,b90 <__muldi3+0x4c>
 b88:	00088813          	mv	a6,a7
 b8c:	01ef8333          	add	t1,t6,t5
 b90:	00169693          	slli	a3,a3,0x1
 b94:	01c7e7b3          	or	a5,a5,t3
 b98:	fc0718e3          	bnez	a4,b68 <__muldi3+0x24>
 b9c:	00058863          	beqz	a1,bac <__muldi3+0x68>
 ba0:	00060513          	mv	a0,a2
 ba4:	f7dff0ef          	jal	b20 <__mulsi3>
 ba8:	00650333          	add	t1,a0,t1
 bac:	00028a63          	beqz	t0,bc0 <__muldi3+0x7c>
 bb0:	00038513          	mv	a0,t2
 bb4:	00028593          	mv	a1,t0
 bb8:	f69ff0ef          	jal	b20 <__mulsi3>
 bbc:	00650333          	add	t1,a0,t1
 bc0:	00c12083          	lw	ra,12(sp)
 bc4:	00080513          	mv	a0,a6
 bc8:	00030593          	mv	a1,t1
 bcc:	01010113          	addi	sp,sp,16
 bd0:	00008067          	ret
