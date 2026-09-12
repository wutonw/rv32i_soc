
D:\aaa1verilog_project\rv32i_cpu\benchmark\embench\build\sglib-combined\sglib-combined.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00008117          	auipc	sp,0x8
   4:	f0010113          	addi	sp,sp,-256 # 7f00 <__stack_top>
   8:	00001297          	auipc	t0,0x1
   c:	31828293          	addi	t0,t0,792 # 1320 <heap_requested>
  10:	00003317          	auipc	t1,0x3
  14:	50030313          	addi	t1,t1,1280 # 3510 <__bss_end>
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
  78:	671000ef          	jal	ee8 <initialise_benchmark>
  7c:	00000513          	li	a0,0
  80:	66d000ef          	jal	eec <warm_caches>
  84:	fadff0ef          	jal	30 <start_trigger>
  88:	671000ef          	jal	ef8 <benchmark>
  8c:	00a12623          	sw	a0,12(sp)
  90:	fb5ff0ef          	jal	44 <stop_trigger>
  94:	00c12503          	lw	a0,12(sp)
  98:	545000ef          	jal	ddc <verify_benchmark>
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

00000128 <init_heap_beebs>:
 128:	0035f793          	andi	a5,a1,3
 12c:	02079263          	bnez	a5,150 <init_heap_beebs+0x28>
 130:	00b505b3          	add	a1,a0,a1
 134:	000016b7          	lui	a3,0x1
 138:	00001737          	lui	a4,0x1
 13c:	000017b7          	lui	a5,0x1
 140:	32b6a223          	sw	a1,804(a3) # 1324 <heap_end>
 144:	32a72423          	sw	a0,808(a4) # 1328 <heap_ptr>
 148:	3207a023          	sw	zero,800(a5) # 1320 <heap_requested>
 14c:	00008067          	ret
 150:	0000006f          	j	150 <init_heap_beebs+0x28>

00000154 <check_heap_beebs>:
 154:	000017b7          	lui	a5,0x1
 158:	3207a703          	lw	a4,800(a5) # 1320 <heap_requested>
 15c:	000017b7          	lui	a5,0x1
 160:	3247a783          	lw	a5,804(a5) # 1324 <heap_end>
 164:	00e50533          	add	a0,a0,a4
 168:	00a7b533          	sltu	a0,a5,a0
 16c:	00154513          	xori	a0,a0,1
 170:	00008067          	ret

00000174 <malloc_beebs>:
 174:	00050793          	mv	a5,a0
 178:	04050e63          	beqz	a0,1d4 <malloc_beebs+0x60>
 17c:	00001637          	lui	a2,0x1
 180:	32862503          	lw	a0,808(a2) # 1328 <heap_ptr>
 184:	000016b7          	lui	a3,0x1
 188:	3206a583          	lw	a1,800(a3) # 1320 <heap_requested>
 18c:	00f50733          	add	a4,a0,a5
 190:	00377813          	andi	a6,a4,3
 194:	00b787b3          	add	a5,a5,a1
 198:	00081e63          	bnez	a6,1b4 <malloc_beebs+0x40>
 19c:	000015b7          	lui	a1,0x1
 1a0:	3245a583          	lw	a1,804(a1) # 1324 <heap_end>
 1a4:	32f6a023          	sw	a5,800(a3)
 1a8:	02e5e663          	bltu	a1,a4,1d4 <malloc_beebs+0x60>
 1ac:	32e62423          	sw	a4,808(a2)
 1b0:	00008067          	ret
 1b4:	00400593          	li	a1,4
 1b8:	410585b3          	sub	a1,a1,a6
 1bc:	00b787b3          	add	a5,a5,a1
 1c0:	00b70733          	add	a4,a4,a1
 1c4:	000015b7          	lui	a1,0x1
 1c8:	3245a583          	lw	a1,804(a1) # 1324 <heap_end>
 1cc:	32f6a023          	sw	a5,800(a3)
 1d0:	fce5fee3          	bgeu	a1,a4,1ac <malloc_beebs+0x38>
 1d4:	00000513          	li	a0,0
 1d8:	00008067          	ret

