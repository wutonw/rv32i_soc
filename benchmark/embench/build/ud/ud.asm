
D:\aaa1verilog_project\rv32i_cpu\benchmark\embench\build\ud\ud.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00008117          	auipc	sp,0x8
   4:	f0010113          	addi	sp,sp,-256 # 7f00 <__stack_top>
   8:	00001297          	auipc	t0,0x1
   c:	04828293          	addi	t0,t0,72 # 1050 <chkerr>
  10:	00001317          	auipc	t1,0x1
  14:	72430313          	addi	t1,t1,1828 # 1734 <__bss_end>
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
  78:	104000ef          	jal	17c <initialise_benchmark>
  7c:	00000513          	li	a0,0
  80:	628000ef          	jal	6a8 <warm_caches>
  84:	fadff0ef          	jal	30 <start_trigger>
  88:	62c000ef          	jal	6b4 <benchmark>
  8c:	00a12623          	sw	a0,12(sp)
  90:	fb5ff0ef          	jal	44 <stop_trigger>
  94:	00c12503          	lw	a0,12(sp)
  98:	06c000ef          	jal	104 <verify_benchmark>
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

00000104 <verify_benchmark>:
 104:	000017b7          	lui	a5,0x1
 108:	f9010113          	addi	sp,sp,-112
 10c:	00078793          	mv	a5,a5
 110:	06112623          	sw	ra,108(sp)
 114:	00050313          	mv	t1,a0
 118:	05078693          	addi	a3,a5,80 # 1050 <chkerr>
 11c:	01010713          	addi	a4,sp,16
 120:	0007a883          	lw	a7,0(a5)
 124:	0047a803          	lw	a6,4(a5)
 128:	0087a583          	lw	a1,8(a5)
 12c:	00c7a603          	lw	a2,12(a5)
 130:	01172023          	sw	a7,0(a4)
 134:	01072223          	sw	a6,4(a4)
 138:	00b72423          	sw	a1,8(a4)
 13c:	00c72623          	sw	a2,12(a4)
 140:	01078793          	addi	a5,a5,16
 144:	01070713          	addi	a4,a4,16
 148:	fcd79ce3          	bne	a5,a3,120 <verify_benchmark+0x1c>
 14c:	00001537          	lui	a0,0x1
 150:	01010593          	addi	a1,sp,16
 154:	05450513          	addi	a0,a0,84 # 1054 <x>
 158:	05000613          	li	a2,80
 15c:	00612623          	sw	t1,12(sp)
 160:	f71ff0ef          	jal	d0 <memcmp>
 164:	00c12303          	lw	t1,12(sp)
 168:	06c12083          	lw	ra,108(sp)
 16c:	00656533          	or	a0,a0,t1
 170:	00153513          	seqz	a0,a0
 174:	07010113          	addi	sp,sp,112
 178:	00008067          	ret

0000017c <initialise_benchmark>:
 17c:	00008067          	ret

