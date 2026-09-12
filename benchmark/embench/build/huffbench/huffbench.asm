
D:\aaa1verilog_project\rv32i_cpu\benchmark\embench\build\huffbench\huffbench.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00008117          	auipc	sp,0x8
   4:	f0010113          	addi	sp,sp,-256 # 7f00 <__stack_top>
   8:	00001297          	auipc	t0,0x1
   c:	1f828293          	addi	t0,t0,504 # 1200 <heap_requested>
  10:	00003317          	auipc	t1,0x3
  14:	3f030313          	addi	t1,t1,1008 # 3400 <__bss_end>
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
  78:	0e9000ef          	jal	960 <initialise_benchmark>
  7c:	00000513          	li	a0,0
  80:	0e5000ef          	jal	964 <warm_caches>
  84:	fadff0ef          	jal	30 <start_trigger>
  88:	0e9000ef          	jal	970 <benchmark>
  8c:	00a12623          	sw	a0,12(sp)
  90:	fb5ff0ef          	jal	44 <stop_trigger>
  94:	00c12503          	lw	a0,12(sp)
  98:	099000ef          	jal	930 <verify_benchmark>
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

000000f4 <memset>:
  f4:	00c50733          	add	a4,a0,a2
  f8:	00050793          	mv	a5,a0
  fc:	00060863          	beqz	a2,10c <memset+0x18>
 100:	00178793          	addi	a5,a5,1
 104:	feb78fa3          	sb	a1,-1(a5)
 108:	fef71ce3          	bne	a4,a5,100 <memset+0xc>
 10c:	00008067          	ret

00000110 <memcmp>:
 110:	02060663          	beqz	a2,13c <memcmp+0x2c>
 114:	00c50633          	add	a2,a0,a2
 118:	0080006f          	j	120 <memcmp+0x10>
 11c:	02c50063          	beq	a0,a2,13c <memcmp+0x2c>
 120:	00054783          	lbu	a5,0(a0)
 124:	0005c703          	lbu	a4,0(a1)
 128:	00150513          	addi	a0,a0,1
 12c:	00158593          	addi	a1,a1,1
 130:	fee786e3          	beq	a5,a4,11c <memcmp+0xc>
 134:	40e78533          	sub	a0,a5,a4
 138:	00008067          	ret
 13c:	00000513          	li	a0,0
 140:	00008067          	ret

00000144 <init_heap_beebs>:
 144:	0035f793          	andi	a5,a1,3
 148:	02079263          	bnez	a5,16c <init_heap_beebs+0x28>
 14c:	00b505b3          	add	a1,a0,a1
 150:	000016b7          	lui	a3,0x1
 154:	00001737          	lui	a4,0x1
 158:	000017b7          	lui	a5,0x1
 15c:	20b6a223          	sw	a1,516(a3) # 1204 <heap_end>
 160:	20a72423          	sw	a0,520(a4) # 1208 <heap_ptr>
 164:	2007a023          	sw	zero,512(a5) # 1200 <heap_requested>
 168:	00008067          	ret
 16c:	0000006f          	j	16c <init_heap_beebs+0x28>

00000170 <malloc_beebs>:
 170:	00050793          	mv	a5,a0
 174:	04050e63          	beqz	a0,1d0 <malloc_beebs+0x60>
 178:	00001637          	lui	a2,0x1
 17c:	20862503          	lw	a0,520(a2) # 1208 <heap_ptr>
 180:	000016b7          	lui	a3,0x1
 184:	2006a583          	lw	a1,512(a3) # 1200 <heap_requested>
 188:	00f50733          	add	a4,a0,a5
 18c:	00377813          	andi	a6,a4,3
 190:	00b787b3          	add	a5,a5,a1
 194:	00081e63          	bnez	a6,1b0 <malloc_beebs+0x40>
 198:	000015b7          	lui	a1,0x1
 19c:	2045a583          	lw	a1,516(a1) # 1204 <heap_end>
 1a0:	20f6a023          	sw	a5,512(a3)
 1a4:	02e5e663          	bltu	a1,a4,1d0 <malloc_beebs+0x60>
 1a8:	20e62423          	sw	a4,520(a2)
 1ac:	00008067          	ret
 1b0:	00400593          	li	a1,4
 1b4:	410585b3          	sub	a1,a1,a6
 1b8:	00b787b3          	add	a5,a5,a1
 1bc:	00b70733          	add	a4,a4,a1
 1c0:	000015b7          	lui	a1,0x1
 1c4:	2045a583          	lw	a1,516(a1) # 1204 <heap_end>
 1c8:	20f6a023          	sw	a5,512(a3)
 1cc:	fce5fee3          	bgeu	a1,a4,1a8 <malloc_beebs+0x38>
 1d0:	00000513          	li	a0,0
 1d4:	00008067          	ret

