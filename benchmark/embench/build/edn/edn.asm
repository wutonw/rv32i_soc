
D:\aaa1verilog_project\rv32i_cpu\benchmark\embench\build\edn\edn.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00008117          	auipc	sp,0x8
   4:	f0010113          	addi	sp,sp,-256 # 7f00 <__stack_top>
   8:	00001297          	auipc	t0,0x1
   c:	63828293          	addi	t0,t0,1592 # 1640 <output>
  10:	00002317          	auipc	t1,0x2
  14:	c7c30313          	addi	t1,t1,-900 # 1c8c <__bss_end>
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
  78:	1ed000ef          	jal	a64 <initialise_benchmark>
  7c:	00000513          	li	a0,0
  80:	1e9000ef          	jal	a68 <warm_caches>
  84:	fadff0ef          	jal	30 <start_trigger>
  88:	1ed000ef          	jal	a74 <benchmark>
  8c:	00a12623          	sw	a0,12(sp)
  90:	fb5ff0ef          	jal	44 <stop_trigger>
  94:	00c12503          	lw	a0,12(sp)
  98:	201000ef          	jal	a98 <verify_benchmark>
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

000000d0 <memcmp>:
  d0:	02060663          	beqz	a2,fc <memcmp+0x2c>
  d4:	00c50633          	add	a2,a0,a2
  d8:	0080006f          	j	e0 <memcmp+0x10>
  dc:	02c50063          	beq	a0,a2,fc <memcmp+0x2c>
  e0:	00054783          	lbu	a5,0(a0)
  e4:	0005c703          	lbu	a4,0(a1)
  e8:	00150513          	addi	a0,a0,1
  ec:	00158593          	addi	a1,a1,1
  f0:	fee786e3          	beq	a5,a4,dc <memcmp+0xc>
  f4:	40e78533          	sub	a0,a5,a4
  f8:	00008067          	ret
  fc:	00000513          	li	a0,0
 100:	00008067          	ret

00000104 <fir>:
 104:	fd010113          	addi	sp,sp,-48
 108:	01312e23          	sw	s3,28(sp)
 10c:	01412c23          	sw	s4,24(sp)
 110:	01512a23          	sw	s5,20(sp)
 114:	01612823          	sw	s6,16(sp)
 118:	01712623          	sw	s7,12(sp)
 11c:	02112623          	sw	ra,44(sp)
 120:	02812423          	sw	s0,40(sp)
 124:	02912223          	sw	s1,36(sp)
 128:	03212023          	sw	s2,32(sp)
 12c:	06450993          	addi	s3,a0,100
 130:	00060a13          	mv	s4,a2
 134:	00058b93          	mv	s7,a1
 138:	00000a93          	li	s5,0
 13c:	03200b13          	li	s6,50
 140:	f9c98413          	addi	s0,s3,-100
 144:	000b8493          	mv	s1,s7
 148:	00000913          	li	s2,0
 14c:	00049583          	lh	a1,0(s1)
 150:	00041503          	lh	a0,0(s0)
 154:	00240413          	addi	s0,s0,2
 158:	00248493          	addi	s1,s1,2
 15c:	1f1000ef          	jal	b4c <__mulsi3>
 160:	00a90933          	add	s2,s2,a0
 164:	fe8994e3          	bne	s3,s0,14c <fir+0x48>
 168:	40f95913          	srai	s2,s2,0xf
 16c:	012a2023          	sw	s2,0(s4)
 170:	001a8a93          	addi	s5,s5,1
 174:	004a0a13          	addi	s4,s4,4
 178:	00298993          	addi	s3,s3,2
 17c:	fd6a92e3          	bne	s5,s6,140 <fir+0x3c>
 180:	02c12083          	lw	ra,44(sp)
 184:	02812403          	lw	s0,40(sp)
 188:	02412483          	lw	s1,36(sp)
 18c:	02012903          	lw	s2,32(sp)
 190:	01c12983          	lw	s3,28(sp)
 194:	01812a03          	lw	s4,24(sp)
 198:	01412a83          	lw	s5,20(sp)
 19c:	01012b03          	lw	s6,16(sp)
 1a0:	00c12b83          	lw	s7,12(sp)
 1a4:	03010113          	addi	sp,sp,48
 1a8:	00008067          	ret