000001dc <sglib___rbtree_add_recursive.constprop.0>:
 1dc:	00052783          	lw	a5,0(a0)
 1e0:	04078a63          	beqz	a5,234 <sglib___rbtree_add_recursive.constprop.0+0x58>
 1e4:	0005a703          	lw	a4,0(a1)
 1e8:	0007a683          	lw	a3,0(a5)
 1ec:	fe010113          	addi	sp,sp,-32
 1f0:	00812c23          	sw	s0,24(sp)
 1f4:	00112e23          	sw	ra,28(sp)
 1f8:	40d70733          	sub	a4,a4,a3
 1fc:	00050413          	mv	s0,a0
 200:	00074663          	bltz	a4,20c <sglib___rbtree_add_recursive.constprop.0+0x30>
 204:	0a071a63          	bnez	a4,2b8 <sglib___rbtree_add_recursive.constprop.0+0xdc>
 208:	0af5f863          	bgeu	a1,a5,2b8 <sglib___rbtree_add_recursive.constprop.0+0xdc>
 20c:	00878513          	addi	a0,a5,8
 210:	00f12623          	sw	a5,12(sp)
 214:	fc9ff0ef          	jal	1dc <sglib___rbtree_add_recursive.constprop.0>
 218:	00c12783          	lw	a5,12(sp)
 21c:	0047c783          	lbu	a5,4(a5)
 220:	02078263          	beqz	a5,244 <sglib___rbtree_add_recursive.constprop.0+0x68>
 224:	01c12083          	lw	ra,28(sp)
 228:	01812403          	lw	s0,24(sp)
 22c:	02010113          	addi	sp,sp,32
 230:	00008067          	ret
 234:	00100793          	li	a5,1
 238:	00f58223          	sb	a5,4(a1)
 23c:	00b52023          	sw	a1,0(a0)
 240:	00008067          	ret
 244:	00042783          	lw	a5,0(s0)
 248:	0087a703          	lw	a4,8(a5)
 24c:	00c7a683          	lw	a3,12(a5)
 250:	00474603          	lbu	a2,4(a4)
 254:	00068863          	beqz	a3,264 <sglib___rbtree_add_recursive.constprop.0+0x88>
 258:	0046c583          	lbu	a1,4(a3)
 25c:	00100513          	li	a0,1
 260:	10a58e63          	beq	a1,a0,37c <sglib___rbtree_add_recursive.constprop.0+0x1a0>
 264:	00100693          	li	a3,1
 268:	fad61ee3          	bne	a2,a3,224 <sglib___rbtree_add_recursive.constprop.0+0x48>
 26c:	00872583          	lw	a1,8(a4)
 270:	00c72683          	lw	a3,12(a4)
 274:	00058663          	beqz	a1,280 <sglib___rbtree_add_recursive.constprop.0+0xa4>
 278:	0045c503          	lbu	a0,4(a1)
 27c:	0cc50463          	beq	a0,a2,344 <sglib___rbtree_add_recursive.constprop.0+0x168>
 280:	fa0682e3          	beqz	a3,224 <sglib___rbtree_add_recursive.constprop.0+0x48>
 284:	0046c603          	lbu	a2,4(a3)
 288:	00100593          	li	a1,1
 28c:	f8b61ce3          	bne	a2,a1,224 <sglib___rbtree_add_recursive.constprop.0+0x48>
 290:	0086a503          	lw	a0,8(a3)
 294:	00c6a583          	lw	a1,12(a3)
 298:	00a72623          	sw	a0,12(a4)
 29c:	00b7a423          	sw	a1,8(a5)
 2a0:	00e6a423          	sw	a4,8(a3)
 2a4:	00f6a623          	sw	a5,12(a3)
 2a8:	00068223          	sb	zero,4(a3)
 2ac:	00c78223          	sb	a2,4(a5)
 2b0:	00d42023          	sw	a3,0(s0)
 2b4:	f71ff06f          	j	224 <sglib___rbtree_add_recursive.constprop.0+0x48>
 2b8:	00c78513          	addi	a0,a5,12
 2bc:	00f12623          	sw	a5,12(sp)
 2c0:	f1dff0ef          	jal	1dc <sglib___rbtree_add_recursive.constprop.0>
 2c4:	00c12783          	lw	a5,12(sp)
 2c8:	0047c783          	lbu	a5,4(a5)
 2cc:	f4079ce3          	bnez	a5,224 <sglib___rbtree_add_recursive.constprop.0+0x48>
 2d0:	00042783          	lw	a5,0(s0)
 2d4:	00c7a703          	lw	a4,12(a5)
 2d8:	0087a683          	lw	a3,8(a5)
 2dc:	00474603          	lbu	a2,4(a4)
 2e0:	00068863          	beqz	a3,2f0 <sglib___rbtree_add_recursive.constprop.0+0x114>
 2e4:	0046c583          	lbu	a1,4(a3)
 2e8:	00100513          	li	a0,1
 2ec:	0ca58663          	beq	a1,a0,3b8 <sglib___rbtree_add_recursive.constprop.0+0x1dc>
 2f0:	00100693          	li	a3,1
 2f4:	f2d618e3          	bne	a2,a3,224 <sglib___rbtree_add_recursive.constprop.0+0x48>
 2f8:	00c72583          	lw	a1,12(a4)
 2fc:	00872683          	lw	a3,8(a4)
 300:	00058663          	beqz	a1,30c <sglib___rbtree_add_recursive.constprop.0+0x130>
 304:	0045c503          	lbu	a0,4(a1)
 308:	04c50c63          	beq	a0,a2,360 <sglib___rbtree_add_recursive.constprop.0+0x184>
 30c:	f0068ce3          	beqz	a3,224 <sglib___rbtree_add_recursive.constprop.0+0x48>
 310:	0046c603          	lbu	a2,4(a3)
 314:	00100593          	li	a1,1
 318:	f0b616e3          	bne	a2,a1,224 <sglib___rbtree_add_recursive.constprop.0+0x48>
 31c:	00c6a503          	lw	a0,12(a3)
 320:	0086a583          	lw	a1,8(a3)
 324:	00a72423          	sw	a0,8(a4)
 328:	00b7a623          	sw	a1,12(a5)
 32c:	00e6a623          	sw	a4,12(a3)
 330:	00f6a423          	sw	a5,8(a3)
 334:	00068223          	sb	zero,4(a3)
 338:	00c78223          	sb	a2,4(a5)
 33c:	00d42023          	sw	a3,0(s0)
 340:	ee5ff06f          	j	224 <sglib___rbtree_add_recursive.constprop.0+0x48>
 344:	00d7a423          	sw	a3,8(a5)
 348:	00b72423          	sw	a1,8(a4)
 34c:	00f72623          	sw	a5,12(a4)
 350:	00c78223          	sb	a2,4(a5)
 354:	00070223          	sb	zero,4(a4)
 358:	00e42023          	sw	a4,0(s0)
 35c:	ec9ff06f          	j	224 <sglib___rbtree_add_recursive.constprop.0+0x48>
 360:	00d7a623          	sw	a3,12(a5)
 364:	00b72623          	sw	a1,12(a4)
 368:	00f72423          	sw	a5,8(a4)
 36c:	00c78223          	sb	a2,4(a5)
 370:	00070223          	sb	zero,4(a4)
 374:	00e42023          	sw	a4,0(s0)
 378:	eadff06f          	j	224 <sglib___rbtree_add_recursive.constprop.0+0x48>
 37c:	eab614e3          	bne	a2,a1,224 <sglib___rbtree_add_recursive.constprop.0+0x48>
 380:	00872583          	lw	a1,8(a4)
 384:	00058663          	beqz	a1,390 <sglib___rbtree_add_recursive.constprop.0+0x1b4>
 388:	0045c583          	lbu	a1,4(a1)
 38c:	00c58c63          	beq	a1,a2,3a4 <sglib___rbtree_add_recursive.constprop.0+0x1c8>
 390:	00c72603          	lw	a2,12(a4)
 394:	e80608e3          	beqz	a2,224 <sglib___rbtree_add_recursive.constprop.0+0x48>
 398:	00464583          	lbu	a1,4(a2)
 39c:	00100613          	li	a2,1
 3a0:	e8c592e3          	bne	a1,a2,224 <sglib___rbtree_add_recursive.constprop.0+0x48>
 3a4:	00070223          	sb	zero,4(a4)
 3a8:	00068223          	sb	zero,4(a3)
 3ac:	00100713          	li	a4,1
 3b0:	00e78223          	sb	a4,4(a5)
 3b4:	e71ff06f          	j	224 <sglib___rbtree_add_recursive.constprop.0+0x48>
 3b8:	e6b616e3          	bne	a2,a1,224 <sglib___rbtree_add_recursive.constprop.0+0x48>
 3bc:	00c72583          	lw	a1,12(a4)
 3c0:	00058663          	beqz	a1,3cc <sglib___rbtree_add_recursive.constprop.0+0x1f0>
 3c4:	0045c583          	lbu	a1,4(a1)
 3c8:	fcc58ee3          	beq	a1,a2,3a4 <sglib___rbtree_add_recursive.constprop.0+0x1c8>
 3cc:	00872603          	lw	a2,8(a4)
 3d0:	fc0614e3          	bnez	a2,398 <sglib___rbtree_add_recursive.constprop.0+0x1bc>
 3d4:	e51ff06f          	j	224 <sglib___rbtree_add_recursive.constprop.0+0x48>

