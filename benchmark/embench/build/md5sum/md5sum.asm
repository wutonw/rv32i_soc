
D:\aaa1verilog_project\rv32i_cpu\benchmark\embench\build\md5sum\md5sum.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00008117          	auipc	sp,0x8
   4:	f0010113          	addi	sp,sp,-256 # 7f00 <__stack_top>
   8:	00001297          	auipc	t0,0x1
   c:	1f828293          	addi	t0,t0,504 # 1200 <heap_requested>
  10:	00002317          	auipc	t1,0x2
  14:	e1430313          	addi	t1,t1,-492 # 1e24 <__bss_end>
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
  78:	574000ef          	jal	5ec <initialise_benchmark>
  7c:	00000513          	li	a0,0
  80:	570000ef          	jal	5f0 <warm_caches>
  84:	fadff0ef          	jal	30 <start_trigger>
  88:	574000ef          	jal	5fc <benchmark>
  8c:	00a12623          	sw	a0,12(sp)
  90:	fb5ff0ef          	jal	44 <stop_trigger>
  94:	00c12503          	lw	a0,12(sp)
  98:	570000ef          	jal	608 <verify_benchmark>
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

00000110 <init_heap_beebs>:
 110:	0035f793          	andi	a5,a1,3
 114:	02079263          	bnez	a5,138 <init_heap_beebs+0x28>
 118:	00b505b3          	add	a1,a0,a1
 11c:	000016b7          	lui	a3,0x1
 120:	00001737          	lui	a4,0x1
 124:	000017b7          	lui	a5,0x1
 128:	20b6a223          	sw	a1,516(a3) # 1204 <heap_end>
 12c:	20a72423          	sw	a0,520(a4) # 1208 <heap_ptr>
 130:	2007a023          	sw	zero,512(a5) # 1200 <heap_requested>
 134:	00008067          	ret
 138:	0000006f          	j	138 <init_heap_beebs+0x28>

0000013c <malloc_beebs>:
 13c:	00050793          	mv	a5,a0
 140:	04050e63          	beqz	a0,19c <malloc_beebs+0x60>
 144:	00001637          	lui	a2,0x1
 148:	20862503          	lw	a0,520(a2) # 1208 <heap_ptr>
 14c:	000016b7          	lui	a3,0x1
 150:	2006a583          	lw	a1,512(a3) # 1200 <heap_requested>
 154:	00f50733          	add	a4,a0,a5
 158:	00377813          	andi	a6,a4,3
 15c:	00b787b3          	add	a5,a5,a1
 160:	00081e63          	bnez	a6,17c <malloc_beebs+0x40>
 164:	000015b7          	lui	a1,0x1
 168:	2045a583          	lw	a1,516(a1) # 1204 <heap_end>
 16c:	20f6a023          	sw	a5,512(a3)
 170:	02e5e663          	bltu	a1,a4,19c <malloc_beebs+0x60>
 174:	20e62423          	sw	a4,520(a2)
 178:	00008067          	ret
 17c:	00400593          	li	a1,4
 180:	410585b3          	sub	a1,a1,a6
 184:	00b787b3          	add	a5,a5,a1
 188:	00b70733          	add	a4,a4,a1
 18c:	000015b7          	lui	a1,0x1
 190:	2045a583          	lw	a1,516(a1) # 1204 <heap_end>
 194:	20f6a023          	sw	a5,512(a3)
 198:	fce5fee3          	bgeu	a1,a4,174 <malloc_beebs+0x38>
 19c:	00000513          	li	a0,0
 1a0:	00008067          	ret