000001ac <fir_no_red_ld>:
 1ac:	fc010113          	addi	sp,sp,-64
 1b0:	03512223          	sw	s5,36(sp)
 1b4:	03612023          	sw	s6,32(sp)
 1b8:	01712e23          	sw	s7,28(sp)
 1bc:	01812c23          	sw	s8,24(sp)
 1c0:	01912a23          	sw	s9,20(sp)
 1c4:	02112e23          	sw	ra,60(sp)
 1c8:	02812c23          	sw	s0,56(sp)
 1cc:	02912a23          	sw	s1,52(sp)
 1d0:	03212823          	sw	s2,48(sp)
 1d4:	03312623          	sw	s3,44(sp)
 1d8:	03412423          	sw	s4,40(sp)
 1dc:	01a12823          	sw	s10,16(sp)
 1e0:	01b12623          	sw	s11,12(sp)
 1e4:	04250a93          	addi	s5,a0,66
 1e8:	00060b13          	mv	s6,a2
 1ec:	00058c93          	mv	s9,a1
 1f0:	00000b93          	li	s7,0
 1f4:	06400c13          	li	s8,100
 1f8:	fbea9d03          	lh	s10,-66(s5)
 1fc:	fc0a8413          	addi	s0,s5,-64
 200:	000c8993          	mv	s3,s9
 204:	00000493          	li	s1,0
 208:	00000a13          	li	s4,0
 20c:	00099d83          	lh	s11,0(s3)
 210:	000d0513          	mv	a0,s10
 214:	00440413          	addi	s0,s0,4
 218:	000d8593          	mv	a1,s11
 21c:	131000ef          	jal	b4c <__mulsi3>
 220:	ffc41903          	lh	s2,-4(s0)
 224:	01450a33          	add	s4,a0,s4
 228:	000d8513          	mv	a0,s11
 22c:	00090593          	mv	a1,s2
 230:	11d000ef          	jal	b4c <__mulsi3>
 234:	00299d83          	lh	s11,2(s3)
 238:	ffe41d03          	lh	s10,-2(s0)
 23c:	009504b3          	add	s1,a0,s1
 240:	000d8593          	mv	a1,s11
 244:	00090513          	mv	a0,s2
 248:	105000ef          	jal	b4c <__mulsi3>
 24c:	000d8593          	mv	a1,s11
 250:	01450a33          	add	s4,a0,s4
 254:	000d0513          	mv	a0,s10
 258:	0f5000ef          	jal	b4c <__mulsi3>
 25c:	00498993          	addi	s3,s3,4
 260:	009504b3          	add	s1,a0,s1
 264:	fa8a94e3          	bne	s5,s0,20c <fir_no_red_ld+0x60>
 268:	40fa5913          	srai	s2,s4,0xf
 26c:	40f4d493          	srai	s1,s1,0xf
 270:	012b2023          	sw	s2,0(s6)
 274:	009b2223          	sw	s1,4(s6)
 278:	002b8b93          	addi	s7,s7,2
 27c:	008b0b13          	addi	s6,s6,8
 280:	004a8a93          	addi	s5,s5,4
 284:	f78b9ae3          	bne	s7,s8,1f8 <fir_no_red_ld+0x4c>
 288:	03c12083          	lw	ra,60(sp)
 28c:	03812403          	lw	s0,56(sp)
 290:	03412483          	lw	s1,52(sp)
 294:	03012903          	lw	s2,48(sp)
 298:	02c12983          	lw	s3,44(sp)
 29c:	02812a03          	lw	s4,40(sp)
 2a0:	02412a83          	lw	s5,36(sp)
 2a4:	02012b03          	lw	s6,32(sp)
 2a8:	01c12b83          	lw	s7,28(sp)
 2ac:	01812c03          	lw	s8,24(sp)
 2b0:	01412c83          	lw	s9,20(sp)
 2b4:	01012d03          	lw	s10,16(sp)
 2b8:	00c12d83          	lw	s11,12(sp)
 2bc:	04010113          	addi	sp,sp,64
 2c0:	00008067          	ret

000002c4 <iir1>:
 2c4:	fd010113          	addi	sp,sp,-48
 2c8:	01312e23          	sw	s3,28(sp)
 2cc:	00059983          	lh	s3,0(a1)
 2d0:	02812423          	sw	s0,40(sp)
 2d4:	02912223          	sw	s1,36(sp)
 2d8:	01412c23          	sw	s4,24(sp)
 2dc:	01712623          	sw	s7,12(sp)
 2e0:	02112623          	sw	ra,44(sp)
 2e4:	03212023          	sw	s2,32(sp)
 2e8:	01512a23          	sw	s5,20(sp)
 2ec:	01612823          	sw	s6,16(sp)
 2f0:	00050413          	mv	s0,a0
 2f4:	00068493          	mv	s1,a3
 2f8:	00060b93          	mv	s7,a2
 2fc:	19050a13          	addi	s4,a0,400
 300:	0004aa83          	lw	s5,0(s1)
 304:	00441503          	lh	a0,4(s0)
 308:	0044ab03          	lw	s6,4(s1)
 30c:	000a8593          	mv	a1,s5
 310:	03d000ef          	jal	b4c <__mulsi3>
 314:	00050913          	mv	s2,a0
 318:	00641503          	lh	a0,6(s0)
 31c:	000b0593          	mv	a1,s6
 320:	00840413          	addi	s0,s0,8
 324:	029000ef          	jal	b4c <__mulsi3>
 328:	00a90933          	add	s2,s2,a0
 32c:	ff841503          	lh	a0,-8(s0)
 330:	000a8593          	mv	a1,s5
 334:	40f95913          	srai	s2,s2,0xf
 338:	015000ef          	jal	b4c <__mulsi3>
 33c:	013909b3          	add	s3,s2,s3
 340:	00050913          	mv	s2,a0
 344:	ffa41503          	lh	a0,-6(s0)
 348:	000b0593          	mv	a1,s6
 34c:	00848493          	addi	s1,s1,8
 350:	7fc000ef          	jal	b4c <__mulsi3>
 354:	00a90933          	add	s2,s2,a0
 358:	ff34ac23          	sw	s3,-8(s1)
 35c:	40f95913          	srai	s2,s2,0xf
 360:	ff54ae23          	sw	s5,-4(s1)
 364:	013909b3          	add	s3,s2,s3
 368:	f9441ce3          	bne	s0,s4,300 <iir1+0x3c>
 36c:	02c12083          	lw	ra,44(sp)
 370:	02812403          	lw	s0,40(sp)
 374:	013ba023          	sw	s3,0(s7)
 378:	02412483          	lw	s1,36(sp)
 37c:	02012903          	lw	s2,32(sp)
 380:	01c12983          	lw	s3,28(sp)
 384:	01812a03          	lw	s4,24(sp)
 388:	01412a83          	lw	s5,20(sp)
 38c:	01012b03          	lw	s6,16(sp)
 390:	00c12b83          	lw	s7,12(sp)
 394:	03010113          	addi	sp,sp,48
 398:	00008067          	ret