00000180 <ludcmp>:
 180:	000017b7          	lui	a5,0x1
 184:	e0010113          	addi	sp,sp,-512
 188:	0a478713          	addi	a4,a5,164 # 10a4 <b>
 18c:	02e12623          	sw	a4,44(sp)
 190:	00072703          	lw	a4,0(a4)
 194:	1e112e23          	sw	ra,508(sp)
 198:	1e812c23          	sw	s0,504(sp)
 19c:	00b12823          	sw	a1,16(sp)
 1a0:	02e12423          	sw	a4,40(sp)
 1a4:	38b05063          	blez	a1,524 <ludcmp+0x3a4>
 1a8:	00259793          	slli	a5,a1,0x2
 1ac:	02f12023          	sw	a5,32(sp)
 1b0:	000017b7          	lui	a5,0x1
 1b4:	02012703          	lw	a4,32(sp)
 1b8:	0f478793          	addi	a5,a5,244 # 10f4 <a>
 1bc:	02f12223          	sw	a5,36(sp)
 1c0:	05078793          	addi	a5,a5,80
 1c4:	00f12a23          	sw	a5,20(sp)
 1c8:	02412783          	lw	a5,36(sp)
 1cc:	1e912a23          	sw	s1,500(sp)
 1d0:	00b704b3          	add	s1,a4,a1
 1d4:	00449493          	slli	s1,s1,0x4
 1d8:	009784b3          	add	s1,a5,s1
 1dc:	00070793          	mv	a5,a4
 1e0:	01412703          	lw	a4,20(sp)
 1e4:	02412403          	lw	s0,36(sp)
 1e8:	1f312623          	sw	s3,492(sp)
 1ec:	00e789b3          	add	s3,a5,a4
 1f0:	fb000793          	li	a5,-80
 1f4:	1f212823          	sw	s2,496(sp)
 1f8:	1f612023          	sw	s6,480(sp)
 1fc:	1f412423          	sw	s4,488(sp)
 200:	1f512223          	sw	s5,484(sp)
 204:	1d712e23          	sw	s7,476(sp)
 208:	1d812c23          	sw	s8,472(sp)
 20c:	1d912a23          	sw	s9,468(sp)
 210:	1da12823          	sw	s10,464(sp)
 214:	1db12623          	sw	s11,460(sp)
 218:	00070913          	mv	s2,a4
 21c:	00b12623          	sw	a1,12(sp)
 220:	00f12e23          	sw	a5,28(sp)
 224:	00012c23          	sw	zero,24(sp)
 228:	00000b13          	li	s6,0
 22c:	01012783          	lw	a5,16(sp)
 230:	001b0b13          	addi	s6,s6,1
 234:	1567c263          	blt	a5,s6,378 <ludcmp+0x1f8>
 238:	01812783          	lw	a5,24(sp)
 23c:	05042d83          	lw	s11,80(s0)
 240:	00040a13          	mv	s4,s0
 244:	06078463          	beqz	a5,2ac <ludcmp+0x12c>
 248:	41600ab3          	neg	s5,s6
 24c:	000017b7          	lui	a5,0x1
 250:	002a9a93          	slli	s5,s5,0x2
 254:	0f078793          	addi	a5,a5,240 # 10f0 <b+0x4c>
 258:	41578c33          	sub	s8,a5,s5
 25c:	00040b93          	mv	s7,s0
 260:	054a8a93          	addi	s5,s5,84
 264:	017a8cb3          	add	s9,s5,s7
 268:	000c0d13          	mv	s10,s8
 26c:	000d2583          	lw	a1,0(s10)
 270:	000ca503          	lw	a0,0(s9)
 274:	050d0d13          	addi	s10,s10,80
 278:	004c8c93          	addi	s9,s9,4
 27c:	444000ef          	jal	6c0 <__mulsi3>
 280:	40ad8db3          	sub	s11,s11,a0
 284:	fe8d14e3          	bne	s10,s0,26c <ludcmp+0xec>
 288:	00042583          	lw	a1,0(s0)
 28c:	000d8513          	mv	a0,s11
 290:	050b8b93          	addi	s7,s7,80
 294:	450000ef          	jal	6e4 <__divsi3>
 298:	04aa2823          	sw	a0,80(s4)
 29c:	069b8263          	beq	s7,s1,300 <ludcmp+0x180>
 2a0:	050bad83          	lw	s11,80(s7)
 2a4:	000b8a13          	mv	s4,s7
 2a8:	fbdff06f          	j	264 <ludcmp+0xe4>
 2ac:	00042583          	lw	a1,0(s0)
 2b0:	000d8513          	mv	a0,s11
 2b4:	00040a93          	mv	s5,s0
 2b8:	42c000ef          	jal	6e4 <__divsi3>
 2bc:	04aa2823          	sw	a0,80(s4)
 2c0:	050a8a13          	addi	s4,s5,80
 2c4:	03448e63          	beq	s1,s4,300 <ludcmp+0x180>
 2c8:	0a0aa503          	lw	a0,160(s5)
 2cc:	00042583          	lw	a1,0(s0)
 2d0:	0a0a8a93          	addi	s5,s5,160
 2d4:	410000ef          	jal	6e4 <__divsi3>
 2d8:	04aa2823          	sw	a0,80(s4)
 2dc:	029a8263          	beq	s5,s1,300 <ludcmp+0x180>
 2e0:	050aad83          	lw	s11,80(s5)
 2e4:	00042583          	lw	a1,0(s0)
 2e8:	000a8a13          	mv	s4,s5
 2ec:	000d8513          	mv	a0,s11
 2f0:	3f4000ef          	jal	6e4 <__divsi3>
 2f4:	04aa2823          	sw	a0,80(s4)
 2f8:	050a8a13          	addi	s4,s5,80
 2fc:	fd4496e3          	bne	s1,s4,2c8 <ludcmp+0x148>
 300:	01c12783          	lw	a5,28(sp)
 304:	05040a93          	addi	s5,s0,80
 308:	05440413          	addi	s0,s0,84
 30c:	00040a13          	mv	s4,s0
 310:	00478b93          	addi	s7,a5,4
 314:	004aad83          	lw	s11,4(s5)
 318:	015b8c33          	add	s8,s7,s5
 31c:	00090d13          	mv	s10,s2
 320:	000c2583          	lw	a1,0(s8)
 324:	000d2503          	lw	a0,0(s10)
 328:	050c0c13          	addi	s8,s8,80
 32c:	004d0d13          	addi	s10,s10,4
 330:	390000ef          	jal	6c0 <__mulsi3>
 334:	40ad8db3          	sub	s11,s11,a0
 338:	ff4c14e3          	bne	s8,s4,320 <ludcmp+0x1a0>
 33c:	01baa223          	sw	s11,4(s5)
 340:	004a8a93          	addi	s5,s5,4
 344:	004c0a13          	addi	s4,s8,4
 348:	fd3a96e3          	bne	s5,s3,314 <ludcmp+0x194>
 34c:	01812783          	lw	a5,24(sp)
 350:	05098993          	addi	s3,s3,80
 354:	05090913          	addi	s2,s2,80
 358:	00178793          	addi	a5,a5,1
 35c:	00f12c23          	sw	a5,24(sp)
 360:	01c12783          	lw	a5,28(sp)
 364:	00448493          	addi	s1,s1,4
 368:	fb078793          	addi	a5,a5,-80
 36c:	00f12e23          	sw	a5,28(sp)
 370:	01012783          	lw	a5,16(sp)
 374:	eb679ce3          	bne	a5,s6,22c <ludcmp+0xac>
 378:	02812783          	lw	a5,40(sp)
 37c:	03410993          	addi	s3,sp,52
 380:	03010a13          	addi	s4,sp,48
 384:	02f12823          	sw	a5,48(sp)
 388:	02c12783          	lw	a5,44(sp)
 38c:	00478a93          	addi	s5,a5,4
 390:	02012783          	lw	a5,32(sp)
 394:	00f98b33          	add	s6,s3,a5
 398:	000aa903          	lw	s2,0(s5)
 39c:	01412483          	lw	s1,20(sp)
 3a0:	000a0413          	mv	s0,s4
 3a4:	00042583          	lw	a1,0(s0)
 3a8:	0004a503          	lw	a0,0(s1)
 3ac:	00440413          	addi	s0,s0,4
 3b0:	00448493          	addi	s1,s1,4
 3b4:	30c000ef          	jal	6c0 <__mulsi3>
 3b8:	40a90933          	sub	s2,s2,a0
 3bc:	ff3414e3          	bne	s0,s3,3a4 <ludcmp+0x224>
 3c0:	01412783          	lw	a5,20(sp)
 3c4:	01242023          	sw	s2,0(s0)
 3c8:	00440993          	addi	s3,s0,4
 3cc:	05078793          	addi	a5,a5,80
 3d0:	00f12a23          	sw	a5,20(sp)
 3d4:	004a8a93          	addi	s5,s5,4
 3d8:	fd6990e3          	bne	s3,s6,398 <ludcmp+0x218>
 3dc:	01012703          	lw	a4,16(sp)
 3e0:	02012783          	lw	a5,32(sp)
 3e4:	00001937          	lui	s2,0x1
 3e8:	05490913          	addi	s2,s2,84 # 1054 <x>
 3ec:	00e784b3          	add	s1,a5,a4
 3f0:	00249493          	slli	s1,s1,0x2
 3f4:	02412783          	lw	a5,36(sp)
 3f8:	00e484b3          	add	s1,s1,a4
 3fc:	00249493          	slli	s1,s1,0x2
 400:	00978733          	add	a4,a5,s1
 404:	02012783          	lw	a5,32(sp)
 408:	00072583          	lw	a1,0(a4)
 40c:	00fa07b3          	add	a5,s4,a5
 410:	0007a503          	lw	a0,0(a5)
 414:	02012783          	lw	a5,32(sp)
 418:	ffca0a13          	addi	s4,s4,-4
 41c:	00f90433          	add	s0,s2,a5
 420:	2c4000ef          	jal	6e4 <__divsi3>
 424:	02412783          	lw	a5,36(sp)
 428:	00490913          	addi	s2,s2,4
 42c:	00a42023          	sw	a0,0(s0)
 430:	fb078a93          	addi	s5,a5,-80
 434:	02012783          	lw	a5,32(sp)
 438:	009a8ab3          	add	s5,s5,s1
 43c:	00fa0b33          	add	s6,s4,a5
 440:	00f909b3          	add	s3,s2,a5
 444:	00040a13          	mv	s4,s0
 448:	01012783          	lw	a5,16(sp)
 44c:	00c12703          	lw	a4,12(sp)
 450:	000b2903          	lw	s2,0(s6)
 454:	06e7c263          	blt	a5,a4,4b8 <ludcmp+0x338>
 458:	000a0413          	mv	s0,s4
 45c:	000a8493          	mv	s1,s5
 460:	00042583          	lw	a1,0(s0)
 464:	0004a503          	lw	a0,0(s1)
 468:	00440413          	addi	s0,s0,4
 46c:	00448493          	addi	s1,s1,4
 470:	250000ef          	jal	6c0 <__mulsi3>
 474:	40a90933          	sub	s2,s2,a0
 478:	fe8994e3          	bne	s3,s0,460 <ludcmp+0x2e0>
 47c:	ffcaa583          	lw	a1,-4(s5)
 480:	00090513          	mv	a0,s2
 484:	260000ef          	jal	6e4 <__divsi3>
 488:	00c12783          	lw	a5,12(sp)
 48c:	feaa2e23          	sw	a0,-4(s4)
 490:	fff78793          	addi	a5,a5,-1
 494:	00f12623          	sw	a5,12(sp)
 498:	04078663          	beqz	a5,4e4 <ludcmp+0x364>
 49c:	01012783          	lw	a5,16(sp)
 4a0:	00c12703          	lw	a4,12(sp)
 4a4:	ffcb0b13          	addi	s6,s6,-4
 4a8:	ffca0a13          	addi	s4,s4,-4
 4ac:	faca8a93          	addi	s5,s5,-84
 4b0:	000b2903          	lw	s2,0(s6)
 4b4:	fae7d2e3          	bge	a5,a4,458 <ludcmp+0x2d8>
 4b8:	ffcaa583          	lw	a1,-4(s5)
 4bc:	00090513          	mv	a0,s2
 4c0:	ffcb0b13          	addi	s6,s6,-4
 4c4:	220000ef          	jal	6e4 <__divsi3>
 4c8:	00c12783          	lw	a5,12(sp)
 4cc:	feaa2e23          	sw	a0,-4(s4)
 4d0:	faca8a93          	addi	s5,s5,-84
 4d4:	fff78793          	addi	a5,a5,-1
 4d8:	00f12623          	sw	a5,12(sp)
 4dc:	ffca0a13          	addi	s4,s4,-4
 4e0:	f69ff06f          	j	448 <ludcmp+0x2c8>
 4e4:	1fc12083          	lw	ra,508(sp)
 4e8:	1f812403          	lw	s0,504(sp)
 4ec:	1f412483          	lw	s1,500(sp)
 4f0:	1f012903          	lw	s2,496(sp)
 4f4:	1ec12983          	lw	s3,492(sp)
 4f8:	1e812a03          	lw	s4,488(sp)
 4fc:	1e412a83          	lw	s5,484(sp)
 500:	1e012b03          	lw	s6,480(sp)
 504:	1dc12b83          	lw	s7,476(sp)
 508:	1d812c03          	lw	s8,472(sp)
 50c:	1d412c83          	lw	s9,468(sp)
 510:	1d012d03          	lw	s10,464(sp)
 514:	1cc12d83          	lw	s11,460(sp)
 518:	00000513          	li	a0,0
 51c:	20010113          	addi	sp,sp,512
 520:	00008067          	ret
 524:	02812783          	lw	a5,40(sp)
 528:	01012703          	lw	a4,16(sp)
 52c:	00001437          	lui	s0,0x1
 530:	02f12823          	sw	a5,48(sp)
 534:	01012783          	lw	a5,16(sp)
 538:	05440413          	addi	s0,s0,84 # 1054 <x>
 53c:	00279693          	slli	a3,a5,0x2
 540:	00f687b3          	add	a5,a3,a5
 544:	00279793          	slli	a5,a5,0x2
 548:	00e787b3          	add	a5,a5,a4
 54c:	00001737          	lui	a4,0x1
 550:	0f470713          	addi	a4,a4,244 # 10f4 <a>
 554:	00279793          	slli	a5,a5,0x2
 558:	00f707b3          	add	a5,a4,a5
 55c:	00268733          	add	a4,a3,sp
 560:	0007a583          	lw	a1,0(a5)
 564:	03072503          	lw	a0,48(a4)
 568:	00d40433          	add	s0,s0,a3
 56c:	178000ef          	jal	6e4 <__divsi3>
 570:	00a42023          	sw	a0,0(s0)
 574:	1fc12083          	lw	ra,508(sp)
 578:	1f812403          	lw	s0,504(sp)
 57c:	00000513          	li	a0,0
 580:	20010113          	addi	sp,sp,512
 584:	00008067          	ret