000003d8 <sglib_dllist_sort>:
 3d8:	00052783          	lw	a5,0(a0)
 3dc:	16078a63          	beqz	a5,550 <sglib_dllist_sort+0x178>
 3e0:	ff010113          	addi	sp,sp,-16
 3e4:	00078693          	mv	a3,a5
 3e8:	0087a783          	lw	a5,8(a5)
 3ec:	fe079ce3          	bnez	a5,3e4 <sglib_dllist_sort+0xc>
 3f0:	00100813          	li	a6,1
 3f4:	00080e13          	mv	t3,a6
 3f8:	00012623          	sw	zero,12(sp)
 3fc:	00000313          	li	t1,0
 400:	00c10613          	addi	a2,sp,12
 404:	00068713          	mv	a4,a3
 408:	00100593          	li	a1,1
 40c:	0d0e5e63          	bge	t3,a6,4e8 <sglib_dllist_sort+0x110>
 410:	00472703          	lw	a4,4(a4)
 414:	00158593          	addi	a1,a1,1
 418:	0105a7b3          	slt	a5,a1,a6
 41c:	00e038b3          	snez	a7,a4
 420:	0117f7b3          	and	a5,a5,a7
 424:	fe0796e3          	bnez	a5,410 <sglib_dllist_sort+0x38>
 428:	0e070063          	beqz	a4,508 <sglib_dllist_sort+0x130>
 42c:	00472783          	lw	a5,4(a4)
 430:	00072223          	sw	zero,4(a4)
 434:	0e078863          	beqz	a5,524 <sglib_dllist_sort+0x14c>
 438:	00078713          	mv	a4,a5
 43c:	00100593          	li	a1,1
 440:	00158593          	addi	a1,a1,1
 444:	00472703          	lw	a4,4(a4)
 448:	0105d463          	bge	a1,a6,450 <sglib_dllist_sort+0x78>
 44c:	fe071ae3          	bnez	a4,440 <sglib_dllist_sort+0x68>
 450:	00000893          	li	a7,0
 454:	00070663          	beqz	a4,460 <sglib_dllist_sort+0x88>
 458:	00472883          	lw	a7,4(a4)
 45c:	00072223          	sw	zero,4(a4)
 460:	0006a583          	lw	a1,0(a3)
 464:	0007a703          	lw	a4,0(a5)
 468:	04e5cc63          	blt	a1,a4,4c0 <sglib_dllist_sort+0xe8>
 46c:	00f62023          	sw	a5,0(a2)
 470:	00478613          	addi	a2,a5,4
 474:	0047a783          	lw	a5,4(a5)
 478:	00f03733          	snez	a4,a5
 47c:	fe0712e3          	bnez	a4,460 <sglib_dllist_sort+0x88>
 480:	04068c63          	beqz	a3,4d8 <sglib_dllist_sort+0x100>
 484:	00d62023          	sw	a3,0(a2)
 488:	00068793          	mv	a5,a3
 48c:	00088693          	mv	a3,a7
 490:	00078613          	mv	a2,a5
 494:	0047a783          	lw	a5,4(a5)
 498:	fe079ce3          	bnez	a5,490 <sglib_dllist_sort+0xb8>
 49c:	00460613          	addi	a2,a2,4
 4a0:	00100313          	li	t1,1
 4a4:	f60890e3          	bnez	a7,404 <sglib_dllist_sort+0x2c>
 4a8:	00c12683          	lw	a3,12(sp)
 4ac:	00181813          	slli	a6,a6,0x1
 4b0:	f40694e3          	bnez	a3,3f8 <sglib_dllist_sort+0x20>
 4b4:	00d52023          	sw	a3,0(a0)
 4b8:	01010113          	addi	sp,sp,16
 4bc:	00008067          	ret
 4c0:	00d62023          	sw	a3,0(a2)
 4c4:	00468613          	addi	a2,a3,4
 4c8:	0046a683          	lw	a3,4(a3)
 4cc:	00d03733          	snez	a4,a3
 4d0:	f80718e3          	bnez	a4,460 <sglib_dllist_sort+0x88>
 4d4:	fadff06f          	j	480 <sglib_dllist_sort+0xa8>
 4d8:	00f62023          	sw	a5,0(a2)
 4dc:	00088693          	mv	a3,a7
 4e0:	fa0798e3          	bnez	a5,490 <sglib_dllist_sort+0xb8>
 4e4:	fbdff06f          	j	4a0 <sglib_dllist_sort+0xc8>
 4e8:	0046a703          	lw	a4,4(a3)
 4ec:	0006a223          	sw	zero,4(a3)
 4f0:	00070793          	mv	a5,a4
 4f4:	02070663          	beqz	a4,520 <sglib_dllist_sort+0x148>
 4f8:	00472883          	lw	a7,4(a4)
 4fc:	00072223          	sw	zero,4(a4)
 500:	f80702e3          	beqz	a4,484 <sglib_dllist_sort+0xac>
 504:	f5dff06f          	j	460 <sglib_dllist_sort+0x88>
 508:	00d62023          	sw	a3,0(a2)
 50c:	00c12683          	lw	a3,12(sp)
 510:	00030e63          	beqz	t1,52c <sglib_dllist_sort+0x154>
 514:	00181813          	slli	a6,a6,0x1
 518:	ee0690e3          	bnez	a3,3f8 <sglib_dllist_sort+0x20>
 51c:	f99ff06f          	j	4b4 <sglib_dllist_sort+0xdc>
 520:	02071a63          	bnez	a4,554 <sglib_dllist_sort+0x17c>
 524:	00000893          	li	a7,0
 528:	f5dff06f          	j	484 <sglib_dllist_sort+0xac>
 52c:	f80684e3          	beqz	a3,4b4 <sglib_dllist_sort+0xdc>
 530:	00068793          	mv	a5,a3
 534:	00e7a423          	sw	a4,8(a5)
 538:	00078713          	mv	a4,a5
 53c:	0047a783          	lw	a5,4(a5)
 540:	fe079ae3          	bnez	a5,534 <sglib_dllist_sort+0x15c>
 544:	00d52023          	sw	a3,0(a0)
 548:	01010113          	addi	sp,sp,16
 54c:	00008067          	ret
 550:	00008067          	ret
 554:	00000893          	li	a7,0
 558:	f09ff06f          	j	460 <sglib_dllist_sort+0x88>

0000055c <sglib__rbtree_it_compute_current_elem>:
 55c:	fd010113          	addi	sp,sp,-48
 560:	28451783          	lh	a5,644(a0)
 564:	03212023          	sw	s2,32(sp)
 568:	01412c23          	sw	s4,24(sp)
 56c:	02112623          	sw	ra,44(sp)
 570:	00052023          	sw	zero,0(a0)
 574:	28852903          	lw	s2,648(a0)
 578:	28c52a03          	lw	s4,652(a0)
 57c:	08f05663          	blez	a5,608 <sglib__rbtree_it_compute_current_elem+0xac>
 580:	02912223          	sw	s1,36(sp)
 584:	01712623          	sw	s7,12(sp)
 588:	02812423          	sw	s0,40(sp)
 58c:	01312e23          	sw	s3,28(sp)
 590:	01512a23          	sw	s5,20(sp)
 594:	01612823          	sw	s6,16(sp)
 598:	00050493          	mv	s1,a0
 59c:	fff78693          	addi	a3,a5,-1
 5a0:	00100b93          	li	s7,1
 5a4:	00d489b3          	add	s3,s1,a3
 5a8:	0049c703          	lbu	a4,4(s3)
 5ac:	00078a93          	mv	s5,a5
 5b0:	06ebf663          	bgeu	s7,a4,61c <sglib__rbtree_it_compute_current_elem+0xc0>
 5b4:	01069793          	slli	a5,a3,0x10
 5b8:	4107d793          	srai	a5,a5,0x10
 5bc:	28f49223          	sh	a5,644(s1)
 5c0:	02f05863          	blez	a5,5f0 <sglib__rbtree_it_compute_current_elem+0x94>
 5c4:	fff78693          	addi	a3,a5,-1
 5c8:	00d48733          	add	a4,s1,a3
 5cc:	00474703          	lbu	a4,4(a4)
 5d0:	28649603          	lh	a2,646(s1)
 5d4:	00e61a63          	bne	a2,a4,5e8 <sglib__rbtree_it_compute_current_elem+0x8c>
 5d8:	00279713          	slli	a4,a5,0x2
 5dc:	00e48733          	add	a4,s1,a4
 5e0:	08072703          	lw	a4,128(a4)
 5e4:	00e4a023          	sw	a4,0(s1)
 5e8:	0004a703          	lw	a4,0(s1)
 5ec:	fa070ce3          	beqz	a4,5a4 <sglib__rbtree_it_compute_current_elem+0x48>
 5f0:	02812403          	lw	s0,40(sp)
 5f4:	02412483          	lw	s1,36(sp)
 5f8:	01c12983          	lw	s3,28(sp)
 5fc:	01412a83          	lw	s5,20(sp)
 600:	01012b03          	lw	s6,16(sp)
 604:	00c12b83          	lw	s7,12(sp)
 608:	02c12083          	lw	ra,44(sp)
 60c:	02012903          	lw	s2,32(sp)
 610:	01812a03          	lw	s4,24(sp)
 614:	03010113          	addi	sp,sp,48
 618:	00008067          	ret
 61c:	00279b13          	slli	s6,a5,0x2
 620:	01648b33          	add	s6,s1,s6
 624:	080b2783          	lw	a5,128(s6)
 628:	06071c63          	bnez	a4,6a0 <sglib__rbtree_it_compute_current_elem+0x144>
 62c:	0087a403          	lw	s0,8(a5)
 630:	04090463          	beqz	s2,678 <sglib__rbtree_it_compute_current_elem+0x11c>
 634:	060a0e63          	beqz	s4,6b0 <sglib__rbtree_it_compute_current_elem+0x154>
 638:	0a040863          	beqz	s0,6e8 <sglib__rbtree_it_compute_current_elem+0x18c>
 63c:	00040593          	mv	a1,s0
 640:	00090513          	mv	a0,s2
 644:	000a00e7          	jalr	s4
 648:	02054263          	bltz	a0,66c <sglib__rbtree_it_compute_current_elem+0x110>
 64c:	04050e63          	beqz	a0,6a8 <sglib__rbtree_it_compute_current_elem+0x14c>
 650:	00c42403          	lw	s0,12(s0)
 654:	fe0414e3          	bnez	s0,63c <sglib__rbtree_it_compute_current_elem+0xe0>
 658:	28449783          	lh	a5,644(s1)
 65c:	0049c703          	lbu	a4,4(s3)
 660:	00170713          	addi	a4,a4,1
 664:	00e98223          	sb	a4,4(s3)
 668:	f59ff06f          	j	5c0 <sglib__rbtree_it_compute_current_elem+0x64>
 66c:	00842403          	lw	s0,8(s0)
 670:	fc0416e3          	bnez	s0,63c <sglib__rbtree_it_compute_current_elem+0xe0>
 674:	fe5ff06f          	j	658 <sglib__rbtree_it_compute_current_elem+0xfc>
 678:	28449783          	lh	a5,644(s1)
 67c:	fe0400e3          	beqz	s0,65c <sglib__rbtree_it_compute_current_elem+0x100>
 680:	00178793          	addi	a5,a5,1
 684:	088b2223          	sw	s0,132(s6)
 688:	01079793          	slli	a5,a5,0x10
 68c:	01548ab3          	add	s5,s1,s5
 690:	4107d793          	srai	a5,a5,0x10
 694:	000a8223          	sb	zero,4(s5)
 698:	28f49223          	sh	a5,644(s1)
 69c:	fc1ff06f          	j	65c <sglib__rbtree_it_compute_current_elem+0x100>
 6a0:	00c7a403          	lw	s0,12(a5)
 6a4:	f8dff06f          	j	630 <sglib__rbtree_it_compute_current_elem+0xd4>
 6a8:	28449783          	lh	a5,644(s1)
 6ac:	fd5ff06f          	j	680 <sglib__rbtree_it_compute_current_elem+0x124>
 6b0:	02040c63          	beqz	s0,6e8 <sglib__rbtree_it_compute_current_elem+0x18c>
 6b4:	00092703          	lw	a4,0(s2)
 6b8:	00042783          	lw	a5,0(s0)
 6bc:	40f707b3          	sub	a5,a4,a5
 6c0:	0007ce63          	bltz	a5,6dc <sglib__rbtree_it_compute_current_elem+0x180>
 6c4:	fe0782e3          	beqz	a5,6a8 <sglib__rbtree_it_compute_current_elem+0x14c>
 6c8:	00c42403          	lw	s0,12(s0)
 6cc:	f80406e3          	beqz	s0,658 <sglib__rbtree_it_compute_current_elem+0xfc>
 6d0:	00042783          	lw	a5,0(s0)
 6d4:	40f707b3          	sub	a5,a4,a5
 6d8:	fe07d6e3          	bgez	a5,6c4 <sglib__rbtree_it_compute_current_elem+0x168>
 6dc:	00842403          	lw	s0,8(s0)
 6e0:	fe0418e3          	bnez	s0,6d0 <sglib__rbtree_it_compute_current_elem+0x174>
 6e4:	f75ff06f          	j	658 <sglib__rbtree_it_compute_current_elem+0xfc>
 6e8:	28449783          	lh	a5,644(s1)
 6ec:	f75ff06f          	j	660 <sglib__rbtree_it_compute_current_elem+0x104>