0000039c <jpegdct>:
 39c:	f5010113          	addi	sp,sp,-176
 3a0:	0a812423          	sw	s0,168(sp)
 3a4:	09612823          	sw	s6,144(sp)
 3a8:	09712623          	sw	s7,140(sp)
 3ac:	09812423          	sw	s8,136(sp)
 3b0:	09912223          	sw	s9,132(sp)
 3b4:	09a12023          	sw	s10,128(sp)
 3b8:	07b12e23          	sw	s11,124(sp)
 3bc:	0a112623          	sw	ra,172(sp)
 3c0:	0a912223          	sw	s1,164(sp)
 3c4:	0b212023          	sw	s2,160(sp)
 3c8:	09312e23          	sw	s3,156(sp)
 3cc:	09412c23          	sw	s4,152(sp)
 3d0:	09512a23          	sw	s5,148(sp)
 3d4:	00058413          	mv	s0,a1
 3d8:	00200c93          	li	s9,2
 3dc:	ff800f93          	li	t6,-8
 3e0:	ffc00f13          	li	t5,-4
 3e4:	ffe00c13          	li	s8,-2
 3e8:	00400e93          	li	t4,4
 3ec:	00800e13          	li	t3,8
 3f0:	00000313          	li	t1,0
 3f4:	01000893          	li	a7,16
 3f8:	03010d93          	addi	s11,sp,48
 3fc:	07000d13          	li	s10,112
 400:	00e00b93          	li	s7,14
 404:	00050b13          	mv	s6,a0
 408:	000c0493          	mv	s1,s8
 40c:	00d30993          	addi	s3,t1,13
 410:	017b0933          	add	s2,s6,s7
 414:	03f12223          	sw	t6,36(sp)
 418:	03e12423          	sw	t5,40(sp)
 41c:	03d12623          	sw	t4,44(sp)
 420:	03c12823          	sw	t3,48(sp)
 424:	00030793          	mv	a5,t1
 428:	03a12a23          	sw	s10,52(sp)
 42c:	03712c23          	sw	s7,56(sp)
 430:	00800613          	li	a2,8
 434:	000b0a93          	mv	s5,s6
 438:	00088c13          	mv	s8,a7
 43c:	03612e23          	sw	s6,60(sp)
 440:	04010e13          	addi	t3,sp,64
 444:	000a8e93          	mv	t4,s5
 448:	000e0513          	mv	a0,t3
 44c:	00090813          	mv	a6,s2
 450:	000e9703          	lh	a4,0(t4)
 454:	00081683          	lh	a3,0(a6)
 458:	ffc50513          	addi	a0,a0,-4
 45c:	019e8eb3          	add	t4,t4,s9
 460:	00d705b3          	add	a1,a4,a3
 464:	00be2023          	sw	a1,0(t3)
 468:	40d70733          	sub	a4,a4,a3
 46c:	02e52023          	sw	a4,32(a0)
 470:	00980833          	add	a6,a6,s1
 474:	004e0e13          	addi	t3,t3,4
 478:	fdb51ce3          	bne	a0,s11,450 <jpegdct+0xb4>
 47c:	04c12803          	lw	a6,76(sp)
 480:	04812583          	lw	a1,72(sp)
 484:	04012d03          	lw	s10,64(sp)
 488:	04412b83          	lw	s7,68(sp)
 48c:	00f12e23          	sw	a5,28(sp)
 490:	010d0533          	add	a0,s10,a6
 494:	410d0d33          	sub	s10,s10,a6
 498:	00bb8833          	add	a6,s7,a1
 49c:	40bb8bb3          	sub	s7,s7,a1
 4a0:	010505b3          	add	a1,a0,a6
 4a4:	41050533          	sub	a0,a0,a6
 4a8:	40f5d5b3          	sra	a1,a1,a5
 4ac:	40f55533          	sra	a0,a0,a5
 4b0:	03012783          	lw	a5,48(sp)
 4b4:	00ba9023          	sh	a1,0(s5)
 4b8:	02c12023          	sw	a2,32(sp)
 4bc:	00fa85b3          	add	a1,s5,a5
 4c0:	00a59023          	sh	a0,0(a1)
 4c4:	01441583          	lh	a1,20(s0)
 4c8:	01ab8533          	add	a0,s7,s10
 4cc:	01051513          	slli	a0,a0,0x10
 4d0:	41055513          	srai	a0,a0,0x10
 4d4:	678000ef          	jal	b4c <__mulsi3>
 4d8:	02c12783          	lw	a5,44(sp)
 4dc:	00050a13          	mv	s4,a0
 4e0:	01241503          	lh	a0,18(s0)
 4e4:	000d0593          	mv	a1,s10
 4e8:	00fa8d33          	add	s10,s5,a5
 4ec:	660000ef          	jal	b4c <__mulsi3>
 4f0:	41355533          	sra	a0,a0,s3
 4f4:	00aa0533          	add	a0,s4,a0
 4f8:	00ad1023          	sh	a0,0(s10)
 4fc:	01641503          	lh	a0,22(s0)
 500:	000b8593          	mv	a1,s7
 504:	00990bb3          	add	s7,s2,s1
 508:	644000ef          	jal	b4c <__mulsi3>
 50c:	05c12d03          	lw	s10,92(sp)
 510:	05015f03          	lhu	t5,80(sp)
 514:	41355533          	sra	a0,a0,s3
 518:	00aa0a33          	add	s4,s4,a0
 51c:	010d1813          	slli	a6,s10,0x10
 520:	01085813          	srli	a6,a6,0x10
 524:	014b9023          	sh	s4,0(s7)
 528:	010f0533          	add	a0,t5,a6
 52c:	00441583          	lh	a1,4(s0)
 530:	01051513          	slli	a0,a0,0x10
 534:	41055513          	srai	a0,a0,0x10
 538:	01012c23          	sw	a6,24(sp)
 53c:	01e12a23          	sw	t5,20(sp)
 540:	60c000ef          	jal	b4c <__mulsi3>
 544:	05412b03          	lw	s6,84(sp)
 548:	05815e03          	lhu	t3,88(sp)
 54c:	00041583          	lh	a1,0(s0)
 550:	010b1e93          	slli	t4,s6,0x10
 554:	010ede93          	srli	t4,t4,0x10
 558:	00050a13          	mv	s4,a0
 55c:	04a12023          	sw	a0,64(sp)
 560:	01ce8533          	add	a0,t4,t3
 564:	01051513          	slli	a0,a0,0x10
 568:	41055513          	srai	a0,a0,0x10
 56c:	01c12823          	sw	t3,16(sp)
 570:	01d12623          	sw	t4,12(sp)
 574:	5d8000ef          	jal	b4c <__mulsi3>
 578:	05012283          	lw	t0,80(sp)
 57c:	05812383          	lw	t2,88(sp)
 580:	016d0b33          	add	s6,s10,s6
 584:	00050b93          	mv	s7,a0
 588:	007283b3          	add	t2,t0,t2
 58c:	01638533          	add	a0,t2,s6
 590:	01041583          	lh	a1,16(s0)
 594:	01051513          	slli	a0,a0,0x10
 598:	41055513          	srai	a0,a0,0x10
 59c:	00712423          	sw	t2,8(sp)
 5a0:	05712223          	sw	s7,68(sp)
 5a4:	5a8000ef          	jal	b4c <__mulsi3>
 5a8:	00811583          	lh	a1,8(sp)
 5ac:	00050d13          	mv	s10,a0
 5b0:	00241503          	lh	a0,2(s0)
 5b4:	598000ef          	jal	b4c <__mulsi3>
 5b8:	010b1593          	slli	a1,s6,0x10
 5bc:	01a50b33          	add	s6,a0,s10
 5c0:	00641503          	lh	a0,6(s0)
 5c4:	4105d593          	srai	a1,a1,0x10
 5c8:	05612423          	sw	s6,72(sp)
 5cc:	580000ef          	jal	b4c <__mulsi3>
 5d0:	01a50d33          	add	s10,a0,s10
 5d4:	00845583          	lhu	a1,8(s0)
 5d8:	01412503          	lw	a0,20(sp)
 5dc:	05a12623          	sw	s10,76(sp)
 5e0:	56c000ef          	jal	b4c <__mulsi3>
 5e4:	00aa05b3          	add	a1,s4,a0
 5e8:	00bb05b3          	add	a1,s6,a1
 5ec:	01059593          	slli	a1,a1,0x10
 5f0:	4105d593          	srai	a1,a1,0x10
 5f4:	4135d5b3          	sra	a1,a1,s3
 5f8:	02812783          	lw	a5,40(sp)
 5fc:	00b91023          	sh	a1,0(s2)
 600:	00c45583          	lhu	a1,12(s0)
 604:	00c12503          	lw	a0,12(sp)
 608:	00f90eb3          	add	t4,s2,a5
 60c:	01d12623          	sw	t4,12(sp)
 610:	53c000ef          	jal	b4c <__mulsi3>
 614:	00ab85b3          	add	a1,s7,a0
 618:	00bd05b3          	add	a1,s10,a1
 61c:	00c12e83          	lw	t4,12(sp)
 620:	01059593          	slli	a1,a1,0x10
 624:	4105d593          	srai	a1,a1,0x10
 628:	4135d5b3          	sra	a1,a1,s3
 62c:	02412783          	lw	a5,36(sp)
 630:	00be9023          	sh	a1,0(t4)
 634:	00a45583          	lhu	a1,10(s0)
 638:	01012503          	lw	a0,16(sp)
 63c:	00f90e33          	add	t3,s2,a5
 640:	01c12423          	sw	t3,8(sp)
 644:	508000ef          	jal	b4c <__mulsi3>
 648:	00ab8bb3          	add	s7,s7,a0
 64c:	017b0fb3          	add	t6,s6,s7
 650:	00812e03          	lw	t3,8(sp)
 654:	010f9f93          	slli	t6,t6,0x10
 658:	410fdf93          	srai	t6,t6,0x10
 65c:	413fdfb3          	sra	t6,t6,s3
 660:	01fe1023          	sh	t6,0(t3)
 664:	00e45583          	lhu	a1,14(s0)
 668:	01812503          	lw	a0,24(sp)
 66c:	019a8bb3          	add	s7,s5,s9
 670:	01890933          	add	s2,s2,s8
 674:	4d8000ef          	jal	b4c <__mulsi3>
 678:	02012603          	lw	a2,32(sp)
 67c:	00aa0a33          	add	s4,s4,a0
 680:	014d0d33          	add	s10,s10,s4
 684:	010d1d13          	slli	s10,s10,0x10
 688:	410d5d13          	srai	s10,s10,0x10
 68c:	fff60613          	addi	a2,a2,-1
 690:	01061613          	slli	a2,a2,0x10
 694:	413d5d33          	sra	s10,s10,s3
 698:	01065613          	srli	a2,a2,0x10
 69c:	01ab9023          	sh	s10,0(s7)
 6a0:	01c12783          	lw	a5,28(sp)
 6a4:	018a8ab3          	add	s5,s5,s8
 6a8:	d8061ce3          	bnez	a2,440 <jpegdct+0xa4>
 6ac:	03c12b03          	lw	s6,60(sp)
 6b0:	03412d03          	lw	s10,52(sp)
 6b4:	02412f83          	lw	t6,36(sp)
 6b8:	02812f03          	lw	t5,40(sp)
 6bc:	02c12e83          	lw	t4,44(sp)
 6c0:	03012e03          	lw	t3,48(sp)
 6c4:	03812b83          	lw	s7,56(sp)
 6c8:	018b0b33          	add	s6,s6,s8
 6cc:	01ab0b33          	add	s6,s6,s10
 6d0:	00378313          	addi	t1,a5,3
 6d4:	00e00793          	li	a5,14
 6d8:	ff2c0893          	addi	a7,s8,-14
 6dc:	f80b0b13          	addi	s6,s6,-128
 6e0:	f9ed0d13          	addi	s10,s10,-98
 6e4:	038e0e13          	addi	t3,t3,56
 6e8:	01ce8e93          	addi	t4,t4,28
 6ec:	ff248c13          	addi	s8,s1,-14
 6f0:	fe4f0f13          	addi	t5,t5,-28
 6f4:	fc8f8f93          	addi	t6,t6,-56
 6f8:	00ec8c93          	addi	s9,s9,14
 6fc:	00fb9663          	bne	s7,a5,708 <jpegdct+0x36c>
 700:	07000b93          	li	s7,112
 704:	d05ff06f          	j	408 <jpegdct+0x6c>
 708:	0ac12083          	lw	ra,172(sp)
 70c:	0a812403          	lw	s0,168(sp)
 710:	0a412483          	lw	s1,164(sp)
 714:	0a012903          	lw	s2,160(sp)
 718:	09c12983          	lw	s3,156(sp)
 71c:	09812a03          	lw	s4,152(sp)
 720:	09412a83          	lw	s5,148(sp)
 724:	09012b03          	lw	s6,144(sp)
 728:	08c12b83          	lw	s7,140(sp)
 72c:	08812c03          	lw	s8,136(sp)
 730:	08412c83          	lw	s9,132(sp)
 734:	08012d03          	lw	s10,128(sp)
 738:	07c12d83          	lw	s11,124(sp)
 73c:	0b010113          	addi	sp,sp,176
 740:	00008067          	ret