00000588 <benchmark_body>:
 588:	fd010113          	addi	sp,sp,-48
 58c:	02912223          	sw	s1,36(sp)
 590:	02112623          	sw	ra,44(sp)
 594:	000014b7          	lui	s1,0x1
 598:	0e058e63          	beqz	a1,694 <benchmark_body+0x10c>
 59c:	02812423          	sw	s0,40(sp)
 5a0:	03212023          	sw	s2,32(sp)
 5a4:	01312e23          	sw	s3,28(sp)
 5a8:	01412c23          	sw	s4,24(sp)
 5ac:	01512a23          	sw	s5,20(sp)
 5b0:	01612823          	sw	s6,16(sp)
 5b4:	01712623          	sw	s7,12(sp)
 5b8:	01812423          	sw	s8,8(sp)
 5bc:	00050a93          	mv	s5,a0
 5c0:	00058413          	mv	s0,a1
 5c4:	00000a13          	li	s4,0
 5c8:	000014b7          	lui	s1,0x1
 5cc:	000019b7          	lui	s3,0x1
 5d0:	00001937          	lui	s2,0x1
 5d4:	ffe00b93          	li	s7,-2
 5d8:	00600b13          	li	s6,6
 5dc:	00000c13          	li	s8,0
 5e0:	0a498313          	addi	t1,s3,164 # 10a4 <b>
 5e4:	0f490893          	addi	a7,s2,244 # 10f4 <a>
 5e8:	00800513          	li	a0,8
 5ec:	00000593          	li	a1,0
 5f0:	00258793          	addi	a5,a1,2
 5f4:	00088713          	mv	a4,a7
 5f8:	00000693          	li	a3,0
 5fc:	40bb8833          	sub	a6,s7,a1
 600:	01c0006f          	j	61c <benchmark_body+0x94>
 604:	00f72023          	sw	a5,0(a4)
 608:	00078613          	mv	a2,a5
 60c:	00178793          	addi	a5,a5,1
 610:	00c686b3          	add	a3,a3,a2
 614:	00470713          	addi	a4,a4,4
 618:	02a78263          	beq	a5,a0,63c <benchmark_body+0xb4>
 61c:	00f80633          	add	a2,a6,a5
 620:	feb612e3          	bne	a2,a1,604 <benchmark_body+0x7c>
 624:	00179613          	slli	a2,a5,0x1
 628:	00c72023          	sw	a2,0(a4)
 62c:	00178793          	addi	a5,a5,1
 630:	00c686b3          	add	a3,a3,a2
 634:	00470713          	addi	a4,a4,4
 638:	fea792e3          	bne	a5,a0,61c <benchmark_body+0x94>
 63c:	00d32023          	sw	a3,0(t1)
 640:	00158593          	addi	a1,a1,1
 644:	00430313          	addi	t1,t1,4
 648:	00178513          	addi	a0,a5,1
 64c:	05088893          	addi	a7,a7,80
 650:	fb6590e3          	bne	a1,s6,5f0 <benchmark_body+0x68>
 654:	00500593          	li	a1,5
 658:	01400513          	li	a0,20
 65c:	b25ff0ef          	jal	180 <ludcmp>
 660:	001c0c13          	addi	s8,s8,1
 664:	0404a823          	sw	zero,80(s1) # 1050 <chkerr>
 668:	f7841ce3          	bne	s0,s8,5e0 <benchmark_body+0x58>
 66c:	001a0a13          	addi	s4,s4,1
 670:	f75a16e3          	bne	s4,s5,5dc <benchmark_body+0x54>
 674:	02812403          	lw	s0,40(sp)
 678:	02012903          	lw	s2,32(sp)
 67c:	01c12983          	lw	s3,28(sp)
 680:	01812a03          	lw	s4,24(sp)
 684:	01412a83          	lw	s5,20(sp)
 688:	01012b03          	lw	s6,16(sp)
 68c:	00c12b83          	lw	s7,12(sp)
 690:	00812c03          	lw	s8,8(sp)
 694:	02c12083          	lw	ra,44(sp)
 698:	0504a503          	lw	a0,80(s1)
 69c:	02412483          	lw	s1,36(sp)
 6a0:	03010113          	addi	sp,sp,48
 6a4:	00008067          	ret