000006f0 <benchmark_body>:
 6f0:	b7010113          	addi	sp,sp,-1168
 6f4:	48112623          	sw	ra,1164(sp)
 6f8:	6c058263          	beqz	a1,dbc <benchmark_body+0x6cc>
 6fc:	000017b7          	lui	a5,0x1
 700:	47712623          	sw	s7,1132(sp)
 704:	00001bb7          	lui	s7,0x1
 708:	48812423          	sw	s0,1160(sp)
 70c:	49212023          	sw	s2,1152(sp)
 710:	47512a23          	sw	s5,1140(sp)
 714:	00001837          	lui	a6,0x1
 718:	00001437          	lui	s0,0x1
 71c:	00001ab7          	lui	s5,0x1
 720:	32c78913          	addi	s2,a5,812 # 132c <htab>
 724:	330b8793          	addi	a5,s7,816 # 1330 <htab+0x4>
 728:	48912223          	sw	s1,1156(sp)
 72c:	47412c23          	sw	s4,1144(sp)
 730:	47612823          	sw	s6,1136(sp)
 734:	47912223          	sw	s9,1124(sp)
 738:	47a12023          	sw	s10,1120(sp)
 73c:	45b12e23          	sw	s11,1116(sp)
 740:	47312e23          	sw	s3,1148(sp)
 744:	47812423          	sw	s8,1128(sp)
 748:	00050713          	mv	a4,a0
 74c:	38080d13          	addi	s10,a6,896 # 1380 <array2>
 750:	32040413          	addi	s0,s0,800 # 1320 <heap_requested>
 754:	37ca8a93          	addi	s5,s5,892 # 137c <the_list>
 758:	00f12623          	sw	a5,12(sp)
 75c:	00001b37          	lui	s6,0x1
 760:	02c10d93          	addi	s11,sp,44
 764:	1c010a13          	addi	s4,sp,448
 768:	000014b7          	lui	s1,0x1
 76c:	00000c93          	li	s9,0
 770:	00058e93          	mv	t4,a1
 774:	00000b93          	li	s7,0
 778:	01912823          	sw	s9,16(sp)
 77c:	000e8993          	mv	s3,t4
 780:	00e12a23          	sw	a4,20(sp)
 784:	19000613          	li	a2,400
 788:	190b0593          	addi	a1,s6,400 # 1190 <array>
 78c:	000d0513          	mv	a0,s10
 790:	941ff0ef          	jal	d0 <memcpy>
 794:	06400893          	li	a7,100
 798:	00000813          	li	a6,0
 79c:	02012623          	sw	zero,44(sp)
 7a0:	1d112023          	sw	a7,448(sp)
 7a4:	00000313          	li	t1,0
 7a8:	00200e13          	li	t3,2
 7ac:	410887b3          	sub	a5,a7,a6
 7b0:	0afe5e63          	bge	t3,a5,86c <benchmark_body+0x17c>
 7b4:	fff88693          	addi	a3,a7,-1
 7b8:	00281613          	slli	a2,a6,0x2
 7bc:	00180793          	addi	a5,a6,1
 7c0:	00269593          	slli	a1,a3,0x2
 7c4:	00cd0eb3          	add	t4,s10,a2
 7c8:	12d7dc63          	bge	a5,a3,900 <benchmark_body+0x210>
 7cc:	000ea503          	lw	a0,0(t4)
 7d0:	0cf6c263          	blt	a3,a5,894 <benchmark_body+0x1a4>
 7d4:	00279713          	slli	a4,a5,0x2
 7d8:	00ed0733          	add	a4,s10,a4
 7dc:	00c0006f          	j	7e8 <benchmark_body+0xf8>
 7e0:	00178793          	addi	a5,a5,1
 7e4:	0af6c863          	blt	a3,a5,894 <benchmark_body+0x1a4>
 7e8:	00072f03          	lw	t5,0(a4)
 7ec:	00470713          	addi	a4,a4,4
 7f0:	ffe558e3          	bge	a0,t5,7e0 <benchmark_body+0xf0>
 7f4:	0af6c063          	blt	a3,a5,894 <benchmark_body+0x1a4>
 7f8:	00bd05b3          	add	a1,s10,a1
 7fc:	0005a703          	lw	a4,0(a1)
 800:	ffc58593          	addi	a1,a1,-4
 804:	08a74c63          	blt	a4,a0,89c <benchmark_body+0x1ac>
 808:	fff68693          	addi	a3,a3,-1
 80c:	fef6d8e3          	bge	a3,a5,7fc <benchmark_body+0x10c>
 810:	00269713          	slli	a4,a3,0x2
 814:	00ed0733          	add	a4,s10,a4
 818:	00072583          	lw	a1,0(a4)
 81c:	00cd07b3          	add	a5,s10,a2
 820:	00a72023          	sw	a0,0(a4)
 824:	00b7a023          	sw	a1,0(a5)
 828:	00068613          	mv	a2,a3
 82c:	410687b3          	sub	a5,a3,a6
 830:	00100593          	li	a1,1
 834:	0cf5d863          	bge	a1,a5,904 <benchmark_body+0x214>
 838:	40c88733          	sub	a4,a7,a2
 83c:	0ce5da63          	bge	a1,a4,910 <benchmark_body+0x220>
 840:	fff70713          	addi	a4,a4,-1
 844:	00b60633          	add	a2,a2,a1
 848:	0ce7d863          	bge	a5,a4,918 <benchmark_body+0x228>
 84c:	00231713          	slli	a4,t1,0x2
 850:	00ea05b3          	add	a1,s4,a4
 854:	00ed8733          	add	a4,s11,a4
 858:	0115a023          	sw	a7,0(a1)
 85c:	00c72023          	sw	a2,0(a4)
 860:	00130313          	addi	t1,t1,1
 864:	00068893          	mv	a7,a3
 868:	f4fe46e3          	blt	t3,a5,7b4 <benchmark_body+0xc4>
 86c:	0dc78863          	beq	a5,t3,93c <benchmark_body+0x24c>
 870:	0e605c63          	blez	t1,968 <benchmark_body+0x278>
 874:	fff30313          	addi	t1,t1,-1
 878:	00231793          	slli	a5,t1,0x2
 87c:	00fd8733          	add	a4,s11,a5
 880:	00fa07b3          	add	a5,s4,a5
 884:	00072803          	lw	a6,0(a4)
 888:	0007a883          	lw	a7,0(a5)
 88c:	410887b3          	sub	a5,a7,a6
 890:	f21ff06f          	j	7b0 <benchmark_body+0xc0>
 894:	00bd0733          	add	a4,s10,a1
 898:	f81ff06f          	j	818 <benchmark_body+0x128>
 89c:	f6f6cae3          	blt	a3,a5,810 <benchmark_body+0x120>
 8a0:	04d7da63          	bge	a5,a3,8f4 <benchmark_body+0x204>
 8a4:	00269593          	slli	a1,a3,0x2
 8a8:	00bd0f33          	add	t5,s10,a1
 8ac:	00279713          	slli	a4,a5,0x2
 8b0:	000f2503          	lw	a0,0(t5)
 8b4:	00ed0733          	add	a4,s10,a4
 8b8:	00072f83          	lw	t6,0(a4)
 8bc:	00a72023          	sw	a0,0(a4)
 8c0:	00278513          	addi	a0,a5,2
 8c4:	01ff2023          	sw	t6,0(t5)
 8c8:	00178713          	addi	a4,a5,1
 8cc:	00d54a63          	blt	a0,a3,8e0 <benchmark_body+0x1f0>
 8d0:	00d74463          	blt	a4,a3,8d8 <benchmark_body+0x1e8>
 8d4:	00078713          	mv	a4,a5
 8d8:	00070793          	mv	a5,a4
 8dc:	ef1ff06f          	j	7cc <benchmark_body+0xdc>
 8e0:	fff68693          	addi	a3,a3,-1
 8e4:	4ed75463          	bge	a4,a3,dcc <benchmark_body+0x6dc>
 8e8:	00269593          	slli	a1,a3,0x2
 8ec:	00070793          	mv	a5,a4
 8f0:	eddff06f          	j	7cc <benchmark_body+0xdc>
 8f4:	00068613          	mv	a2,a3
 8f8:	00078693          	mv	a3,a5
 8fc:	f31ff06f          	j	82c <benchmark_body+0x13c>
 900:	00068613          	mv	a2,a3
 904:	00160813          	addi	a6,a2,1
 908:	410887b3          	sub	a5,a7,a6
 90c:	ea5ff06f          	j	7b0 <benchmark_body+0xc0>
 910:	00068893          	mv	a7,a3
 914:	e9dff06f          	j	7b0 <benchmark_body+0xc0>
 918:	00231793          	slli	a5,t1,0x2
 91c:	00fd8733          	add	a4,s11,a5
 920:	00fa07b3          	add	a5,s4,a5
 924:	01072023          	sw	a6,0(a4)
 928:	00d7a023          	sw	a3,0(a5)
 92c:	00130313          	addi	t1,t1,1
 930:	40c887b3          	sub	a5,a7,a2
 934:	00060813          	mv	a6,a2
 938:	e79ff06f          	j	7b0 <benchmark_body+0xc0>
 93c:	fff88793          	addi	a5,a7,-1
 940:	00279793          	slli	a5,a5,0x2
 944:	00281713          	slli	a4,a6,0x2
 948:	00fd07b3          	add	a5,s10,a5
 94c:	00ed0733          	add	a4,s10,a4
 950:	0007a603          	lw	a2,0(a5)
 954:	00072683          	lw	a3,0(a4)
 958:	f0d65ce3          	bge	a2,a3,870 <benchmark_body+0x180>
 95c:	00c72023          	sw	a2,0(a4)
 960:	00d7a023          	sw	a3,0(a5)
 964:	f06048e3          	bgtz	t1,874 <benchmark_body+0x184>
 968:	000017b7          	lui	a5,0x1
 96c:	000025b7          	lui	a1,0x2
 970:	51078513          	addi	a0,a5,1296 # 1510 <heap>
 974:	190b0c13          	addi	s8,s6,400
 978:	fb0ff0ef          	jal	128 <init_heap_beebs>
 97c:	000c0c93          	mv	s9,s8
 980:	3604ae23          	sw	zero,892(s1) # 137c <the_list>
 984:	0280006f          	j	9ac <benchmark_body+0x2bc>
 988:	0087a703          	lw	a4,8(a5)
 98c:	00f52223          	sw	a5,4(a0)
 990:	00e52423          	sw	a4,8(a0)
 994:	00a7a423          	sw	a0,8(a5)
 998:	00852783          	lw	a5,8(a0)
 99c:	00078463          	beqz	a5,9a4 <benchmark_body+0x2b4>
 9a0:	00a7a223          	sw	a0,4(a5)
 9a4:	004c8c93          	addi	s9,s9,4
 9a8:	03940863          	beq	s0,s9,9d8 <benchmark_body+0x2e8>
 9ac:	00c00513          	li	a0,12
 9b0:	fc4ff0ef          	jal	174 <malloc_beebs>
 9b4:	000ca703          	lw	a4,0(s9)
 9b8:	37c4a783          	lw	a5,892(s1)
 9bc:	00e52023          	sw	a4,0(a0)
 9c0:	fc0794e3          	bnez	a5,988 <benchmark_body+0x298>
 9c4:	36a4ae23          	sw	a0,892(s1)
 9c8:	00052423          	sw	zero,8(a0)
 9cc:	00052223          	sw	zero,4(a0)
 9d0:	004c8c93          	addi	s9,s9,4
 9d4:	fd941ce3          	bne	s0,s9,9ac <benchmark_body+0x2bc>
 9d8:	37c48513          	addi	a0,s1,892
 9dc:	9fdff0ef          	jal	3d8 <sglib_dllist_sort>
 9e0:	37c4a783          	lw	a5,892(s1)
 9e4:	02012223          	sw	zero,36(sp)
 9e8:	02078263          	beqz	a5,a0c <benchmark_body+0x31c>
 9ec:	00078713          	mv	a4,a5
 9f0:	0087a783          	lw	a5,8(a5)
 9f4:	fe079ce3          	bnez	a5,9ec <benchmark_body+0x2fc>
 9f8:	02412783          	lw	a5,36(sp)
 9fc:	00472703          	lw	a4,4(a4)
 a00:	00178793          	addi	a5,a5,1
 a04:	02f12223          	sw	a5,36(sp)
 a08:	fe0718e3          	bnez	a4,9f8 <benchmark_body+0x308>
 a0c:	00090793          	mv	a5,s2
 a10:	0007a023          	sw	zero,0(a5)
 a14:	00478793          	addi	a5,a5,4
 a18:	fefa9ce3          	bne	s5,a5,a10 <benchmark_body+0x320>
 a1c:	01312e23          	sw	s3,28(sp)
 a20:	01712c23          	sw	s7,24(sp)
 a24:	190b0993          	addi	s3,s6,400
 a28:	0009ac83          	lw	s9,0(s3)
 a2c:	01400593          	li	a1,20
 a30:	000c8513          	mv	a0,s9
 a34:	520000ef          	jal	f54 <__umodsi3>
 a38:	00251693          	slli	a3,a0,0x2
 a3c:	00d90bb3          	add	s7,s2,a3
 a40:	000ba783          	lw	a5,0(s7)
 a44:	00079863          	bnez	a5,a54 <benchmark_body+0x364>
 a48:	0880006f          	j	ad0 <benchmark_body+0x3e0>
 a4c:	0047a783          	lw	a5,4(a5)
 a50:	08078063          	beqz	a5,ad0 <benchmark_body+0x3e0>
 a54:	0007a703          	lw	a4,0(a5)
 a58:	feec9ae3          	bne	s9,a4,a4c <benchmark_body+0x35c>
 a5c:	00498993          	addi	s3,s3,4
 a60:	fd3414e3          	bne	s0,s3,a28 <benchmark_body+0x338>
 a64:	000017b7          	lui	a5,0x1
 a68:	32c7a783          	lw	a5,812(a5) # 132c <htab>
 a6c:	01812b83          	lw	s7,24(sp)
 a70:	01c12983          	lw	s3,28(sp)
 a74:	14078a63          	beqz	a5,bc8 <benchmark_body+0x4d8>
 a78:	0047a703          	lw	a4,4(a5)
 a7c:	00000793          	li	a5,0
 a80:	01300593          	li	a1,19
 a84:	02412683          	lw	a3,36(sp)
 a88:	00168693          	addi	a3,a3,1
 a8c:	02d12223          	sw	a3,36(sp)
 a90:	00070c63          	beqz	a4,aa8 <benchmark_body+0x3b8>
 a94:	02412683          	lw	a3,36(sp)
 a98:	00472703          	lw	a4,4(a4)
 a9c:	00168693          	addi	a3,a3,1
 aa0:	02d12223          	sw	a3,36(sp)
 aa4:	fe0718e3          	bnez	a4,a94 <benchmark_body+0x3a4>
 aa8:	00c12683          	lw	a3,12(sp)
 aac:	00279713          	slli	a4,a5,0x2
 ab0:	00e68733          	add	a4,a3,a4
 ab4:	00178793          	addi	a5,a5,1
 ab8:	00470713          	addi	a4,a4,4
 abc:	02f5cc63          	blt	a1,a5,af4 <benchmark_body+0x404>
 ac0:	ffc72683          	lw	a3,-4(a4)
 ac4:	fe0688e3          	beqz	a3,ab4 <benchmark_body+0x3c4>
 ac8:	0046a703          	lw	a4,4(a3)
 acc:	fb9ff06f          	j	a84 <benchmark_body+0x394>
 ad0:	00800513          	li	a0,8
 ad4:	ea0ff0ef          	jal	174 <malloc_beebs>
 ad8:	000ba783          	lw	a5,0(s7)
 adc:	01952023          	sw	s9,0(a0)
 ae0:	00498993          	addi	s3,s3,4
 ae4:	00f52223          	sw	a5,4(a0)
 ae8:	00aba023          	sw	a0,0(s7)
 aec:	f3341ee3          	bne	s0,s3,a28 <benchmark_body+0x338>
 af0:	f75ff06f          	j	a64 <benchmark_body+0x374>
 af4:	190b0c93          	addi	s9,s6,400
 af8:	00000513          	li	a0,0
 afc:	000ca703          	lw	a4,0(s9)
 b00:	00251793          	slli	a5,a0,0x2
 b04:	00fd87b3          	add	a5,s11,a5
 b08:	00150513          	addi	a0,a0,1
 b0c:	00e7a023          	sw	a4,0(a5)
 b10:	06500593          	li	a1,101
 b14:	474000ef          	jal	f88 <__modsi3>
 b18:	004c8c93          	addi	s9,s9,4
 b1c:	0a050463          	beqz	a0,bc4 <benchmark_body+0x4d4>
 b20:	fc8c9ee3          	bne	s9,s0,afc <benchmark_body+0x40c>
 b24:	00050c93          	mv	s9,a0
 b28:	00000513          	li	a0,0
 b2c:	00251713          	slli	a4,a0,0x2
 b30:	00ed8733          	add	a4,s11,a4
 b34:	00072683          	lw	a3,0(a4)
 b38:	02412703          	lw	a4,36(sp)
 b3c:	00150513          	addi	a0,a0,1
 b40:	06500593          	li	a1,101
 b44:	00d70733          	add	a4,a4,a3
 b48:	02e12223          	sw	a4,36(sp)
 b4c:	43c000ef          	jal	f88 <__modsi3>
 b50:	fcac9ee3          	bne	s9,a0,b2c <benchmark_body+0x43c>
 b54:	000017b7          	lui	a5,0x1
 b58:	19478313          	addi	t1,a5,404 # 1194 <array+0x4>
 b5c:	000d8893          	mv	a7,s11
 b60:	00000813          	li	a6,0
 b64:	00e00593          	li	a1,14
 b68:	06300e13          	li	t3,99
 b6c:	00b8a023          	sw	a1,0(a7)
 b70:	00080793          	mv	a5,a6
 b74:	00081e63          	bnez	a6,b90 <benchmark_body+0x4a0>
 b78:	0380006f          	j	bb0 <benchmark_body+0x4c0>
 b7c:	00b72023          	sw	a1,0(a4)
 b80:	00c7a023          	sw	a2,0(a5)
 b84:	02068463          	beqz	a3,bac <benchmark_body+0x4bc>
 b88:	00072583          	lw	a1,0(a4)
 b8c:	00068793          	mv	a5,a3
 b90:	4017d693          	srai	a3,a5,0x1
 b94:	00269713          	slli	a4,a3,0x2
 b98:	00ed8733          	add	a4,s11,a4
 b9c:	00072603          	lw	a2,0(a4)
 ba0:	00279793          	slli	a5,a5,0x2
 ba4:	00fd87b3          	add	a5,s11,a5
 ba8:	fcb64ae3          	blt	a2,a1,b7c <benchmark_body+0x48c>
 bac:	05c80063          	beq	a6,t3,bec <benchmark_body+0x4fc>
 bb0:	00032583          	lw	a1,0(t1)
 bb4:	00488893          	addi	a7,a7,4
 bb8:	00180813          	addi	a6,a6,1
 bbc:	00430313          	addi	t1,t1,4
 bc0:	fadff06f          	j	b6c <benchmark_body+0x47c>
 bc4:	0000006f          	j	bc4 <benchmark_body+0x4d4>
 bc8:	00c12703          	lw	a4,12(sp)
 bcc:	01400593          	li	a1,20
 bd0:	00178793          	addi	a5,a5,1
 bd4:	00470713          	addi	a4,a4,4
 bd8:	f0b78ee3          	beq	a5,a1,af4 <benchmark_body+0x404>
 bdc:	ffc72603          	lw	a2,-4(a4)
 be0:	fe0608e3          	beqz	a2,bd0 <benchmark_body+0x4e0>
 be4:	00462703          	lw	a4,4(a2)
 be8:	e99ff06f          	j	a80 <benchmark_body+0x390>
 bec:	18cd8313          	addi	t1,s11,396
 bf0:	06400813          	li	a6,100
 bf4:	00c0006f          	j	c00 <benchmark_body+0x510>
 bf8:	ffc30313          	addi	t1,t1,-4
 bfc:	0a080863          	beqz	a6,cac <benchmark_body+0x5bc>
 c00:	02412783          	lw	a5,36(sp)
 c04:	02c12683          	lw	a3,44(sp)
 c08:	00032703          	lw	a4,0(t1)
 c0c:	fff80813          	addi	a6,a6,-1
 c10:	00d787b3          	add	a5,a5,a3
 c14:	02f12223          	sw	a5,36(sp)
 c18:	02e12623          	sw	a4,44(sp)
 c1c:	00000593          	li	a1,0
 c20:	00159793          	slli	a5,a1,0x1
 c24:	00178713          	addi	a4,a5,1
 c28:	fd0758e3          	bge	a4,a6,bf8 <benchmark_body+0x508>
 c2c:	00259613          	slli	a2,a1,0x2
 c30:	00271693          	slli	a3,a4,0x2
 c34:	00cd8533          	add	a0,s11,a2
 c38:	00dd86b3          	add	a3,s11,a3
 c3c:	00052503          	lw	a0,0(a0)
 c40:	0006a683          	lw	a3,0(a3)
 c44:	00278793          	addi	a5,a5,2
 c48:	04d54263          	blt	a0,a3,c8c <benchmark_body+0x59c>
 c4c:	fb07d6e3          	bge	a5,a6,bf8 <benchmark_body+0x508>
 c50:	00279713          	slli	a4,a5,0x2
 c54:	00ed8733          	add	a4,s11,a4
 c58:	00072703          	lw	a4,0(a4)
 c5c:	f8a74ee3          	blt	a4,a0,bf8 <benchmark_body+0x508>
 c60:	f8e55ce3          	bge	a0,a4,bf8 <benchmark_body+0x508>
 c64:	00078713          	mv	a4,a5
 c68:	f8e588e3          	beq	a1,a4,bf8 <benchmark_body+0x508>
 c6c:	00271793          	slli	a5,a4,0x2
 c70:	00fd87b3          	add	a5,s11,a5
 c74:	0007a683          	lw	a3,0(a5)
 c78:	00cd8633          	add	a2,s11,a2
 c7c:	00070593          	mv	a1,a4
 c80:	00d62023          	sw	a3,0(a2)
 c84:	00a7a023          	sw	a0,0(a5)
 c88:	f99ff06f          	j	c20 <benchmark_body+0x530>
 c8c:	fd07dee3          	bge	a5,a6,c68 <benchmark_body+0x578>
 c90:	00279893          	slli	a7,a5,0x2
 c94:	011d88b3          	add	a7,s11,a7
 c98:	0008a883          	lw	a7,0(a7)
 c9c:	fcd8c6e3          	blt	a7,a3,c68 <benchmark_body+0x578>
 ca0:	fd16d4e3          	bge	a3,a7,c68 <benchmark_body+0x578>
 ca4:	00078713          	mv	a4,a5
 ca8:	fc1ff06f          	j	c68 <benchmark_body+0x578>
 cac:	02012423          	sw	zero,40(sp)
 cb0:	00e00c93          	li	s9,14
 cb4:	01000513          	li	a0,16
 cb8:	cbcff0ef          	jal	174 <malloc_beebs>
 cbc:	00050593          	mv	a1,a0
 cc0:	01952023          	sw	s9,0(a0)
 cc4:	00052623          	sw	zero,12(a0)
 cc8:	00052423          	sw	zero,8(a0)
 ccc:	02810513          	addi	a0,sp,40
 cd0:	d0cff0ef          	jal	1dc <sglib___rbtree_add_recursive.constprop.0>
 cd4:	02812583          	lw	a1,40(sp)
 cd8:	004c0c13          	addi	s8,s8,4
 cdc:	00058223          	sb	zero,4(a1) # 2004 <heap+0xaf4>
 ce0:	05840263          	beq	s0,s8,d24 <benchmark_body+0x634>
 ce4:	00058713          	mv	a4,a1
 ce8:	000c2c83          	lw	s9,0(s8)
 cec:	00072783          	lw	a5,0(a4)
 cf0:	40fc87b3          	sub	a5,s9,a5
 cf4:	0007ce63          	bltz	a5,d10 <benchmark_body+0x620>
 cf8:	02078263          	beqz	a5,d1c <benchmark_body+0x62c>
 cfc:	00c72703          	lw	a4,12(a4)
 d00:	fa070ae3          	beqz	a4,cb4 <benchmark_body+0x5c4>
 d04:	00072783          	lw	a5,0(a4)
 d08:	40fc87b3          	sub	a5,s9,a5
 d0c:	fe07d6e3          	bgez	a5,cf8 <benchmark_body+0x608>
 d10:	00872703          	lw	a4,8(a4)
 d14:	fe0718e3          	bnez	a4,d04 <benchmark_body+0x614>
 d18:	f9dff06f          	j	cb4 <benchmark_body+0x5c4>
 d1c:	004c0c13          	addi	s8,s8,4
 d20:	fc8c12e3          	bne	s8,s0,ce4 <benchmark_body+0x5f4>
 d24:	000107b7          	lui	a5,0x10
 d28:	00178793          	addi	a5,a5,1 # 10001 <__stack_top+0x8101>
 d2c:	000a0513          	mv	a0,s4
 d30:	44f12223          	sw	a5,1092(sp)
 d34:	44012423          	sw	zero,1096(sp)
 d38:	44012623          	sw	zero,1100(sp)
 d3c:	1c010223          	sb	zero,452(sp)
 d40:	24b12223          	sw	a1,580(sp)
 d44:	819ff0ef          	jal	55c <sglib__rbtree_it_compute_current_elem>
 d48:	1c012783          	lw	a5,448(sp)
 d4c:	02078263          	beqz	a5,d70 <benchmark_body+0x680>
 d50:	0007a703          	lw	a4,0(a5)
 d54:	02412783          	lw	a5,36(sp)
 d58:	000a0513          	mv	a0,s4
 d5c:	00e787b3          	add	a5,a5,a4
 d60:	02f12223          	sw	a5,36(sp)
 d64:	ff8ff0ef          	jal	55c <sglib__rbtree_it_compute_current_elem>
 d68:	1c012783          	lw	a5,448(sp)
 d6c:	fe0792e3          	bnez	a5,d50 <benchmark_body+0x660>
 d70:	001b8b93          	addi	s7,s7,1
 d74:	a17998e3          	bne	s3,s7,784 <benchmark_body+0x94>
 d78:	01012c83          	lw	s9,16(sp)
 d7c:	01412703          	lw	a4,20(sp)
 d80:	00098e93          	mv	t4,s3
 d84:	001c8c93          	addi	s9,s9,1
 d88:	9f9716e3          	bne	a4,s9,774 <benchmark_body+0x84>
 d8c:	48812403          	lw	s0,1160(sp)
 d90:	48412483          	lw	s1,1156(sp)
 d94:	48012903          	lw	s2,1152(sp)
 d98:	47c12983          	lw	s3,1148(sp)
 d9c:	47812a03          	lw	s4,1144(sp)
 da0:	47412a83          	lw	s5,1140(sp)
 da4:	47012b03          	lw	s6,1136(sp)
 da8:	46c12b83          	lw	s7,1132(sp)
 dac:	46812c03          	lw	s8,1128(sp)
 db0:	46412c83          	lw	s9,1124(sp)
 db4:	46012d03          	lw	s10,1120(sp)
 db8:	45c12d83          	lw	s11,1116(sp)
 dbc:	48c12083          	lw	ra,1164(sp)
 dc0:	02412503          	lw	a0,36(sp)
 dc4:	49010113          	addi	sp,sp,1168
 dc8:	00008067          	ret
 dcc:	00068613          	mv	a2,a3
 dd0:	410707b3          	sub	a5,a4,a6
 dd4:	00070693          	mv	a3,a4
 dd8:	a59ff06f          	j	830 <benchmark_body+0x140>