00000744 <benchmark_body.isra.0>:
 744:	30058e63          	beqz	a1,a60 <benchmark_body.isra.0+0x31c>
 748:	c7010113          	addi	sp,sp,-912
 74c:	37a12023          	sw	s10,864(sp)
 750:	35b12e23          	sw	s11,860(sp)
 754:	00001d37          	lui	s10,0x1
 758:	00001db7          	lui	s11,0x1
 75c:	190d0713          	addi	a4,s10,400 # 1190 <__mulsi3+0x644>
 760:	000d8793          	mv	a5,s11
 764:	00f12e23          	sw	a5,28(sp)
 768:	000016b7          	lui	a3,0x1
 76c:	00e12a23          	sw	a4,20(sp)
 770:	0000b7b7          	lui	a5,0xb
 774:	00002737          	lui	a4,0x2
 778:	38812423          	sw	s0,904(sp)
 77c:	38912223          	sw	s1,900(sp)
 780:	39212023          	sw	s2,896(sp)
 784:	37412c23          	sw	s4,888(sp)
 788:	37512a23          	sw	s5,884(sp)
 78c:	37612823          	sw	s6,880(sp)
 790:	00002ab7          	lui	s5,0x2
 794:	00002937          	lui	s2,0x2
 798:	000024b7          	lui	s1,0x2
 79c:	00002437          	lui	s0,0x2
 7a0:	00002a37          	lui	s4,0x2
 7a4:	afc70b13          	addi	s6,a4,-1284 # 1afc <a>
 7a8:	aaa78793          	addi	a5,a5,-1366 # aaaa <__stack_top+0x2baa>
 7ac:	7d068713          	addi	a4,a3,2000 # 17d0 <output+0x190>
 7b0:	37912223          	sw	s9,868(sp)
 7b4:	38112623          	sw	ra,908(sp)
 7b8:	37312e23          	sw	s3,892(sp)
 7bc:	37712623          	sw	s7,876(sp)
 7c0:	37812423          	sw	s8,872(sp)
 7c4:	02b12223          	sw	a1,36(sp)
 7c8:	96ca8a93          	addi	s5,s5,-1684 # 196c <b>
 7cc:	afc90913          	addi	s2,s2,-1284 # 1afc <a>
 7d0:	c2848493          	addi	s1,s1,-984 # 1c28 <a+0x12c>
 7d4:	a9840413          	addi	s0,s0,-1384 # 1a98 <b+0x12c>
 7d8:	afaa0a13          	addi	s4,s4,-1286 # 1afa <b+0x18e>
 7dc:	02e12023          	sw	a4,32(sp)
 7e0:	00f12c23          	sw	a5,24(sp)
 7e4:	00000c93          	li	s9,0
 7e8:	00050d13          	mv	s10,a0
 7ec:	02412b83          	lw	s7,36(sp)
 7f0:	00000993          	li	s3,0
 7f4:	03912423          	sw	s9,40(sp)
 7f8:	03a12623          	sw	s10,44(sp)
 7fc:	01c12783          	lw	a5,28(sp)
 800:	03010713          	addi	a4,sp,48
 804:	0007a603          	lw	a2,0(a5)
 808:	0047a683          	lw	a3,4(a5)
 80c:	01078793          	addi	a5,a5,16
 810:	00c72023          	sw	a2,0(a4)
 814:	00d72223          	sw	a3,4(a4)
 818:	ff87a603          	lw	a2,-8(a5)
 81c:	ffc7a683          	lw	a3,-4(a5)
 820:	01070713          	addi	a4,a4,16
 824:	fec72c23          	sw	a2,-8(a4)
 828:	fed72e23          	sw	a3,-4(a4)
 82c:	01412683          	lw	a3,20(sp)
 830:	fcd79ae3          	bne	a5,a3,804 <benchmark_body.isra.0+0xc0>
 834:	1c010713          	addi	a4,sp,448
 838:	0047a683          	lw	a3,4(a5)
 83c:	0007a603          	lw	a2,0(a5)
 840:	01078793          	addi	a5,a5,16
 844:	00d72223          	sw	a3,4(a4)
 848:	ffc7a683          	lw	a3,-4(a5)
 84c:	00c72023          	sw	a2,0(a4)
 850:	ff87a603          	lw	a2,-8(a5)
 854:	00d72623          	sw	a3,12(a4)
 858:	000016b7          	lui	a3,0x1
 85c:	00c72423          	sw	a2,8(a4)
 860:	32068693          	addi	a3,a3,800 # 1320 <__mulsi3+0x7d4>
 864:	01070713          	addi	a4,a4,16
 868:	fcd798e3          	bne	a5,a3,838 <benchmark_body.isra.0+0xf4>
 86c:	1c010613          	addi	a2,sp,448
 870:	03010693          	addi	a3,sp,48
 874:	000b0713          	mv	a4,s6
 878:	000a8793          	mv	a5,s5
 87c:	0006a503          	lw	a0,0(a3)
 880:	00062583          	lw	a1,0(a2)
 884:	00478793          	addi	a5,a5,4
 888:	00a72023          	sw	a0,0(a4)
 88c:	feb7ae23          	sw	a1,-4(a5)
 890:	00468693          	addi	a3,a3,4
 894:	00460613          	addi	a2,a2,4
 898:	00470713          	addi	a4,a4,4
 89c:	fef910e3          	bne	s2,a5,87c <benchmark_body.isra.0+0x138>
 8a0:	000a8693          	mv	a3,s5
 8a4:	000b0713          	mv	a4,s6
 8a8:	00069603          	lh	a2,0(a3)
 8ac:	00075583          	lhu	a1,0(a4)
 8b0:	00270713          	addi	a4,a4,2
 8b4:	00161793          	slli	a5,a2,0x1
 8b8:	00c787b3          	add	a5,a5,a2
 8bc:	40f7d793          	srai	a5,a5,0xf
 8c0:	00b787b3          	add	a5,a5,a1
 8c4:	fef71f23          	sh	a5,-2(a4)
 8c8:	00268693          	addi	a3,a3,2
 8cc:	fce49ee3          	bne	s1,a4,8a8 <benchmark_body.isra.0+0x164>
 8d0:	000017b7          	lui	a5,0x1
 8d4:	6407ad03          	lw	s10,1600(a5) # 1640 <output>
 8d8:	000b8c93          	mv	s9,s7
 8dc:	000b0d93          	mv	s11,s6
 8e0:	000a8c13          	mv	s8,s5
 8e4:	01312623          	sw	s3,12(sp)
 8e8:	00300b93          	li	s7,3
 8ec:	000c1983          	lh	s3,0(s8)
 8f0:	000d9503          	lh	a0,0(s11) # 1000 <__mulsi3+0x4b4>
 8f4:	002c0c13          	addi	s8,s8,2
 8f8:	00098593          	mv	a1,s3
 8fc:	250000ef          	jal	b4c <__mulsi3>
 900:	00098593          	mv	a1,s3
 904:	00ad0d33          	add	s10,s10,a0
 908:	00098513          	mv	a0,s3
 90c:	240000ef          	jal	b4c <__mulsi3>
 910:	002d8d93          	addi	s11,s11,2
 914:	00ab8bb3          	add	s7,s7,a0
 918:	fd841ae3          	bne	s0,s8,8ec <benchmark_body.isra.0+0x1a8>
 91c:	00001c37          	lui	s8,0x1
 920:	000c8793          	mv	a5,s9
 924:	640c0613          	addi	a2,s8,1600 # 1640 <output>
 928:	000b8c93          	mv	s9,s7
 92c:	000a8593          	mv	a1,s5
 930:	00078b93          	mv	s7,a5
 934:	000b0513          	mv	a0,s6
 938:	000027b7          	lui	a5,0x2
 93c:	97979423          	sh	s9,-1688(a5) # 1968 <c>
 940:	65ac2023          	sw	s10,1600(s8)
 944:	00c12983          	lw	s3,12(sp)
 948:	fbcff0ef          	jal	104 <fir>
 94c:	640c0613          	addi	a2,s8,1600
 950:	000a8593          	mv	a1,s5
 954:	000b0513          	mv	a0,s6
 958:	855ff0ef          	jal	1ac <fir_no_red_ld>
 95c:	0c6a9583          	lh	a1,198(s5)
 960:	0c6b1503          	lh	a0,198(s6)
 964:	1e8000ef          	jal	b4c <__mulsi3>
 968:	01812783          	lw	a5,24(sp)
 96c:	01312623          	sw	s3,12(sp)
 970:	01712823          	sw	s7,16(sp)
 974:	40a78c33          	sub	s8,a5,a0
 978:	000027b7          	lui	a5,0x2
 97c:	bc078d13          	addi	s10,a5,-1088 # 1bc0 <a+0xc4>
 980:	000027b7          	lui	a5,0x2
 984:	a3078c93          	addi	s9,a5,-1488 # 1a30 <b+0xc4>
 988:	000d1983          	lh	s3,0(s10)
 98c:	000c9b83          	lh	s7,0(s9)
 990:	ffed0d13          	addi	s10,s10,-2
 994:	00098513          	mv	a0,s3
 998:	000b8593          	mv	a1,s7
 99c:	1b0000ef          	jal	b4c <__mulsi3>
 9a0:	40ac0c33          	sub	s8,s8,a0
 9a4:	410c5d93          	srai	s11,s8,0x10
 9a8:	000b8513          	mv	a0,s7
 9ac:	000d8593          	mv	a1,s11
 9b0:	19c000ef          	jal	b4c <__mulsi3>
 9b4:	41055513          	srai	a0,a0,0x10
 9b8:	01350533          	add	a0,a0,s3
 9bc:	00ad1223          	sh	a0,4(s10)
 9c0:	ffec8c93          	addi	s9,s9,-2
 9c4:	fdaa12e3          	bne	s4,s10,988 <benchmark_body.isra.0+0x244>
 9c8:	02012603          	lw	a2,32(sp)
 9cc:	000027b7          	lui	a5,0x2
 9d0:	00c12983          	lw	s3,12(sp)
 9d4:	afb79e23          	sh	s11,-1284(a5) # 1afc <a>
 9d8:	000017b7          	lui	a5,0x1
 9dc:	64078693          	addi	a3,a5,1600 # 1640 <output>
 9e0:	000a8593          	mv	a1,s5
 9e4:	000027b7          	lui	a5,0x2
 9e8:	000b0513          	mv	a0,s6
 9ec:	01012b83          	lw	s7,16(sp)
 9f0:	9787a223          	sw	s8,-1692(a5) # 1964 <d>
 9f4:	8d1ff0ef          	jal	2c4 <iir1>
 9f8:	000027b7          	lui	a5,0x2
 9fc:	000a8593          	mv	a1,s5
 a00:	000b0513          	mv	a0,s6
 a04:	00198993          	addi	s3,s3,1
 a08:	9787a023          	sw	s8,-1696(a5) # 1960 <e>
 a0c:	991ff0ef          	jal	39c <jpegdct>
 a10:	df7996e3          	bne	s3,s7,7fc <benchmark_body.isra.0+0xb8>
 a14:	02812c83          	lw	s9,40(sp)
 a18:	02c12d03          	lw	s10,44(sp)
 a1c:	001c8c93          	addi	s9,s9,1
 a20:	dd9d16e3          	bne	s10,s9,7ec <benchmark_body.isra.0+0xa8>
 a24:	38c12083          	lw	ra,908(sp)
 a28:	38812403          	lw	s0,904(sp)
 a2c:	38412483          	lw	s1,900(sp)
 a30:	38012903          	lw	s2,896(sp)
 a34:	37c12983          	lw	s3,892(sp)
 a38:	37812a03          	lw	s4,888(sp)
 a3c:	37412a83          	lw	s5,884(sp)
 a40:	37012b03          	lw	s6,880(sp)
 a44:	36c12b83          	lw	s7,876(sp)
 a48:	36812c03          	lw	s8,872(sp)
 a4c:	36412c83          	lw	s9,868(sp)
 a50:	36012d03          	lw	s10,864(sp)
 a54:	35c12d83          	lw	s11,860(sp)
 a58:	39010113          	addi	sp,sp,912
 a5c:	00008067          	ret
 a60:	00008067          	ret