000001a4 <calloc_beebs>:
 1a4:	fe010113          	addi	sp,sp,-32
 1a8:	00112e23          	sw	ra,28(sp)
 1ac:	470000ef          	jal	61c <__mulsi3>
 1b0:	08050263          	beqz	a0,234 <calloc_beebs+0x90>
 1b4:	000015b7          	lui	a1,0x1
 1b8:	2085a783          	lw	a5,520(a1) # 1208 <heap_ptr>
 1bc:	00001637          	lui	a2,0x1
 1c0:	20062703          	lw	a4,512(a2) # 1200 <heap_requested>
 1c4:	00a786b3          	add	a3,a5,a0
 1c8:	0036f893          	andi	a7,a3,3
 1cc:	00e50733          	add	a4,a0,a4
 1d0:	04089263          	bnez	a7,214 <calloc_beebs+0x70>
 1d4:	00001837          	lui	a6,0x1
 1d8:	20482803          	lw	a6,516(a6) # 1204 <heap_end>
 1dc:	20e62023          	sw	a4,512(a2)
 1e0:	04d86a63          	bltu	a6,a3,234 <calloc_beebs+0x90>
 1e4:	20d5a423          	sw	a3,520(a1)
 1e8:	00078e63          	beqz	a5,204 <calloc_beebs+0x60>
 1ec:	00050613          	mv	a2,a0
 1f0:	00000593          	li	a1,0
 1f4:	00078513          	mv	a0,a5
 1f8:	00f12623          	sw	a5,12(sp)
 1fc:	ef9ff0ef          	jal	f4 <memset>
 200:	00c12783          	lw	a5,12(sp)
 204:	01c12083          	lw	ra,28(sp)
 208:	00078513          	mv	a0,a5
 20c:	02010113          	addi	sp,sp,32
 210:	00008067          	ret
 214:	00400813          	li	a6,4
 218:	41180833          	sub	a6,a6,a7
 21c:	01070733          	add	a4,a4,a6
 220:	010686b3          	add	a3,a3,a6
 224:	00001837          	lui	a6,0x1
 228:	20482803          	lw	a6,516(a6) # 1204 <heap_end>
 22c:	20e62023          	sw	a4,512(a2)
 230:	fad87ae3          	bgeu	a6,a3,1e4 <calloc_beebs+0x40>
 234:	01c12083          	lw	ra,28(sp)
 238:	00000793          	li	a5,0
 23c:	00078513          	mv	a0,a5
 240:	02010113          	addi	sp,sp,32
 244:	00008067          	ret

00000248 <free_beebs>:
 248:	00008067          	ret

