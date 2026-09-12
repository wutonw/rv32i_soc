
D:\aaa1verilog_project\rv32i_cpu\benchmark\embench\build\depthconv\depthconv.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00008117          	auipc	sp,0x8
   4:	f0010113          	addi	sp,sp,-256 # 7f00 <__stack_top>
   8:	00001297          	auipc	t0,0x1
   c:	21828293          	addi	t0,t0,536 # 1220 <OUTPUT_DATA>
  10:	00001317          	auipc	t1,0x1
  14:	2b030313          	addi	t1,t1,688 # 12c0 <__bss_end>
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
  78:	264000ef          	jal	2dc <initialise_benchmark>
  7c:	00000513          	li	a0,0
  80:	260000ef          	jal	2e0 <warm_caches>
  84:	fadff0ef          	jal	30 <start_trigger>
  88:	25c000ef          	jal	2e4 <benchmark>
  8c:	00a12623          	sw	a0,12(sp)
  90:	fb5ff0ef          	jal	44 <stop_trigger>
  94:	00c12503          	lw	a0,12(sp)
  98:	26c000ef          	jal	304 <verify_benchmark>
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

000000d0 <DepthwiseConvPerChannel.constprop.0>:
  d0:	fb010113          	addi	sp,sp,-80
  d4:	03612823          	sw	s6,48(sp)
  d8:	03712623          	sw	s7,44(sp)
  dc:	03812423          	sw	s8,40(sp)
  e0:	03912223          	sw	s9,36(sp)
  e4:	03a12023          	sw	s10,32(sp)
  e8:	01b12e23          	sw	s11,28(sp)
  ec:	00001d37          	lui	s10,0x1
  f0:	00001db7          	lui	s11,0x1
  f4:	00001cb7          	lui	s9,0x1
  f8:	00001c37          	lui	s8,0x1
  fc:	00001bb7          	lui	s7,0x1
 100:	00001b37          	lui	s6,0x1
 104:	04812423          	sw	s0,72(sp)
 108:	04912223          	sw	s1,68(sp)
 10c:	05212023          	sw	s2,64(sp)
 110:	03312e23          	sw	s3,60(sp)
 114:	03412c23          	sw	s4,56(sp)
 118:	03512a23          	sw	s5,52(sp)
 11c:	04112623          	sw	ra,76(sp)
 120:	240d8d93          	addi	s11,s11,576 # 1240 <BIAS_DATA>
 124:	1a0d0d13          	addi	s10,s10,416 # 11a0 <OUTPUT_MULTIPLIER>
 128:	120c8c93          	addi	s9,s9,288 # 1120 <OUTPUT_SHIFT>
 12c:	220c0c13          	addi	s8,s8,544 # 1220 <OUTPUT_DATA>
 130:	020b8b93          	addi	s7,s7,32 # 1020 <FILTER_DATA>
 134:	120b0b13          	addi	s6,s6,288 # 1120 <OUTPUT_SHIFT>
 138:	00000913          	li	s2,0
 13c:	01e00a93          	li	s5,30
 140:	00100493          	li	s1,1
 144:	01f00413          	li	s0,31
 148:	f8000a13          	li	s4,-128
 14c:	07f00993          	li	s3,127
 150:	f80b0713          	addi	a4,s6,-128
 154:	000b8693          	mv	a3,s7
 158:	00000793          	li	a5,0
 15c:	00070503          	lb	a0,0(a4)
 160:	00068583          	lb	a1,0(a3)
 164:	00f12623          	sw	a5,12(sp)
 168:	08050513          	addi	a0,a0,128
 16c:	00e12423          	sw	a4,8(sp)
 170:	00d12223          	sw	a3,4(sp)
 174:	1d0000ef          	jal	344 <__mulsi3>
 178:	00812703          	lw	a4,8(sp)
 17c:	00412683          	lw	a3,4(sp)
 180:	00c12783          	lw	a5,12(sp)
 184:	02070713          	addi	a4,a4,32
 188:	02068693          	addi	a3,a3,32
 18c:	00a787b3          	add	a5,a5,a0
 190:	fceb16e3          	bne	s6,a4,15c <DepthwiseConvPerChannel.constprop.0+0x8c>
 194:	000da683          	lw	a3,0(s11)
 198:	000d2603          	lw	a2,0(s10)
 19c:	000ca703          	lw	a4,0(s9)
 1a0:	00d78533          	add	a0,a5,a3
 1a4:	41f55593          	srai	a1,a0,0x1f
 1a8:	41f65693          	srai	a3,a2,0x1f
 1ac:	00e12223          	sw	a4,4(sp)
 1b0:	1b8000ef          	jal	368 <__muldi3>
 1b4:	00412703          	lw	a4,4(sp)
 1b8:	40ea87b3          	sub	a5,s5,a4
 1bc:	fe078613          	addi	a2,a5,-32
 1c0:	0a064063          	bltz	a2,260 <DepthwiseConvPerChannel.constprop.0+0x190>
 1c4:	00000793          	li	a5,0
 1c8:	00c49633          	sll	a2,s1,a2
 1cc:	40e406b3          	sub	a3,s0,a4
 1d0:	00f507b3          	add	a5,a0,a5
 1d4:	00c585b3          	add	a1,a1,a2
 1d8:	00a7b733          	sltu	a4,a5,a0
 1dc:	fe068613          	addi	a2,a3,-32
 1e0:	00b70733          	add	a4,a4,a1
 1e4:	0a064063          	bltz	a2,284 <DepthwiseConvPerChannel.constprop.0+0x1b4>
 1e8:	40c757b3          	sra	a5,a4,a2
 1ec:	0147d463          	bge	a5,s4,1f4 <DepthwiseConvPerChannel.constprop.0+0x124>
 1f0:	f8000793          	li	a5,-128
 1f4:	00f9d463          	bge	s3,a5,1fc <DepthwiseConvPerChannel.constprop.0+0x12c>
 1f8:	07f00793          	li	a5,127
 1fc:	00fc0023          	sb	a5,0(s8)
 200:	00190913          	addi	s2,s2,1
 204:	02000793          	li	a5,32
 208:	004d8d93          	addi	s11,s11,4
 20c:	004d0d13          	addi	s10,s10,4
 210:	004c8c93          	addi	s9,s9,4
 214:	001c0c13          	addi	s8,s8,1
 218:	001b8b93          	addi	s7,s7,1
 21c:	001b0b13          	addi	s6,s6,1
 220:	f2f918e3          	bne	s2,a5,150 <DepthwiseConvPerChannel.constprop.0+0x80>
 224:	04c12083          	lw	ra,76(sp)
 228:	04812403          	lw	s0,72(sp)
 22c:	04412483          	lw	s1,68(sp)
 230:	04012903          	lw	s2,64(sp)
 234:	03c12983          	lw	s3,60(sp)
 238:	03812a03          	lw	s4,56(sp)
 23c:	03412a83          	lw	s5,52(sp)
 240:	03012b03          	lw	s6,48(sp)
 244:	02c12b83          	lw	s7,44(sp)
 248:	02812c03          	lw	s8,40(sp)
 24c:	02412c83          	lw	s9,36(sp)
 250:	02012d03          	lw	s10,32(sp)
 254:	01c12d83          	lw	s11,28(sp)
 258:	05010113          	addi	sp,sp,80
 25c:	00008067          	ret
 260:	00f497b3          	sll	a5,s1,a5
 264:	00000613          	li	a2,0
 268:	40e406b3          	sub	a3,s0,a4
 26c:	00f507b3          	add	a5,a0,a5
 270:	00c585b3          	add	a1,a1,a2
 274:	00a7b733          	sltu	a4,a5,a0
 278:	fe068613          	addi	a2,a3,-32
 27c:	00b70733          	add	a4,a4,a1
 280:	f60654e3          	bgez	a2,1e8 <DepthwiseConvPerChannel.constprop.0+0x118>
 284:	00d7d7b3          	srl	a5,a5,a3
 288:	00171713          	slli	a4,a4,0x1
 28c:	40d406b3          	sub	a3,s0,a3
 290:	00d71733          	sll	a4,a4,a3
 294:	00f707b3          	add	a5,a4,a5
 298:	f55ff06f          	j	1ec <DepthwiseConvPerChannel.constprop.0+0x11c>