000001d8 <free_beebs>:
 1d8:	00008067          	ret

000001dc <heap_adjust>:
 1dc:	01f65f13          	srli	t5,a2,0x1f
 1e0:	ffc58593          	addi	a1,a1,-4
 1e4:	00269793          	slli	a5,a3,0x2
 1e8:	00cf0f33          	add	t5,t5,a2
 1ec:	00f587b3          	add	a5,a1,a5
 1f0:	401f5f13          	srai	t5,t5,0x1
 1f4:	0007a383          	lw	t2,0(a5)
 1f8:	08df4863          	blt	t5,a3,288 <heap_adjust+0xac>
 1fc:	00239f93          	slli	t6,t2,0x2
 200:	01f50fb3          	add	t6,a0,t6
 204:	02c0006f          	j	230 <heap_adjust+0x54>
 208:	000e0713          	mv	a4,t3
 20c:	000e8813          	mv	a6,t4
 210:	00028893          	mv	a7,t0
 214:	000fae03          	lw	t3,0(t6)
 218:	00269693          	slli	a3,a3,0x2
 21c:	40d787b3          	sub	a5,a5,a3
 220:	070e6463          	bltu	t3,a6,288 <heap_adjust+0xac>
 224:	0117a023          	sw	a7,0(a5)
 228:	06ef4463          	blt	t5,a4,290 <heap_adjust+0xb4>
 22c:	00070693          	mv	a3,a4
 230:	00369793          	slli	a5,a3,0x3
 234:	00f587b3          	add	a5,a1,a5
 238:	0007a883          	lw	a7,0(a5)
 23c:	00169713          	slli	a4,a3,0x1
 240:	00170e13          	addi	t3,a4,1
 244:	00289813          	slli	a6,a7,0x2
 248:	01050833          	add	a6,a0,a6
 24c:	00082803          	lw	a6,0(a6)
 250:	002e1e93          	slli	t4,t3,0x2
 254:	00078313          	mv	t1,a5
 258:	fac75ee3          	bge	a4,a2,214 <heap_adjust+0x38>
 25c:	01d58333          	add	t1,a1,t4
 260:	00032283          	lw	t0,0(t1)
 264:	00229e93          	slli	t4,t0,0x2
 268:	01d50eb3          	add	t4,a0,t4
 26c:	000eae83          	lw	t4,0(t4)
 270:	f90eece3          	bltu	t4,a6,208 <heap_adjust+0x2c>
 274:	000fae03          	lw	t3,0(t6)
 278:	00269693          	slli	a3,a3,0x2
 27c:	00078313          	mv	t1,a5
 280:	40d787b3          	sub	a5,a5,a3
 284:	fb0e70e3          	bgeu	t3,a6,224 <heap_adjust+0x48>
 288:	0077a023          	sw	t2,0(a5)
 28c:	00008067          	ret
 290:	00030793          	mv	a5,t1
 294:	0077a023          	sw	t2,0(a5)
 298:	00008067          	ret

