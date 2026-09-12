
D:\aaa1verilog_project\rv32i_cpu\benchmark\embench\build\tarfind\tarfind.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00008117          	auipc	sp,0x8
   4:	f0010113          	addi	sp,sp,-256 # 7f00 <__stack_top>
   8:	00001297          	auipc	t0,0x1
   c:	ff828293          	addi	t0,t0,-8 # 1000 <__data_end>
  10:	00003317          	auipc	t1,0x3
  14:	32430313          	addi	t1,t1,804 # 3334 <__bss_end>
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
  78:	344000ef          	jal	3bc <initialise_benchmark>
  7c:	00000513          	li	a0,0
  80:	324000ef          	jal	3a4 <warm_caches>
  84:	fadff0ef          	jal	30 <start_trigger>
  88:	328000ef          	jal	3b0 <benchmark>
  8c:	00a12623          	sw	a0,12(sp)
  90:	fb5ff0ef          	jal	44 <stop_trigger>
  94:	00c12503          	lw	a0,12(sp)
  98:	328000ef          	jal	3c0 <verify_benchmark>
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

000000d0 <memset>:
  d0:	00c50733          	add	a4,a0,a2
  d4:	00050793          	mv	a5,a0
  d8:	00060863          	beqz	a2,e8 <memset+0x18>
  dc:	00178793          	addi	a5,a5,1
  e0:	feb78fa3          	sb	a1,-1(a5)
  e4:	fef71ce3          	bne	a4,a5,dc <memset+0xc>
  e8:	00008067          	ret

000000ec <rand_beebs>:
  ec:	00001637          	lui	a2,0x1
  f0:	00c62703          	lw	a4,12(a2) # 100c <seed>
  f4:	000036b7          	lui	a3,0x3
  f8:	03968693          	addi	a3,a3,57 # 3039 <heap+0x2029>
  fc:	00871793          	slli	a5,a4,0x8
 100:	40e787b3          	sub	a5,a5,a4
 104:	00379793          	slli	a5,a5,0x3
 108:	00e787b3          	add	a5,a5,a4
 10c:	00779793          	slli	a5,a5,0x7
 110:	00e787b3          	add	a5,a5,a4
 114:	00379793          	slli	a5,a5,0x3
 118:	40e787b3          	sub	a5,a5,a4
 11c:	00579593          	slli	a1,a5,0x5
 120:	00b78533          	add	a0,a5,a1
 124:	00251513          	slli	a0,a0,0x2
 128:	40e50533          	sub	a0,a0,a4
 12c:	00251513          	slli	a0,a0,0x2
 130:	00e50533          	add	a0,a0,a4
 134:	00d50533          	add	a0,a0,a3
 138:	00151513          	slli	a0,a0,0x1
 13c:	00155513          	srli	a0,a0,0x1
 140:	00a62623          	sw	a0,12(a2)
 144:	01055513          	srli	a0,a0,0x10
 148:	00008067          	ret

0000014c <init_heap_beebs>:
 14c:	0035f793          	andi	a5,a1,3
 150:	02079263          	bnez	a5,174 <init_heap_beebs+0x28>
 154:	00b505b3          	add	a1,a0,a1
 158:	000016b7          	lui	a3,0x1
 15c:	00001737          	lui	a4,0x1
 160:	000017b7          	lui	a5,0x1
 164:	00b6a223          	sw	a1,4(a3) # 1004 <heap_end>
 168:	00a72423          	sw	a0,8(a4) # 1008 <heap_ptr>
 16c:	0007a023          	sw	zero,0(a5) # 1000 <__data_end>
 170:	00008067          	ret
 174:	0000006f          	j	174 <init_heap_beebs+0x28>