000006a8 <warm_caches>:
 6a8:	00050593          	mv	a1,a0
 6ac:	00100513          	li	a0,1
 6b0:	ed9ff06f          	j	588 <benchmark_body>

000006b4 <benchmark>:
 6b4:	00100593          	li	a1,1
 6b8:	00200513          	li	a0,2
 6bc:	ecdff06f          	j	588 <benchmark_body>

000006c0 <__mulsi3>:
 6c0:	00050613          	mv	a2,a0
 6c4:	00000513          	li	a0,0
 6c8:	0015f693          	andi	a3,a1,1
 6cc:	00068463          	beqz	a3,6d4 <__mulsi3+0x14>
 6d0:	00c50533          	add	a0,a0,a2
 6d4:	0015d593          	srli	a1,a1,0x1
 6d8:	00161613          	slli	a2,a2,0x1
 6dc:	fe0596e3          	bnez	a1,6c8 <__mulsi3+0x8>
 6e0:	00008067          	ret

000006e4 <__divsi3>:
 6e4:	06054063          	bltz	a0,744 <__umodsi3+0x10>
 6e8:	0605c663          	bltz	a1,754 <__umodsi3+0x20>

000006ec <__hidden___udivsi3>:
 6ec:	00058613          	mv	a2,a1
 6f0:	00050593          	mv	a1,a0
 6f4:	fff00513          	li	a0,-1
 6f8:	02060c63          	beqz	a2,730 <__hidden___udivsi3+0x44>
 6fc:	00100693          	li	a3,1
 700:	00b67a63          	bgeu	a2,a1,714 <__hidden___udivsi3+0x28>
 704:	00c05863          	blez	a2,714 <__hidden___udivsi3+0x28>
 708:	00161613          	slli	a2,a2,0x1
 70c:	00169693          	slli	a3,a3,0x1
 710:	feb66ae3          	bltu	a2,a1,704 <__hidden___udivsi3+0x18>
 714:	00000513          	li	a0,0
 718:	00c5e663          	bltu	a1,a2,724 <__hidden___udivsi3+0x38>
 71c:	40c585b3          	sub	a1,a1,a2
 720:	00d56533          	or	a0,a0,a3
 724:	0016d693          	srli	a3,a3,0x1
 728:	00165613          	srli	a2,a2,0x1
 72c:	fe0696e3          	bnez	a3,718 <__hidden___udivsi3+0x2c>
 730:	00008067          	ret