0000029c <compdecomp>:
 29c:	81010113          	addi	sp,sp,-2032
 2a0:	fffff2b7          	lui	t0,0xfffff
 2a4:	9a028293          	addi	t0,t0,-1632 # ffffe9a0 <__stack_top+0xffff6aa0>
 2a8:	7e812423          	sw	s0,2024(sp)
 2ac:	00158413          	addi	s0,a1,1
 2b0:	7e112623          	sw	ra,2028(sp)
 2b4:	7e912223          	sw	s1,2020(sp)
 2b8:	7f212023          	sw	s2,2016(sp)
 2bc:	7d312e23          	sw	s3,2012(sp)
 2c0:	7d412c23          	sw	s4,2008(sp)
 2c4:	7d612823          	sw	s6,2000(sp)
 2c8:	00050993          	mv	s3,a0
 2cc:	7d512a23          	sw	s5,2004(sp)
 2d0:	7d712623          	sw	s7,1996(sp)
 2d4:	7d812423          	sw	s8,1992(sp)
 2d8:	7d912223          	sw	s9,1988(sp)
 2dc:	7da12023          	sw	s10,1984(sp)
 2e0:	7bb12e23          	sw	s11,1980(sp)
 2e4:	00040513          	mv	a0,s0
 2e8:	00510133          	add	sp,sp,t0
 2ec:	00058493          	mv	s1,a1
 2f0:	01312623          	sw	s3,12(sp)
 2f4:	e7dff0ef          	jal	170 <malloc_beebs>
 2f8:	00040613          	mv	a2,s0
 2fc:	00000593          	li	a1,0
 300:	00050913          	mv	s2,a0
 304:	df1ff0ef          	jal	f4 <memset>
 308:	000017b7          	lui	a5,0x1
 30c:	61078793          	addi	a5,a5,1552 # 1610 <heap+0x210>
 310:	00278a33          	add	s4,a5,sp
 314:	00001437          	lui	s0,0x1
 318:	800a0a13          	addi	s4,s4,-2048
 31c:	80040613          	addi	a2,s0,-2048 # 800 <compdecomp+0x564>
 320:	00000593          	li	a1,0
 324:	000a0513          	mv	a0,s4
 328:	dcdff0ef          	jal	f4 <memset>
 32c:	40000613          	li	a2,1024
 330:	00000593          	li	a1,0
 334:	21010513          	addi	a0,sp,528
 338:	dbdff0ef          	jal	f4 <memset>
 33c:	000017b7          	lui	a5,0x1
 340:	61078793          	addi	a5,a5,1552 # 1610 <heap+0x210>
 344:	00278b33          	add	s6,a5,sp
 348:	80040613          	addi	a2,s0,-2048
 34c:	00000593          	li	a1,0
 350:	000b0513          	mv	a0,s6
 354:	da1ff0ef          	jal	f4 <memset>
 358:	40000613          	li	a2,1024
 35c:	00000593          	li	a1,0
 360:	61010513          	addi	a0,sp,1552
 364:	d91ff0ef          	jal	f4 <memset>
 368:	10000613          	li	a2,256
 36c:	01010513          	addi	a0,sp,16
 370:	00000593          	li	a1,0
 374:	d81ff0ef          	jal	f4 <memset>
 378:	00c12703          	lw	a4,12(sp)
 37c:	00998633          	add	a2,s3,s1
 380:	02048263          	beqz	s1,3a4 <compdecomp+0x108>
 384:	00074783          	lbu	a5,0(a4)
 388:	00170713          	addi	a4,a4,1
 38c:	00279793          	slli	a5,a5,0x2
 390:	00fa07b3          	add	a5,s4,a5
 394:	0007a683          	lw	a3,0(a5)
 398:	00168693          	addi	a3,a3,1
 39c:	00d7a023          	sw	a3,0(a5)
 3a0:	fec712e3          	bne	a4,a2,384 <compdecomp+0xe8>
 3a4:	e1010593          	addi	a1,sp,-496
 3a8:	000a0413          	mv	s0,s4
 3ac:	000a0693          	mv	a3,s4
 3b0:	00000a93          	li	s5,0
 3b4:	00000793          	li	a5,0
 3b8:	10000513          	li	a0,256
 3bc:	0006a603          	lw	a2,0(a3)
 3c0:	002a9713          	slli	a4,s5,0x2
 3c4:	00e58733          	add	a4,a1,a4
 3c8:	00060663          	beqz	a2,3d4 <compdecomp+0x138>
 3cc:	40f72023          	sw	a5,1024(a4)
 3d0:	001a8a93          	addi	s5,s5,1
 3d4:	00178793          	addi	a5,a5,1
 3d8:	00468693          	addi	a3,a3,4
 3dc:	fea790e3          	bne	a5,a0,3bc <compdecomp+0x120>
 3e0:	0c0a8a63          	beqz	s5,4b4 <compdecomp+0x218>
 3e4:	21010b93          	addi	s7,sp,528
 3e8:	000a8c13          	mv	s8,s5
 3ec:	000c0693          	mv	a3,s8
 3f0:	000a8613          	mv	a2,s5
 3f4:	000b8593          	mv	a1,s7
 3f8:	000a0513          	mv	a0,s4
 3fc:	fffc0c13          	addi	s8,s8,-1
 400:	dddff0ef          	jal	1dc <heap_adjust>
 404:	fe0c14e3          	bnez	s8,3ec <compdecomp+0x150>
 408:	00100793          	li	a5,1
 40c:	0afa8263          	beq	s5,a5,4b0 <compdecomp+0x214>
 410:	002a9793          	slli	a5,s5,0x2
 414:	ffcb8813          	addi	a6,s7,-4
 418:	3fca0c13          	addi	s8,s4,1020
 41c:	0ffa8a93          	addi	s5,s5,255
 420:	00f809b3          	add	s3,a6,a5
 424:	00fc0c33          	add	s8,s8,a5
 428:	10000c93          	li	s9,256
 42c:	0009a783          	lw	a5,0(s3)
 430:	f00a8613          	addi	a2,s5,-256
 434:	00100693          	li	a3,1
 438:	000b8593          	mv	a1,s7
 43c:	000a0513          	mv	a0,s4
 440:	21012d03          	lw	s10,528(sp)
 444:	00c12423          	sw	a2,8(sp)
 448:	20f12823          	sw	a5,528(sp)
 44c:	d91ff0ef          	jal	1dc <heap_adjust>
 450:	21012783          	lw	a5,528(sp)
 454:	002d1713          	slli	a4,s10,0x2
 458:	00ea05b3          	add	a1,s4,a4
 45c:	00279793          	slli	a5,a5,0x2
 460:	00fa06b3          	add	a3,s4,a5
 464:	0005a583          	lw	a1,0(a1)
 468:	0006a683          	lw	a3,0(a3)
 46c:	00812603          	lw	a2,8(sp)
 470:	00eb0733          	add	a4,s6,a4
 474:	00b686b3          	add	a3,a3,a1
 478:	01572023          	sw	s5,0(a4)
 47c:	00dc2023          	sw	a3,0(s8)
 480:	41500733          	neg	a4,s5
 484:	00fb07b3          	add	a5,s6,a5
 488:	21512823          	sw	s5,528(sp)
 48c:	000b8593          	mv	a1,s7
 490:	000a0513          	mv	a0,s4
 494:	00100693          	li	a3,1
 498:	fffa8a93          	addi	s5,s5,-1
 49c:	00e7a023          	sw	a4,0(a5)
 4a0:	ffc98993          	addi	s3,s3,-4
 4a4:	d39ff0ef          	jal	1dc <heap_adjust>
 4a8:	ffcc0c13          	addi	s8,s8,-4
 4ac:	f99a90e3          	bne	s5,s9,42c <compdecomp+0x190>
 4b0:	10100793          	li	a5,257
 4b4:	00279793          	slli	a5,a5,0x2
 4b8:	00fb07b3          	add	a5,s6,a5
 4bc:	61010b93          	addi	s7,sp,1552
 4c0:	01010a93          	addi	s5,sp,16
 4c4:	0007a023          	sw	zero,0(a5)
 4c8:	000b8513          	mv	a0,s7
 4cc:	000a8593          	mv	a1,s5
 4d0:	000b0813          	mv	a6,s6
 4d4:	400a0893          	addi	a7,s4,1024
 4d8:	00000e13          	li	t3,0
 4dc:	00000e93          	li	t4,0
 4e0:	0200006f          	j	500 <compdecomp+0x264>
 4e4:	00d52023          	sw	a3,0(a0)
 4e8:	00e58023          	sb	a4,0(a1)
 4ec:	00440413          	addi	s0,s0,4
 4f0:	00450513          	addi	a0,a0,4
 4f4:	00158593          	addi	a1,a1,1
 4f8:	00480813          	addi	a6,a6,4
 4fc:	06888c63          	beq	a7,s0,574 <compdecomp+0x2d8>
 500:	00042683          	lw	a3,0(s0)
 504:	00000713          	li	a4,0
 508:	fc068ee3          	beqz	a3,4e4 <compdecomp+0x248>
 50c:	00082783          	lw	a5,0(a6)
 510:	00000693          	li	a3,0
 514:	fc0788e3          	beqz	a5,4e4 <compdecomp+0x248>
 518:	00100713          	li	a4,1
 51c:	00000613          	li	a2,0
 520:	0007d663          	bgez	a5,52c <compdecomp+0x290>
 524:	00e686b3          	add	a3,a3,a4
 528:	40f007b3          	neg	a5,a5
 52c:	00279793          	slli	a5,a5,0x2
 530:	00fb07b3          	add	a5,s6,a5
 534:	0007a783          	lw	a5,0(a5)
 538:	00171713          	slli	a4,a4,0x1
 53c:	00160613          	addi	a2,a2,1
 540:	fe0790e3          	bnez	a5,520 <compdecomp+0x284>
 544:	00060713          	mv	a4,a2
 548:	00ce7463          	bgeu	t3,a2,550 <compdecomp+0x2b4>
 54c:	00060e13          	mv	t3,a2
 550:	f8defae3          	bgeu	t4,a3,4e4 <compdecomp+0x248>
 554:	00d52023          	sw	a3,0(a0)
 558:	00e58023          	sb	a4,0(a1)
 55c:	00440413          	addi	s0,s0,4
 560:	00068e93          	mv	t4,a3
 564:	00450513          	addi	a0,a0,4
 568:	00158593          	addi	a1,a1,1
 56c:	00480813          	addi	a6,a6,4
 570:	f88898e3          	bne	a7,s0,500 <compdecomp+0x264>
 574:	021e3e13          	sltiu	t3,t3,33
 578:	220e0e63          	beqz	t3,7b4 <compdecomp+0x518>
 57c:	220e8c63          	beqz	t4,7b4 <compdecomp+0x518>
 580:	2e048463          	beqz	s1,868 <compdecomp+0x5cc>
 584:	00c12783          	lw	a5,12(sp)
 588:	e1010e13          	addi	t3,sp,-496
 58c:	fff00593          	li	a1,-1
 590:	009782b3          	add	t0,a5,s1
 594:	00078f13          	mv	t5,a5
 598:	00000693          	li	a3,0
 59c:	00000893          	li	a7,0
 5a0:	00100f93          	li	t6,1
 5a4:	00700e93          	li	t4,7
 5a8:	000f4503          	lbu	a0,0(t5)
 5ac:	00ae07b3          	add	a5,t3,a0
 5b0:	2007c783          	lbu	a5,512(a5)
 5b4:	04078463          	beqz	a5,5fc <compdecomp+0x360>
 5b8:	fff78793          	addi	a5,a5,-1
 5bc:	00ff9733          	sll	a4,t6,a5
 5c0:	00000613          	li	a2,0
 5c4:	23d58c63          	beq	a1,t4,7fc <compdecomp+0x560>
 5c8:	00158593          	addi	a1,a1,1
 5cc:	00169693          	slli	a3,a3,0x1
 5d0:	00251793          	slli	a5,a0,0x2
 5d4:	00fa07b3          	add	a5,s4,a5
 5d8:	8007a783          	lw	a5,-2048(a5)
 5dc:	00ae0833          	add	a6,t3,a0
 5e0:	00160613          	addi	a2,a2,1
 5e4:	00f777b3          	and	a5,a4,a5
 5e8:	00078463          	beqz	a5,5f0 <compdecomp+0x354>
 5ec:	0016e693          	ori	a3,a3,1
 5f0:	20084783          	lbu	a5,512(a6)
 5f4:	00175713          	srli	a4,a4,0x1
 5f8:	fcf666e3          	bltu	a2,a5,5c4 <compdecomp+0x328>
 5fc:	001f0f13          	addi	t5,t5,1
 600:	fbe294e3          	bne	t0,t5,5a8 <compdecomp+0x30c>
 604:	00700793          	li	a5,7
 608:	40b787b3          	sub	a5,a5,a1
 60c:	011908b3          	add	a7,s2,a7
 610:	00f696b3          	sll	a3,a3,a5
 614:	7ff10413          	addi	s0,sp,2047
 618:	21140413          	addi	s0,s0,529
 61c:	00d88023          	sb	a3,0(a7)
 620:	00040513          	mv	a0,s0
 624:	40000613          	li	a2,1024
 628:	00000593          	li	a1,0
 62c:	ac9ff0ef          	jal	f4 <memset>
 630:	00040e93          	mv	t4,s0
 634:	11010e13          	addi	t3,sp,272
 638:	00000813          	li	a6,0
 63c:	00100f93          	li	t6,1
 640:	10000f13          	li	t5,256
 644:	0180006f          	j	65c <compdecomp+0x3c0>
 648:	00180813          	addi	a6,a6,1
 64c:	004b8b93          	addi	s7,s7,4
 650:	001a8a93          	addi	s5,s5,1
 654:	004e8e93          	addi	t4,t4,4
 658:	05e80e63          	beq	a6,t5,6b4 <compdecomp+0x418>
 65c:	000ba503          	lw	a0,0(s7)
 660:	000ac583          	lbu	a1,0(s5)
 664:	010e0023          	sb	a6,0(t3)
 668:	001e0e13          	addi	t3,t3,1
 66c:	00b567b3          	or	a5,a0,a1
 670:	fc078ce3          	beqz	a5,648 <compdecomp+0x3ac>
 674:	1a058463          	beqz	a1,81c <compdecomp+0x580>
 678:	fff58693          	addi	a3,a1,-1
 67c:	00df96b3          	sll	a3,t6,a3
 680:	00000793          	li	a5,0
 684:	00000613          	li	a2,0
 688:	00178893          	addi	a7,a5,1
 68c:	00d57733          	and	a4,a0,a3
 690:	00179793          	slli	a5,a5,0x1
 694:	00178793          	addi	a5,a5,1
 698:	00070463          	beqz	a4,6a0 <compdecomp+0x404>
 69c:	00189793          	slli	a5,a7,0x1
 6a0:	00160613          	addi	a2,a2,1
 6a4:	0016d693          	srli	a3,a3,0x1
 6a8:	fec590e3          	bne	a1,a2,688 <compdecomp+0x3ec>
 6ac:	00fea023          	sw	a5,0(t4)
 6b0:	f99ff06f          	j	648 <compdecomp+0x3ac>
 6b4:	00440f13          	addi	t5,s0,4
 6b8:	11110813          	addi	a6,sp,273
 6bc:	000f0313          	mv	t1,t5
 6c0:	e1010e93          	addi	t4,sp,-496
 6c4:	00100893          	li	a7,1
 6c8:	10000f93          	li	t6,256
 6cc:	00032503          	lw	a0,0(t1)
 6d0:	00084e03          	lbu	t3,0(a6)
 6d4:	00080713          	mv	a4,a6
 6d8:	00030793          	mv	a5,t1
 6dc:	00088693          	mv	a3,a7
 6e0:	ffc7a603          	lw	a2,-4(a5)
 6e4:	02c57063          	bgeu	a0,a2,704 <compdecomp+0x468>
 6e8:	fff74583          	lbu	a1,-1(a4)
 6ec:	00c7a023          	sw	a2,0(a5)
 6f0:	fff68693          	addi	a3,a3,-1
 6f4:	00b70023          	sb	a1,0(a4)
 6f8:	ffc78793          	addi	a5,a5,-4
 6fc:	fff70713          	addi	a4,a4,-1
 700:	fe0690e3          	bnez	a3,6e0 <compdecomp+0x444>
 704:	00269793          	slli	a5,a3,0x2
 708:	00fa07b3          	add	a5,s4,a5
 70c:	00de86b3          	add	a3,t4,a3
 710:	00188893          	addi	a7,a7,1
 714:	c0a7a023          	sw	a0,-1024(a5)
 718:	31c68023          	sb	t3,768(a3)
 71c:	00430313          	addi	t1,t1,4
 720:	00180813          	addi	a6,a6,1
 724:	fbf894e3          	bne	a7,t6,6cc <compdecomp+0x430>
 728:	c00a2583          	lw	a1,-1024(s4)
 72c:	14059463          	bnez	a1,874 <compdecomp+0x5d8>
 730:	000f0793          	mv	a5,t5
 734:	0007a703          	lw	a4,0(a5)
 738:	00478793          	addi	a5,a5,4
 73c:	00158593          	addi	a1,a1,1
 740:	fe070ae3          	beqz	a4,734 <compdecomp+0x498>
 744:	06048463          	beqz	s1,7ac <compdecomp+0x510>
 748:	e1010313          	addi	t1,sp,-496
 74c:	00090893          	mv	a7,s2
 750:	00058713          	mv	a4,a1
 754:	00000613          	li	a2,0
 758:	08000513          	li	a0,128
 75c:	00000813          	li	a6,0
 760:	00100e13          	li	t3,1
 764:	0008c783          	lbu	a5,0(a7)
 768:	00a7f7b3          	and	a5,a5,a0
 76c:	0e078863          	beqz	a5,85c <compdecomp+0x5c0>
 770:	00160613          	addi	a2,a2,1
 774:	00161613          	slli	a2,a2,0x1
 778:	00271793          	slli	a5,a4,0x2
 77c:	00fa06b3          	add	a3,s4,a5
 780:	c006a683          	lw	a3,-1024(a3)
 784:	01e787b3          	add	a5,a5,t5
 788:	00c6fa63          	bgeu	a3,a2,79c <compdecomp+0x500>
 78c:	0007a683          	lw	a3,0(a5)
 790:	00478793          	addi	a5,a5,4
 794:	00170713          	addi	a4,a4,1
 798:	fec6eae3          	bltu	a3,a2,78c <compdecomp+0x4f0>
 79c:	08d60663          	beq	a2,a3,828 <compdecomp+0x58c>
 7a0:	0bc50863          	beq	a0,t3,850 <compdecomp+0x5b4>
 7a4:	00155513          	srli	a0,a0,0x1
 7a8:	fa986ee3          	bltu	a6,s1,764 <compdecomp+0x4c8>
 7ac:	00090513          	mv	a0,s2
 7b0:	a29ff0ef          	jal	1d8 <free_beebs>
 7b4:	000012b7          	lui	t0,0x1
 7b8:	66028293          	addi	t0,t0,1632 # 1660 <heap+0x260>
 7bc:	00510133          	add	sp,sp,t0
 7c0:	7ec12083          	lw	ra,2028(sp)
 7c4:	7e812403          	lw	s0,2024(sp)
 7c8:	7e412483          	lw	s1,2020(sp)
 7cc:	7e012903          	lw	s2,2016(sp)
 7d0:	7dc12983          	lw	s3,2012(sp)
 7d4:	7d812a03          	lw	s4,2008(sp)
 7d8:	7d412a83          	lw	s5,2004(sp)
 7dc:	7d012b03          	lw	s6,2000(sp)
 7e0:	7cc12b83          	lw	s7,1996(sp)
 7e4:	7c812c03          	lw	s8,1992(sp)
 7e8:	7c412c83          	lw	s9,1988(sp)
 7ec:	7c012d03          	lw	s10,1984(sp)
 7f0:	7bc12d83          	lw	s11,1980(sp)
 7f4:	7f010113          	addi	sp,sp,2032
 7f8:	00008067          	ret
 7fc:	011907b3          	add	a5,s2,a7
 800:	00d78023          	sb	a3,0(a5)
 804:	00188893          	addi	a7,a7,1
 808:	fb1486e3          	beq	s1,a7,7b4 <compdecomp+0x518>
 80c:	000f4503          	lbu	a0,0(t5)
 810:	00000693          	li	a3,0
 814:	00000593          	li	a1,0
 818:	db9ff06f          	j	5d0 <compdecomp+0x334>
 81c:	00000793          	li	a5,0
 820:	00fea023          	sw	a5,0(t4)
 824:	e25ff06f          	j	648 <compdecomp+0x3ac>
 828:	00e30733          	add	a4,t1,a4
 82c:	30074783          	lbu	a5,768(a4)
 830:	00c12683          	lw	a3,12(sp)
 834:	00180813          	addi	a6,a6,1
 838:	00058713          	mv	a4,a1
 83c:	00f68023          	sb	a5,0(a3)
 840:	00168793          	addi	a5,a3,1
 844:	00f12623          	sw	a5,12(sp)
 848:	00000613          	li	a2,0
 84c:	f5c51ce3          	bne	a0,t3,7a4 <compdecomp+0x508>
 850:	00188893          	addi	a7,a7,1
 854:	08000513          	li	a0,128
 858:	f51ff06f          	j	7a8 <compdecomp+0x50c>
 85c:	00161613          	slli	a2,a2,0x1
 860:	00160613          	addi	a2,a2,1
 864:	f15ff06f          	j	778 <compdecomp+0x4dc>
 868:	00090893          	mv	a7,s2
 86c:	00000693          	li	a3,0
 870:	da5ff06f          	j	614 <compdecomp+0x378>
 874:	00000593          	li	a1,0
 878:	ecdff06f          	j	744 <compdecomp+0x4a8>