00000178 <malloc_beebs>:
 178:	00050793          	mv	a5,a0
 17c:	04050e63          	beqz	a0,1d8 <malloc_beebs+0x60>
 180:	00001637          	lui	a2,0x1
 184:	00862503          	lw	a0,8(a2) # 1008 <heap_ptr>
 188:	000016b7          	lui	a3,0x1
 18c:	0006a583          	lw	a1,0(a3) # 1000 <__data_end>
 190:	00f50733          	add	a4,a0,a5
 194:	00377813          	andi	a6,a4,3
 198:	00b787b3          	add	a5,a5,a1
 19c:	00081e63          	bnez	a6,1b8 <malloc_beebs+0x40>
 1a0:	000015b7          	lui	a1,0x1
 1a4:	0045a583          	lw	a1,4(a1) # 1004 <heap_end>
 1a8:	00f6a023          	sw	a5,0(a3)
 1ac:	02e5e663          	bltu	a1,a4,1d8 <malloc_beebs+0x60>
 1b0:	00e62423          	sw	a4,8(a2)
 1b4:	00008067          	ret
 1b8:	00400593          	li	a1,4
 1bc:	410585b3          	sub	a1,a1,a6
 1c0:	00b787b3          	add	a5,a5,a1
 1c4:	00b70733          	add	a4,a4,a1
 1c8:	000015b7          	lui	a1,0x1
 1cc:	0045a583          	lw	a1,4(a1) # 1004 <heap_end>
 1d0:	00f6a023          	sw	a5,0(a3)
 1d4:	fce5fee3          	bgeu	a1,a4,1b0 <malloc_beebs+0x38>
 1d8:	00000513          	li	a0,0
 1dc:	00008067          	ret

000001e0 <free_beebs>:
 1e0:	00008067          	ret