00000734 <__umodsi3>:
 734:	00008293          	mv	t0,ra
 738:	fb5ff0ef          	jal	6ec <__hidden___udivsi3>
 73c:	00058513          	mv	a0,a1
 740:	00028067          	jr	t0
 744:	40a00533          	neg	a0,a0
 748:	00b04863          	bgtz	a1,758 <__umodsi3+0x24>
 74c:	40b005b3          	neg	a1,a1
 750:	f9dff06f          	j	6ec <__hidden___udivsi3>
 754:	40b005b3          	neg	a1,a1
 758:	00008293          	mv	t0,ra
 75c:	f91ff0ef          	jal	6ec <__hidden___udivsi3>
 760:	40a00533          	neg	a0,a0
 764:	00028067          	jr	t0

00000768 <__modsi3>:
 768:	00008293          	mv	t0,ra
 76c:	0005ca63          	bltz	a1,780 <__modsi3+0x18>
 770:	00054c63          	bltz	a0,788 <__modsi3+0x20>
 774:	f79ff0ef          	jal	6ec <__hidden___udivsi3>
 778:	00058513          	mv	a0,a1
 77c:	00028067          	jr	t0
 780:	40b005b3          	neg	a1,a1
 784:	fe0558e3          	bgez	a0,774 <__modsi3+0xc>
 788:	40a00533          	neg	a0,a0
 78c:	f61ff0ef          	jal	6ec <__hidden___udivsi3>
 790:	40b00533          	neg	a0,a1
 794:	00028067          	jr	t0