0000029c <benchmark_body.constprop.0.isra.0>:
 29c:	02050e63          	beqz	a0,2d8 <benchmark_body.constprop.0.isra.0+0x3c>
 2a0:	ff010113          	addi	sp,sp,-16
 2a4:	00812423          	sw	s0,8(sp)
 2a8:	00912223          	sw	s1,4(sp)
 2ac:	00112623          	sw	ra,12(sp)
 2b0:	00050493          	mv	s1,a0
 2b4:	00000413          	li	s0,0
 2b8:	00140413          	addi	s0,s0,1
 2bc:	e15ff0ef          	jal	d0 <DepthwiseConvPerChannel.constprop.0>
 2c0:	fe941ce3          	bne	s0,s1,2b8 <benchmark_body.constprop.0.isra.0+0x1c>
 2c4:	00c12083          	lw	ra,12(sp)
 2c8:	00812403          	lw	s0,8(sp)
 2cc:	00412483          	lw	s1,4(sp)
 2d0:	01010113          	addi	sp,sp,16
 2d4:	00008067          	ret
 2d8:	00008067          	ret

000002dc <initialise_benchmark>:
 2dc:	00008067          	ret

000002e0 <warm_caches>:
 2e0:	fbdff06f          	j	29c <benchmark_body.constprop.0.isra.0>