00000a64 <initialise_benchmark>:
 a64:	00008067          	ret

00000a68 <warm_caches>:
 a68:	00050593          	mv	a1,a0
 a6c:	00100513          	li	a0,1
 a70:	cd5ff06f          	j	744 <benchmark_body.isra.0>

00000a74 <benchmark>:
 a74:	ff010113          	addi	sp,sp,-16
 a78:	00200513          	li	a0,2
 a7c:	00100593          	li	a1,1
 a80:	00112623          	sw	ra,12(sp)
 a84:	cc1ff0ef          	jal	744 <benchmark_body.isra.0>
 a88:	00c12083          	lw	ra,12(sp)
 a8c:	00000513          	li	a0,0
 a90:	01010113          	addi	sp,sp,16
 a94:	00008067          	ret

00000a98 <verify_benchmark>:
 a98:	00001737          	lui	a4,0x1
 a9c:	00070713          	mv	a4,a4
 aa0:	cd010113          	addi	sp,sp,-816
 aa4:	32070793          	addi	a5,a4,800 # 1320 <__mulsi3+0x7d4>
 aa8:	64070693          	addi	a3,a4,1600
 aac:	32112623          	sw	ra,812(sp)
 ab0:	00010713          	mv	a4,sp
 ab4:	0007a803          	lw	a6,0(a5)
 ab8:	0047a503          	lw	a0,4(a5)
 abc:	0087a583          	lw	a1,8(a5)
 ac0:	00c7a603          	lw	a2,12(a5)
 ac4:	01072023          	sw	a6,0(a4)
 ac8:	00a72223          	sw	a0,4(a4)
 acc:	00b72423          	sw	a1,8(a4)
 ad0:	00c72623          	sw	a2,12(a4)
 ad4:	01078793          	addi	a5,a5,16
 ad8:	01070713          	addi	a4,a4,16
 adc:	fcd79ce3          	bne	a5,a3,ab4 <verify_benchmark+0x1c>
 ae0:	00001537          	lui	a0,0x1
 ae4:	00010593          	mv	a1,sp
 ae8:	64050513          	addi	a0,a0,1600 # 1640 <output>
 aec:	32000613          	li	a2,800
 af0:	de0ff0ef          	jal	d0 <memcmp>
 af4:	00050a63          	beqz	a0,b08 <verify_benchmark+0x70>
 af8:	00000513          	li	a0,0
 afc:	32c12083          	lw	ra,812(sp)
 b00:	33010113          	addi	sp,sp,816
 b04:	00008067          	ret
 b08:	000027b7          	lui	a5,0x2
 b0c:	96879703          	lh	a4,-1688(a5) # 1968 <c>
 b10:	000037b7          	lui	a5,0x3
 b14:	80378793          	addi	a5,a5,-2045 # 2803 <__bss_end+0xb77>
 b18:	fef712e3          	bne	a4,a5,afc <verify_benchmark+0x64>
 b1c:	000027b7          	lui	a5,0x2
 b20:	9647a703          	lw	a4,-1692(a5) # 1964 <d>
 b24:	e5a967b7          	lui	a5,0xe5a96
 b28:	9ea78793          	addi	a5,a5,-1558 # e5a959ea <__stack_top+0xe5a8daea>
 b2c:	fcf718e3          	bne	a4,a5,afc <verify_benchmark+0x64>
 b30:	000027b7          	lui	a5,0x2
 b34:	9607a503          	lw	a0,-1696(a5) # 1960 <e>
 b38:	1a56a7b7          	lui	a5,0x1a56a
 b3c:	61678793          	addi	a5,a5,1558 # 1a56a616 <__stack_top+0x1a562716>
 b40:	00f50533          	add	a0,a0,a5
 b44:	00153513          	seqz	a0,a0
 b48:	fb5ff06f          	j	afc <verify_benchmark+0x64>

00000b4c <__mulsi3>:
 b4c:	00050613          	mv	a2,a0
 b50:	00000513          	li	a0,0
 b54:	0015f693          	andi	a3,a1,1
 b58:	00068463          	beqz	a3,b60 <__mulsi3+0x14>
 b5c:	00c50533          	add	a0,a0,a2
 b60:	0015d593          	srli	a1,a1,0x1
 b64:	00161613          	slli	a2,a2,0x1
 b68:	fe0596e3          	bnez	a1,b54 <__mulsi3+0x8>
 b6c:	00008067          	ret