0000024c <md5>:
 24c:	00001737          	lui	a4,0x1
 250:	da010113          	addi	sp,sp,-608
 254:	00070713          	mv	a4,a4
 258:	24912a23          	sw	s1,596(sp)
 25c:	25212823          	sw	s2,592(sp)
 260:	24112e23          	sw	ra,604(sp)
 264:	24812c23          	sw	s0,600(sp)
 268:	25312623          	sw	s3,588(sp)
 26c:	25412423          	sw	s4,584(sp)
 270:	25512223          	sw	s5,580(sp)
 274:	25612023          	sw	s6,576(sp)
 278:	23712e23          	sw	s7,572(sp)
 27c:	23812c23          	sw	s8,568(sp)
 280:	23912a23          	sw	s9,564(sp)
 284:	23a12823          	sw	s10,560(sp)
 288:	23b12623          	sw	s11,556(sp)
 28c:	00050913          	mv	s2,a0
 290:	00058493          	mv	s1,a1
 294:	00070793          	mv	a5,a4
 298:	10070613          	addi	a2,a4,256 # 1100 <__mulsi3+0xae4>
 29c:	02010693          	addi	a3,sp,32
 2a0:	0007a883          	lw	a7,0(a5)
 2a4:	0047a803          	lw	a6,4(a5)
 2a8:	0087a503          	lw	a0,8(a5)
 2ac:	00c7a583          	lw	a1,12(a5)
 2b0:	0116a023          	sw	a7,0(a3)
 2b4:	0106a223          	sw	a6,4(a3)
 2b8:	00a6a423          	sw	a0,8(a3)
 2bc:	00b6a623          	sw	a1,12(a3)
 2c0:	01078793          	addi	a5,a5,16
 2c4:	01068693          	addi	a3,a3,16
 2c8:	fcc79ce3          	bne	a5,a2,2a0 <md5+0x54>
 2cc:	20070713          	addi	a4,a4,512
 2d0:	12010693          	addi	a3,sp,288
 2d4:	0007a803          	lw	a6,0(a5)
 2d8:	0047a503          	lw	a0,4(a5)
 2dc:	0087a583          	lw	a1,8(a5)
 2e0:	00c7a603          	lw	a2,12(a5)
 2e4:	0106a023          	sw	a6,0(a3)
 2e8:	00a6a223          	sw	a0,4(a3)
 2ec:	00b6a423          	sw	a1,8(a3)
 2f0:	00c6a623          	sw	a2,12(a3)
 2f4:	01078793          	addi	a5,a5,16
 2f8:	01068693          	addi	a3,a3,16
 2fc:	fce79ce3          	bne	a5,a4,2d4 <md5+0x88>
 300:	00848a13          	addi	s4,s1,8
 304:	fc0a7a13          	andi	s4,s4,-64
 308:	67452637          	lui	a2,0x67452
 30c:	efcdb6b7          	lui	a3,0xefcdb
 310:	98bae737          	lui	a4,0x98bae
 314:	103257b7          	lui	a5,0x10325
 318:	cfe70713          	addi	a4,a4,-770 # 98badcfe <__stack_top+0x98ba5dfe>
 31c:	47678793          	addi	a5,a5,1142 # 10325476 <__stack_top+0x1031d576>
 320:	30160613          	addi	a2,a2,769 # 67452301 <__stack_top+0x6744a401>
 324:	b8968693          	addi	a3,a3,-1143 # efcdab89 <__stack_top+0xefcd2c89>
 328:	078a0513          	addi	a0,s4,120
 32c:	00100593          	li	a1,1
 330:	00001bb7          	lui	s7,0x1
 334:	00001b37          	lui	s6,0x1
 338:	00001ab7          	lui	s5,0x1
 33c:	00001db7          	lui	s11,0x1
 340:	20eaa823          	sw	a4,528(s5) # 1210 <h2>
 344:	20fda623          	sw	a5,524(s11) # 120c <h3>
 348:	20cbac23          	sw	a2,536(s7) # 1218 <h0>
 34c:	20db2a23          	sw	a3,532(s6) # 1214 <h1>
 350:	e55ff0ef          	jal	1a4 <calloc_beebs>
 354:	00048613          	mv	a2,s1
 358:	00090593          	mv	a1,s2
 35c:	00050413          	mv	s0,a0
 360:	d71ff0ef          	jal	d0 <memcpy>
 364:	038a0a13          	addi	s4,s4,56
 368:	009407b3          	add	a5,s0,s1
 36c:	f8000713          	li	a4,-128
 370:	00349493          	slli	s1,s1,0x3
 374:	00e78023          	sb	a4,0(a5)
 378:	01c10593          	addi	a1,sp,28
 37c:	01440533          	add	a0,s0,s4
 380:	00400613          	li	a2,4
 384:	00912e23          	sw	s1,28(sp)
 388:	d49ff0ef          	jal	d0 <memcpy>
 38c:	13405e63          	blez	s4,4c8 <md5+0x27c>
 390:	218bad03          	lw	s10,536(s7)
 394:	214b2c83          	lw	s9,532(s6)
 398:	210aac03          	lw	s8,528(s5)
 39c:	20cdaf83          	lw	t6,524(s11)
 3a0:	00000293          	li	t0,0
 3a4:	00f00493          	li	s1,15
 3a8:	01f00913          	li	s2,31
 3ac:	02f00993          	li	s3,47
 3b0:	04000393          	li	t2,64
 3b4:	01412623          	sw	s4,12(sp)
 3b8:	00000613          	li	a2,0
 3bc:	12010313          	addi	t1,sp,288
 3c0:	02010893          	addi	a7,sp,32
 3c4:	000f8813          	mv	a6,t6
 3c8:	000c0513          	mv	a0,s8
 3cc:	000c8593          	mv	a1,s9
 3d0:	000d0793          	mv	a5,s10
 3d4:	00000f13          	li	t5,0
 3d8:	00500e93          	li	t4,5
 3dc:	00100e13          	li	t3,1
 3e0:	08c4f463          	bgeu	s1,a2,468 <md5+0x21c>
 3e4:	00a5c733          	xor	a4,a1,a0
 3e8:	01077733          	and	a4,a4,a6
 3ec:	08c97863          	bgeu	s2,a2,47c <md5+0x230>
 3f0:	00a5c733          	xor	a4,a1,a0
 3f4:	01074733          	xor	a4,a4,a6
 3f8:	00fef693          	andi	a3,t4,15
 3fc:	08c9e663          	bltu	s3,a2,488 <md5+0x23c>
 400:	00269693          	slli	a3,a3,0x2
 404:	00d406b3          	add	a3,s0,a3
 408:	005686b3          	add	a3,a3,t0
 40c:	0006aa03          	lw	s4,0(a3)
 410:	00032683          	lw	a3,0(t1)
 414:	00160613          	addi	a2,a2,1
 418:	005e0e13          	addi	t3,t3,5
 41c:	00d70733          	add	a4,a4,a3
 420:	0008a683          	lw	a3,0(a7)
 424:	01470733          	add	a4,a4,s4
 428:	00f70733          	add	a4,a4,a5
 42c:	40d007b3          	neg	a5,a3
 430:	00d716b3          	sll	a3,a4,a3
 434:	00f75733          	srl	a4,a4,a5
 438:	00e6e6b3          	or	a3,a3,a4
 43c:	003e8e93          	addi	t4,t4,3
 440:	007f0f13          	addi	t5,t5,7
 444:	00430313          	addi	t1,t1,4
 448:	00488893          	addi	a7,a7,4
 44c:	00b686b3          	add	a3,a3,a1
 450:	00080793          	mv	a5,a6
 454:	04760463          	beq	a2,t2,49c <md5+0x250>
 458:	00050813          	mv	a6,a0
 45c:	00058513          	mv	a0,a1
 460:	00068593          	mv	a1,a3
 464:	f8c4e0e3          	bltu	s1,a2,3e4 <md5+0x198>
 468:	01054733          	xor	a4,a0,a6
 46c:	00b77733          	and	a4,a4,a1
 470:	01074733          	xor	a4,a4,a6
 474:	00060693          	mv	a3,a2
 478:	f89ff06f          	j	400 <md5+0x1b4>
 47c:	00a74733          	xor	a4,a4,a0
 480:	00fe7693          	andi	a3,t3,15
 484:	f7dff06f          	j	400 <md5+0x1b4>
 488:	fff84713          	not	a4,a6
 48c:	00b76733          	or	a4,a4,a1
 490:	00a74733          	xor	a4,a4,a0
 494:	00ff7693          	andi	a3,t5,15
 498:	f69ff06f          	j	400 <md5+0x1b4>
 49c:	00c12783          	lw	a5,12(sp)
 4a0:	04028293          	addi	t0,t0,64
 4a4:	010d0d33          	add	s10,s10,a6
 4a8:	00dc8cb3          	add	s9,s9,a3
 4ac:	00bc0c33          	add	s8,s8,a1
 4b0:	00af8fb3          	add	t6,t6,a0
 4b4:	f0f2c2e3          	blt	t0,a5,3b8 <md5+0x16c>
 4b8:	21abac23          	sw	s10,536(s7)
 4bc:	219b2a23          	sw	s9,532(s6)
 4c0:	218aa823          	sw	s8,528(s5)
 4c4:	21fda623          	sw	t6,524(s11)
 4c8:	00040513          	mv	a0,s0
 4cc:	d7dff0ef          	jal	248 <free_beebs>
 4d0:	25c12083          	lw	ra,604(sp)
 4d4:	25812403          	lw	s0,600(sp)
 4d8:	25412483          	lw	s1,596(sp)
 4dc:	25012903          	lw	s2,592(sp)
 4e0:	24c12983          	lw	s3,588(sp)
 4e4:	24812a03          	lw	s4,584(sp)
 4e8:	24412a83          	lw	s5,580(sp)
 4ec:	24012b03          	lw	s6,576(sp)
 4f0:	23c12b83          	lw	s7,572(sp)
 4f4:	23812c03          	lw	s8,568(sp)
 4f8:	23412c83          	lw	s9,564(sp)
 4fc:	23012d03          	lw	s10,560(sp)
 500:	22c12d83          	lw	s11,556(sp)
 504:	26010113          	addi	sp,sp,608
 508:	00008067          	ret