00000ddc <verify_benchmark>:
 ddc:	000017b7          	lui	a5,0x1
 de0:	37c7a703          	lw	a4,892(a5) # 137c <the_list>
 de4:	02070a63          	beqz	a4,e18 <verify_benchmark+0x3c>
 de8:	00070793          	mv	a5,a4
 dec:	00872703          	lw	a4,8(a4)
 df0:	fe071ce3          	bnez	a4,de8 <verify_benchmark+0xc>
 df4:	0007a683          	lw	a3,0(a5)
 df8:	00e69c63          	bne	a3,a4,e10 <verify_benchmark+0x34>
 dfc:	0047a783          	lw	a5,4(a5)
 e00:	00170713          	addi	a4,a4,1
 e04:	00078a63          	beqz	a5,e18 <verify_benchmark+0x3c>
 e08:	0007a683          	lw	a3,0(a5)
 e0c:	fee688e3          	beq	a3,a4,dfc <verify_benchmark+0x20>
 e10:	00000513          	li	a0,0
 e14:	00008067          	ret
 e18:	fe010113          	addi	sp,sp,-32
 e1c:	00912a23          	sw	s1,20(sp)
 e20:	000014b7          	lui	s1,0x1
 e24:	01212823          	sw	s2,16(sp)
 e28:	19048493          	addi	s1,s1,400 # 1190 <array>
 e2c:	00001937          	lui	s2,0x1
 e30:	01312623          	sw	s3,12(sp)
 e34:	01412423          	sw	s4,8(sp)
 e38:	00112e23          	sw	ra,28(sp)
 e3c:	00812c23          	sw	s0,24(sp)
 e40:	00050a13          	mv	s4,a0
 e44:	19048993          	addi	s3,s1,400
 e48:	32c90913          	addi	s2,s2,812 # 132c <htab>
 e4c:	0004a403          	lw	s0,0(s1)
 e50:	01400593          	li	a1,20
 e54:	00040513          	mv	a0,s0
 e58:	0fc000ef          	jal	f54 <__umodsi3>
 e5c:	00251793          	slli	a5,a0,0x2
 e60:	00f907b3          	add	a5,s2,a5
 e64:	0007a783          	lw	a5,0(a5)
 e68:	00079863          	bnez	a5,e78 <verify_benchmark+0x9c>
 e6c:	0280006f          	j	e94 <verify_benchmark+0xb8>
 e70:	0047a783          	lw	a5,4(a5)
 e74:	02078063          	beqz	a5,e94 <verify_benchmark+0xb8>
 e78:	0007a703          	lw	a4,0(a5)
 e7c:	fee41ae3          	bne	s0,a4,e70 <verify_benchmark+0x94>
 e80:	00448493          	addi	s1,s1,4
 e84:	fc9994e3          	bne	s3,s1,e4c <verify_benchmark+0x70>
 e88:	000047b7          	lui	a5,0x4
 e8c:	aca78793          	addi	a5,a5,-1334 # 3aca <__bss_end+0x5ba>
 e90:	02fa0463          	beq	s4,a5,eb8 <verify_benchmark+0xdc>
 e94:	00000513          	li	a0,0
 e98:	01c12083          	lw	ra,28(sp)
 e9c:	01812403          	lw	s0,24(sp)
 ea0:	01412483          	lw	s1,20(sp)
 ea4:	01012903          	lw	s2,16(sp)
 ea8:	00c12983          	lw	s3,12(sp)
 eac:	00812a03          	lw	s4,8(sp)
 eb0:	02010113          	addi	sp,sp,32
 eb4:	00008067          	ret
 eb8:	00001537          	lui	a0,0x1
 ebc:	51050513          	addi	a0,a0,1296 # 1510 <heap>
 ec0:	a94ff0ef          	jal	154 <check_heap_beebs>
 ec4:	fc0508e3          	beqz	a0,e94 <verify_benchmark+0xb8>
 ec8:	000015b7          	lui	a1,0x1
 ecc:	00001537          	lui	a0,0x1
 ed0:	00058593          	mv	a1,a1
 ed4:	38050513          	addi	a0,a0,896 # 1380 <array2>
 ed8:	19000613          	li	a2,400
 edc:	a18ff0ef          	jal	f4 <memcmp>
 ee0:	00153513          	seqz	a0,a0
 ee4:	fb5ff06f          	j	e98 <verify_benchmark+0xbc>