000001e4 <benchmark_body>:
 1e4:	1a058a63          	beqz	a1,398 <benchmark_body+0x1b4>
 1e8:	fb010113          	addi	sp,sp,-80
 1ec:	000017b7          	lui	a5,0x1
 1f0:	03412c23          	sw	s4,56(sp)
 1f4:	03512a23          	sw	s5,52(sp)
 1f8:	01078793          	addi	a5,a5,16 # 1010 <heap>
 1fc:	00002ab7          	lui	s5,0x2
 200:	00002a37          	lui	s4,0x2
 204:	04812423          	sw	s0,72(sp)
 208:	05212023          	sw	s2,64(sp)
 20c:	03312e23          	sw	s3,60(sp)
 210:	03612823          	sw	s6,48(sp)
 214:	04112623          	sw	ra,76(sp)
 218:	04912223          	sw	s1,68(sp)
 21c:	03712623          	sw	s7,44(sp)
 220:	03812423          	sw	s8,40(sp)
 224:	03912223          	sw	s9,36(sp)
 228:	03a12023          	sw	s10,32(sp)
 22c:	01b12e23          	sw	s11,28(sp)
 230:	00050b13          	mv	s6,a0
 234:	00058913          	mv	s2,a1
 238:	00f12623          	sw	a5,12(sp)
 23c:	323a8a93          	addi	s5,s5,803 # 2323 <heap+0x1313>
 240:	34ba0a13          	addi	s4,s4,843 # 234b <heap+0x133b>
 244:	00000993          	li	s3,0
 248:	03000413          	li	s0,48
 24c:	00000b93          	li	s7,0
 250:	00c12503          	lw	a0,12(sp)
 254:	000025b7          	lui	a1,0x2
 258:	32458593          	addi	a1,a1,804 # 2324 <heap+0x1314>
 25c:	ef1ff0ef          	jal	14c <init_heap_beebs>
 260:	00002537          	lui	a0,0x2
 264:	32350513          	addi	a0,a0,803 # 2323 <heap+0x1313>
 268:	f11ff0ef          	jal	178 <malloc_beebs>
 26c:	00050493          	mv	s1,a0
 270:	01450d33          	add	s10,a0,s4
 274:	00550c13          	addi	s8,a0,5
 278:	00050c93          	mv	s9,a0
 27c:	10100613          	li	a2,257
 280:	00000593          	li	a1,0
 284:	000c8513          	mv	a0,s9
 288:	e49ff0ef          	jal	d0 <memset>
 28c:	000c8d93          	mv	s11,s9
 290:	088c8e23          	sb	s0,156(s9)
 294:	e59ff0ef          	jal	ec <rand_beebs>
 298:	01a00593          	li	a1,26
 29c:	1b4000ef          	jal	450 <__modsi3>
 2a0:	04150513          	addi	a0,a0,65
 2a4:	00ad8023          	sb	a0,0(s11)
 2a8:	001d8d93          	addi	s11,s11,1
 2ac:	ff8d94e3          	bne	s11,s8,294 <benchmark_body+0xb0>
 2b0:	068c8e23          	sb	s0,124(s9)
 2b4:	102d8c13          	addi	s8,s11,258
 2b8:	101c8c93          	addi	s9,s9,257
 2bc:	fdac10e3          	bne	s8,s10,27c <benchmark_body+0x98>
 2c0:	00001537          	lui	a0,0x1
 2c4:	000018b7          	lui	a7,0x1
 2c8:	11150513          	addi	a0,a0,273 # 1111 <heap+0x101>
 2cc:	61688893          	addi	a7,a7,1558 # 1616 <heap+0x606>
 2d0:	00a48533          	add	a0,s1,a0
 2d4:	011488b3          	add	a7,s1,a7
 2d8:	00000c13          	li	s8,0
 2dc:	01548833          	add	a6,s1,s5
 2e0:	00048593          	mv	a1,s1
 2e4:	0005c703          	lbu	a4,0(a1)
 2e8:	00058693          	mv	a3,a1
 2ec:	00050793          	mv	a5,a0
 2f0:	00071a63          	bnez	a4,304 <benchmark_body+0x120>
 2f4:	08c0006f          	j	380 <benchmark_body+0x19c>
 2f8:	00e61e63          	bne	a2,a4,314 <benchmark_body+0x130>
 2fc:	0006c703          	lbu	a4,0(a3)
 300:	08070063          	beqz	a4,380 <benchmark_body+0x19c>
 304:	0007c603          	lbu	a2,0(a5)
 308:	00168693          	addi	a3,a3,1
 30c:	00178793          	addi	a5,a5,1
 310:	fe0614e3          	bnez	a2,2f8 <benchmark_body+0x114>
 314:	10158593          	addi	a1,a1,257
 318:	fd0596e3          	bne	a1,a6,2e4 <benchmark_body+0x100>
 31c:	10150513          	addi	a0,a0,257
 320:	fca890e3          	bne	a7,a0,2e0 <benchmark_body+0xfc>
 324:	00048513          	mv	a0,s1
 328:	001b8b93          	addi	s7,s7,1
 32c:	eb5ff0ef          	jal	1e0 <free_beebs>
 330:	f37910e3          	bne	s2,s7,250 <benchmark_body+0x6c>
 334:	00198993          	addi	s3,s3,1
 338:	f13b1ae3          	bne	s6,s3,24c <benchmark_body+0x68>
 33c:	04c12083          	lw	ra,76(sp)
 340:	04812403          	lw	s0,72(sp)
 344:	ffbc0513          	addi	a0,s8,-5
 348:	04412483          	lw	s1,68(sp)
 34c:	04012903          	lw	s2,64(sp)
 350:	03c12983          	lw	s3,60(sp)
 354:	03812a03          	lw	s4,56(sp)
 358:	03412a83          	lw	s5,52(sp)
 35c:	03012b03          	lw	s6,48(sp)
 360:	02c12b83          	lw	s7,44(sp)
 364:	02812c03          	lw	s8,40(sp)
 368:	02412c83          	lw	s9,36(sp)
 36c:	02012d03          	lw	s10,32(sp)
 370:	01c12d83          	lw	s11,28(sp)
 374:	00153513          	seqz	a0,a0
 378:	05010113          	addi	sp,sp,80
 37c:	00008067          	ret
 380:	0007c783          	lbu	a5,0(a5)
 384:	f80798e3          	bnez	a5,314 <benchmark_body+0x130>
 388:	10150513          	addi	a0,a0,257
 38c:	001c0c13          	addi	s8,s8,1
 390:	f4a898e3          	bne	a7,a0,2e0 <benchmark_body+0xfc>
 394:	f91ff06f          	j	324 <benchmark_body+0x140>
 398:	ffbc0513          	addi	a0,s8,-5
 39c:	00153513          	seqz	a0,a0
 3a0:	00008067          	ret