000002e4 <benchmark>:
 2e4:	ff010113          	addi	sp,sp,-16
 2e8:	00200513          	li	a0,2
 2ec:	00112623          	sw	ra,12(sp)
 2f0:	fadff0ef          	jal	29c <benchmark_body.constprop.0.isra.0>
 2f4:	00c12083          	lw	ra,12(sp)
 2f8:	00000513          	li	a0,0
 2fc:	01010113          	addi	sp,sp,16
 300:	00008067          	ret

00000304 <verify_benchmark>:
 304:	000017b7          	lui	a5,0x1
 308:	00078793          	mv	a5,a5
 30c:	00001737          	lui	a4,0x1
 310:	02078593          	addi	a1,a5,32 # 1020 <FILTER_DATA>
 314:	22070713          	addi	a4,a4,544 # 1220 <OUTPUT_DATA>
 318:	0080006f          	j	320 <verify_benchmark+0x1c>
 31c:	02b78063          	beq	a5,a1,33c <verify_benchmark+0x38>
 320:	00078603          	lb	a2,0(a5)
 324:	00070683          	lb	a3,0(a4)
 328:	00178793          	addi	a5,a5,1
 32c:	00170713          	addi	a4,a4,1
 330:	fed606e3          	beq	a2,a3,31c <verify_benchmark+0x18>
 334:	00000513          	li	a0,0
 338:	00008067          	ret
 33c:	00100513          	li	a0,1
 340:	00008067          	ret

00000344 <__mulsi3>:
 344:	00050613          	mv	a2,a0
 348:	00000513          	li	a0,0
 34c:	0015f693          	andi	a3,a1,1
 350:	00068463          	beqz	a3,358 <__mulsi3+0x14>
 354:	00c50533          	add	a0,a0,a2
 358:	0015d593          	srli	a1,a1,0x1
 35c:	00161613          	slli	a2,a2,0x1
 360:	fe0596e3          	bnez	a1,34c <__mulsi3+0x8>
 364:	00008067          	ret

00000368 <__muldi3>:
 368:	ff010113          	addi	sp,sp,-16
 36c:	00068293          	mv	t0,a3
 370:	00112623          	sw	ra,12(sp)
 374:	00050393          	mv	t2,a0
 378:	00050693          	mv	a3,a0
 37c:	00060713          	mv	a4,a2
 380:	00000793          	li	a5,0
 384:	00000313          	li	t1,0
 388:	00000813          	li	a6,0
 38c:	00d808b3          	add	a7,a6,a3
 390:	00177e93          	andi	t4,a4,1
 394:	00f30f33          	add	t5,t1,a5
 398:	01f6de13          	srli	t3,a3,0x1f
 39c:	00175713          	srli	a4,a4,0x1
 3a0:	0108bfb3          	sltu	t6,a7,a6
 3a4:	00179793          	slli	a5,a5,0x1
 3a8:	000e8663          	beqz	t4,3b4 <__muldi3+0x4c>
 3ac:	00088813          	mv	a6,a7
 3b0:	01ef8333          	add	t1,t6,t5
 3b4:	00169693          	slli	a3,a3,0x1
 3b8:	01c7e7b3          	or	a5,a5,t3
 3bc:	fc0718e3          	bnez	a4,38c <__muldi3+0x24>
 3c0:	00058863          	beqz	a1,3d0 <__muldi3+0x68>
 3c4:	00060513          	mv	a0,a2
 3c8:	f7dff0ef          	jal	344 <__mulsi3>
 3cc:	00650333          	add	t1,a0,t1
 3d0:	00028a63          	beqz	t0,3e4 <__muldi3+0x7c>
 3d4:	00038513          	mv	a0,t2
 3d8:	00028593          	mv	a1,t0
 3dc:	f69ff0ef          	jal	344 <__mulsi3>
 3e0:	00650333          	add	t1,a0,t1
 3e4:	00c12083          	lw	ra,12(sp)
 3e8:	00080513          	mv	a0,a6
 3ec:	00030593          	mv	a1,t1
 3f0:	01010113          	addi	sp,sp,16
 3f4:	00008067          	ret