00000ee8 <initialise_benchmark>:
 ee8:	00008067          	ret

00000eec <warm_caches>:
 eec:	00050593          	mv	a1,a0
 ef0:	00100513          	li	a0,1
 ef4:	ffcff06f          	j	6f0 <benchmark_body>

00000ef8 <benchmark>:
 ef8:	00100593          	li	a1,1
 efc:	00200513          	li	a0,2
 f00:	ff0ff06f          	j	6f0 <benchmark_body>

00000f04 <__divsi3>:
 f04:	06054063          	bltz	a0,f64 <__umodsi3+0x10>
 f08:	0605c663          	bltz	a1,f74 <__umodsi3+0x20>

00000f0c <__hidden___udivsi3>:
 f0c:	00058613          	mv	a2,a1
 f10:	00050593          	mv	a1,a0
 f14:	fff00513          	li	a0,-1
 f18:	02060c63          	beqz	a2,f50 <__hidden___udivsi3+0x44>
 f1c:	00100693          	li	a3,1
 f20:	00b67a63          	bgeu	a2,a1,f34 <__hidden___udivsi3+0x28>
 f24:	00c05863          	blez	a2,f34 <__hidden___udivsi3+0x28>
 f28:	00161613          	slli	a2,a2,0x1
 f2c:	00169693          	slli	a3,a3,0x1
 f30:	feb66ae3          	bltu	a2,a1,f24 <__hidden___udivsi3+0x18>
 f34:	00000513          	li	a0,0
 f38:	00c5e663          	bltu	a1,a2,f44 <__hidden___udivsi3+0x38>
 f3c:	40c585b3          	sub	a1,a1,a2
 f40:	00d56533          	or	a0,a0,a3
 f44:	0016d693          	srli	a3,a3,0x1
 f48:	00165613          	srli	a2,a2,0x1
 f4c:	fe0696e3          	bnez	a3,f38 <__hidden___udivsi3+0x2c>
 f50:	00008067          	ret