0000087c <benchmark_body.isra.0>:
 87c:	0a058863          	beqz	a1,92c <benchmark_body.isra.0+0xb0>
 880:	fe010113          	addi	sp,sp,-32
 884:	00912a23          	sw	s1,20(sp)
 888:	01312623          	sw	s3,12(sp)
 88c:	01412423          	sw	s4,8(sp)
 890:	000019b7          	lui	s3,0x1
 894:	00001a37          	lui	s4,0x1
 898:	000014b7          	lui	s1,0x1
 89c:	01212823          	sw	s2,16(sp)
 8a0:	01512223          	sw	s5,4(sp)
 8a4:	01612023          	sw	s6,0(sp)
 8a8:	00112e23          	sw	ra,28(sp)
 8ac:	00812c23          	sw	s0,24(sp)
 8b0:	00050b13          	mv	s6,a0
 8b4:	00058913          	mv	s2,a1
 8b8:	400a0a13          	addi	s4,s4,1024 # 1400 <heap>
 8bc:	00098993          	mv	s3,s3
 8c0:	20c48493          	addi	s1,s1,524 # 120c <test_data>
 8c4:	00000a93          	li	s5,0
 8c8:	00000413          	li	s0,0
 8cc:	000025b7          	lui	a1,0x2
 8d0:	000a0513          	mv	a0,s4
 8d4:	871ff0ef          	jal	144 <init_heap_beebs>
 8d8:	00098593          	mv	a1,s3
 8dc:	1f400613          	li	a2,500
 8e0:	00048513          	mv	a0,s1
 8e4:	fecff0ef          	jal	d0 <memcpy>
 8e8:	00048513          	mv	a0,s1
 8ec:	1f400593          	li	a1,500
 8f0:	00140413          	addi	s0,s0,1
 8f4:	9a9ff0ef          	jal	29c <compdecomp>
 8f8:	fd241ae3          	bne	s0,s2,8cc <benchmark_body.isra.0+0x50>
 8fc:	001a8a93          	addi	s5,s5,1
 900:	fd5b14e3          	bne	s6,s5,8c8 <benchmark_body.isra.0+0x4c>
 904:	01c12083          	lw	ra,28(sp)
 908:	01812403          	lw	s0,24(sp)
 90c:	01412483          	lw	s1,20(sp)
 910:	01012903          	lw	s2,16(sp)
 914:	00c12983          	lw	s3,12(sp)
 918:	00812a03          	lw	s4,8(sp)
 91c:	00412a83          	lw	s5,4(sp)
 920:	00012b03          	lw	s6,0(sp)
 924:	02010113          	addi	sp,sp,32
 928:	00008067          	ret
 92c:	00008067          	ret