000003a4 <warm_caches>:
 3a4:	00050593          	mv	a1,a0
 3a8:	00100513          	li	a0,1
 3ac:	e39ff06f          	j	1e4 <benchmark_body>

000003b0 <benchmark>:
 3b0:	00100593          	li	a1,1
 3b4:	00200513          	li	a0,2
 3b8:	e2dff06f          	j	1e4 <benchmark_body>

000003bc <initialise_benchmark>:
 3bc:	00008067          	ret

000003c0 <verify_benchmark>:
 3c0:	fff50513          	addi	a0,a0,-1
 3c4:	00153513          	seqz	a0,a0
 3c8:	00008067          	ret

000003cc <__divsi3>:
 3cc:	06054063          	bltz	a0,42c <__umodsi3+0x10>
 3d0:	0605c663          	bltz	a1,43c <__umodsi3+0x20>

000003d4 <__hidden___udivsi3>:
 3d4:	00058613          	mv	a2,a1
 3d8:	00050593          	mv	a1,a0
 3dc:	fff00513          	li	a0,-1
 3e0:	02060c63          	beqz	a2,418 <__hidden___udivsi3+0x44>
 3e4:	00100693          	li	a3,1
 3e8:	00b67a63          	bgeu	a2,a1,3fc <__hidden___udivsi3+0x28>
 3ec:	00c05863          	blez	a2,3fc <__hidden___udivsi3+0x28>
 3f0:	00161613          	slli	a2,a2,0x1
 3f4:	00169693          	slli	a3,a3,0x1
 3f8:	feb66ae3          	bltu	a2,a1,3ec <__hidden___udivsi3+0x18>
 3fc:	00000513          	li	a0,0
 400:	00c5e663          	bltu	a1,a2,40c <__hidden___udivsi3+0x38>
 404:	40c585b3          	sub	a1,a1,a2
 408:	00d56533          	or	a0,a0,a3
 40c:	0016d693          	srli	a3,a3,0x1
 410:	00165613          	srli	a2,a2,0x1
 414:	fe0696e3          	bnez	a3,400 <__hidden___udivsi3+0x2c>
 418:	00008067          	ret

0000041c <__umodsi3>:
 41c:	00008293          	mv	t0,ra
 420:	fb5ff0ef          	jal	3d4 <__hidden___udivsi3>
 424:	00058513          	mv	a0,a1
 428:	00028067          	jr	t0
 42c:	40a00533          	neg	a0,a0
 430:	00b04863          	bgtz	a1,440 <__umodsi3+0x24>
 434:	40b005b3          	neg	a1,a1
 438:	f9dff06f          	j	3d4 <__hidden___udivsi3>
 43c:	40b005b3          	neg	a1,a1
 440:	00008293          	mv	t0,ra
 444:	f91ff0ef          	jal	3d4 <__hidden___udivsi3>
 448:	40a00533          	neg	a0,a0
 44c:	00028067          	jr	t0

00000450 <__modsi3>:
 450:	00008293          	mv	t0,ra
 454:	0005ca63          	bltz	a1,468 <__modsi3+0x18>
 458:	00054c63          	bltz	a0,470 <__modsi3+0x20>
 45c:	f79ff0ef          	jal	3d4 <__hidden___udivsi3>
 460:	00058513          	mv	a0,a1
 464:	00028067          	jr	t0
 468:	40b005b3          	neg	a1,a1
 46c:	fe0558e3          	bgez	a0,45c <__modsi3+0xc>
 470:	40a00533          	neg	a0,a0
 474:	f61ff0ef          	jal	3d4 <__hidden___udivsi3>
 478:	40b00533          	neg	a0,a1
 47c:	00028067          	jr	t0