00000f54 <__umodsi3>:
 f54:	00008293          	mv	t0,ra
 f58:	fb5ff0ef          	jal	f0c <__hidden___udivsi3>
 f5c:	00058513          	mv	a0,a1
 f60:	00028067          	jr	t0
 f64:	40a00533          	neg	a0,a0
 f68:	00b04863          	bgtz	a1,f78 <__umodsi3+0x24>
 f6c:	40b005b3          	neg	a1,a1
 f70:	f9dff06f          	j	f0c <__hidden___udivsi3>
 f74:	40b005b3          	neg	a1,a1
 f78:	00008293          	mv	t0,ra
 f7c:	f91ff0ef          	jal	f0c <__hidden___udivsi3>
 f80:	40a00533          	neg	a0,a0
 f84:	00028067          	jr	t0

00000f88 <__modsi3>:
 f88:	00008293          	mv	t0,ra
 f8c:	0005ca63          	bltz	a1,fa0 <__modsi3+0x18>
 f90:	00054c63          	bltz	a0,fa8 <__modsi3+0x20>
 f94:	f79ff0ef          	jal	f0c <__hidden___udivsi3>
 f98:	00058513          	mv	a0,a1
 f9c:	00028067          	jr	t0
 fa0:	40b005b3          	neg	a1,a1
 fa4:	fe0558e3          	bgez	a0,f94 <__modsi3+0xc>
 fa8:	40a00533          	neg	a0,a0
 fac:	f61ff0ef          	jal	f0c <__hidden___udivsi3>
 fb0:	40b00533          	neg	a0,a1
 fb4:	00028067          	jr	t0