00000930 <verify_benchmark>:
 930:	000015b7          	lui	a1,0x1
 934:	00001537          	lui	a0,0x1
 938:	ff010113          	addi	sp,sp,-16
 93c:	00058593          	mv	a1,a1
 940:	20c50513          	addi	a0,a0,524 # 120c <test_data>
 944:	1f400613          	li	a2,500
 948:	00112623          	sw	ra,12(sp)
 94c:	fc4ff0ef          	jal	110 <memcmp>
 950:	00c12083          	lw	ra,12(sp)
 954:	00153513          	seqz	a0,a0
 958:	01010113          	addi	sp,sp,16
 95c:	00008067          	ret

00000960 <initialise_benchmark>:
 960:	00008067          	ret

00000964 <warm_caches>:
 964:	00050593          	mv	a1,a0
 968:	00100513          	li	a0,1
 96c:	f11ff06f          	j	87c <benchmark_body.isra.0>

00000970 <benchmark>:
 970:	ff010113          	addi	sp,sp,-16
 974:	00200513          	li	a0,2
 978:	00100593          	li	a1,1
 97c:	00112623          	sw	ra,12(sp)
 980:	efdff0ef          	jal	87c <benchmark_body.isra.0>
 984:	00c12083          	lw	ra,12(sp)
 988:	00000513          	li	a0,0
 98c:	01010113          	addi	sp,sp,16
 990:	00008067          	ret