0000050c <benchmark_body.constprop.0>:
 50c:	fd010113          	addi	sp,sp,-48
 510:	02112623          	sw	ra,44(sp)
 514:	0a058063          	beqz	a1,5b4 <benchmark_body.constprop.0+0xa8>
 518:	01312e23          	sw	s3,28(sp)
 51c:	000019b7          	lui	s3,0x1
 520:	02812423          	sw	s0,40(sp)
 524:	03212023          	sw	s2,32(sp)
 528:	01412c23          	sw	s4,24(sp)
 52c:	01512a23          	sw	s5,20(sp)
 530:	02912223          	sw	s1,36(sp)
 534:	00050a93          	mv	s5,a0
 538:	00058913          	mv	s2,a1
 53c:	21c98993          	addi	s3,s3,540 # 121c <heap>
 540:	00000a13          	li	s4,0
 544:	3e800413          	li	s0,1000
 548:	00000493          	li	s1,0
 54c:	000015b7          	lui	a1,0x1
 550:	c0858593          	addi	a1,a1,-1016 # c08 <__mulsi3+0x5ec>
 554:	00098513          	mv	a0,s3
 558:	bb9ff0ef          	jal	110 <init_heap_beebs>
 55c:	3e800513          	li	a0,1000
 560:	bddff0ef          	jal	13c <malloc_beebs>
 564:	00000793          	li	a5,0
 568:	00f50733          	add	a4,a0,a5
 56c:	00f70023          	sb	a5,0(a4)
 570:	00178793          	addi	a5,a5,1
 574:	fe879ae3          	bne	a5,s0,568 <benchmark_body.constprop.0+0x5c>
 578:	00040593          	mv	a1,s0
 57c:	00a12623          	sw	a0,12(sp)
 580:	ccdff0ef          	jal	24c <md5>
 584:	00c12503          	lw	a0,12(sp)
 588:	00148493          	addi	s1,s1,1
 58c:	cbdff0ef          	jal	248 <free_beebs>
 590:	fb249ee3          	bne	s1,s2,54c <benchmark_body.constprop.0+0x40>
 594:	001a0a13          	addi	s4,s4,1
 598:	fb4a98e3          	bne	s5,s4,548 <benchmark_body.constprop.0+0x3c>
 59c:	02812403          	lw	s0,40(sp)
 5a0:	02412483          	lw	s1,36(sp)
 5a4:	02012903          	lw	s2,32(sp)
 5a8:	01c12983          	lw	s3,28(sp)
 5ac:	01812a03          	lw	s4,24(sp)
 5b0:	01412a83          	lw	s5,20(sp)
 5b4:	00001737          	lui	a4,0x1
 5b8:	000017b7          	lui	a5,0x1
 5bc:	21472683          	lw	a3,532(a4) # 1214 <h1>
 5c0:	2187a783          	lw	a5,536(a5) # 1218 <h0>
 5c4:	00001737          	lui	a4,0x1
 5c8:	21072703          	lw	a4,528(a4) # 1210 <h2>
 5cc:	00001637          	lui	a2,0x1
 5d0:	20c62503          	lw	a0,524(a2) # 120c <h3>
 5d4:	02c12083          	lw	ra,44(sp)
 5d8:	00d7c7b3          	xor	a5,a5,a3
 5dc:	00e7c7b3          	xor	a5,a5,a4
 5e0:	00a7c533          	xor	a0,a5,a0
 5e4:	03010113          	addi	sp,sp,48
 5e8:	00008067          	ret

000005ec <initialise_benchmark>:
 5ec:	00008067          	ret

000005f0 <warm_caches>:
 5f0:	00050593          	mv	a1,a0
 5f4:	00100513          	li	a0,1
 5f8:	f15ff06f          	j	50c <benchmark_body.constprop.0>

000005fc <benchmark>:
 5fc:	00100593          	li	a1,1
 600:	00200513          	li	a0,2
 604:	f09ff06f          	j	50c <benchmark_body.constprop.0>

00000608 <verify_benchmark>:
 608:	cc0997b7          	lui	a5,0xcc099
 60c:	c4c78793          	addi	a5,a5,-948 # cc098c4c <__stack_top+0xcc090d4c>
 610:	00f50533          	add	a0,a0,a5
 614:	00153513          	seqz	a0,a0
 618:	00008067          	ret

0000061c <__mulsi3>:
 61c:	00050613          	mv	a2,a0
 620:	00000513          	li	a0,0
 624:	0015f693          	andi	a3,a1,1
 628:	00068463          	beqz	a3,630 <__mulsi3+0x14>
 62c:	00c50533          	add	a0,a0,a2
 630:	0015d593          	srli	a1,a1,0x1
 634:	00161613          	slli	a2,a2,0x1
 638:	fe0596e3          	bnez	a1,624 <__mulsi3+0x8>
 63c:	00008067          	ret
