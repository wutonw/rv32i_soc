
D:\aaa1verilog_project\rv32i_cpu\benchmark\embench\build\qrduino\qrduino.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
       0:	00008117          	auipc	sp,0x8
       4:	f0010113          	addi	sp,sp,-256 # 7f00 <__stack_top>
       8:	00001297          	auipc	t0,0x1
       c:	5fc28293          	addi	t0,t0,1532 # 1604 <heap_requested>
      10:	00003317          	auipc	t1,0x3
      14:	62830313          	addi	t1,t1,1576 # 3638 <__bss_end>
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
      78:	298030ef          	jal	3310 <initialise_benchmark>
      7c:	00000513          	li	a0,0
      80:	260030ef          	jal	32e0 <warm_caches>
      84:	fadff0ef          	jal	30 <start_trigger>
      88:	264030ef          	jal	32ec <benchmark>
      8c:	00a12623          	sw	a0,12(sp)
      90:	fb5ff0ef          	jal	44 <stop_trigger>
      94:	00c12503          	lw	a0,12(sp)
      98:	27c030ef          	jal	3314 <verify_benchmark>
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

00000148 <memset>:
     148:	00c50733          	add	a4,a0,a2
     14c:	00050793          	mv	a5,a0
     150:	00060863          	beqz	a2,160 <memset+0x18>
     154:	00178793          	addi	a5,a5,1
     158:	feb78fa3          	sb	a1,-1(a5)
     15c:	fef71ce3          	bne	a4,a5,154 <memset+0xc>
     160:	00008067          	ret

00000164 <memcmp>:
     164:	02060663          	beqz	a2,190 <memcmp+0x2c>
     168:	00c50633          	add	a2,a0,a2
     16c:	0080006f          	j	174 <memcmp+0x10>
     170:	02c50063          	beq	a0,a2,190 <memcmp+0x2c>
     174:	00054783          	lbu	a5,0(a0)
     178:	0005c703          	lbu	a4,0(a1)
     17c:	00150513          	addi	a0,a0,1
     180:	00158593          	addi	a1,a1,1
     184:	fee786e3          	beq	a5,a4,170 <memcmp+0xc>
     188:	40e78533          	sub	a0,a5,a4
     18c:	00008067          	ret
     190:	00000513          	li	a0,0
     194:	00008067          	ret

00000198 <strlen>:
     198:	00054783          	lbu	a5,0(a0)
     19c:	00078e63          	beqz	a5,1b8 <strlen+0x20>
     1a0:	00050793          	mv	a5,a0
     1a4:	0017c703          	lbu	a4,1(a5)
     1a8:	00178793          	addi	a5,a5,1
     1ac:	fe071ce3          	bnez	a4,1a4 <strlen+0xc>
     1b0:	40a78533          	sub	a0,a5,a0
     1b4:	00008067          	ret
     1b8:	00000513          	li	a0,0
     1bc:	00008067          	ret

000001c0 <init_heap_beebs>:
     1c0:	0035f793          	andi	a5,a1,3
     1c4:	02079263          	bnez	a5,1e8 <init_heap_beebs+0x28>
     1c8:	00b505b3          	add	a1,a0,a1
     1cc:	000016b7          	lui	a3,0x1
     1d0:	00001737          	lui	a4,0x1
     1d4:	000017b7          	lui	a5,0x1
     1d8:	60b6a423          	sw	a1,1544(a3) # 1608 <heap_end>
     1dc:	60a72623          	sw	a0,1548(a4) # 160c <heap_ptr>
     1e0:	6007a223          	sw	zero,1540(a5) # 1604 <heap_requested>
     1e4:	00008067          	ret
     1e8:	0000006f          	j	1e8 <init_heap_beebs+0x28>

000001ec <check_heap_beebs>:
     1ec:	000017b7          	lui	a5,0x1
     1f0:	6047a703          	lw	a4,1540(a5) # 1604 <heap_requested>
     1f4:	000017b7          	lui	a5,0x1
     1f8:	6087a783          	lw	a5,1544(a5) # 1608 <heap_end>
     1fc:	00e50533          	add	a0,a0,a4
     200:	00a7b533          	sltu	a0,a5,a0
     204:	00154513          	xori	a0,a0,1
     208:	00008067          	ret

0000020c <malloc_beebs>:
     20c:	00050793          	mv	a5,a0
     210:	04050e63          	beqz	a0,26c <malloc_beebs+0x60>
     214:	00001637          	lui	a2,0x1
     218:	60c62503          	lw	a0,1548(a2) # 160c <heap_ptr>
     21c:	000016b7          	lui	a3,0x1
     220:	6046a583          	lw	a1,1540(a3) # 1604 <heap_requested>
     224:	00f50733          	add	a4,a0,a5
     228:	00377813          	andi	a6,a4,3
     22c:	00b787b3          	add	a5,a5,a1
     230:	00081e63          	bnez	a6,24c <malloc_beebs+0x40>
     234:	000015b7          	lui	a1,0x1
     238:	6085a583          	lw	a1,1544(a1) # 1608 <heap_end>
     23c:	60f6a223          	sw	a5,1540(a3)
     240:	02e5e663          	bltu	a1,a4,26c <malloc_beebs+0x60>
     244:	60e62623          	sw	a4,1548(a2)
     248:	00008067          	ret
     24c:	00400593          	li	a1,4
     250:	410585b3          	sub	a1,a1,a6
     254:	00b787b3          	add	a5,a5,a1
     258:	00b70733          	add	a4,a4,a1
     25c:	000015b7          	lui	a1,0x1
     260:	6085a583          	lw	a1,1544(a1) # 1608 <heap_end>
     264:	60f6a223          	sw	a5,1540(a3)
     268:	fce5fee3          	bgeu	a1,a4,244 <malloc_beebs+0x38>
     26c:	00000513          	li	a0,0
     270:	00008067          	ret

00000274 <calloc_beebs>:
     274:	fe010113          	addi	sp,sp,-32
     278:	00112e23          	sw	ra,28(sp)
     27c:	120030ef          	jal	339c <__mulsi3>
     280:	08050263          	beqz	a0,304 <calloc_beebs+0x90>
     284:	000015b7          	lui	a1,0x1
     288:	60c5a783          	lw	a5,1548(a1) # 160c <heap_ptr>
     28c:	00001637          	lui	a2,0x1
     290:	60462703          	lw	a4,1540(a2) # 1604 <heap_requested>
     294:	00a786b3          	add	a3,a5,a0
     298:	0036f893          	andi	a7,a3,3
     29c:	00e50733          	add	a4,a0,a4
     2a0:	04089263          	bnez	a7,2e4 <calloc_beebs+0x70>
     2a4:	00001837          	lui	a6,0x1
     2a8:	60882803          	lw	a6,1544(a6) # 1608 <heap_end>
     2ac:	60e62223          	sw	a4,1540(a2)
     2b0:	04d86a63          	bltu	a6,a3,304 <calloc_beebs+0x90>
     2b4:	60d5a623          	sw	a3,1548(a1)
     2b8:	00078e63          	beqz	a5,2d4 <calloc_beebs+0x60>
     2bc:	00050613          	mv	a2,a0
     2c0:	00000593          	li	a1,0
     2c4:	00078513          	mv	a0,a5
     2c8:	00f12623          	sw	a5,12(sp)
     2cc:	e7dff0ef          	jal	148 <memset>
     2d0:	00c12783          	lw	a5,12(sp)
     2d4:	01c12083          	lw	ra,28(sp)
     2d8:	00078513          	mv	a0,a5
     2dc:	02010113          	addi	sp,sp,32
     2e0:	00008067          	ret
     2e4:	00400813          	li	a6,4
     2e8:	41180833          	sub	a6,a6,a7
     2ec:	01070733          	add	a4,a4,a6
     2f0:	010686b3          	add	a3,a3,a6
     2f4:	00001837          	lui	a6,0x1
     2f8:	60882803          	lw	a6,1544(a6) # 1608 <heap_end>
     2fc:	60e62223          	sw	a4,1540(a2)
     300:	fad87ae3          	bgeu	a6,a3,2b4 <calloc_beebs+0x40>
     304:	01c12083          	lw	ra,28(sp)
     308:	00000793          	li	a5,0
     30c:	00078513          	mv	a0,a5
     310:	02010113          	addi	sp,sp,32
     314:	00008067          	ret

00000318 <free_beebs>:
     318:	00008067          	ret

0000031c <badruns>:
     31c:	000017b7          	lui	a5,0x1
     320:	6247a783          	lw	a5,1572(a5) # 1624 <rlens>
     324:	00050813          	mv	a6,a0
     328:	00000713          	li	a4,0
     32c:	00000513          	li	a0,0
     330:	00400593          	li	a1,4
     334:	00e786b3          	add	a3,a5,a4
     338:	0006c683          	lbu	a3,0(a3)
     33c:	00170713          	addi	a4,a4,1
     340:	0ff77713          	zext.b	a4,a4
     344:	ffe50613          	addi	a2,a0,-2
     348:	00d5f463          	bgeu	a1,a3,350 <badruns+0x34>
     34c:	00c68533          	add	a0,a3,a2
     350:	fee872e3          	bgeu	a6,a4,334 <badruns+0x18>
     354:	00400713          	li	a4,4
     358:	09075a63          	bge	a4,a6,3ec <badruns+0xd0>
     35c:	00500893          	li	a7,5
     360:	40f888b3          	sub	a7,a7,a5
     364:	fff80313          	addi	t1,a6,-1
     368:	00300693          	li	a3,3
     36c:	0100006f          	j	37c <badruns+0x60>
     370:	0ff67693          	zext.b	a3,a2
     374:	00278793          	addi	a5,a5,2
     378:	0666da63          	bge	a3,t1,3ec <badruns+0xd0>
     37c:	0057c583          	lbu	a1,5(a5)
     380:	0017c703          	lbu	a4,1(a5)
     384:	00f88633          	add	a2,a7,a5
     388:	feb714e3          	bne	a4,a1,370 <badruns+0x54>
     38c:	0027c583          	lbu	a1,2(a5)
     390:	feb710e3          	bne	a4,a1,370 <badruns+0x54>
     394:	0047c583          	lbu	a1,4(a5)
     398:	fce59ce3          	bne	a1,a4,370 <badruns+0x54>
     39c:	0037ce03          	lbu	t3,3(a5)
     3a0:	00159713          	slli	a4,a1,0x1
     3a4:	00b70733          	add	a4,a4,a1
     3a8:	fdc714e3          	bne	a4,t3,370 <badruns+0x54>
     3ac:	0007c583          	lbu	a1,0(a5)
     3b0:	00268693          	addi	a3,a3,2
     3b4:	02058463          	beqz	a1,3dc <badruns+0xc0>
     3b8:	00159e13          	slli	t3,a1,0x1
     3bc:	00271713          	slli	a4,a4,0x2
     3c0:	00be0e33          	add	t3,t3,a1
     3c4:	0106dc63          	bge	a3,a6,3dc <badruns+0xc0>
     3c8:	00ee5a63          	bge	t3,a4,3dc <badruns+0xc0>
     3cc:	0067c583          	lbu	a1,6(a5)
     3d0:	00159693          	slli	a3,a1,0x1
     3d4:	00b686b3          	add	a3,a3,a1
     3d8:	f8e6cce3          	blt	a3,a4,370 <badruns+0x54>
     3dc:	0ff67693          	zext.b	a3,a2
     3e0:	02850513          	addi	a0,a0,40
     3e4:	00278793          	addi	a5,a5,2
     3e8:	f866cae3          	blt	a3,t1,37c <badruns+0x60>
     3ec:	00008067          	ret

000003f0 <appendrs>:
     3f0:	fc010113          	addi	sp,sp,-64
     3f4:	03512223          	sw	s5,36(sp)
     3f8:	00060a93          	mv	s5,a2
     3fc:	03412423          	sw	s4,40(sp)
     400:	01712e23          	sw	s7,28(sp)
     404:	00050a13          	mv	s4,a0
     408:	00058b93          	mv	s7,a1
     40c:	00068613          	mv	a2,a3
     410:	000a8513          	mv	a0,s5
     414:	00000593          	li	a1,0
     418:	03612023          	sw	s6,32(sp)
     41c:	01912a23          	sw	s9,20(sp)
     420:	02112e23          	sw	ra,60(sp)
     424:	00068b13          	mv	s6,a3
     428:	00070c93          	mv	s9,a4
     42c:	d1dff0ef          	jal	148 <memset>
     430:	0e0b8e63          	beqz	s7,52c <appendrs+0x13c>
     434:	03312623          	sw	s3,44(sp)
     438:	ffeb0993          	addi	s3,s6,-2
     43c:	02812c23          	sw	s0,56(sp)
     440:	02912a23          	sw	s1,52(sp)
     444:	03212823          	sw	s2,48(sp)
     448:	01812c23          	sw	s8,24(sp)
     44c:	0ff9f993          	zext.b	s3,s3
     450:	001a8493          	addi	s1,s5,1
     454:	fffb0413          	addi	s0,s6,-1
     458:	00001c37          	lui	s8,0x1
     45c:	00001937          	lui	s2,0x1
     460:	01a12823          	sw	s10,16(sp)
     464:	01b12623          	sw	s11,12(sp)
     468:	017a0bb3          	add	s7,s4,s7
     46c:	009989b3          	add	s3,s3,s1
     470:	008a8db3          	add	s11,s5,s0
     474:	1a0c0c13          	addi	s8,s8,416 # 11a0 <g0log>
     478:	0a090913          	addi	s2,s2,160 # 10a0 <g0exp>
     47c:	0ff00d13          	li	s10,255
     480:	000a4783          	lbu	a5,0(s4)
     484:	000ac703          	lbu	a4,0(s5)
     488:	00e7c7b3          	xor	a5,a5,a4
     48c:	00fc07b3          	add	a5,s8,a5
     490:	0007c883          	lbu	a7,0(a5)
     494:	0ba88c63          	beq	a7,s10,54c <appendrs+0x15c>
     498:	000016b7          	lui	a3,0x1
     49c:	00100793          	li	a5,1
     4a0:	0a068693          	addi	a3,a3,160 # 10a0 <g0exp>
     4a4:	0567f263          	bgeu	a5,s6,4e8 <appendrs+0xf8>
     4a8:	000a8613          	mv	a2,s5
     4ac:	016c8833          	add	a6,s9,s6
     4b0:	00090693          	mv	a3,s2
     4b4:	0fe00713          	li	a4,254
     4b8:	fff84783          	lbu	a5,-1(a6)
     4bc:	00164583          	lbu	a1,1(a2)
     4c0:	fff80813          	addi	a6,a6,-1
     4c4:	011787b3          	add	a5,a5,a7
     4c8:	00f75463          	bge	a4,a5,4d0 <appendrs+0xe0>
     4cc:	f0178793          	addi	a5,a5,-255
     4d0:	00f907b3          	add	a5,s2,a5
     4d4:	0007c783          	lbu	a5,0(a5)
     4d8:	00160613          	addi	a2,a2,1
     4dc:	00f5c7b3          	xor	a5,a1,a5
     4e0:	fef60fa3          	sb	a5,-1(a2)
     4e4:	fd361ae3          	bne	a2,s3,4b8 <appendrs+0xc8>
     4e8:	000cc783          	lbu	a5,0(s9)
     4ec:	0fe00713          	li	a4,254
     4f0:	011787b3          	add	a5,a5,a7
     4f4:	00f75463          	bge	a4,a5,4fc <appendrs+0x10c>
     4f8:	f0178793          	addi	a5,a5,-255
     4fc:	00f686b3          	add	a3,a3,a5
     500:	0006c783          	lbu	a5,0(a3)
     504:	00fd8023          	sb	a5,0(s11)
     508:	001a0a13          	addi	s4,s4,1
     50c:	f74b9ae3          	bne	s7,s4,480 <appendrs+0x90>
     510:	03812403          	lw	s0,56(sp)
     514:	03412483          	lw	s1,52(sp)
     518:	03012903          	lw	s2,48(sp)
     51c:	02c12983          	lw	s3,44(sp)
     520:	01812c03          	lw	s8,24(sp)
     524:	01012d03          	lw	s10,16(sp)
     528:	00c12d83          	lw	s11,12(sp)
     52c:	03c12083          	lw	ra,60(sp)
     530:	02812a03          	lw	s4,40(sp)
     534:	02412a83          	lw	s5,36(sp)
     538:	02012b03          	lw	s6,32(sp)
     53c:	01c12b83          	lw	s7,28(sp)
     540:	01412c83          	lw	s9,20(sp)
     544:	04010113          	addi	sp,sp,64
     548:	00008067          	ret
     54c:	00040613          	mv	a2,s0
     550:	00048593          	mv	a1,s1
     554:	000a8513          	mv	a0,s5
     558:	b9dff0ef          	jal	f4 <memmove>
     55c:	00000793          	li	a5,0
     560:	fa5ff06f          	j	504 <appendrs+0x114>

00000564 <applymask>:
     564:	00700793          	li	a5,7
     568:	26a7eee3          	bltu	a5,a0,fe4 <applymask+0xa80>
     56c:	00001737          	lui	a4,0x1
     570:	00070713          	mv	a4,a4
     574:	00251793          	slli	a5,a0,0x2
     578:	00e787b3          	add	a5,a5,a4
     57c:	0007a783          	lw	a5,0(a5)
     580:	fc010113          	addi	sp,sp,-64
     584:	03212823          	sw	s2,48(sp)
     588:	02112e23          	sw	ra,60(sp)
     58c:	02812c23          	sw	s0,56(sp)
     590:	00050913          	mv	s2,a0
     594:	00078067          	jr	a5
     598:	00001437          	lui	s0,0x1
     59c:	62144783          	lbu	a5,1569(s0) # 1621 <WD>
     5a0:	03412423          	sw	s4,40(sp)
     5a4:	01b12623          	sw	s11,12(sp)
     5a8:	00000a13          	li	s4,0
     5ac:	00000d93          	li	s11,0
     5b0:	00000913          	li	s2,0
     5b4:	1e0784e3          	beqz	a5,f9c <applymask+0xa38>
     5b8:	03312623          	sw	s3,44(sp)
     5bc:	03512223          	sw	s5,36(sp)
     5c0:	01712e23          	sw	s7,28(sp)
     5c4:	01812c23          	sw	s8,24(sp)
     5c8:	02912a23          	sw	s1,52(sp)
     5cc:	03612023          	sw	s6,32(sp)
     5d0:	01912a23          	sw	s9,20(sp)
     5d4:	01a12823          	sw	s10,16(sp)
     5d8:	00300993          	li	s3,3
     5dc:	00001ab7          	lui	s5,0x1
     5e0:	00001c37          	lui	s8,0x1
     5e4:	00001bb7          	lui	s7,0x1
     5e8:	00000c93          	li	s9,0
     5ec:	00000493          	li	s1,0
     5f0:	0f3c8ae3          	beq	s9,s3,ee4 <applymask+0x980>
     5f4:	412c87b3          	sub	a5,s9,s2
     5f8:	01903733          	snez	a4,s9
     5fc:	0017b793          	seqz	a5,a5
     600:	001c8c93          	addi	s9,s9,1
     604:	00f77733          	and	a4,a4,a5
     608:	0ffcfc93          	zext.b	s9,s9
     60c:	01b4f7b3          	and	a5,s1,s11
     610:	00e787b3          	add	a5,a5,a4
     614:	0017f793          	andi	a5,a5,1
     618:	08079063          	bnez	a5,698 <applymask+0x134>
     61c:	109de2e3          	bltu	s11,s1,f20 <applymask+0x9bc>
     620:	000d8b13          	mv	s6,s11
     624:	00048d13          	mv	s10,s1
     628:	000b0593          	mv	a1,s6
     62c:	000b0513          	mv	a0,s6
     630:	56d020ef          	jal	339c <__mulsi3>
     634:	01650533          	add	a0,a0,s6
     638:	628aa703          	lw	a4,1576(s5) # 1628 <framask>
     63c:	00155513          	srli	a0,a0,0x1
     640:	00ad07b3          	add	a5,s10,a0
     644:	0037d693          	srli	a3,a5,0x3
     648:	00d70733          	add	a4,a4,a3
     64c:	00074703          	lbu	a4,0(a4) # 1000 <qrencode+0x18>
     650:	fff7c793          	not	a5,a5
     654:	0077f793          	andi	a5,a5,7
     658:	40f757b3          	sra	a5,a4,a5
     65c:	0017f793          	andi	a5,a5,1
     660:	02079c63          	bnez	a5,698 <applymask+0x134>
     664:	620bc503          	lbu	a0,1568(s7) # 1620 <WDB>
     668:	000a0593          	mv	a1,s4
     66c:	531020ef          	jal	339c <__mulsi3>
     670:	618c2703          	lw	a4,1560(s8) # 1618 <qrframe>
     674:	0034d793          	srli	a5,s1,0x3
     678:	00f50533          	add	a0,a0,a5
     67c:	00a70733          	add	a4,a4,a0
     680:	00074683          	lbu	a3,0(a4)
     684:	0074f793          	andi	a5,s1,7
     688:	08000613          	li	a2,128
     68c:	40f657b3          	sra	a5,a2,a5
     690:	00d7c7b3          	xor	a5,a5,a3
     694:	00f70023          	sb	a5,0(a4)
     698:	62144783          	lbu	a5,1569(s0)
     69c:	00148493          	addi	s1,s1,1
     6a0:	0ff4f493          	zext.b	s1,s1
     6a4:	f4f4e6e3          	bltu	s1,a5,5f0 <applymask+0x8c>
     6a8:	001a0a13          	addi	s4,s4,1
     6ac:	00190913          	addi	s2,s2,1
     6b0:	0ffa7d93          	zext.b	s11,s4
     6b4:	0ff97913          	zext.b	s2,s2
     6b8:	4efdf463          	bgeu	s11,a5,ba0 <applymask+0x63c>
     6bc:	f33916e3          	bne	s2,s3,5e8 <applymask+0x84>
     6c0:	00000913          	li	s2,0
     6c4:	f25ff06f          	j	5e8 <applymask+0x84>
     6c8:	00001437          	lui	s0,0x1
     6cc:	62144783          	lbu	a5,1569(s0) # 1621 <WD>
     6d0:	03412423          	sw	s4,40(sp)
     6d4:	01b12623          	sw	s11,12(sp)
     6d8:	00000a13          	li	s4,0
     6dc:	00000d93          	li	s11,0
     6e0:	00000913          	li	s2,0
     6e4:	0a078ce3          	beqz	a5,f9c <applymask+0xa38>
     6e8:	03312623          	sw	s3,44(sp)
     6ec:	03512223          	sw	s5,36(sp)
     6f0:	01712e23          	sw	s7,28(sp)
     6f4:	01812c23          	sw	s8,24(sp)
     6f8:	02912a23          	sw	s1,52(sp)
     6fc:	03612023          	sw	s6,32(sp)
     700:	01912a23          	sw	s9,20(sp)
     704:	01a12823          	sw	s10,16(sp)
     708:	00300993          	li	s3,3
     70c:	00001ab7          	lui	s5,0x1
     710:	00001c37          	lui	s8,0x1
     714:	00001bb7          	lui	s7,0x1
     718:	00000c93          	li	s9,0
     71c:	00000493          	li	s1,0
     720:	7b3c8c63          	beq	s9,s3,ed8 <applymask+0x974>
     724:	412c87b3          	sub	a5,s9,s2
     728:	01903733          	snez	a4,s9
     72c:	0017b793          	seqz	a5,a5
     730:	001c8c93          	addi	s9,s9,1
     734:	00f77733          	and	a4,a4,a5
     738:	0ffcfc93          	zext.b	s9,s9
     73c:	01b487b3          	add	a5,s1,s11
     740:	00e787b3          	add	a5,a5,a4
     744:	0017f793          	andi	a5,a5,1
     748:	08079063          	bnez	a5,7c8 <applymask+0x264>
     74c:	7e9de063          	bltu	s11,s1,f2c <applymask+0x9c8>
     750:	000d8b13          	mv	s6,s11
     754:	00048d13          	mv	s10,s1
     758:	000b0593          	mv	a1,s6
     75c:	000b0513          	mv	a0,s6
     760:	43d020ef          	jal	339c <__mulsi3>
     764:	01650533          	add	a0,a0,s6
     768:	628aa703          	lw	a4,1576(s5) # 1628 <framask>
     76c:	00155513          	srli	a0,a0,0x1
     770:	00ad07b3          	add	a5,s10,a0
     774:	0037d693          	srli	a3,a5,0x3
     778:	00d70733          	add	a4,a4,a3
     77c:	00074703          	lbu	a4,0(a4)
     780:	fff7c793          	not	a5,a5
     784:	0077f793          	andi	a5,a5,7
     788:	40f757b3          	sra	a5,a4,a5
     78c:	0017f793          	andi	a5,a5,1
     790:	02079c63          	bnez	a5,7c8 <applymask+0x264>
     794:	620bc503          	lbu	a0,1568(s7) # 1620 <WDB>
     798:	000a0593          	mv	a1,s4
     79c:	401020ef          	jal	339c <__mulsi3>
     7a0:	618c2703          	lw	a4,1560(s8) # 1618 <qrframe>
     7a4:	0034d793          	srli	a5,s1,0x3
     7a8:	00f50533          	add	a0,a0,a5
     7ac:	00a70733          	add	a4,a4,a0
     7b0:	00074683          	lbu	a3,0(a4)
     7b4:	0074f793          	andi	a5,s1,7
     7b8:	08000613          	li	a2,128
     7bc:	40f657b3          	sra	a5,a2,a5
     7c0:	00d7c7b3          	xor	a5,a5,a3
     7c4:	00f70023          	sb	a5,0(a4)
     7c8:	62144783          	lbu	a5,1569(s0)
     7cc:	00148493          	addi	s1,s1,1
     7d0:	0ff4f493          	zext.b	s1,s1
     7d4:	f4f4e6e3          	bltu	s1,a5,720 <applymask+0x1bc>
     7d8:	001a0a13          	addi	s4,s4,1
     7dc:	00190913          	addi	s2,s2,1
     7e0:	0ffa7d93          	zext.b	s11,s4
     7e4:	0ff97913          	zext.b	s2,s2
     7e8:	3afdfc63          	bgeu	s11,a5,ba0 <applymask+0x63c>
     7ec:	f33916e3          	bne	s2,s3,718 <applymask+0x1b4>
     7f0:	00000913          	li	s2,0
     7f4:	f25ff06f          	j	718 <applymask+0x1b4>
     7f8:	00001437          	lui	s0,0x1
     7fc:	62144783          	lbu	a5,1569(s0) # 1621 <WD>
     800:	1e078463          	beqz	a5,9e8 <applymask+0x484>
     804:	03312623          	sw	s3,44(sp)
     808:	03412423          	sw	s4,40(sp)
     80c:	03512223          	sw	s5,36(sp)
     810:	03612023          	sw	s6,32(sp)
     814:	01712e23          	sw	s7,28(sp)
     818:	01912a23          	sw	s9,20(sp)
     81c:	02912a23          	sw	s1,52(sp)
     820:	01812c23          	sw	s8,24(sp)
     824:	01a12823          	sw	s10,16(sp)
     828:	00050c93          	mv	s9,a0
     82c:	00000993          	li	s3,0
     830:	00001a37          	lui	s4,0x1
     834:	00001bb7          	lui	s7,0x1
     838:	00001b37          	lui	s6,0x1
     83c:	08000a93          	li	s5,128
     840:	00090493          	mv	s1,s2
     844:	0880006f          	j	8cc <applymask+0x368>
     848:	000c8d13          	mv	s10,s9
     84c:	00048c13          	mv	s8,s1
     850:	000d0593          	mv	a1,s10
     854:	000d0513          	mv	a0,s10
     858:	345020ef          	jal	339c <__mulsi3>
     85c:	01a50533          	add	a0,a0,s10
     860:	628a2703          	lw	a4,1576(s4) # 1628 <framask>
     864:	00155513          	srli	a0,a0,0x1
     868:	00ac07b3          	add	a5,s8,a0
     86c:	0037d693          	srli	a3,a5,0x3
     870:	00d70733          	add	a4,a4,a3
     874:	00074703          	lbu	a4,0(a4)
     878:	fff7c793          	not	a5,a5
     87c:	0077f793          	andi	a5,a5,7
     880:	40f757b3          	sra	a5,a4,a5
     884:	0017f793          	andi	a5,a5,1
     888:	02079a63          	bnez	a5,8bc <applymask+0x358>
     88c:	620b4503          	lbu	a0,1568(s6) # 1620 <WDB>
     890:	00098593          	mv	a1,s3
     894:	309020ef          	jal	339c <__mulsi3>
     898:	618ba703          	lw	a4,1560(s7) # 1618 <qrframe>
     89c:	0034d793          	srli	a5,s1,0x3
     8a0:	00f50533          	add	a0,a0,a5
     8a4:	00a70733          	add	a4,a4,a0
     8a8:	00074683          	lbu	a3,0(a4)
     8ac:	0074f793          	andi	a5,s1,7
     8b0:	40fad7b3          	sra	a5,s5,a5
     8b4:	00d7c7b3          	xor	a5,a5,a3
     8b8:	00f70023          	sb	a5,0(a4)
     8bc:	62144783          	lbu	a5,1569(s0)
     8c0:	00148493          	addi	s1,s1,1
     8c4:	0ff4f493          	zext.b	s1,s1
     8c8:	66f4f863          	bgeu	s1,a5,f38 <applymask+0x9d4>
     8cc:	019487b3          	add	a5,s1,s9
     8d0:	0017f793          	andi	a5,a5,1
     8d4:	fe0794e3          	bnez	a5,8bc <applymask+0x358>
     8d8:	f69cf8e3          	bgeu	s9,s1,848 <applymask+0x2e4>
     8dc:	00048d13          	mv	s10,s1
     8e0:	000c8c13          	mv	s8,s9
     8e4:	f6dff06f          	j	850 <applymask+0x2ec>
     8e8:	00001437          	lui	s0,0x1
     8ec:	62144783          	lbu	a5,1569(s0) # 1621 <WD>
     8f0:	03312623          	sw	s3,44(sp)
     8f4:	00000913          	li	s2,0
     8f8:	00000993          	li	s3,0
     8fc:	6a078663          	beqz	a5,fa8 <applymask+0xa44>
     900:	03412423          	sw	s4,40(sp)
     904:	03512223          	sw	s5,36(sp)
     908:	03612023          	sw	s6,32(sp)
     90c:	01712e23          	sw	s7,28(sp)
     910:	02912a23          	sw	s1,52(sp)
     914:	01812c23          	sw	s8,24(sp)
     918:	01912a23          	sw	s9,20(sp)
     91c:	00001a37          	lui	s4,0x1
     920:	00001bb7          	lui	s7,0x1
     924:	00001b37          	lui	s6,0x1
     928:	08000a93          	li	s5,128
     92c:	00197493          	andi	s1,s2,1
     930:	62049e63          	bnez	s1,f6c <applymask+0xa08>
     934:	5e996063          	bltu	s2,s1,f14 <applymask+0x9b0>
     938:	00090c93          	mv	s9,s2
     93c:	00048c13          	mv	s8,s1
     940:	000c8593          	mv	a1,s9
     944:	000c8513          	mv	a0,s9
     948:	255020ef          	jal	339c <__mulsi3>
     94c:	01950533          	add	a0,a0,s9
     950:	628a2703          	lw	a4,1576(s4) # 1628 <framask>
     954:	00155513          	srli	a0,a0,0x1
     958:	00ac07b3          	add	a5,s8,a0
     95c:	0037d693          	srli	a3,a5,0x3
     960:	00d70733          	add	a4,a4,a3
     964:	00074703          	lbu	a4,0(a4)
     968:	fff7c793          	not	a5,a5
     96c:	0077f793          	andi	a5,a5,7
     970:	40f757b3          	sra	a5,a4,a5
     974:	0017f793          	andi	a5,a5,1
     978:	02079a63          	bnez	a5,9ac <applymask+0x448>
     97c:	620b4503          	lbu	a0,1568(s6) # 1620 <WDB>
     980:	00098593          	mv	a1,s3
     984:	219020ef          	jal	339c <__mulsi3>
     988:	618ba703          	lw	a4,1560(s7) # 1618 <qrframe>
     98c:	0034d793          	srli	a5,s1,0x3
     990:	00f50533          	add	a0,a0,a5
     994:	00a70733          	add	a4,a4,a0
     998:	00074683          	lbu	a3,0(a4)
     99c:	0074f793          	andi	a5,s1,7
     9a0:	40fad7b3          	sra	a5,s5,a5
     9a4:	00d7c7b3          	xor	a5,a5,a3
     9a8:	00f70023          	sb	a5,0(a4)
     9ac:	62144703          	lbu	a4,1569(s0)
     9b0:	00148493          	addi	s1,s1,1
     9b4:	0ff4f493          	zext.b	s1,s1
     9b8:	f6e4eee3          	bltu	s1,a4,934 <applymask+0x3d0>
     9bc:	00198993          	addi	s3,s3,1
     9c0:	0ff9f913          	zext.b	s2,s3
     9c4:	f6e964e3          	bltu	s2,a4,92c <applymask+0x3c8>
     9c8:	03412483          	lw	s1,52(sp)
     9cc:	02c12983          	lw	s3,44(sp)
     9d0:	02812a03          	lw	s4,40(sp)
     9d4:	02412a83          	lw	s5,36(sp)
     9d8:	02012b03          	lw	s6,32(sp)
     9dc:	01c12b83          	lw	s7,28(sp)
     9e0:	01812c03          	lw	s8,24(sp)
     9e4:	01412c83          	lw	s9,20(sp)
     9e8:	03c12083          	lw	ra,60(sp)
     9ec:	03812403          	lw	s0,56(sp)
     9f0:	03012903          	lw	s2,48(sp)
     9f4:	04010113          	addi	sp,sp,64
     9f8:	00008067          	ret
     9fc:	00001437          	lui	s0,0x1
     a00:	62144783          	lbu	a5,1569(s0) # 1621 <WD>
     a04:	03312623          	sw	s3,44(sp)
     a08:	03512223          	sw	s5,36(sp)
     a0c:	00000993          	li	s3,0
     a10:	00000a93          	li	s5,0
     a14:	5c078263          	beqz	a5,fd8 <applymask+0xa74>
     a18:	03412423          	sw	s4,40(sp)
     a1c:	03612023          	sw	s6,32(sp)
     a20:	01712e23          	sw	s7,28(sp)
     a24:	01812c23          	sw	s8,24(sp)
     a28:	02912a23          	sw	s1,52(sp)
     a2c:	01912a23          	sw	s9,20(sp)
     a30:	00001a37          	lui	s4,0x1
     a34:	00001c37          	lui	s8,0x1
     a38:	00001bb7          	lui	s7,0x1
     a3c:	08000b13          	li	s6,128
     a40:	00000793          	li	a5,0
     a44:	00000493          	li	s1,0
     a48:	ffd78713          	addi	a4,a5,-3
     a4c:	00070463          	beqz	a4,a54 <applymask+0x4f0>
     a50:	08079863          	bnez	a5,ae0 <applymask+0x57c>
     a54:	4899ee63          	bltu	s3,s1,ef0 <applymask+0x98c>
     a58:	00098c93          	mv	s9,s3
     a5c:	00048913          	mv	s2,s1
     a60:	000c8593          	mv	a1,s9
     a64:	000c8513          	mv	a0,s9
     a68:	135020ef          	jal	339c <__mulsi3>
     a6c:	01950533          	add	a0,a0,s9
     a70:	628a2703          	lw	a4,1576(s4) # 1628 <framask>
     a74:	00155513          	srli	a0,a0,0x1
     a78:	00a907b3          	add	a5,s2,a0
     a7c:	0037d693          	srli	a3,a5,0x3
     a80:	00d70733          	add	a4,a4,a3
     a84:	00074703          	lbu	a4,0(a4)
     a88:	fff7c793          	not	a5,a5
     a8c:	0077f793          	andi	a5,a5,7
     a90:	40f757b3          	sra	a5,a4,a5
     a94:	0017f793          	andi	a5,a5,1
     a98:	02079a63          	bnez	a5,acc <applymask+0x568>
     a9c:	620bc503          	lbu	a0,1568(s7) # 1620 <WDB>
     aa0:	000a8593          	mv	a1,s5
     aa4:	0f9020ef          	jal	339c <__mulsi3>
     aa8:	618c2703          	lw	a4,1560(s8) # 1618 <qrframe>
     aac:	0034d793          	srli	a5,s1,0x3
     ab0:	00f50533          	add	a0,a0,a5
     ab4:	00a70733          	add	a4,a4,a0
     ab8:	00074683          	lbu	a3,0(a4)
     abc:	0074f793          	andi	a5,s1,7
     ac0:	40fb57b3          	sra	a5,s6,a5
     ac4:	00d7c7b3          	xor	a5,a5,a3
     ac8:	00f70023          	sb	a5,0(a4)
     acc:	62144703          	lbu	a4,1569(s0)
     ad0:	00148493          	addi	s1,s1,1
     ad4:	0ff4f493          	zext.b	s1,s1
     ad8:	02e4f063          	bgeu	s1,a4,af8 <applymask+0x594>
     adc:	00100793          	li	a5,1
     ae0:	62144703          	lbu	a4,1569(s0)
     ae4:	00148493          	addi	s1,s1,1
     ae8:	00178793          	addi	a5,a5,1
     aec:	0ff4f493          	zext.b	s1,s1
     af0:	0ff7f793          	zext.b	a5,a5
     af4:	f4e4eae3          	bltu	s1,a4,a48 <applymask+0x4e4>
     af8:	001a8a93          	addi	s5,s5,1
     afc:	0ffaf993          	zext.b	s3,s5
     b00:	f4e9e0e3          	bltu	s3,a4,a40 <applymask+0x4dc>
     b04:	ec5ff06f          	j	9c8 <applymask+0x464>
     b08:	00001437          	lui	s0,0x1
     b0c:	62144783          	lbu	a5,1569(s0) # 1621 <WD>
     b10:	03412423          	sw	s4,40(sp)
     b14:	00000913          	li	s2,0
     b18:	00000a13          	li	s4,0
     b1c:	4a078a63          	beqz	a5,fd0 <applymask+0xa6c>
     b20:	03312623          	sw	s3,44(sp)
     b24:	03512223          	sw	s5,36(sp)
     b28:	03612023          	sw	s6,32(sp)
     b2c:	01712e23          	sw	s7,28(sp)
     b30:	01812c23          	sw	s8,24(sp)
     b34:	02912a23          	sw	s1,52(sp)
     b38:	01912a23          	sw	s9,20(sp)
     b3c:	01a12823          	sw	s10,16(sp)
     b40:	01b12623          	sw	s11,12(sp)
     b44:	00001ab7          	lui	s5,0x1
     b48:	00001c37          	lui	s8,0x1
     b4c:	00001bb7          	lui	s7,0x1
     b50:	08000b13          	li	s6,128
     b54:	00300993          	li	s3,3
     b58:	00297d13          	andi	s10,s2,2
     b5c:	060d0863          	beqz	s10,bcc <applymask+0x668>
     b60:	00000d13          	li	s10,0
     b64:	62144783          	lbu	a5,1569(s0)
     b68:	001d0d13          	addi	s10,s10,1
     b6c:	0ffd7d13          	zext.b	s10,s10
     b70:	00100713          	li	a4,1
     b74:	02fd7063          	bgeu	s10,a5,b94 <applymask+0x630>
     b78:	05370a63          	beq	a4,s3,bcc <applymask+0x668>
     b7c:	62144783          	lbu	a5,1569(s0)
     b80:	001d0d13          	addi	s10,s10,1
     b84:	00170713          	addi	a4,a4,1
     b88:	0ffd7d13          	zext.b	s10,s10
     b8c:	0ff77713          	zext.b	a4,a4
     b90:	fefd64e3          	bltu	s10,a5,b78 <applymask+0x614>
     b94:	001a0a13          	addi	s4,s4,1
     b98:	0ffa7913          	zext.b	s2,s4
     b9c:	faf96ee3          	bltu	s2,a5,b58 <applymask+0x5f4>
     ba0:	03412483          	lw	s1,52(sp)
     ba4:	02c12983          	lw	s3,44(sp)
     ba8:	02812a03          	lw	s4,40(sp)
     bac:	02412a83          	lw	s5,36(sp)
     bb0:	02012b03          	lw	s6,32(sp)
     bb4:	01c12b83          	lw	s7,28(sp)
     bb8:	01812c03          	lw	s8,24(sp)
     bbc:	01412c83          	lw	s9,20(sp)
     bc0:	01012d03          	lw	s10,16(sp)
     bc4:	00c12d83          	lw	s11,12(sp)
     bc8:	e21ff06f          	j	9e8 <applymask+0x484>
     bcc:	00100493          	li	s1,1
     bd0:	09a96c63          	bltu	s2,s10,c68 <applymask+0x704>
     bd4:	00090d93          	mv	s11,s2
     bd8:	000d0c93          	mv	s9,s10
     bdc:	000d8593          	mv	a1,s11
     be0:	000d8513          	mv	a0,s11
     be4:	7b8020ef          	jal	339c <__mulsi3>
     be8:	01b50533          	add	a0,a0,s11
     bec:	628aa703          	lw	a4,1576(s5) # 1628 <framask>
     bf0:	00155513          	srli	a0,a0,0x1
     bf4:	00ac87b3          	add	a5,s9,a0
     bf8:	0037d693          	srli	a3,a5,0x3
     bfc:	00d70733          	add	a4,a4,a3
     c00:	00074703          	lbu	a4,0(a4)
     c04:	fff7c793          	not	a5,a5
     c08:	0077f793          	andi	a5,a5,7
     c0c:	40f757b3          	sra	a5,a4,a5
     c10:	0017f793          	andi	a5,a5,1
     c14:	02079a63          	bnez	a5,c48 <applymask+0x6e4>
     c18:	620bc503          	lbu	a0,1568(s7) # 1620 <WDB>
     c1c:	000a0593          	mv	a1,s4
     c20:	77c020ef          	jal	339c <__mulsi3>
     c24:	618c2703          	lw	a4,1560(s8) # 1618 <qrframe>
     c28:	003d5793          	srli	a5,s10,0x3
     c2c:	00f50533          	add	a0,a0,a5
     c30:	00a70733          	add	a4,a4,a0
     c34:	00074683          	lbu	a3,0(a4)
     c38:	007d7793          	andi	a5,s10,7
     c3c:	40fb57b3          	sra	a5,s6,a5
     c40:	00d7c7b3          	xor	a5,a5,a3
     c44:	00f70023          	sb	a5,0(a4)
     c48:	62144783          	lbu	a5,1569(s0)
     c4c:	001d0d13          	addi	s10,s10,1
     c50:	0ffd7d13          	zext.b	s10,s10
     c54:	f4fd70e3          	bgeu	s10,a5,b94 <applymask+0x630>
     c58:	f13486e3          	beq	s1,s3,b64 <applymask+0x600>
     c5c:	00148493          	addi	s1,s1,1
     c60:	0ff4f493          	zext.b	s1,s1
     c64:	f7a978e3          	bgeu	s2,s10,bd4 <applymask+0x670>
     c68:	000d0d93          	mv	s11,s10
     c6c:	00090c93          	mv	s9,s2
     c70:	f6dff06f          	j	bdc <applymask+0x678>
     c74:	00001437          	lui	s0,0x1
     c78:	62144783          	lbu	a5,1569(s0) # 1621 <WD>
     c7c:	03312623          	sw	s3,44(sp)
     c80:	03412423          	sw	s4,40(sp)
     c84:	03612023          	sw	s6,32(sp)
     c88:	00000993          	li	s3,0
     c8c:	00000b13          	li	s6,0
     c90:	00000a13          	li	s4,0
     c94:	32078663          	beqz	a5,fc0 <applymask+0xa5c>
     c98:	03512223          	sw	s5,36(sp)
     c9c:	01712e23          	sw	s7,28(sp)
     ca0:	01812c23          	sw	s8,24(sp)
     ca4:	01912a23          	sw	s9,20(sp)
     ca8:	01b12623          	sw	s11,12(sp)
     cac:	02912a23          	sw	s1,52(sp)
     cb0:	01a12823          	sw	s10,16(sp)
     cb4:	00001ab7          	lui	s5,0x1
     cb8:	00001cb7          	lui	s9,0x1
     cbc:	00001c37          	lui	s8,0x1
     cc0:	08000b93          	li	s7,128
     cc4:	00300d93          	li	s11,3
     cc8:	000a0793          	mv	a5,s4
     ccc:	00000493          	li	s1,0
     cd0:	ffd78713          	addi	a4,a5,-3
     cd4:	00070463          	beqz	a4,cdc <applymask+0x778>
     cd8:	08079863          	bnez	a5,d68 <applymask+0x804>
     cdc:	2299e063          	bltu	s3,s1,efc <applymask+0x998>
     ce0:	00098d13          	mv	s10,s3
     ce4:	00048913          	mv	s2,s1
     ce8:	000d0593          	mv	a1,s10
     cec:	000d0513          	mv	a0,s10
     cf0:	6ac020ef          	jal	339c <__mulsi3>
     cf4:	01a50533          	add	a0,a0,s10
     cf8:	628aa703          	lw	a4,1576(s5) # 1628 <framask>
     cfc:	00155513          	srli	a0,a0,0x1
     d00:	00a907b3          	add	a5,s2,a0
     d04:	0037d693          	srli	a3,a5,0x3
     d08:	00d70733          	add	a4,a4,a3
     d0c:	00074703          	lbu	a4,0(a4)
     d10:	fff7c793          	not	a5,a5
     d14:	0077f793          	andi	a5,a5,7
     d18:	40f757b3          	sra	a5,a4,a5
     d1c:	0017f793          	andi	a5,a5,1
     d20:	02079a63          	bnez	a5,d54 <applymask+0x7f0>
     d24:	620c4503          	lbu	a0,1568(s8) # 1620 <WDB>
     d28:	000b0593          	mv	a1,s6
     d2c:	670020ef          	jal	339c <__mulsi3>
     d30:	618ca703          	lw	a4,1560(s9) # 1618 <qrframe>
     d34:	0034d793          	srli	a5,s1,0x3
     d38:	00f50533          	add	a0,a0,a5
     d3c:	00a70733          	add	a4,a4,a0
     d40:	00074683          	lbu	a3,0(a4)
     d44:	0074f793          	andi	a5,s1,7
     d48:	40fbd7b3          	sra	a5,s7,a5
     d4c:	00d7c7b3          	xor	a5,a5,a3
     d50:	00f70023          	sb	a5,0(a4)
     d54:	62144703          	lbu	a4,1569(s0)
     d58:	00148493          	addi	s1,s1,1
     d5c:	0ff4f493          	zext.b	s1,s1
     d60:	02e4f063          	bgeu	s1,a4,d80 <applymask+0x81c>
     d64:	00100793          	li	a5,1
     d68:	62144703          	lbu	a4,1569(s0)
     d6c:	00148493          	addi	s1,s1,1
     d70:	00178793          	addi	a5,a5,1
     d74:	0ff4f493          	zext.b	s1,s1
     d78:	0ff7f793          	zext.b	a5,a5
     d7c:	f4e4eae3          	bltu	s1,a4,cd0 <applymask+0x76c>
     d80:	001b0b13          	addi	s6,s6,1
     d84:	001a0a13          	addi	s4,s4,1
     d88:	0ffb7993          	zext.b	s3,s6
     d8c:	0ffa7a13          	zext.b	s4,s4
     d90:	e0e9f8e3          	bgeu	s3,a4,ba0 <applymask+0x63c>
     d94:	f3ba1ae3          	bne	s4,s11,cc8 <applymask+0x764>
     d98:	00000a13          	li	s4,0
     d9c:	f2dff06f          	j	cc8 <applymask+0x764>
     da0:	00001437          	lui	s0,0x1
     da4:	62144783          	lbu	a5,1569(s0) # 1621 <WD>
     da8:	03412423          	sw	s4,40(sp)
     dac:	03512223          	sw	s5,36(sp)
     db0:	01712e23          	sw	s7,28(sp)
     db4:	00000a93          	li	s5,0
     db8:	00000b93          	li	s7,0
     dbc:	00000a13          	li	s4,0
     dc0:	1e078863          	beqz	a5,fb0 <applymask+0xa4c>
     dc4:	03612023          	sw	s6,32(sp)
     dc8:	01912a23          	sw	s9,20(sp)
     dcc:	02912a23          	sw	s1,52(sp)
     dd0:	03312623          	sw	s3,44(sp)
     dd4:	01812c23          	sw	s8,24(sp)
     dd8:	01a12823          	sw	s10,16(sp)
     ddc:	01b12623          	sw	s11,12(sp)
     de0:	00300913          	li	s2,3
     de4:	00001b37          	lui	s6,0x1
     de8:	00001cb7          	lui	s9,0x1
     dec:	014039b3          	snez	s3,s4
     df0:	00000d13          	li	s10,0
     df4:	00000493          	li	s1,0
     df8:	0d2d0a63          	beq	s10,s2,ecc <applymask+0x968>
     dfc:	01a03733          	snez	a4,s10
     e00:	001d0d13          	addi	s10,s10,1
     e04:	00e9f733          	and	a4,s3,a4
     e08:	0ffd7d13          	zext.b	s10,s10
     e0c:	0174f7b3          	and	a5,s1,s7
     e10:	0017f793          	andi	a5,a5,1
     e14:	00e787b3          	add	a5,a5,a4
     e18:	08079263          	bnez	a5,e9c <applymask+0x938>
     e1c:	0e9be663          	bltu	s7,s1,f08 <applymask+0x9a4>
     e20:	000b8c13          	mv	s8,s7
     e24:	00048d93          	mv	s11,s1
     e28:	000c0593          	mv	a1,s8
     e2c:	000c0513          	mv	a0,s8
     e30:	56c020ef          	jal	339c <__mulsi3>
     e34:	01850533          	add	a0,a0,s8
     e38:	628b2703          	lw	a4,1576(s6) # 1628 <framask>
     e3c:	00155513          	srli	a0,a0,0x1
     e40:	00ad87b3          	add	a5,s11,a0
     e44:	0037d613          	srli	a2,a5,0x3
     e48:	00c70733          	add	a4,a4,a2
     e4c:	00074703          	lbu	a4,0(a4)
     e50:	fff7c793          	not	a5,a5
     e54:	0077f793          	andi	a5,a5,7
     e58:	40f757b3          	sra	a5,a4,a5
     e5c:	0017f793          	andi	a5,a5,1
     e60:	02079e63          	bnez	a5,e9c <applymask+0x938>
     e64:	000017b7          	lui	a5,0x1
     e68:	6207c503          	lbu	a0,1568(a5) # 1620 <WDB>
     e6c:	000a8593          	mv	a1,s5
     e70:	52c020ef          	jal	339c <__mulsi3>
     e74:	618ca703          	lw	a4,1560(s9) # 1618 <qrframe>
     e78:	0034d793          	srli	a5,s1,0x3
     e7c:	00f50533          	add	a0,a0,a5
     e80:	00a70733          	add	a4,a4,a0
     e84:	00074603          	lbu	a2,0(a4)
     e88:	0074f793          	andi	a5,s1,7
     e8c:	08000693          	li	a3,128
     e90:	40f6d7b3          	sra	a5,a3,a5
     e94:	00c7c7b3          	xor	a5,a5,a2
     e98:	00f70023          	sb	a5,0(a4)
     e9c:	62144783          	lbu	a5,1569(s0)
     ea0:	00148493          	addi	s1,s1,1
     ea4:	0ff4f493          	zext.b	s1,s1
     ea8:	f4f4e8e3          	bltu	s1,a5,df8 <applymask+0x894>
     eac:	001a8a93          	addi	s5,s5,1
     eb0:	001a0a13          	addi	s4,s4,1
     eb4:	0ffafb93          	zext.b	s7,s5
     eb8:	0ffa7a13          	zext.b	s4,s4
     ebc:	cefbf2e3          	bgeu	s7,a5,ba0 <applymask+0x63c>
     ec0:	f32a16e3          	bne	s4,s2,dec <applymask+0x888>
     ec4:	00000a13          	li	s4,0
     ec8:	f25ff06f          	j	dec <applymask+0x888>
     ecc:	00100d13          	li	s10,1
     ed0:	00000713          	li	a4,0
     ed4:	f39ff06f          	j	e0c <applymask+0x8a8>
     ed8:	00100c93          	li	s9,1
     edc:	00000713          	li	a4,0
     ee0:	85dff06f          	j	73c <applymask+0x1d8>
     ee4:	00100c93          	li	s9,1
     ee8:	00000713          	li	a4,0
     eec:	f20ff06f          	j	60c <applymask+0xa8>
     ef0:	00048c93          	mv	s9,s1
     ef4:	00098913          	mv	s2,s3
     ef8:	b69ff06f          	j	a60 <applymask+0x4fc>
     efc:	00048d13          	mv	s10,s1
     f00:	00098913          	mv	s2,s3
     f04:	de5ff06f          	j	ce8 <applymask+0x784>
     f08:	00048c13          	mv	s8,s1
     f0c:	000b8d93          	mv	s11,s7
     f10:	f19ff06f          	j	e28 <applymask+0x8c4>
     f14:	00048c93          	mv	s9,s1
     f18:	00090c13          	mv	s8,s2
     f1c:	a25ff06f          	j	940 <applymask+0x3dc>
     f20:	00048b13          	mv	s6,s1
     f24:	000d8d13          	mv	s10,s11
     f28:	f00ff06f          	j	628 <applymask+0xc4>
     f2c:	00048b13          	mv	s6,s1
     f30:	000d8d13          	mv	s10,s11
     f34:	825ff06f          	j	758 <applymask+0x1f4>
     f38:	00198993          	addi	s3,s3,1
     f3c:	0ff9fc93          	zext.b	s9,s3
     f40:	90fce0e3          	bltu	s9,a5,840 <applymask+0x2dc>
     f44:	03412483          	lw	s1,52(sp)
     f48:	02c12983          	lw	s3,44(sp)
     f4c:	02812a03          	lw	s4,40(sp)
     f50:	02412a83          	lw	s5,36(sp)
     f54:	02012b03          	lw	s6,32(sp)
     f58:	01c12b83          	lw	s7,28(sp)
     f5c:	01812c03          	lw	s8,24(sp)
     f60:	01412c83          	lw	s9,20(sp)
     f64:	01012d03          	lw	s10,16(sp)
     f68:	a81ff06f          	j	9e8 <applymask+0x484>
     f6c:	00000793          	li	a5,0
     f70:	62144703          	lbu	a4,1569(s0)
     f74:	00178693          	addi	a3,a5,1
     f78:	0ff6f693          	zext.b	a3,a3
     f7c:	a4e6f0e3          	bgeu	a3,a4,9bc <applymask+0x458>
     f80:	00278793          	addi	a5,a5,2
     f84:	0ff7f793          	zext.b	a5,a5
     f88:	fee7e4e3          	bltu	a5,a4,f70 <applymask+0xa0c>
     f8c:	00198993          	addi	s3,s3,1
     f90:	0ff9f913          	zext.b	s2,s3
     f94:	98e96ce3          	bltu	s2,a4,92c <applymask+0x3c8>
     f98:	a31ff06f          	j	9c8 <applymask+0x464>
     f9c:	02812a03          	lw	s4,40(sp)
     fa0:	00c12d83          	lw	s11,12(sp)
     fa4:	a45ff06f          	j	9e8 <applymask+0x484>
     fa8:	02c12983          	lw	s3,44(sp)
     fac:	a3dff06f          	j	9e8 <applymask+0x484>
     fb0:	02812a03          	lw	s4,40(sp)
     fb4:	02412a83          	lw	s5,36(sp)
     fb8:	01c12b83          	lw	s7,28(sp)
     fbc:	a2dff06f          	j	9e8 <applymask+0x484>
     fc0:	02c12983          	lw	s3,44(sp)
     fc4:	02812a03          	lw	s4,40(sp)
     fc8:	02012b03          	lw	s6,32(sp)
     fcc:	a1dff06f          	j	9e8 <applymask+0x484>
     fd0:	02812a03          	lw	s4,40(sp)
     fd4:	a15ff06f          	j	9e8 <applymask+0x484>
     fd8:	02c12983          	lw	s3,44(sp)
     fdc:	02412a83          	lw	s5,36(sp)
     fe0:	a09ff06f          	j	9e8 <applymask+0x484>
     fe4:	00008067          	ret

00000fe8 <qrencode>:
     fe8:	000017b7          	lui	a5,0x1
     fec:	61c7a503          	lw	a0,1564(a5) # 161c <strinbuf>
     ff0:	fb010113          	addi	sp,sp,-80
     ff4:	04112623          	sw	ra,76(sp)
     ff8:	04812423          	sw	s0,72(sp)
     ffc:	03312e23          	sw	s3,60(sp)
    1000:	03512a23          	sw	s5,52(sp)
    1004:	04912223          	sw	s1,68(sp)
    1008:	05212023          	sw	s2,64(sp)
    100c:	03412c23          	sw	s4,56(sp)
    1010:	03612823          	sw	s6,48(sp)
    1014:	03712623          	sw	s7,44(sp)
    1018:	03812423          	sw	s8,40(sp)
    101c:	03912223          	sw	s9,36(sp)
    1020:	03a12023          	sw	s10,32(sp)
    1024:	01b12e23          	sw	s11,28(sp)
    1028:	970ff0ef          	jal	198 <strlen>
    102c:	000017b7          	lui	a5,0x1
    1030:	00001ab7          	lui	s5,0x1
    1034:	6127c983          	lbu	s3,1554(a5) # 1612 <neccblk2>
    1038:	00050413          	mv	s0,a0
    103c:	000017b7          	lui	a5,0x1
    1040:	613ac503          	lbu	a0,1555(s5) # 1613 <neccblk1>
    1044:	6117c583          	lbu	a1,1553(a5) # 1611 <datablkw>
    1048:	01350533          	add	a0,a0,s3
    104c:	350020ef          	jal	339c <__mulsi3>
    1050:	013509b3          	add	s3,a0,s3
    1054:	00001637          	lui	a2,0x1
    1058:	ffe98793          	addi	a5,s3,-2
    105c:	62264703          	lbu	a4,1570(a2) # 1622 <VERSION>
    1060:	1ef468e3          	bltu	s0,a5,1a50 <heap+0x418>
    1064:	00900693          	li	a3,9
    1068:	ffd98413          	addi	s0,s3,-3
    106c:	2ae6fce3          	bgeu	a3,a4,1b24 <heap+0x4ec>
    1070:	000017b7          	lui	a5,0x1
    1074:	61c7a703          	lw	a4,1564(a5) # 161c <strinbuf>
    1078:	fff00513          	li	a0,-1
    107c:	fff40793          	addi	a5,s0,-1
    1080:	00870733          	add	a4,a4,s0
    1084:	00070123          	sb	zero,2(a4)
    1088:	04040263          	beqz	s0,10cc <g0exp+0x2c>
    108c:	00001837          	lui	a6,0x1
    1090:	61c82703          	lw	a4,1564(a6) # 161c <strinbuf>
    1094:	00f706b3          	add	a3,a4,a5
    1098:	0006c683          	lbu	a3,0(a3)
    109c:	00f70733          	add	a4,a4,a5
    10a0:	00374583          	lbu	a1,3(a4)
    10a4:	00469693          	slli	a3,a3,0x4
    10a8:	00b6e6b3          	or	a3,a3,a1
    10ac:	00d701a3          	sb	a3,3(a4)
    10b0:	61c82703          	lw	a4,1564(a6)
    10b4:	00f70733          	add	a4,a4,a5
    10b8:	00074683          	lbu	a3,0(a4)
    10bc:	fff78793          	addi	a5,a5,-1
    10c0:	0046d693          	srli	a3,a3,0x4
    10c4:	00d70123          	sb	a3,2(a4)
    10c8:	fca792e3          	bne	a5,a0,108c <fmtword+0x6c>
    10cc:	00001837          	lui	a6,0x1
    10d0:	61c82503          	lw	a0,1564(a6) # 161c <strinbuf>
    10d4:	00441593          	slli	a1,s0,0x4
    10d8:	00445713          	srli	a4,s0,0x4
    10dc:	00254683          	lbu	a3,2(a0)
    10e0:	00c45793          	srli	a5,s0,0xc
    10e4:	0407e793          	ori	a5,a5,64
    10e8:	00b6e6b3          	or	a3,a3,a1
    10ec:	00d50123          	sb	a3,2(a0)
    10f0:	61c82683          	lw	a3,1564(a6)
    10f4:	fec00593          	li	a1,-20
    10f8:	00e680a3          	sb	a4,1(a3)
    10fc:	61c82703          	lw	a4,1564(a6)
    1100:	00f70023          	sb	a5,0(a4)
    1104:	62264783          	lbu	a5,1570(a2)
    1108:	01100613          	li	a2,17
    110c:	00a7b793          	sltiu	a5,a5,10
    1110:	40f407b3          	sub	a5,s0,a5
    1114:	00378793          	addi	a5,a5,3
    1118:	1f37e0e3          	bltu	a5,s3,1af8 <heap+0x4c0>
    111c:	000017b7          	lui	a5,0x1
    1120:	6107cf03          	lbu	t5,1552(a5) # 1610 <eccblkwid>
    1124:	000017b7          	lui	a5,0x1
    1128:	61c7a403          	lw	s0,1564(a5) # 161c <strinbuf>
    112c:	00001db7          	lui	s11,0x1
    1130:	618dae83          	lw	t4,1560(s11) # 1618 <qrframe>
    1134:	013404b3          	add	s1,s0,s3
    1138:	560f0ae3          	beqz	t5,1eac <heap+0x874>
    113c:	00100f93          	li	t6,1
    1140:	00001537          	lui	a0,0x1
    1144:	00001337          	lui	t1,0x1
    1148:	01fe8023          	sb	t6,0(t4)
    114c:	1a050513          	addi	a0,a0,416 # 11a0 <g0log>
    1150:	0a030313          	addi	t1,t1,160 # 10a0 <g0exp>
    1154:	000e8613          	mv	a2,t4
    1158:	00000893          	li	a7,0
    115c:	0fe00e13          	li	t3,254
    1160:	01f600a3          	sb	t6,1(a2)
    1164:	06088463          	beqz	a7,11cc <g0log+0x2c>
    1168:	fff88793          	addi	a5,a7,-1
    116c:	0ff7f793          	zext.b	a5,a5
    1170:	fff60813          	addi	a6,a2,-1
    1174:	40f80833          	sub	a6,a6,a5
    1178:	00064703          	lbu	a4,0(a2)
    117c:	00060793          	mv	a5,a2
    1180:	0100006f          	j	1190 <g0exp+0xf0>
    1184:	00d78023          	sb	a3,0(a5)
    1188:	fff78793          	addi	a5,a5,-1
    118c:	05078063          	beq	a5,a6,11cc <g0log+0x2c>
    1190:	00070593          	mv	a1,a4
    1194:	fff7c703          	lbu	a4,-1(a5)
    1198:	00070693          	mv	a3,a4
    119c:	fe0584e3          	beqz	a1,1184 <g0exp+0xe4>
    11a0:	00b505b3          	add	a1,a0,a1
    11a4:	0005c683          	lbu	a3,0(a1)
    11a8:	011686b3          	add	a3,a3,a7
    11ac:	00de5463          	bge	t3,a3,11b4 <g0log+0x14>
    11b0:	f0168693          	addi	a3,a3,-255
    11b4:	00d306b3          	add	a3,t1,a3
    11b8:	0006c683          	lbu	a3,0(a3)
    11bc:	fff78793          	addi	a5,a5,-1
    11c0:	00d746b3          	xor	a3,a4,a3
    11c4:	00d780a3          	sb	a3,1(a5)
    11c8:	fd0794e3          	bne	a5,a6,1190 <g0exp+0xf0>
    11cc:	000ec783          	lbu	a5,0(t4)
    11d0:	00f507b3          	add	a5,a0,a5
    11d4:	0007c783          	lbu	a5,0(a5)
    11d8:	011787b3          	add	a5,a5,a7
    11dc:	00fe5463          	bge	t3,a5,11e4 <g0log+0x44>
    11e0:	f0178793          	addi	a5,a5,-255
    11e4:	00f307b3          	add	a5,t1,a5
    11e8:	0007c783          	lbu	a5,0(a5)
    11ec:	00188893          	addi	a7,a7,1
    11f0:	00160613          	addi	a2,a2,1
    11f4:	00fe8023          	sb	a5,0(t4)
    11f8:	f7e894e3          	bne	a7,t5,1160 <g0exp+0xc0>
    11fc:	00f507b3          	add	a5,a0,a5
    1200:	0007c703          	lbu	a4,0(a5)
    1204:	00100793          	li	a5,1
    1208:	00ee8023          	sb	a4,0(t4)
    120c:	00fe86b3          	add	a3,t4,a5
    1210:	0006c703          	lbu	a4,0(a3)
    1214:	00178793          	addi	a5,a5,1
    1218:	0ff7f793          	zext.b	a5,a5
    121c:	00e50733          	add	a4,a0,a4
    1220:	00074703          	lbu	a4,0(a4)
    1224:	00e68023          	sb	a4,0(a3)
    1228:	feff72e3          	bgeu	t5,a5,120c <g0log+0x6c>
    122c:	613ac783          	lbu	a5,1555(s5)
    1230:	00001737          	lui	a4,0x1
    1234:	61174a03          	lbu	s4,1553(a4) # 1611 <datablkw>
    1238:	04078663          	beqz	a5,1284 <g0log+0xe4>
    123c:	000017b7          	lui	a5,0x1
    1240:	6107c683          	lbu	a3,1552(a5) # 1610 <eccblkwid>
    1244:	00000913          	li	s2,0
    1248:	000a0593          	mv	a1,s4
    124c:	618da703          	lw	a4,1560(s11)
    1250:	00048613          	mv	a2,s1
    1254:	00040513          	mv	a0,s0
    1258:	998ff0ef          	jal	3f0 <appendrs>
    125c:	000017b7          	lui	a5,0x1
    1260:	6117c583          	lbu	a1,1553(a5) # 1611 <datablkw>
    1264:	000017b7          	lui	a5,0x1
    1268:	6107c683          	lbu	a3,1552(a5) # 1610 <eccblkwid>
    126c:	613ac783          	lbu	a5,1555(s5)
    1270:	00190913          	addi	s2,s2,1
    1274:	00b40433          	add	s0,s0,a1
    1278:	00d484b3          	add	s1,s1,a3
    127c:	fcf968e3          	bltu	s2,a5,124c <g0log+0xac>
    1280:	00058a13          	mv	s4,a1
    1284:	000017b7          	lui	a5,0x1
    1288:	6127c783          	lbu	a5,1554(a5) # 1612 <neccblk2>
    128c:	400788e3          	beqz	a5,1e9c <heap+0x864>
    1290:	000017b7          	lui	a5,0x1
    1294:	6107c683          	lbu	a3,1552(a5) # 1610 <eccblkwid>
    1298:	001a0593          	addi	a1,s4,1
    129c:	00000913          	li	s2,0
    12a0:	618da703          	lw	a4,1560(s11)
    12a4:	0ff5f593          	zext.b	a1,a1
    12a8:	00048613          	mv	a2,s1
    12ac:	00040513          	mv	a0,s0
    12b0:	940ff0ef          	jal	3f0 <appendrs>
    12b4:	000017b7          	lui	a5,0x1
    12b8:	6117ca03          	lbu	s4,1553(a5) # 1611 <datablkw>
    12bc:	000017b7          	lui	a5,0x1
    12c0:	6107c683          	lbu	a3,1552(a5) # 1610 <eccblkwid>
    12c4:	000017b7          	lui	a5,0x1
    12c8:	6127c783          	lbu	a5,1554(a5) # 1612 <neccblk2>
    12cc:	001a0593          	addi	a1,s4,1
    12d0:	00190913          	addi	s2,s2,1
    12d4:	00b40433          	add	s0,s0,a1
    12d8:	00d484b3          	add	s1,s1,a3
    12dc:	fcf962e3          	bltu	s2,a5,12a0 <eccblocks>
    12e0:	618da403          	lw	s0,1560(s11)
    12e4:	3a0a06e3          	beqz	s4,1e90 <heap+0x858>
    12e8:	613ac483          	lbu	s1,1555(s5)
    12ec:	00000913          	li	s2,0
    12f0:	00000b13          	li	s6,0
    12f4:	04048ee3          	beqz	s1,1b50 <heap+0x518>
    12f8:	000a0513          	mv	a0,s4
    12fc:	000b0593          	mv	a1,s6
    1300:	09c020ef          	jal	339c <__mulsi3>
    1304:	000017b7          	lui	a5,0x1
    1308:	61c7a783          	lw	a5,1564(a5) # 161c <strinbuf>
    130c:	00140413          	addi	s0,s0,1
    1310:	001b0b13          	addi	s6,s6,1
    1314:	012787b3          	add	a5,a5,s2
    1318:	00a787b3          	add	a5,a5,a0
    131c:	0007c783          	lbu	a5,0(a5)
    1320:	fef40fa3          	sb	a5,-1(s0)
    1324:	613ac483          	lbu	s1,1555(s5)
    1328:	000017b7          	lui	a5,0x1
    132c:	6117ca03          	lbu	s4,1553(a5) # 1611 <datablkw>
    1330:	fc9b64e3          	bltu	s6,s1,12f8 <eccblocks+0x58>
    1334:	000017b7          	lui	a5,0x1
    1338:	6127c783          	lbu	a5,1554(a5) # 1612 <neccblk2>
    133c:	06078063          	beqz	a5,139c <eccblocks+0xfc>
    1340:	00000b13          	li	s6,0
    1344:	000b0593          	mv	a1,s6
    1348:	001a0513          	addi	a0,s4,1
    134c:	050020ef          	jal	339c <__mulsi3>
    1350:	00050b93          	mv	s7,a0
    1354:	000a0593          	mv	a1,s4
    1358:	00048513          	mv	a0,s1
    135c:	040020ef          	jal	339c <__mulsi3>
    1360:	000017b7          	lui	a5,0x1
    1364:	61c7a783          	lw	a5,1564(a5) # 161c <strinbuf>
    1368:	00140413          	addi	s0,s0,1
    136c:	00001737          	lui	a4,0x1
    1370:	012787b3          	add	a5,a5,s2
    1374:	017787b3          	add	a5,a5,s7
    1378:	00a787b3          	add	a5,a5,a0
    137c:	0007c783          	lbu	a5,0(a5)
    1380:	001b0b13          	addi	s6,s6,1
    1384:	fef40fa3          	sb	a5,-1(s0)
    1388:	000017b7          	lui	a5,0x1
    138c:	6127c783          	lbu	a5,1554(a5) # 1612 <neccblk2>
    1390:	61174a03          	lbu	s4,1553(a4) # 1611 <datablkw>
    1394:	613ac483          	lbu	s1,1555(s5)
    1398:	fafb66e3          	bltu	s6,a5,1344 <eccblocks+0xa4>
    139c:	00190913          	addi	s2,s2,1
    13a0:	f54968e3          	bltu	s2,s4,12f0 <eccblocks+0x50>
    13a4:	000017b7          	lui	a5,0x1
    13a8:	6127c783          	lbu	a5,1554(a5) # 1612 <neccblk2>
    13ac:	06078063          	beqz	a5,140c <eccblocks+0x16c>
    13b0:	00000b13          	li	s6,0
    13b4:	000017b7          	lui	a5,0x1
    13b8:	6117ca03          	lbu	s4,1553(a5) # 1611 <datablkw>
    13bc:	000b0593          	mv	a1,s6
    13c0:	00140413          	addi	s0,s0,1
    13c4:	001a0513          	addi	a0,s4,1
    13c8:	7d5010ef          	jal	339c <__mulsi3>
    13cc:	00050b93          	mv	s7,a0
    13d0:	000a0593          	mv	a1,s4
    13d4:	00048513          	mv	a0,s1
    13d8:	7c5010ef          	jal	339c <__mulsi3>
    13dc:	000017b7          	lui	a5,0x1
    13e0:	61c7a783          	lw	a5,1564(a5) # 161c <strinbuf>
    13e4:	001b0b13          	addi	s6,s6,1
    13e8:	012787b3          	add	a5,a5,s2
    13ec:	017787b3          	add	a5,a5,s7
    13f0:	00a787b3          	add	a5,a5,a0
    13f4:	0007c783          	lbu	a5,0(a5)
    13f8:	fef40fa3          	sb	a5,-1(s0)
    13fc:	000017b7          	lui	a5,0x1
    1400:	6127c783          	lbu	a5,1554(a5) # 1612 <neccblk2>
    1404:	613ac483          	lbu	s1,1555(s5)
    1408:	fafb66e3          	bltu	s6,a5,13b4 <eccblocks+0x114>
    140c:	00f484b3          	add	s1,s1,a5
    1410:	000017b7          	lui	a5,0x1
    1414:	6107c503          	lbu	a0,1552(a5) # 1610 <eccblkwid>
    1418:	00000b13          	li	s6,0
    141c:	06050463          	beqz	a0,1484 <eccblocks+0x1e4>
    1420:	70048663          	beqz	s1,1b2c <heap+0x4f4>
    1424:	01698a33          	add	s4,s3,s6
    1428:	00000913          	li	s2,0
    142c:	00090593          	mv	a1,s2
    1430:	76d010ef          	jal	339c <__mulsi3>
    1434:	000017b7          	lui	a5,0x1
    1438:	61c7a783          	lw	a5,1564(a5) # 161c <strinbuf>
    143c:	00140413          	addi	s0,s0,1
    1440:	00001737          	lui	a4,0x1
    1444:	014787b3          	add	a5,a5,s4
    1448:	00a787b3          	add	a5,a5,a0
    144c:	0007c783          	lbu	a5,0(a5)
    1450:	00190913          	addi	s2,s2,1
    1454:	fef40fa3          	sb	a5,-1(s0)
    1458:	000017b7          	lui	a5,0x1
    145c:	613ac483          	lbu	s1,1555(s5)
    1460:	6127c783          	lbu	a5,1554(a5) # 1612 <neccblk2>
    1464:	61074503          	lbu	a0,1552(a4) # 1610 <eccblkwid>
    1468:	00f484b3          	add	s1,s1,a5
    146c:	fc9960e3          	bltu	s2,s1,142c <eccblocks+0x18c>
    1470:	001b0b13          	addi	s6,s6,1
    1474:	faab66e3          	bltu	s6,a0,1420 <eccblocks+0x180>
    1478:	00048593          	mv	a1,s1
    147c:	721010ef          	jal	339c <__mulsi3>
    1480:	00a989b3          	add	s3,s3,a0
    1484:	000017b7          	lui	a5,0x1
    1488:	61c7a503          	lw	a0,1564(a5) # 161c <strinbuf>
    148c:	618da583          	lw	a1,1560(s11)
    1490:	00098613          	mv	a2,s3
    1494:	00001cb7          	lui	s9,0x1
    1498:	c39fe0ef          	jal	d0 <memcpy>
    149c:	00001d37          	lui	s10,0x1
    14a0:	621cc583          	lbu	a1,1569(s9) # 1621 <WD>
    14a4:	620d4503          	lbu	a0,1568(s10) # 1620 <WDB>
    14a8:	6f5010ef          	jal	339c <__mulsi3>
    14ac:	000017b7          	lui	a5,0x1
    14b0:	62c7a583          	lw	a1,1580(a5) # 162c <framebase>
    14b4:	00050613          	mv	a2,a0
    14b8:	618da503          	lw	a0,1560(s11)
    14bc:	c15fe0ef          	jal	d0 <memcpy>
    14c0:	000017b7          	lui	a5,0x1
    14c4:	6127c483          	lbu	s1,1554(a5) # 1612 <neccblk2>
    14c8:	000017b7          	lui	a5,0x1
    14cc:	6107c503          	lbu	a0,1552(a5) # 1610 <eccblkwid>
    14d0:	000017b7          	lui	a5,0x1
    14d4:	6117c783          	lbu	a5,1553(a5) # 1611 <datablkw>
    14d8:	613ac583          	lbu	a1,1555(s5)
    14dc:	621cc403          	lbu	s0,1569(s9)
    14e0:	00f50533          	add	a0,a0,a5
    14e4:	009585b3          	add	a1,a1,s1
    14e8:	6b5010ef          	jal	339c <__mulsi3>
    14ec:	009507b3          	add	a5,a0,s1
    14f0:	18078ce3          	beqz	a5,1e88 <heap+0x850>
    14f4:	fff40713          	addi	a4,s0,-1
    14f8:	0ff77c13          	zext.b	s8,a4
    14fc:	00100413          	li	s0,1
    1500:	00040913          	mv	s2,s0
    1504:	00040b93          	mv	s7,s0
    1508:	00012623          	sw	zero,12(sp)
    150c:	000c0413          	mv	s0,s8
    1510:	00800713          	li	a4,8
    1514:	000017b7          	lui	a5,0x1
    1518:	61c7a783          	lw	a5,1564(a5) # 161c <strinbuf>
    151c:	00e12223          	sw	a4,4(sp)
    1520:	00c12703          	lw	a4,12(sp)
    1524:	00e787b3          	add	a5,a5,a4
    1528:	0007c783          	lbu	a5,0(a5)
    152c:	00f12023          	sw	a5,0(sp)
    1530:	00010783          	lb	a5,0(sp)
    1534:	0207dc63          	bgez	a5,156c <vpat+0x4c>
    1538:	620d4503          	lbu	a0,1568(s10)
    153c:	00040593          	mv	a1,s0
    1540:	65d010ef          	jal	339c <__mulsi3>
    1544:	618da603          	lw	a2,1560(s11)
    1548:	003c5793          	srli	a5,s8,0x3
    154c:	00f50533          	add	a0,a0,a5
    1550:	00a60633          	add	a2,a2,a0
    1554:	00064583          	lbu	a1,0(a2)
    1558:	007c7793          	andi	a5,s8,7
    155c:	08000713          	li	a4,128
    1560:	40f757b3          	sra	a5,a4,a5
    1564:	00b7e7b3          	or	a5,a5,a1
    1568:	00f60023          	sb	a5,0(a2)
    156c:	621cc783          	lbu	a5,1569(s9)
    1570:	00f12423          	sw	a5,8(sp)
    1574:	000017b7          	lui	a5,0x1
    1578:	6287a483          	lw	s1,1576(a5) # 1628 <framask>
    157c:	00812783          	lw	a5,8(sp)
    1580:	fff78b13          	addi	s6,a5,-1
    1584:	5c0b8e63          	beqz	s7,1b60 <heap+0x528>
    1588:	fffc0c13          	addi	s8,s8,-1
    158c:	0ffc7c13          	zext.b	s8,s8
    1590:	000c0a13          	mv	s4,s8
    1594:	00040993          	mv	s3,s0
    1598:	001bc713          	xori	a4,s7,1
    159c:	0ff77b93          	zext.b	s7,a4
    15a0:	5f847663          	bgeu	s0,s8,1b8c <heap+0x554>
    15a4:	000c0593          	mv	a1,s8
    15a8:	000c0513          	mv	a0,s8
    15ac:	5f1010ef          	jal	339c <__mulsi3>
    15b0:	014507b3          	add	a5,a0,s4
    15b4:	0017d793          	srli	a5,a5,0x1
    15b8:	013787b3          	add	a5,a5,s3
    15bc:	fff7c613          	not	a2,a5
    15c0:	00767613          	andi	a2,a2,7
    15c4:	0037d793          	srli	a5,a5,0x3
    15c8:	00f487b3          	add	a5,s1,a5
    15cc:	0007c783          	lbu	a5,0(a5)
    15d0:	40c7d7b3          	sra	a5,a5,a2
    15d4:	0017f793          	andi	a5,a5,1
    15d8:	fa0796e3          	bnez	a5,1584 <vpat+0x64>
    15dc:	00412783          	lw	a5,4(sp)
    15e0:	fff78a13          	addi	s4,a5,-1
    15e4:	0ffa7793          	zext.b	a5,s4
    15e8:	00f12223          	sw	a5,4(sp)
    15ec:	00012783          	lw	a5,0(sp)
    15f0:	00179993          	slli	s3,a5,0x1
    15f4:	0ff9f793          	zext.b	a5,s3
    15f8:	00f12023          	sw	a5,0(sp)
    15fc:	00412783          	lw	a5,4(sp)
    1600:	f20798e3          	bnez	a5,1530 <vpat+0x10>
    1604:	000017b7          	lui	a5,0x1
    1608:	6127c483          	lbu	s1,1554(a5) # 1612 <neccblk2>
    160c:	000017b7          	lui	a5,0x1
    1610:	6117c503          	lbu	a0,1553(a5) # 1611 <datablkw>
    1614:	000017b7          	lui	a5,0x1
    1618:	6107c783          	lbu	a5,1552(a5) # 1610 <eccblkwid>
    161c:	00c12703          	lw	a4,12(sp)
    1620:	613ac583          	lbu	a1,1555(s5)
    1624:	00f50533          	add	a0,a0,a5
    1628:	00170713          	addi	a4,a4,1
    162c:	009585b3          	add	a1,a1,s1
    1630:	00e12623          	sw	a4,12(sp)
    1634:	569010ef          	jal	339c <__mulsi3>
    1638:	00c12703          	lw	a4,12(sp)
    163c:	009507b3          	add	a5,a0,s1
    1640:	ecf748e3          	blt	a4,a5,1510 <eccblocks+0x270>
    1644:	00812583          	lw	a1,8(sp)
    1648:	620d4503          	lbu	a0,1568(s10)
    164c:	00007bb7          	lui	s7,0x7
    1650:	530b8b93          	addi	s7,s7,1328 # 7530 <__stack_bottom+0x530>
    1654:	549010ef          	jal	339c <__mulsi3>
    1658:	000017b7          	lui	a5,0x1
    165c:	00050613          	mv	a2,a0
    1660:	618da583          	lw	a1,1560(s11)
    1664:	61c7a503          	lw	a0,1564(a5) # 161c <strinbuf>
    1668:	00000b13          	li	s6,0
    166c:	00100993          	li	s3,1
    1670:	a61fe0ef          	jal	d0 <memcpy>
    1674:	00001437          	lui	s0,0x1
    1678:	00012623          	sw	zero,12(sp)
    167c:	ffe00a13          	li	s4,-2
    1680:	000b0513          	mv	a0,s6
    1684:	ee1fe0ef          	jal	564 <applymask>
    1688:	621cc583          	lbu	a1,1569(s9)
    168c:	22b9fc63          	bgeu	s3,a1,18c4 <heap+0x28c>
    1690:	620d4383          	lbu	t2,1568(s10)
    1694:	618dae03          	lw	t3,1560(s11)
    1698:	fff58513          	addi	a0,a1,-1
    169c:	0ff57493          	zext.b	s1,a0
    16a0:	00038313          	mv	t1,t2
    16a4:	00000e93          	li	t4,0
    16a8:	00000913          	li	s2,0
    16ac:	00000f93          	li	t6,0
    16b0:	00000713          	li	a4,0
    16b4:	01de0f33          	add	t5,t3,t4
    16b8:	006e02b3          	add	t0,t3,t1
    16bc:	0ff77793          	zext.b	a5,a4
    16c0:	0037d793          	srli	a5,a5,0x3
    16c4:	00fe07b3          	add	a5,t3,a5
    16c8:	fff74813          	not	a6,a4
    16cc:	40ea06b3          	sub	a3,s4,a4
    16d0:	00170713          	addi	a4,a4,1
    16d4:	01d78633          	add	a2,a5,t4
    16d8:	40375893          	srai	a7,a4,0x3
    16dc:	00064603          	lbu	a2,0(a2)
    16e0:	011f05b3          	add	a1,t5,a7
    16e4:	0005c583          	lbu	a1,0(a1)
    16e8:	00787813          	andi	a6,a6,7
    16ec:	41065633          	sra	a2,a2,a6
    16f0:	0076f693          	andi	a3,a3,7
    16f4:	40d5d5b3          	sra	a1,a1,a3
    16f8:	00167613          	andi	a2,a2,1
    16fc:	0015f593          	andi	a1,a1,1
    1700:	006787b3          	add	a5,a5,t1
    1704:	4a060863          	beqz	a2,1bb4 <heap+0x57c>
    1708:	02058663          	beqz	a1,1734 <heap+0xfc>
    170c:	0007c783          	lbu	a5,0(a5)
    1710:	011288b3          	add	a7,t0,a7
    1714:	4107d7b3          	sra	a5,a5,a6
    1718:	0017f793          	andi	a5,a5,1
    171c:	00078c63          	beqz	a5,1734 <heap+0xfc>
    1720:	0008c783          	lbu	a5,0(a7)
    1724:	40d7d7b3          	sra	a5,a5,a3
    1728:	0017f793          	andi	a5,a5,1
    172c:	00078463          	beqz	a5,1734 <heap+0xfc>
    1730:	00390913          	addi	s2,s2,3
    1734:	f8a714e3          	bne	a4,a0,16bc <heap+0x84>
    1738:	001f8f93          	addi	t6,t6,1
    173c:	0fffff93          	zext.b	t6,t6
    1740:	00730333          	add	t1,t1,t2
    1744:	007e8eb3          	add	t4,t4,t2
    1748:	f69f94e3          	bne	t6,s1,16b0 <heap+0x78>
    174c:	01212023          	sw	s2,0(sp)
    1750:	00000913          	li	s2,0
    1754:	00000493          	li	s1,0
    1758:	01712223          	sw	s7,4(sp)
    175c:	01612423          	sw	s6,8(sp)
    1760:	62442783          	lw	a5,1572(s0) # 1624 <rlens>
    1764:	00078023          	sb	zero,0(a5)
    1768:	621ccb03          	lbu	s6,1569(s9)
    176c:	500b0e63          	beqz	s6,1c88 <heap+0x650>
    1770:	00000a93          	li	s5,0
    1774:	00000b93          	li	s7,0
    1778:	00000793          	li	a5,0
    177c:	00000c13          	li	s8,0
    1780:	02c0006f          	j	17ac <heap+0x174>
    1784:	0ff5fb93          	zext.b	s7,a1
    1788:	01770733          	add	a4,a4,s7
    178c:	01370023          	sb	s3,0(a4)
    1790:	621ccb03          	lbu	s6,1569(s9)
    1794:	001a8a93          	addi	s5,s5,1
    1798:	fff78713          	addi	a4,a5,-1
    179c:	00176713          	ori	a4,a4,1
    17a0:	0ffafc13          	zext.b	s8,s5
    17a4:	00e484b3          	add	s1,s1,a4
    17a8:	076c7863          	bgeu	s8,s6,1818 <heap+0x1e0>
    17ac:	620d4503          	lbu	a0,1568(s10)
    17b0:	00090593          	mv	a1,s2
    17b4:	00078b13          	mv	s6,a5
    17b8:	3e5010ef          	jal	339c <__mulsi3>
    17bc:	618da783          	lw	a5,1560(s11)
    17c0:	003c5c13          	srli	s8,s8,0x3
    17c4:	fffac713          	not	a4,s5
    17c8:	00a787b3          	add	a5,a5,a0
    17cc:	018787b3          	add	a5,a5,s8
    17d0:	0007c783          	lbu	a5,0(a5)
    17d4:	00777713          	andi	a4,a4,7
    17d8:	001b8593          	addi	a1,s7,1
    17dc:	40e7d7b3          	sra	a5,a5,a4
    17e0:	0017f793          	andi	a5,a5,1
    17e4:	62442703          	lw	a4,1572(s0)
    17e8:	f9679ee3          	bne	a5,s6,1784 <heap+0x14c>
    17ec:	01770733          	add	a4,a4,s7
    17f0:	00074583          	lbu	a1,0(a4)
    17f4:	001a8a93          	addi	s5,s5,1
    17f8:	0ffafc13          	zext.b	s8,s5
    17fc:	00158593          	addi	a1,a1,1
    1800:	00b70023          	sb	a1,0(a4)
    1804:	621ccb03          	lbu	s6,1569(s9)
    1808:	fff78713          	addi	a4,a5,-1
    180c:	00176713          	ori	a4,a4,1
    1810:	00e484b3          	add	s1,s1,a4
    1814:	f96c6ce3          	bltu	s8,s6,17ac <heap+0x174>
    1818:	000b8513          	mv	a0,s7
    181c:	b01fe0ef          	jal	31c <badruns>
    1820:	00012703          	lw	a4,0(sp)
    1824:	00190913          	addi	s2,s2,1
    1828:	0ff97793          	zext.b	a5,s2
    182c:	00a70733          	add	a4,a4,a0
    1830:	00e12023          	sw	a4,0(sp)
    1834:	f367e6e3          	bltu	a5,s6,1760 <heap+0x128>
    1838:	41f4d693          	srai	a3,s1,0x1f
    183c:	0096c7b3          	xor	a5,a3,s1
    1840:	40d787b3          	sub	a5,a5,a3
    1844:	000b0593          	mv	a1,s6
    1848:	00279493          	slli	s1,a5,0x2
    184c:	00f484b3          	add	s1,s1,a5
    1850:	00058513          	mv	a0,a1
    1854:	00412b83          	lw	s7,4(sp)
    1858:	00149493          	slli	s1,s1,0x1
    185c:	00b12223          	sw	a1,4(sp)
    1860:	33d010ef          	jal	339c <__mulsi3>
    1864:	00812b03          	lw	s6,8(sp)
    1868:	00412583          	lw	a1,4(sp)
    186c:	00050693          	mv	a3,a0
    1870:	44956e63          	bltu	a0,s1,1ccc <heap+0x694>
    1874:	48059063          	bnez	a1,1cf4 <heap+0x6bc>
    1878:	00012783          	lw	a5,0(sp)
    187c:	0577fc63          	bgeu	a5,s7,18d4 <heap+0x29c>
    1880:	00700793          	li	a5,7
    1884:	5efb0e63          	beq	s6,a5,1e80 <heap+0x848>
    1888:	620d4503          	lbu	a0,1568(s10)
    188c:	311010ef          	jal	339c <__mulsi3>
    1890:	000017b7          	lui	a5,0x1
    1894:	61c7a583          	lw	a1,1564(a5) # 161c <strinbuf>
    1898:	00050613          	mv	a2,a0
    189c:	618da503          	lw	a0,1560(s11)
    18a0:	831fe0ef          	jal	d0 <memcpy>
    18a4:	001b0793          	addi	a5,s6,1
    18a8:	01612623          	sw	s6,12(sp)
    18ac:	0ff7fb13          	zext.b	s6,a5
    18b0:	000b0513          	mv	a0,s6
    18b4:	00012b83          	lw	s7,0(sp)
    18b8:	cadfe0ef          	jal	564 <applymask>
    18bc:	621cc583          	lbu	a1,1569(s9)
    18c0:	dcb9e8e3          	bltu	s3,a1,1690 <heap+0x58>
    18c4:	00012023          	sw	zero,0(sp)
    18c8:	e80594e3          	bnez	a1,1750 <heap+0x118>
    18cc:	00012783          	lw	a5,0(sp)
    18d0:	fb77e8e3          	bltu	a5,s7,1880 <heap+0x248>
    18d4:	620d4503          	lbu	a0,1568(s10)
    18d8:	001b0b13          	addi	s6,s6,1
    18dc:	0ffb7b13          	zext.b	s6,s6
    18e0:	2bd010ef          	jal	339c <__mulsi3>
    18e4:	000017b7          	lui	a5,0x1
    18e8:	61c7a583          	lw	a1,1564(a5) # 161c <strinbuf>
    18ec:	00050613          	mv	a2,a0
    18f0:	618da503          	lw	a0,1560(s11)
    18f4:	fdcfe0ef          	jal	d0 <memcpy>
    18f8:	00800793          	li	a5,8
    18fc:	d8fb12e3          	bne	s6,a5,1680 <heap+0x48>
    1900:	00c12c03          	lw	s8,12(sp)
    1904:	016c0663          	beq	s8,s6,1910 <heap+0x2d8>
    1908:	000c0513          	mv	a0,s8
    190c:	c59fe0ef          	jal	564 <applymask>
    1910:	000017b7          	lui	a5,0x1
    1914:	6147c783          	lbu	a5,1556(a5) # 1614 <ECCLEVEL>
    1918:	00001737          	lui	a4,0x1
    191c:	02070713          	addi	a4,a4,32 # 1020 <fmtword>
    1920:	fff78793          	addi	a5,a5,-1
    1924:	0ff7f793          	zext.b	a5,a5
    1928:	00379793          	slli	a5,a5,0x3
    192c:	018787b3          	add	a5,a5,s8
    1930:	00279793          	slli	a5,a5,0x2
    1934:	00f70733          	add	a4,a4,a5
    1938:	00072983          	lw	s3,0(a4)
    193c:	00000593          	li	a1,0
    1940:	00800413          	li	s0,8
    1944:	08000913          	li	s2,128
    1948:	00500493          	li	s1,5
    194c:	0019f793          	andi	a5,s3,1
    1950:	00158a13          	addi	s4,a1,1
    1954:	06078863          	beqz	a5,19c4 <heap+0x38c>
    1958:	621cc783          	lbu	a5,1569(s9)
    195c:	620d4703          	lbu	a4,1568(s10)
    1960:	618da683          	lw	a3,1560(s11)
    1964:	fff78793          	addi	a5,a5,-1
    1968:	40b787b3          	sub	a5,a5,a1
    196c:	4037d613          	srai	a2,a5,0x3
    1970:	00371713          	slli	a4,a4,0x3
    1974:	00c70733          	add	a4,a4,a2
    1978:	00e68733          	add	a4,a3,a4
    197c:	00074683          	lbu	a3,0(a4)
    1980:	0077f793          	andi	a5,a5,7
    1984:	40f957b3          	sra	a5,s2,a5
    1988:	00d7e7b3          	or	a5,a5,a3
    198c:	00f70023          	sb	a5,0(a4)
    1990:	48b4e863          	bltu	s1,a1,1e20 <heap+0x7e8>
    1994:	620d4503          	lbu	a0,1568(s10)
    1998:	0019d993          	srli	s3,s3,0x1
    199c:	201010ef          	jal	339c <__mulsi3>
    19a0:	618da783          	lw	a5,1560(s11)
    19a4:	000a0593          	mv	a1,s4
    19a8:	00158a13          	addi	s4,a1,1
    19ac:	00a787b3          	add	a5,a5,a0
    19b0:	0017c703          	lbu	a4,1(a5)
    19b4:	f8076713          	ori	a4,a4,-128
    19b8:	00e780a3          	sb	a4,1(a5)
    19bc:	0019f793          	andi	a5,s3,1
    19c0:	f8079ce3          	bnez	a5,1958 <heap+0x320>
    19c4:	0019d993          	srli	s3,s3,0x1
    19c8:	000a0593          	mv	a1,s4
    19cc:	f88a10e3          	bne	s4,s0,194c <heap+0x314>
    19d0:	00000413          	li	s0,0
    19d4:	00700a93          	li	s5,7
    19d8:	00600a13          	li	s4,6
    19dc:	08000913          	li	s2,128
    19e0:	0019f493          	andi	s1,s3,1
    19e4:	04048a63          	beqz	s1,1a38 <heap+0x400>
    19e8:	621cc503          	lbu	a0,1569(s9)
    19ec:	620d4583          	lbu	a1,1568(s10)
    19f0:	ff950513          	addi	a0,a0,-7
    19f4:	00850533          	add	a0,a0,s0
    19f8:	1a5010ef          	jal	339c <__mulsi3>
    19fc:	618da783          	lw	a5,1560(s11)
    1a00:	408a06b3          	sub	a3,s4,s0
    1a04:	40d956b3          	sra	a3,s2,a3
    1a08:	00a787b3          	add	a5,a5,a0
    1a0c:	0017c703          	lbu	a4,1(a5)
    1a10:	f8076713          	ori	a4,a4,-128
    1a14:	00e780a3          	sb	a4,1(a5)
    1a18:	620d4703          	lbu	a4,1568(s10)
    1a1c:	618da783          	lw	a5,1560(s11)
    1a20:	00371713          	slli	a4,a4,0x3
    1a24:	00e787b3          	add	a5,a5,a4
    1a28:	0007c703          	lbu	a4,0(a5)
    1a2c:	3e040063          	beqz	s0,1e0c <heap+0x7d4>
    1a30:	00d76733          	or	a4,a4,a3
    1a34:	00e78023          	sb	a4,0(a5)
    1a38:	00140413          	addi	s0,s0,1
    1a3c:	41540463          	beq	s0,s5,1e44 <heap+0x80c>
    1a40:	0019d993          	srli	s3,s3,0x1
    1a44:	0019f493          	andi	s1,s3,1
    1a48:	fe0488e3          	beqz	s1,1a38 <heap+0x400>
    1a4c:	f9dff06f          	j	19e8 <heap+0x3b0>
    1a50:	00900793          	li	a5,9
    1a54:	e0e7ee63          	bltu	a5,a4,1070 <fmtword+0x50>
    1a58:	000017b7          	lui	a5,0x1
    1a5c:	61c7a703          	lw	a4,1564(a5) # 161c <strinbuf>
    1a60:	fff00513          	li	a0,-1
    1a64:	fff40793          	addi	a5,s0,-1
    1a68:	00870733          	add	a4,a4,s0
    1a6c:	000700a3          	sb	zero,1(a4)
    1a70:	04040263          	beqz	s0,1ab4 <heap+0x47c>
    1a74:	00001837          	lui	a6,0x1
    1a78:	61c82703          	lw	a4,1564(a6) # 161c <strinbuf>
    1a7c:	00f706b3          	add	a3,a4,a5
    1a80:	0006c683          	lbu	a3,0(a3)
    1a84:	00f70733          	add	a4,a4,a5
    1a88:	00274583          	lbu	a1,2(a4)
    1a8c:	00469693          	slli	a3,a3,0x4
    1a90:	00b6e6b3          	or	a3,a3,a1
    1a94:	00d70123          	sb	a3,2(a4)
    1a98:	61c82703          	lw	a4,1564(a6)
    1a9c:	00f70733          	add	a4,a4,a5
    1aa0:	00074683          	lbu	a3,0(a4)
    1aa4:	fff78793          	addi	a5,a5,-1
    1aa8:	0046d693          	srli	a3,a3,0x4
    1aac:	00d700a3          	sb	a3,1(a4)
    1ab0:	fca792e3          	bne	a5,a0,1a74 <heap+0x43c>
    1ab4:	00001537          	lui	a0,0x1
    1ab8:	61c52583          	lw	a1,1564(a0) # 161c <strinbuf>
    1abc:	00441693          	slli	a3,s0,0x4
    1ac0:	00445793          	srli	a5,s0,0x4
    1ac4:	0015c703          	lbu	a4,1(a1)
    1ac8:	0407e793          	ori	a5,a5,64
    1acc:	00d76733          	or	a4,a4,a3
    1ad0:	00e580a3          	sb	a4,1(a1)
    1ad4:	61c52703          	lw	a4,1564(a0)
    1ad8:	fec00593          	li	a1,-20
    1adc:	00f70023          	sb	a5,0(a4)
    1ae0:	62264783          	lbu	a5,1570(a2)
    1ae4:	01100613          	li	a2,17
    1ae8:	00a7b793          	sltiu	a5,a5,10
    1aec:	40f407b3          	sub	a5,s0,a5
    1af0:	00378793          	addi	a5,a5,3
    1af4:	e337f463          	bgeu	a5,s3,111c <g0exp+0x7c>
    1af8:	00001537          	lui	a0,0x1
    1afc:	61c52703          	lw	a4,1564(a0) # 161c <strinbuf>
    1b00:	00078693          	mv	a3,a5
    1b04:	00f70733          	add	a4,a4,a5
    1b08:	00b70023          	sb	a1,0(a4)
    1b0c:	61c52703          	lw	a4,1564(a0)
    1b10:	00278793          	addi	a5,a5,2
    1b14:	00d70733          	add	a4,a4,a3
    1b18:	00c700a3          	sb	a2,1(a4)
    1b1c:	fd37eee3          	bltu	a5,s3,1af8 <heap+0x4c0>
    1b20:	dfcff06f          	j	111c <g0exp+0x7c>
    1b24:	00078413          	mv	s0,a5
    1b28:	f31ff06f          	j	1a58 <heap+0x420>
    1b2c:	001b0793          	addi	a5,s6,1
    1b30:	002b0b13          	addi	s6,s6,2
    1b34:	94a7f2e3          	bgeu	a5,a0,1478 <eccblocks+0x1d8>
    1b38:	feab6ae3          	bltu	s6,a0,1b2c <heap+0x4f4>
    1b3c:	93dff06f          	j	1478 <eccblocks+0x1d8>
    1b40:	00190793          	addi	a5,s2,1
    1b44:	00290913          	addi	s2,s2,2
    1b48:	3747f663          	bgeu	a5,s4,1eb4 <heap+0x87c>
    1b4c:	37497663          	bgeu	s2,s4,1eb8 <heap+0x880>
    1b50:	000017b7          	lui	a5,0x1
    1b54:	6127c783          	lbu	a5,1554(a5) # 1612 <neccblk2>
    1b58:	fe079463          	bnez	a5,1340 <eccblocks+0xa0>
    1b5c:	fe5ff06f          	j	1b40 <heap+0x508>
    1b60:	001c0613          	addi	a2,s8,1
    1b64:	08090263          	beqz	s2,1be8 <heap+0x5b0>
    1b68:	08040e63          	beqz	s0,1c04 <heap+0x5cc>
    1b6c:	fff40693          	addi	a3,s0,-1
    1b70:	0ff67a13          	zext.b	s4,a2
    1b74:	0ff6f413          	zext.b	s0,a3
    1b78:	001bc713          	xori	a4,s7,1
    1b7c:	000a0c13          	mv	s8,s4
    1b80:	00040993          	mv	s3,s0
    1b84:	0ff77b93          	zext.b	s7,a4
    1b88:	a1846ee3          	bltu	s0,s8,15a4 <vpat+0x84>
    1b8c:	00040593          	mv	a1,s0
    1b90:	00040513          	mv	a0,s0
    1b94:	009010ef          	jal	339c <__mulsi3>
    1b98:	013507b3          	add	a5,a0,s3
    1b9c:	0017d793          	srli	a5,a5,0x1
    1ba0:	014787b3          	add	a5,a5,s4
    1ba4:	fff7c613          	not	a2,a5
    1ba8:	00767613          	andi	a2,a2,7
    1bac:	0037d793          	srli	a5,a5,0x3
    1bb0:	a19ff06f          	j	15c8 <adelta+0x20>
    1bb4:	b80590e3          	bnez	a1,1734 <heap+0xfc>
    1bb8:	0007c783          	lbu	a5,0(a5)
    1bbc:	006e0633          	add	a2,t3,t1
    1bc0:	01160633          	add	a2,a2,a7
    1bc4:	4107d7b3          	sra	a5,a5,a6
    1bc8:	0017f793          	andi	a5,a5,1
    1bcc:	b60794e3          	bnez	a5,1734 <heap+0xfc>
    1bd0:	00064783          	lbu	a5,0(a2)
    1bd4:	40d7d7b3          	sra	a5,a5,a3
    1bd8:	0017f793          	andi	a5,a5,1
    1bdc:	b4079ce3          	bnez	a5,1734 <heap+0xfc>
    1be0:	00390913          	addi	s2,s2,3
    1be4:	b51ff06f          	j	1734 <heap+0xfc>
    1be8:	03640e63          	beq	s0,s6,1c24 <heap+0x5ec>
    1bec:	00140693          	addi	a3,s0,1
    1bf0:	0ff6f413          	zext.b	s0,a3
    1bf4:	0ff67a13          	zext.b	s4,a2
    1bf8:	00040993          	mv	s3,s0
    1bfc:	000a0c13          	mv	s8,s4
    1c00:	999ff06f          	j	1598 <vpat+0x78>
    1c04:	fffc0c13          	addi	s8,s8,-1
    1c08:	0ffc7c13          	zext.b	s8,s8
    1c0c:	00600793          	li	a5,6
    1c10:	02fc0a63          	beq	s8,a5,1c44 <heap+0x60c>
    1c14:	000c0a13          	mv	s4,s8
    1c18:	00000913          	li	s2,0
    1c1c:	00000993          	li	s3,0
    1c20:	979ff06f          	j	1598 <vpat+0x78>
    1c24:	fffc0c13          	addi	s8,s8,-1
    1c28:	0ffc7c13          	zext.b	s8,s8
    1c2c:	00600793          	li	a5,6
    1c30:	02fc0e63          	beq	s8,a5,1c6c <heap+0x634>
    1c34:	000c0a13          	mv	s4,s8
    1c38:	00040993          	mv	s3,s0
    1c3c:	00100913          	li	s2,1
    1c40:	959ff06f          	j	1598 <vpat+0x78>
    1c44:	0064c783          	lbu	a5,6(s1)
    1c48:	4057d793          	srai	a5,a5,0x5
    1c4c:	0017f793          	andi	a5,a5,1
    1c50:	1a078463          	beqz	a5,1df8 <heap+0x7c0>
    1c54:	00900993          	li	s3,9
    1c58:	00400a13          	li	s4,4
    1c5c:	00098413          	mv	s0,s3
    1c60:	000a0c13          	mv	s8,s4
    1c64:	00000913          	li	s2,0
    1c68:	f25ff06f          	j	1b8c <heap+0x554>
    1c6c:	ff840693          	addi	a3,s0,-8
    1c70:	0ff6f413          	zext.b	s0,a3
    1c74:	00500a13          	li	s4,5
    1c78:	00040993          	mv	s3,s0
    1c7c:	000a0c13          	mv	s8,s4
    1c80:	00100913          	li	s2,1
    1c84:	915ff06f          	j	1598 <vpat+0x78>
    1c88:	00000513          	li	a0,0
    1c8c:	00412b83          	lw	s7,4(sp)
    1c90:	01612223          	sw	s6,4(sp)
    1c94:	e88fe0ef          	jal	31c <badruns>
    1c98:	41f4d693          	srai	a3,s1,0x1f
    1c9c:	0096c7b3          	xor	a5,a3,s1
    1ca0:	40d787b3          	sub	a5,a5,a3
    1ca4:	00279493          	slli	s1,a5,0x2
    1ca8:	00f484b3          	add	s1,s1,a5
    1cac:	00012783          	lw	a5,0(sp)
    1cb0:	00149493          	slli	s1,s1,0x1
    1cb4:	00812b03          	lw	s6,8(sp)
    1cb8:	00a787b3          	add	a5,a5,a0
    1cbc:	00f12023          	sw	a5,0(sp)
    1cc0:	00412583          	lw	a1,4(sp)
    1cc4:	00000693          	li	a3,0
    1cc8:	ba0488e3          	beqz	s1,1878 <heap+0x240>
    1ccc:	00000793          	li	a5,0
    1cd0:	40d484b3          	sub	s1,s1,a3
    1cd4:	00178793          	addi	a5,a5,1
    1cd8:	fe96ece3          	bltu	a3,s1,1cd0 <heap+0x698>
    1cdc:	00279713          	slli	a4,a5,0x2
    1ce0:	00f707b3          	add	a5,a4,a5
    1ce4:	00012703          	lw	a4,0(sp)
    1ce8:	00179793          	slli	a5,a5,0x1
    1cec:	00f707b3          	add	a5,a4,a5
    1cf0:	00f12023          	sw	a5,0(sp)
    1cf4:	00000c13          	li	s8,0
    1cf8:	01712223          	sw	s7,4(sp)
    1cfc:	01612423          	sw	s6,8(sp)
    1d00:	62442783          	lw	a5,1572(s0)
    1d04:	00078023          	sb	zero,0(a5)
    1d08:	621ccb03          	lbu	s6,1569(s9)
    1d0c:	0c0b0263          	beqz	s6,1dd0 <heap+0x798>
    1d10:	0ffc7913          	zext.b	s2,s8
    1d14:	fffc4493          	not	s1,s8
    1d18:	00395913          	srli	s2,s2,0x3
    1d1c:	0074f493          	andi	s1,s1,7
    1d20:	00000a93          	li	s5,0
    1d24:	00000b93          	li	s7,0
    1d28:	00000793          	li	a5,0
    1d2c:	0200006f          	j	1d4c <heap+0x714>
    1d30:	0ff87b93          	zext.b	s7,a6
    1d34:	01770733          	add	a4,a4,s7
    1d38:	01370023          	sb	s3,0(a4)
    1d3c:	621ccb03          	lbu	s6,1569(s9)
    1d40:	001a8a93          	addi	s5,s5,1
    1d44:	0ffaf613          	zext.b	a2,s5
    1d48:	05667c63          	bgeu	a2,s6,1da0 <heap+0x768>
    1d4c:	620d4503          	lbu	a0,1568(s10)
    1d50:	000a8593          	mv	a1,s5
    1d54:	00078b13          	mv	s6,a5
    1d58:	644010ef          	jal	339c <__mulsi3>
    1d5c:	618da783          	lw	a5,1560(s11)
    1d60:	62442703          	lw	a4,1572(s0)
    1d64:	001b8813          	addi	a6,s7,1
    1d68:	012787b3          	add	a5,a5,s2
    1d6c:	00a787b3          	add	a5,a5,a0
    1d70:	0007c783          	lbu	a5,0(a5)
    1d74:	4097d7b3          	sra	a5,a5,s1
    1d78:	0017f793          	andi	a5,a5,1
    1d7c:	fb679ae3          	bne	a5,s6,1d30 <heap+0x6f8>
    1d80:	01770733          	add	a4,a4,s7
    1d84:	00074603          	lbu	a2,0(a4)
    1d88:	001a8a93          	addi	s5,s5,1
    1d8c:	00160613          	addi	a2,a2,1
    1d90:	00c70023          	sb	a2,0(a4)
    1d94:	621ccb03          	lbu	s6,1569(s9)
    1d98:	0ffaf613          	zext.b	a2,s5
    1d9c:	fb6668e3          	bltu	a2,s6,1d4c <heap+0x714>
    1da0:	000b8513          	mv	a0,s7
    1da4:	d78fe0ef          	jal	31c <badruns>
    1da8:	00012703          	lw	a4,0(sp)
    1dac:	001c0c13          	addi	s8,s8,1
    1db0:	0ffc7793          	zext.b	a5,s8
    1db4:	00a70733          	add	a4,a4,a0
    1db8:	00e12023          	sw	a4,0(sp)
    1dbc:	f567e2e3          	bltu	a5,s6,1d00 <heap+0x6c8>
    1dc0:	000b0593          	mv	a1,s6
    1dc4:	00412b83          	lw	s7,4(sp)
    1dc8:	00812b03          	lw	s6,8(sp)
    1dcc:	aadff06f          	j	1878 <heap+0x240>
    1dd0:	00000513          	li	a0,0
    1dd4:	00412b83          	lw	s7,4(sp)
    1dd8:	01612223          	sw	s6,4(sp)
    1ddc:	d40fe0ef          	jal	31c <badruns>
    1de0:	00012783          	lw	a5,0(sp)
    1de4:	00812b03          	lw	s6,8(sp)
    1de8:	00412583          	lw	a1,4(sp)
    1dec:	00a787b3          	add	a5,a5,a0
    1df0:	00f12023          	sw	a5,0(sp)
    1df4:	a85ff06f          	j	1878 <heap+0x240>
    1df8:	00090b93          	mv	s7,s2
    1dfc:	00500c13          	li	s8,5
    1e00:	00000913          	li	s2,0
    1e04:	00900413          	li	s0,9
    1e08:	fd4ff06f          	j	15dc <adelta+0x34>
    1e0c:	00176713          	ori	a4,a4,1
    1e10:	0019d993          	srli	s3,s3,0x1
    1e14:	00e78023          	sb	a4,0(a5)
    1e18:	00048413          	mv	s0,s1
    1e1c:	bc5ff06f          	j	19e0 <heap+0x3a8>
    1e20:	620d4583          	lbu	a1,1568(s10)
    1e24:	000a0513          	mv	a0,s4
    1e28:	574010ef          	jal	339c <__mulsi3>
    1e2c:	618da783          	lw	a5,1560(s11)
    1e30:	00a787b3          	add	a5,a5,a0
    1e34:	0017c703          	lbu	a4,1(a5)
    1e38:	f8076713          	ori	a4,a4,-128
    1e3c:	00e780a3          	sb	a4,1(a5)
    1e40:	b85ff06f          	j	19c4 <heap+0x38c>
    1e44:	04c12083          	lw	ra,76(sp)
    1e48:	04812403          	lw	s0,72(sp)
    1e4c:	04412483          	lw	s1,68(sp)
    1e50:	04012903          	lw	s2,64(sp)
    1e54:	03c12983          	lw	s3,60(sp)
    1e58:	03812a03          	lw	s4,56(sp)
    1e5c:	03412a83          	lw	s5,52(sp)
    1e60:	03012b03          	lw	s6,48(sp)
    1e64:	02c12b83          	lw	s7,44(sp)
    1e68:	02812c03          	lw	s8,40(sp)
    1e6c:	02412c83          	lw	s9,36(sp)
    1e70:	02012d03          	lw	s10,32(sp)
    1e74:	01c12d83          	lw	s11,28(sp)
    1e78:	05010113          	addi	sp,sp,80
    1e7c:	00008067          	ret
    1e80:	000b0c13          	mv	s8,s6
    1e84:	a8dff06f          	j	1910 <heap+0x2d8>
    1e88:	00040593          	mv	a1,s0
    1e8c:	fbcff06f          	j	1648 <heap+0x10>
    1e90:	613ac483          	lbu	s1,1555(s5)
    1e94:	00000913          	li	s2,0
    1e98:	d14ff06f          	j	13ac <eccblocks+0x10c>
    1e9c:	618da403          	lw	s0,1560(s11)
    1ea0:	c40a1463          	bnez	s4,12e8 <eccblocks+0x48>
    1ea4:	613ac483          	lbu	s1,1555(s5)
    1ea8:	d64ff06f          	j	140c <eccblocks+0x16c>
    1eac:	000e8023          	sb	zero,0(t4)
    1eb0:	b7cff06f          	j	122c <g0log+0x8c>
    1eb4:	00078913          	mv	s2,a5
    1eb8:	00000493          	li	s1,0
    1ebc:	ce8ff06f          	j	13a4 <eccblocks+0x104>

00001ec0 <putalign>:
    1ec0:	fb010113          	addi	sp,sp,-80
    1ec4:	05212023          	sw	s2,64(sp)
    1ec8:	00001937          	lui	s2,0x1
    1ecc:	04812423          	sw	s0,72(sp)
    1ed0:	00050413          	mv	s0,a0
    1ed4:	62094503          	lbu	a0,1568(s2) # 1620 <WDB>
    1ed8:	04912223          	sw	s1,68(sp)
    1edc:	03312e23          	sw	s3,60(sp)
    1ee0:	03412c23          	sw	s4,56(sp)
    1ee4:	00058993          	mv	s3,a1
    1ee8:	03512a23          	sw	s5,52(sp)
    1eec:	03612823          	sw	s6,48(sp)
    1ef0:	03712623          	sw	s7,44(sp)
    1ef4:	03812423          	sw	s8,40(sp)
    1ef8:	03912223          	sw	s9,36(sp)
    1efc:	03a12023          	sw	s10,32(sp)
    1f00:	01b12e23          	sw	s11,28(sp)
    1f04:	04112623          	sw	ra,76(sp)
    1f08:	00b12623          	sw	a1,12(sp)
    1f0c:	00001d37          	lui	s10,0x1
    1f10:	48c010ef          	jal	339c <__mulsi3>
    1f14:	62cd2703          	lw	a4,1580(s10) # 162c <framebase>
    1f18:	40345793          	srai	a5,s0,0x3
    1f1c:	00f50533          	add	a0,a0,a5
    1f20:	00a70733          	add	a4,a4,a0
    1f24:	00074683          	lbu	a3,0(a4)
    1f28:	08000a13          	li	s4,128
    1f2c:	00747793          	andi	a5,s0,7
    1f30:	40fa57b3          	sra	a5,s4,a5
    1f34:	00d7e7b3          	or	a5,a5,a3
    1f38:	00f70023          	sb	a5,0(a4)
    1f3c:	ffe40713          	addi	a4,s0,-2
    1f40:	00777793          	andi	a5,a4,7
    1f44:	00240a93          	addi	s5,s0,2
    1f48:	40fa5db3          	sra	s11,s4,a5
    1f4c:	00078c13          	mv	s8,a5
    1f50:	ffe98793          	addi	a5,s3,-2
    1f54:	40375b93          	srai	s7,a4,0x3
    1f58:	007afb13          	andi	s6,s5,7
    1f5c:	00070c93          	mv	s9,a4
    1f60:	00f12223          	sw	a5,4(sp)
    1f64:	403ad713          	srai	a4,s5,0x3
    1f68:	00298793          	addi	a5,s3,2
    1f6c:	000b8493          	mv	s1,s7
    1f70:	416a5b33          	sra	s6,s4,s6
    1f74:	00e12023          	sw	a4,0(sp)
    1f78:	00f12423          	sw	a5,8(sp)
    1f7c:	fff98993          	addi	s3,s3,-1
    1f80:	62094503          	lbu	a0,1568(s2)
    1f84:	00412583          	lw	a1,4(sp)
    1f88:	001c8c93          	addi	s9,s9,1
    1f8c:	410010ef          	jal	339c <__mulsi3>
    1f90:	62cd2683          	lw	a3,1580(s10)
    1f94:	00950533          	add	a0,a0,s1
    1f98:	418a57b3          	sra	a5,s4,s8
    1f9c:	00a686b3          	add	a3,a3,a0
    1fa0:	0006c503          	lbu	a0,0(a3)
    1fa4:	00098593          	mv	a1,s3
    1fa8:	403cd493          	srai	s1,s9,0x3
    1fac:	00a7e7b3          	or	a5,a5,a0
    1fb0:	00f68023          	sb	a5,0(a3)
    1fb4:	62094503          	lbu	a0,1568(s2)
    1fb8:	007cfc13          	andi	s8,s9,7
    1fbc:	3e0010ef          	jal	339c <__mulsi3>
    1fc0:	62cd2783          	lw	a5,1580(s10)
    1fc4:	017506b3          	add	a3,a0,s7
    1fc8:	fff98513          	addi	a0,s3,-1
    1fcc:	00d787b3          	add	a5,a5,a3
    1fd0:	0007c683          	lbu	a3,0(a5)
    1fd4:	00198993          	addi	s3,s3,1
    1fd8:	00dde6b3          	or	a3,s11,a3
    1fdc:	00d78023          	sb	a3,0(a5)
    1fe0:	62094583          	lbu	a1,1568(s2)
    1fe4:	3b8010ef          	jal	339c <__mulsi3>
    1fe8:	00012703          	lw	a4,0(sp)
    1fec:	62cd2783          	lw	a5,1580(s10)
    1ff0:	00812583          	lw	a1,8(sp)
    1ff4:	00e50533          	add	a0,a0,a4
    1ff8:	00a787b3          	add	a5,a5,a0
    1ffc:	0007c683          	lbu	a3,0(a5)
    2000:	00db66b3          	or	a3,s6,a3
    2004:	00d78023          	sb	a3,0(a5)
    2008:	62094503          	lbu	a0,1568(s2)
    200c:	390010ef          	jal	339c <__mulsi3>
    2010:	62cd2683          	lw	a3,1580(s10)
    2014:	00950533          	add	a0,a0,s1
    2018:	418a55b3          	sra	a1,s4,s8
    201c:	00a686b3          	add	a3,a3,a0
    2020:	0006c503          	lbu	a0,0(a3)
    2024:	00a5e5b3          	or	a1,a1,a0
    2028:	00b68023          	sb	a1,0(a3)
    202c:	f59a9ae3          	bne	s5,s9,1f80 <putalign+0xc0>
    2030:	00c14583          	lbu	a1,12(sp)
    2034:	0ff47413          	zext.b	s0,s0
    2038:	fff40b13          	addi	s6,s0,-1
    203c:	00258b93          	addi	s7,a1,2
    2040:	0ffbf793          	zext.b	a5,s7
    2044:	00140d93          	addi	s11,s0,1
    2048:	fff58a93          	addi	s5,a1,-1
    204c:	00158c93          	addi	s9,a1,1
    2050:	0ffb7b13          	zext.b	s6,s6
    2054:	00f12023          	sw	a5,0(sp)
    2058:	0ffdfd13          	zext.b	s10,s11
    205c:	0ffafa93          	zext.b	s5,s5
    2060:	0ffcfc13          	zext.b	s8,s9
    2064:	00058993          	mv	s3,a1
    2068:	00040913          	mv	s2,s0
    206c:	00001bb7          	lui	s7,0x1
    2070:	08000a13          	li	s4,128
    2074:	000b0493          	mv	s1,s6
    2078:	0165f663          	bgeu	a1,s6,2084 <putalign+0x1c4>
    207c:	00058493          	mv	s1,a1
    2080:	000b0593          	mv	a1,s6
    2084:	00158513          	addi	a0,a1,1
    2088:	314010ef          	jal	339c <__mulsi3>
    208c:	628ba683          	lw	a3,1576(s7) # 1628 <framask>
    2090:	00155513          	srli	a0,a0,0x1
    2094:	00a487b3          	add	a5,s1,a0
    2098:	0037d613          	srli	a2,a5,0x3
    209c:	00c686b3          	add	a3,a3,a2
    20a0:	0006c603          	lbu	a2,0(a3)
    20a4:	0077f793          	andi	a5,a5,7
    20a8:	40fa57b3          	sra	a5,s4,a5
    20ac:	00c7e7b3          	or	a5,a5,a2
    20b0:	00f68023          	sb	a5,0(a3)
    20b4:	0fa9fc63          	bgeu	s3,s10,21ac <putalign+0x2ec>
    20b8:	000d0593          	mv	a1,s10
    20bc:	00098493          	mv	s1,s3
    20c0:	00158513          	addi	a0,a1,1
    20c4:	2d8010ef          	jal	339c <__mulsi3>
    20c8:	628ba683          	lw	a3,1576(s7)
    20cc:	00155513          	srli	a0,a0,0x1
    20d0:	00a487b3          	add	a5,s1,a0
    20d4:	0037d613          	srli	a2,a5,0x3
    20d8:	00c686b3          	add	a3,a3,a2
    20dc:	0006c603          	lbu	a2,0(a3)
    20e0:	0077f793          	andi	a5,a5,7
    20e4:	40fa57b3          	sra	a5,s4,a5
    20e8:	00c7e7b3          	or	a5,a5,a2
    20ec:	00f68023          	sb	a5,0(a3)
    20f0:	0b2af863          	bgeu	s5,s2,21a0 <putalign+0x2e0>
    20f4:	00090593          	mv	a1,s2
    20f8:	000a8493          	mv	s1,s5
    20fc:	00158513          	addi	a0,a1,1
    2100:	29c010ef          	jal	339c <__mulsi3>
    2104:	628ba683          	lw	a3,1576(s7)
    2108:	00155513          	srli	a0,a0,0x1
    210c:	00a487b3          	add	a5,s1,a0
    2110:	0037d613          	srli	a2,a5,0x3
    2114:	00c686b3          	add	a3,a3,a2
    2118:	0006c603          	lbu	a2,0(a3)
    211c:	0077f793          	andi	a5,a5,7
    2120:	40fa57b3          	sra	a5,s4,a5
    2124:	00c7e7b3          	or	a5,a5,a2
    2128:	00f68023          	sb	a5,0(a3)
    212c:	000c0593          	mv	a1,s8
    2130:	008c7663          	bgeu	s8,s0,213c <putalign+0x27c>
    2134:	00040593          	mv	a1,s0
    2138:	000c0413          	mv	s0,s8
    213c:	00158513          	addi	a0,a1,1
    2140:	25c010ef          	jal	339c <__mulsi3>
    2144:	628ba783          	lw	a5,1576(s7)
    2148:	00155513          	srli	a0,a0,0x1
    214c:	00a40433          	add	s0,s0,a0
    2150:	00345693          	srli	a3,s0,0x3
    2154:	00d787b3          	add	a5,a5,a3
    2158:	0007c683          	lbu	a3,0(a5)
    215c:	00747413          	andi	s0,s0,7
    2160:	408a5433          	sra	s0,s4,s0
    2164:	00d46433          	or	s0,s0,a3
    2168:	00878023          	sb	s0,0(a5)
    216c:	00012783          	lw	a5,0(sp)
    2170:	fff90913          	addi	s2,s2,-1
    2174:	fff98993          	addi	s3,s3,-1
    2178:	0ffcf593          	zext.b	a1,s9
    217c:	0ff97913          	zext.b	s2,s2
    2180:	0ff9f993          	zext.b	s3,s3
    2184:	0ffdf413          	zext.b	s0,s11
    2188:	02b78863          	beq	a5,a1,21b8 <putalign+0x2f8>
    218c:	00140d93          	addi	s11,s0,1
    2190:	00158c93          	addi	s9,a1,1
    2194:	000b0493          	mv	s1,s6
    2198:	ef65f6e3          	bgeu	a1,s6,2084 <putalign+0x1c4>
    219c:	ee1ff06f          	j	207c <putalign+0x1bc>
    21a0:	000a8593          	mv	a1,s5
    21a4:	00090493          	mv	s1,s2
    21a8:	f55ff06f          	j	20fc <putalign+0x23c>
    21ac:	00098593          	mv	a1,s3
    21b0:	000d0493          	mv	s1,s10
    21b4:	f0dff06f          	j	20c0 <putalign+0x200>
    21b8:	04c12083          	lw	ra,76(sp)
    21bc:	04812403          	lw	s0,72(sp)
    21c0:	04412483          	lw	s1,68(sp)
    21c4:	04012903          	lw	s2,64(sp)
    21c8:	03c12983          	lw	s3,60(sp)
    21cc:	03812a03          	lw	s4,56(sp)
    21d0:	03412a83          	lw	s5,52(sp)
    21d4:	03012b03          	lw	s6,48(sp)
    21d8:	02c12b83          	lw	s7,44(sp)
    21dc:	02812c03          	lw	s8,40(sp)
    21e0:	02412c83          	lw	s9,36(sp)
    21e4:	02012d03          	lw	s10,32(sp)
    21e8:	01c12d83          	lw	s11,28(sp)
    21ec:	05010113          	addi	sp,sp,80
    21f0:	00008067          	ret

000021f4 <initframe>:
    21f4:	f6010113          	addi	sp,sp,-160
    21f8:	08812c23          	sw	s0,152(sp)
    21fc:	07b12623          	sw	s11,108(sp)
    2200:	00001437          	lui	s0,0x1
    2204:	00001db7          	lui	s11,0x1
    2208:	621dc583          	lbu	a1,1569(s11) # 1621 <WD>
    220c:	62044503          	lbu	a0,1568(s0) # 1620 <WDB>
    2210:	08112e23          	sw	ra,156(sp)
    2214:	08912a23          	sw	s1,148(sp)
    2218:	09212823          	sw	s2,144(sp)
    221c:	09312623          	sw	s3,140(sp)
    2220:	09412423          	sw	s4,136(sp)
    2224:	09512223          	sw	s5,132(sp)
    2228:	09612023          	sw	s6,128(sp)
    222c:	07812c23          	sw	s8,120(sp)
    2230:	07912a23          	sw	s9,116(sp)
    2234:	07a12823          	sw	s10,112(sp)
    2238:	07712e23          	sw	s7,124(sp)
    223c:	160010ef          	jal	339c <__mulsi3>
    2240:	00100593          	li	a1,1
    2244:	830fe0ef          	jal	274 <calloc_beebs>
    2248:	621dc583          	lbu	a1,1569(s11)
    224c:	000014b7          	lui	s1,0x1
    2250:	62a4a623          	sw	a0,1580(s1) # 162c <framebase>
    2254:	00158513          	addi	a0,a1,1
    2258:	144010ef          	jal	339c <__mulsi3>
    225c:	40155513          	srai	a0,a0,0x1
    2260:	00750513          	addi	a0,a0,7
    2264:	00100593          	li	a1,1
    2268:	40355513          	srai	a0,a0,0x3
    226c:	808fe0ef          	jal	274 <calloc_beebs>
    2270:	621dc783          	lbu	a5,1569(s11)
    2274:	00001937          	lui	s2,0x1
    2278:	62a92423          	sw	a0,1576(s2) # 1628 <framask>
    227c:	00178513          	addi	a0,a5,1
    2280:	f8dfd0ef          	jal	20c <malloc_beebs>
    2284:	000017b7          	lui	a5,0x1
    2288:	62a7a223          	sw	a0,1572(a5) # 1624 <rlens>
    228c:	00100793          	li	a5,1
    2290:	02f12423          	sw	a5,40(sp)
    2294:	00200793          	li	a5,2
    2298:	02f12823          	sw	a5,48(sp)
    229c:	00100793          	li	a5,1
    22a0:	00f12223          	sw	a5,4(sp)
    22a4:	00078993          	mv	s3,a5
    22a8:	00200793          	li	a5,2
    22ac:	00f12823          	sw	a5,16(sp)
    22b0:	04f12c23          	sw	a5,88(sp)
    22b4:	00400793          	li	a5,4
    22b8:	02f12c23          	sw	a5,56(sp)
    22bc:	00800793          	li	a5,8
    22c0:	02f12a23          	sw	a5,52(sp)
    22c4:	02000793          	li	a5,32
    22c8:	00500d13          	li	s10,5
    22cc:	08000b13          	li	s6,128
    22d0:	04f12623          	sw	a5,76(sp)
    22d4:	00600793          	li	a5,6
    22d8:	03a12223          	sw	s10,36(sp)
    22dc:	03a12023          	sw	s10,32(sp)
    22e0:	01a12e23          	sw	s10,28(sp)
    22e4:	05a12e23          	sw	s10,92(sp)
    22e8:	00300593          	li	a1,3
    22ec:	000b0a13          	mv	s4,s6
    22f0:	04012a23          	sw	zero,84(sp)
    22f4:	02012e23          	sw	zero,60(sp)
    22f8:	04012823          	sw	zero,80(sp)
    22fc:	00f12a23          	sw	a5,20(sp)
    2300:	00000c93          	li	s9,0
    2304:	00012c23          	sw	zero,24(sp)
    2308:	01000c13          	li	s8,16
    230c:	00000a93          	li	s5,0
    2310:	02012623          	sw	zero,44(sp)
    2314:	04012023          	sw	zero,64(sp)
    2318:	00000613          	li	a2,0
    231c:	00000d13          	li	s10,0
    2320:	62044503          	lbu	a0,1568(s0)
    2324:	00c12623          	sw	a2,12(sp)
    2328:	074010ef          	jal	339c <__mulsi3>
    232c:	62c4a783          	lw	a5,1580(s1)
    2330:	01550533          	add	a0,a0,s5
    2334:	00c12603          	lw	a2,12(sp)
    2338:	00a787b3          	add	a5,a5,a0
    233c:	0007c583          	lbu	a1,0(a5)
    2340:	02c12703          	lw	a4,44(sp)
    2344:	000d0a93          	mv	s5,s10
    2348:	00bc6c33          	or	s8,s8,a1
    234c:	01878023          	sb	s8,0(a5)
    2350:	02c12783          	lw	a5,44(sp)
    2354:	00170b93          	addi	s7,a4,1
    2358:	006d0713          	addi	a4,s10,6
    235c:	41a78c33          	sub	s8,a5,s10
    2360:	41a607b3          	sub	a5,a2,s10
    2364:	41ab8bb3          	sub	s7,s7,s10
    2368:	00e12423          	sw	a4,8(sp)
    236c:	00f12623          	sw	a5,12(sp)
    2370:	04c12223          	sw	a2,68(sp)
    2374:	05312423          	sw	s3,72(sp)
    2378:	62044503          	lbu	a0,1568(s0)
    237c:	000d0593          	mv	a1,s10
    2380:	015c09b3          	add	s3,s8,s5
    2384:	018010ef          	jal	339c <__mulsi3>
    2388:	62c4a683          	lw	a3,1580(s1)
    238c:	00c12783          	lw	a5,12(sp)
    2390:	4039d993          	srai	s3,s3,0x3
    2394:	00a989b3          	add	s3,s3,a0
    2398:	013686b3          	add	a3,a3,s3
    239c:	0006c603          	lbu	a2,0(a3)
    23a0:	015787b3          	add	a5,a5,s5
    23a4:	0077f793          	andi	a5,a5,7
    23a8:	40fa57b3          	sra	a5,s4,a5
    23ac:	00c7e7b3          	or	a5,a5,a2
    23b0:	00f68023          	sb	a5,0(a3)
    23b4:	62044503          	lbu	a0,1568(s0)
    23b8:	000a8993          	mv	s3,s5
    23bc:	001a8a93          	addi	s5,s5,1
    23c0:	000a8593          	mv	a1,s5
    23c4:	7d9000ef          	jal	339c <__mulsi3>
    23c8:	01812703          	lw	a4,24(sp)
    23cc:	62c4a783          	lw	a5,1580(s1)
    23d0:	00098593          	mv	a1,s3
    23d4:	00e50533          	add	a0,a0,a4
    23d8:	00a787b3          	add	a5,a5,a0
    23dc:	0007c683          	lbu	a3,0(a5)
    23e0:	013b89b3          	add	s3,s7,s3
    23e4:	00db66b3          	or	a3,s6,a3
    23e8:	00d78023          	sb	a3,0(a5)
    23ec:	62044503          	lbu	a0,1568(s0)
    23f0:	7ad000ef          	jal	339c <__mulsi3>
    23f4:	62c4a783          	lw	a5,1580(s1)
    23f8:	01950533          	add	a0,a0,s9
    23fc:	01012703          	lw	a4,16(sp)
    2400:	00a787b3          	add	a5,a5,a0
    2404:	0007c683          	lbu	a3,0(a5)
    2408:	01412583          	lw	a1,20(sp)
    240c:	00d766b3          	or	a3,a4,a3
    2410:	00d78023          	sb	a3,0(a5)
    2414:	62044503          	lbu	a0,1568(s0)
    2418:	785000ef          	jal	339c <__mulsi3>
    241c:	4039d793          	srai	a5,s3,0x3
    2420:	00f50533          	add	a0,a0,a5
    2424:	62c4a783          	lw	a5,1580(s1)
    2428:	0079f993          	andi	s3,s3,7
    242c:	413a59b3          	sra	s3,s4,s3
    2430:	00a787b3          	add	a5,a5,a0
    2434:	0007c683          	lbu	a3,0(a5)
    2438:	00d9e9b3          	or	s3,s3,a3
    243c:	01378023          	sb	s3,0(a5)
    2440:	00812783          	lw	a5,8(sp)
    2444:	f3579ae3          	bne	a5,s5,2378 <initframe+0x184>
    2448:	04412603          	lw	a2,68(sp)
    244c:	04012783          	lw	a5,64(sp)
    2450:	04812983          	lw	s3,72(sp)
    2454:	00160b13          	addi	s6,a2,1
    2458:	00178b93          	addi	s7,a5,1
    245c:	00560c13          	addi	s8,a2,5
    2460:	01a12423          	sw	s10,8(sp)
    2464:	0ffb7b13          	zext.b	s6,s6
    2468:	05c12d03          	lw	s10,92(sp)
    246c:	0ffbfb93          	zext.b	s7,s7
    2470:	0ffc7c13          	zext.b	s8,s8
    2474:	1369ea63          	bltu	s3,s6,25a8 <initframe+0x3b4>
    2478:	00098593          	mv	a1,s3
    247c:	000b0a93          	mv	s5,s6
    2480:	00158513          	addi	a0,a1,1
    2484:	719000ef          	jal	339c <__mulsi3>
    2488:	62892703          	lw	a4,1576(s2)
    248c:	00155513          	srli	a0,a0,0x1
    2490:	00aa8ab3          	add	s5,s5,a0
    2494:	003ad793          	srli	a5,s5,0x3
    2498:	00f70733          	add	a4,a4,a5
    249c:	00074683          	lbu	a3,0(a4)
    24a0:	007afa93          	andi	s5,s5,7
    24a4:	415a57b3          	sra	a5,s4,s5
    24a8:	00d7e7b3          	or	a5,a5,a3
    24ac:	00f70023          	sb	a5,0(a4)
    24b0:	02812703          	lw	a4,40(sp)
    24b4:	00412783          	lw	a5,4(sp)
    24b8:	001b8a93          	addi	s5,s7,1
    24bc:	0ffafa93          	zext.b	s5,s5
    24c0:	000a8c93          	mv	s9,s5
    24c4:	00070593          	mv	a1,a4
    24c8:	00fae663          	bltu	s5,a5,24d4 <initframe+0x2e0>
    24cc:	000a8593          	mv	a1,s5
    24d0:	00070c93          	mv	s9,a4
    24d4:	00158513          	addi	a0,a1,1
    24d8:	6c5000ef          	jal	339c <__mulsi3>
    24dc:	62892783          	lw	a5,1576(s2)
    24e0:	00155513          	srli	a0,a0,0x1
    24e4:	01950533          	add	a0,a0,s9
    24e8:	00355713          	srli	a4,a0,0x3
    24ec:	00e787b3          	add	a5,a5,a4
    24f0:	0007c703          	lbu	a4,0(a5)
    24f4:	00757513          	andi	a0,a0,7
    24f8:	40aa5533          	sra	a0,s4,a0
    24fc:	00e56533          	or	a0,a0,a4
    2500:	00a78023          	sb	a0,0(a5)
    2504:	01c12783          	lw	a5,28(sp)
    2508:	000d0593          	mv	a1,s10
    250c:	00fbe663          	bltu	s7,a5,2518 <initframe+0x324>
    2510:	000b8593          	mv	a1,s7
    2514:	000d0b93          	mv	s7,s10
    2518:	00158513          	addi	a0,a1,1
    251c:	681000ef          	jal	339c <__mulsi3>
    2520:	62892783          	lw	a5,1576(s2)
    2524:	00155513          	srli	a0,a0,0x1
    2528:	01750533          	add	a0,a0,s7
    252c:	00355713          	srli	a4,a0,0x3
    2530:	00e787b3          	add	a5,a5,a4
    2534:	0007c703          	lbu	a4,0(a5)
    2538:	00757513          	andi	a0,a0,7
    253c:	40aa5533          	sra	a0,s4,a0
    2540:	00e56533          	or	a0,a0,a4
    2544:	00a78023          	sb	a0,0(a5)
    2548:	02412703          	lw	a4,36(sp)
    254c:	02012783          	lw	a5,32(sp)
    2550:	001b0b13          	addi	s6,s6,1
    2554:	0ffb7b13          	zext.b	s6,s6
    2558:	000b0593          	mv	a1,s6
    255c:	00070b93          	mv	s7,a4
    2560:	0167e663          	bltu	a5,s6,256c <initframe+0x378>
    2564:	000b0b93          	mv	s7,s6
    2568:	00070593          	mv	a1,a4
    256c:	00158513          	addi	a0,a1,1
    2570:	62d000ef          	jal	339c <__mulsi3>
    2574:	62892783          	lw	a5,1576(s2)
    2578:	00155513          	srli	a0,a0,0x1
    257c:	01750533          	add	a0,a0,s7
    2580:	00355713          	srli	a4,a0,0x3
    2584:	00e787b3          	add	a5,a5,a4
    2588:	0007c703          	lbu	a4,0(a5)
    258c:	00757513          	andi	a0,a0,7
    2590:	40aa5533          	sra	a0,s4,a0
    2594:	00e56533          	or	a0,a0,a4
    2598:	00a78023          	sb	a0,0(a5)
    259c:	016c0c63          	beq	s8,s6,25b4 <initframe+0x3c0>
    25a0:	000a8b93          	mv	s7,s5
    25a4:	ed69fae3          	bgeu	s3,s6,2478 <initframe+0x284>
    25a8:	000b0593          	mv	a1,s6
    25ac:	00098a93          	mv	s5,s3
    25b0:	ed1ff06f          	j	2480 <initframe+0x28c>
    25b4:	02c12783          	lw	a5,44(sp)
    25b8:	00812d03          	lw	s10,8(sp)
    25bc:	05812b03          	lw	s6,88(sp)
    25c0:	00278c13          	addi	s8,a5,2
    25c4:	403c5b93          	srai	s7,s8,0x3
    25c8:	000c0993          	mv	s3,s8
    25cc:	04c12c83          	lw	s9,76(sp)
    25d0:	05012c03          	lw	s8,80(sp)
    25d4:	003d0a93          	addi	s5,s10,3
    25d8:	005d0d13          	addi	s10,s10,5
    25dc:	62044503          	lbu	a0,1568(s0)
    25e0:	03012583          	lw	a1,48(sp)
    25e4:	00198993          	addi	s3,s3,1
    25e8:	5b5000ef          	jal	339c <__mulsi3>
    25ec:	62c4a703          	lw	a4,1580(s1)
    25f0:	01750533          	add	a0,a0,s7
    25f4:	007b7793          	andi	a5,s6,7
    25f8:	00a70733          	add	a4,a4,a0
    25fc:	00074603          	lbu	a2,0(a4)
    2600:	40fa57b3          	sra	a5,s4,a5
    2604:	000a8593          	mv	a1,s5
    2608:	00c7e7b3          	or	a5,a5,a2
    260c:	00f70023          	sb	a5,0(a4)
    2610:	62044503          	lbu	a0,1568(s0)
    2614:	4039db93          	srai	s7,s3,0x3
    2618:	001b0b13          	addi	s6,s6,1
    261c:	581000ef          	jal	339c <__mulsi3>
    2620:	62c4a783          	lw	a5,1580(s1)
    2624:	01850733          	add	a4,a0,s8
    2628:	fffa8513          	addi	a0,s5,-1
    262c:	00e787b3          	add	a5,a5,a4
    2630:	0007c703          	lbu	a4,0(a5)
    2634:	001a8a93          	addi	s5,s5,1
    2638:	00ece733          	or	a4,s9,a4
    263c:	00e78023          	sb	a4,0(a5)
    2640:	62044583          	lbu	a1,1568(s0)
    2644:	559000ef          	jal	339c <__mulsi3>
    2648:	03c12703          	lw	a4,60(sp)
    264c:	62c4a783          	lw	a5,1580(s1)
    2650:	03412683          	lw	a3,52(sp)
    2654:	00e50533          	add	a0,a0,a4
    2658:	00a787b3          	add	a5,a5,a0
    265c:	0007c703          	lbu	a4,0(a5)
    2660:	03812583          	lw	a1,56(sp)
    2664:	00e6e733          	or	a4,a3,a4
    2668:	00e78023          	sb	a4,0(a5)
    266c:	62044503          	lbu	a0,1568(s0)
    2670:	52d000ef          	jal	339c <__mulsi3>
    2674:	62c4a703          	lw	a4,1580(s1)
    2678:	01750533          	add	a0,a0,s7
    267c:	0079f793          	andi	a5,s3,7
    2680:	00a70733          	add	a4,a4,a0
    2684:	00074583          	lbu	a1,0(a4)
    2688:	40fa57b3          	sra	a5,s4,a5
    268c:	00b7e7b3          	or	a5,a5,a1
    2690:	00f70023          	sb	a5,0(a4)
    2694:	f5aa94e3          	bne	s5,s10,25dc <initframe+0x3e8>
    2698:	05412783          	lw	a5,84(sp)
    269c:	00300713          	li	a4,3
    26a0:	00178793          	addi	a5,a5,1
    26a4:	00f12223          	sw	a5,4(sp)
    26a8:	0ee78a63          	beq	a5,a4,279c <initframe+0x5a8>
    26ac:	00100713          	li	a4,1
    26b0:	02e780e3          	beq	a5,a4,2ed0 <initframe+0xcdc>
    26b4:	621dc783          	lbu	a5,1569(s11)
    26b8:	00200713          	li	a4,2
    26bc:	04e12a23          	sw	a4,84(sp)
    26c0:	ff978613          	addi	a2,a5,-7
    26c4:	0ff67613          	zext.b	a2,a2
    26c8:	00500713          	li	a4,5
    26cc:	00660c93          	addi	s9,a2,6
    26d0:	ffa78813          	addi	a6,a5,-6
    26d4:	ffe78793          	addi	a5,a5,-2
    26d8:	007cf513          	andi	a0,s9,7
    26dc:	00260693          	addi	a3,a2,2
    26e0:	0ff7f793          	zext.b	a5,a5
    26e4:	02e12223          	sw	a4,36(sp)
    26e8:	00260713          	addi	a4,a2,2
    26ec:	0076f593          	andi	a1,a3,7
    26f0:	00f12e23          	sw	a5,28(sp)
    26f4:	04e12c23          	sw	a4,88(sp)
    26f8:	40aa57b3          	sra	a5,s4,a0
    26fc:	00460713          	addi	a4,a2,4
    2700:	00777693          	andi	a3,a4,7
    2704:	00f12823          	sw	a5,16(sp)
    2708:	40ba57b3          	sra	a5,s4,a1
    270c:	04f12623          	sw	a5,76(sp)
    2710:	40da57b3          	sra	a5,s4,a3
    2714:	02f12a23          	sw	a5,52(sp)
    2718:	40375793          	srai	a5,a4,0x3
    271c:	02f12e23          	sw	a5,60(sp)
    2720:	00260793          	addi	a5,a2,2
    2724:	4037d793          	srai	a5,a5,0x3
    2728:	04f12823          	sw	a5,80(sp)
    272c:	00365793          	srli	a5,a2,0x3
    2730:	00f12c23          	sw	a5,24(sp)
    2734:	01c12783          	lw	a5,28(sp)
    2738:	00360a93          	addi	s5,a2,3
    273c:	007afc13          	andi	s8,s5,7
    2740:	04f12e23          	sw	a5,92(sp)
    2744:	00200793          	li	a5,2
    2748:	02f12823          	sw	a5,48(sp)
    274c:	00500793          	li	a5,5
    2750:	02f12023          	sw	a5,32(sp)
    2754:	00400793          	li	a5,4
    2758:	0ff87813          	zext.b	a6,a6
    275c:	00767b13          	andi	s6,a2,7
    2760:	02f12c23          	sw	a5,56(sp)
    2764:	00600793          	li	a5,6
    2768:	01012223          	sw	a6,4(sp)
    276c:	418a5c33          	sra	s8,s4,s8
    2770:	403ada93          	srai	s5,s5,0x3
    2774:	403cdc93          	srai	s9,s9,0x3
    2778:	416a5b33          	sra	s6,s4,s6
    277c:	02c12623          	sw	a2,44(sp)
    2780:	03012423          	sw	a6,40(sp)
    2784:	00100993          	li	s3,1
    2788:	00f12a23          	sw	a5,20(sp)
    278c:	00300593          	li	a1,3
    2790:	00000d13          	li	s10,0
    2794:	04012023          	sw	zero,64(sp)
    2798:	b89ff06f          	j	2320 <initframe+0x12c>
    279c:	00001a37          	lui	s4,0x1
    27a0:	622a4703          	lbu	a4,1570(s4) # 1622 <VERSION>
    27a4:	00100793          	li	a5,1
    27a8:	08e7f063          	bgeu	a5,a4,2828 <initframe+0x634>
    27ac:	000017b7          	lui	a5,0x1
    27b0:	5a878793          	addi	a5,a5,1448 # 15a8 <adelta>
    27b4:	621dc983          	lbu	s3,1569(s11)
    27b8:	00e787b3          	add	a5,a5,a4
    27bc:	0007ca83          	lbu	s5,0(a5)
    27c0:	ff998993          	addi	s3,s3,-7
    27c4:	0ff9fb13          	zext.b	s6,s3
    27c8:	ffda8b93          	addi	s7,s5,-3
    27cc:	009a8c13          	addi	s8,s5,9
    27d0:	0ff9f993          	zext.b	s3,s3
    27d4:	013be863          	bltu	s7,s3,27e4 <initframe+0x5f0>
    27d8:	0200006f          	j	27f8 <initframe+0x604>
    27dc:	0ff7f993          	zext.b	s3,a5
    27e0:	013bfc63          	bgeu	s7,s3,27f8 <initframe+0x604>
    27e4:	000b0593          	mv	a1,s6
    27e8:	00098513          	mv	a0,s3
    27ec:	ed4ff0ef          	jal	1ec0 <putalign>
    27f0:	415987b3          	sub	a5,s3,s5
    27f4:	ff59f4e3          	bgeu	s3,s5,27dc <initframe+0x5e8>
    27f8:	036c7863          	bgeu	s8,s6,2828 <initframe+0x634>
    27fc:	415b0b33          	sub	s6,s6,s5
    2800:	0ffb7b13          	zext.b	s6,s6
    2804:	000b0593          	mv	a1,s6
    2808:	00600513          	li	a0,6
    280c:	eb4ff0ef          	jal	1ec0 <putalign>
    2810:	000b0513          	mv	a0,s6
    2814:	00600593          	li	a1,6
    2818:	ea8ff0ef          	jal	1ec0 <putalign>
    281c:	621dc983          	lbu	s3,1569(s11)
    2820:	ff998993          	addi	s3,s3,-7
    2824:	fadff06f          	j	27d0 <initframe+0x5dc>
    2828:	621dc503          	lbu	a0,1569(s11)
    282c:	62044583          	lbu	a1,1568(s0)
    2830:	00000b93          	li	s7,0
    2834:	ff850513          	addi	a0,a0,-8
    2838:	365000ef          	jal	339c <__mulsi3>
    283c:	62c4a783          	lw	a5,1580(s1)
    2840:	08000c13          	li	s8,128
    2844:	00600b13          	li	s6,6
    2848:	00a787b3          	add	a5,a5,a0
    284c:	0017c703          	lbu	a4,1(a5)
    2850:	00700a93          	li	s5,7
    2854:	f8076713          	ori	a4,a4,-128
    2858:	00e780a3          	sb	a4,1(a5)
    285c:	62892703          	lw	a4,1576(s2)
    2860:	01cb8793          	addi	a5,s7,28
    2864:	0037d693          	srli	a3,a5,0x3
    2868:	00d70733          	add	a4,a4,a3
    286c:	00074683          	lbu	a3,0(a4)
    2870:	0077f793          	andi	a5,a5,7
    2874:	40fc57b3          	sra	a5,s8,a5
    2878:	00d7e7b3          	or	a5,a5,a3
    287c:	00f70023          	sb	a5,0(a4)
    2880:	621dc583          	lbu	a1,1569(s11)
    2884:	0ffbf993          	zext.b	s3,s7
    2888:	000b8c93          	mv	s9,s7
    288c:	ff858593          	addi	a1,a1,-8
    2890:	0ff5f593          	zext.b	a1,a1
    2894:	00b9e663          	bltu	s3,a1,28a0 <initframe+0x6ac>
    2898:	00058c93          	mv	s9,a1
    289c:	000b8593          	mv	a1,s7
    28a0:	00158513          	addi	a0,a1,1
    28a4:	2f9000ef          	jal	339c <__mulsi3>
    28a8:	62892703          	lw	a4,1576(s2)
    28ac:	00155513          	srli	a0,a0,0x1
    28b0:	01950533          	add	a0,a0,s9
    28b4:	00355693          	srli	a3,a0,0x3
    28b8:	00d70733          	add	a4,a4,a3
    28bc:	00074603          	lbu	a2,0(a4)
    28c0:	00757793          	andi	a5,a0,7
    28c4:	40fc57b3          	sra	a5,s8,a5
    28c8:	00c7e7b3          	or	a5,a5,a2
    28cc:	00f70023          	sb	a5,0(a4)
    28d0:	621dc783          	lbu	a5,1569(s11)
    28d4:	01c00693          	li	a3,28
    28d8:	ff978793          	addi	a5,a5,-7
    28dc:	00f985b3          	add	a1,s3,a5
    28e0:	0ff5f593          	zext.b	a1,a1
    28e4:	00158513          	addi	a0,a1,1
    28e8:	00bb7863          	bgeu	s6,a1,28f8 <initframe+0x704>
    28ec:	2b1000ef          	jal	339c <__mulsi3>
    28f0:	00155693          	srli	a3,a0,0x1
    28f4:	00700593          	li	a1,7
    28f8:	62892783          	lw	a5,1576(s2)
    28fc:	00d585b3          	add	a1,a1,a3
    2900:	0035d713          	srli	a4,a1,0x3
    2904:	00e787b3          	add	a5,a5,a4
    2908:	0007c703          	lbu	a4,0(a5)
    290c:	0075f593          	andi	a1,a1,7
    2910:	40bc55b3          	sra	a1,s8,a1
    2914:	00e5e5b3          	or	a1,a1,a4
    2918:	001b8b93          	addi	s7,s7,1
    291c:	00b78023          	sb	a1,0(a5)
    2920:	f35b9ee3          	bne	s7,s5,285c <initframe+0x668>
    2924:	00000b13          	li	s6,0
    2928:	08000c13          	li	s8,128
    292c:	00700a93          	li	s5,7
    2930:	00800993          	li	s3,8
    2934:	62892703          	lw	a4,1576(s2)
    2938:	01cb0793          	addi	a5,s6,28
    293c:	0037d693          	srli	a3,a5,0x3
    2940:	00d70733          	add	a4,a4,a3
    2944:	00074683          	lbu	a3,0(a4)
    2948:	0077f793          	andi	a5,a5,7
    294c:	40fc57b3          	sra	a5,s8,a5
    2950:	00d7e7b3          	or	a5,a5,a3
    2954:	00f70023          	sb	a5,0(a4)
    2958:	621dc583          	lbu	a1,1569(s11)
    295c:	0ffb7d13          	zext.b	s10,s6
    2960:	01c00793          	li	a5,28
    2964:	ff858593          	addi	a1,a1,-8
    2968:	00bd05b3          	add	a1,s10,a1
    296c:	0ff5f593          	zext.b	a1,a1
    2970:	00158513          	addi	a0,a1,1
    2974:	00baf863          	bgeu	s5,a1,2984 <initframe+0x790>
    2978:	225000ef          	jal	339c <__mulsi3>
    297c:	00155793          	srli	a5,a0,0x1
    2980:	000b8593          	mv	a1,s7
    2984:	62892703          	lw	a4,1576(s2)
    2988:	00f585b3          	add	a1,a1,a5
    298c:	0035d793          	srli	a5,a1,0x3
    2990:	00f70733          	add	a4,a4,a5
    2994:	00074683          	lbu	a3,0(a4)
    2998:	0075f593          	andi	a1,a1,7
    299c:	40bc57b3          	sra	a5,s8,a1
    29a0:	00d7e7b3          	or	a5,a5,a3
    29a4:	00f70023          	sb	a5,0(a4)
    29a8:	621dcc83          	lbu	s9,1569(s11)
    29ac:	000b0593          	mv	a1,s6
    29b0:	ff8c8c93          	addi	s9,s9,-8
    29b4:	0ffcfc93          	zext.b	s9,s9
    29b8:	01ace663          	bltu	s9,s10,29c4 <initframe+0x7d0>
    29bc:	000c8593          	mv	a1,s9
    29c0:	000b0c93          	mv	s9,s6
    29c4:	00158513          	addi	a0,a1,1
    29c8:	1d5000ef          	jal	339c <__mulsi3>
    29cc:	62892783          	lw	a5,1576(s2)
    29d0:	00155513          	srli	a0,a0,0x1
    29d4:	01950533          	add	a0,a0,s9
    29d8:	00355713          	srli	a4,a0,0x3
    29dc:	00e787b3          	add	a5,a5,a4
    29e0:	0007c703          	lbu	a4,0(a5)
    29e4:	00757513          	andi	a0,a0,7
    29e8:	40ac5533          	sra	a0,s8,a0
    29ec:	00e56533          	or	a0,a0,a4
    29f0:	001b0b13          	addi	s6,s6,1
    29f4:	00a78023          	sb	a0,0(a5)
    29f8:	f33b1ee3          	bne	s6,s3,2934 <initframe+0x740>
    29fc:	02400713          	li	a4,36
    2a00:	08000513          	li	a0,128
    2a04:	02d00593          	li	a1,45
    2a08:	62892683          	lw	a3,1576(s2)
    2a0c:	00375613          	srli	a2,a4,0x3
    2a10:	00777793          	andi	a5,a4,7
    2a14:	00c686b3          	add	a3,a3,a2
    2a18:	0006c603          	lbu	a2,0(a3)
    2a1c:	40f557b3          	sra	a5,a0,a5
    2a20:	00170713          	addi	a4,a4,1
    2a24:	00c7e7b3          	or	a5,a5,a2
    2a28:	00f68023          	sb	a5,0(a3)
    2a2c:	fcb71ee3          	bne	a4,a1,2a08 <initframe+0x814>
    2a30:	00000993          	li	s3,0
    2a34:	00800b93          	li	s7,8
    2a38:	08000a93          	li	s5,128
    2a3c:	621dc583          	lbu	a1,1569(s11)
    2a40:	02400793          	li	a5,36
    2a44:	ff858593          	addi	a1,a1,-8
    2a48:	013585b3          	add	a1,a1,s3
    2a4c:	0ff5f593          	zext.b	a1,a1
    2a50:	00158513          	addi	a0,a1,1
    2a54:	00bbf863          	bgeu	s7,a1,2a64 <initframe+0x870>
    2a58:	145000ef          	jal	339c <__mulsi3>
    2a5c:	00155793          	srli	a5,a0,0x1
    2a60:	000b0593          	mv	a1,s6
    2a64:	62892703          	lw	a4,1576(s2)
    2a68:	00f585b3          	add	a1,a1,a5
    2a6c:	0035d793          	srli	a5,a1,0x3
    2a70:	00f70733          	add	a4,a4,a5
    2a74:	00074683          	lbu	a3,0(a4)
    2a78:	0075f593          	andi	a1,a1,7
    2a7c:	40bad5b3          	sra	a1,s5,a1
    2a80:	00d5e5b3          	or	a1,a1,a3
    2a84:	00b70023          	sb	a1,0(a4)
    2a88:	62892703          	lw	a4,1576(s2)
    2a8c:	02498793          	addi	a5,s3,36
    2a90:	0037d693          	srli	a3,a5,0x3
    2a94:	00d70733          	add	a4,a4,a3
    2a98:	00074683          	lbu	a3,0(a4)
    2a9c:	0077f793          	andi	a5,a5,7
    2aa0:	40fad7b3          	sra	a5,s5,a5
    2aa4:	00d7e7b3          	or	a5,a5,a3
    2aa8:	00198993          	addi	s3,s3,1
    2aac:	00f70023          	sb	a5,0(a4)
    2ab0:	f97996e3          	bne	s3,s7,2a3c <initframe+0x848>
    2ab4:	00000a93          	li	s5,0
    2ab8:	00700b13          	li	s6,7
    2abc:	08000b93          	li	s7,128
    2ac0:	621dc583          	lbu	a1,1569(s11)
    2ac4:	02400793          	li	a5,36
    2ac8:	ff958593          	addi	a1,a1,-7
    2acc:	015585b3          	add	a1,a1,s5
    2ad0:	0ff5f593          	zext.b	a1,a1
    2ad4:	00158513          	addi	a0,a1,1
    2ad8:	00bb7863          	bgeu	s6,a1,2ae8 <initframe+0x8f4>
    2adc:	0c1000ef          	jal	339c <__mulsi3>
    2ae0:	00155793          	srli	a5,a0,0x1
    2ae4:	00098593          	mv	a1,s3
    2ae8:	00f585b3          	add	a1,a1,a5
    2aec:	62892783          	lw	a5,1576(s2)
    2af0:	0035d713          	srli	a4,a1,0x3
    2af4:	0075f593          	andi	a1,a1,7
    2af8:	00e787b3          	add	a5,a5,a4
    2afc:	0007c703          	lbu	a4,0(a5)
    2b00:	40bbd5b3          	sra	a1,s7,a1
    2b04:	001a8a93          	addi	s5,s5,1
    2b08:	00e5e5b3          	or	a1,a1,a4
    2b0c:	00b78023          	sb	a1,0(a5)
    2b10:	fb6a98e3          	bne	s5,s6,2ac0 <initframe+0x8cc>
    2b14:	621dc783          	lbu	a5,1569(s11)
    2b18:	00e00713          	li	a4,14
    2b1c:	46e78263          	beq	a5,a4,2f80 <initframe+0xd8c>
    2b20:	00000b93          	li	s7,0
    2b24:	08000a93          	li	s5,128
    2b28:	00600b13          	li	s6,6
    2b2c:	05c0006f          	j	2b88 <initframe+0x994>
    2b30:	62044603          	lbu	a2,1568(s0)
    2b34:	62c4a683          	lw	a3,1580(s1)
    2b38:	001b8b93          	addi	s7,s7,1
    2b3c:	00161793          	slli	a5,a2,0x1
    2b40:	00c787b3          	add	a5,a5,a2
    2b44:	00179793          	slli	a5,a5,0x1
    2b48:	00a787b3          	add	a5,a5,a0
    2b4c:	00f686b3          	add	a3,a3,a5
    2b50:	0006c783          	lbu	a5,0(a3)
    2b54:	00198993          	addi	s3,s3,1
    2b58:	00f767b3          	or	a5,a4,a5
    2b5c:	00f68023          	sb	a5,0(a3)
    2b60:	62044503          	lbu	a0,1568(s0)
    2b64:	039000ef          	jal	339c <__mulsi3>
    2b68:	62c4a783          	lw	a5,1580(s1)
    2b6c:	00a78533          	add	a0,a5,a0
    2b70:	00054783          	lbu	a5,0(a0)
    2b74:	0027e793          	ori	a5,a5,2
    2b78:	00f50023          	sb	a5,0(a0)
    2b7c:	621dc783          	lbu	a5,1569(s11)
    2b80:	ff278713          	addi	a4,a5,-14
    2b84:	06ebfc63          	bgeu	s7,a4,2bfc <initframe+0xa08>
    2b88:	007bf793          	andi	a5,s7,7
    2b8c:	40fad733          	sra	a4,s5,a5
    2b90:	001bf793          	andi	a5,s7,1
    2b94:	0039d513          	srli	a0,s3,0x3
    2b98:	00098593          	mv	a1,s3
    2b9c:	f8078ae3          	beqz	a5,2b30 <initframe+0x93c>
    2ba0:	0ff9f593          	zext.b	a1,s3
    2ba4:	01558793          	addi	a5,a1,21
    2ba8:	0037d693          	srli	a3,a5,0x3
    2bac:	0ff9f713          	zext.b	a4,s3
    2bb0:	0077f793          	andi	a5,a5,7
    2bb4:	62892c03          	lw	s8,1576(s2)
    2bb8:	00158513          	addi	a0,a1,1
    2bbc:	40fad7b3          	sra	a5,s5,a5
    2bc0:	22eb6463          	bltu	s6,a4,2de8 <initframe+0xbf4>
    2bc4:	00dc0c33          	add	s8,s8,a3
    2bc8:	000c4703          	lbu	a4,0(s8)
    2bcc:	00e7e733          	or	a4,a5,a4
    2bd0:	00ec0023          	sb	a4,0(s8)
    2bd4:	62892703          	lw	a4,1576(s2)
    2bd8:	001b8b93          	addi	s7,s7,1
    2bdc:	00198993          	addi	s3,s3,1
    2be0:	00d70733          	add	a4,a4,a3
    2be4:	00074683          	lbu	a3,0(a4)
    2be8:	00d7e7b3          	or	a5,a5,a3
    2bec:	00f70023          	sb	a5,0(a4)
    2bf0:	621dc783          	lbu	a5,1569(s11)
    2bf4:	ff278713          	addi	a4,a5,-14
    2bf8:	f8ebe8e3          	bltu	s7,a4,2b88 <initframe+0x994>
    2bfc:	622a4603          	lbu	a2,1570(s4)
    2c00:	00600713          	li	a4,6
    2c04:	0ec77c63          	bgeu	a4,a2,2cfc <initframe+0xb08>
    2c08:	00001737          	lui	a4,0x1
    2c0c:	52070713          	addi	a4,a4,1312 # 1520 <vpat>
    2c10:	00261693          	slli	a3,a2,0x2
    2c14:	00d70733          	add	a4,a4,a3
    2c18:	fe472c83          	lw	s9,-28(a4)
    2c1c:	00500993          	li	s3,5
    2c20:	01100a13          	li	s4,17
    2c24:	00b00c13          	li	s8,11
    2c28:	08000a93          	li	s5,128
    2c2c:	00c12823          	sw	a2,16(sp)
    2c30:	01912223          	sw	s9,4(sp)
    2c34:	413ad733          	sra	a4,s5,s3
    2c38:	000a0b93          	mv	s7,s4
    2c3c:	00000d13          	li	s10,0
    2c40:	00e12423          	sw	a4,8(sp)
    2c44:	00200713          	li	a4,2
    2c48:	41a70cb3          	sub	s9,a4,s10
    2c4c:	00412703          	lw	a4,4(sp)
    2c50:	01978533          	add	a0,a5,s9
    2c54:	ff550513          	addi	a0,a0,-11
    2c58:	ff4b8593          	addi	a1,s7,-12
    2c5c:	01775633          	srl	a2,a4,s7
    2c60:	017c7663          	bgeu	s8,s7,2c6c <initframe+0xa78>
    2c64:	01012703          	lw	a4,16(sp)
    2c68:	00b75633          	srl	a2,a4,a1
    2c6c:	00167613          	andi	a2,a2,1
    2c70:	1a060863          	beqz	a2,2e20 <initframe+0xc2c>
    2c74:	62044583          	lbu	a1,1568(s0)
    2c78:	724000ef          	jal	339c <__mulsi3>
    2c7c:	62c4a783          	lw	a5,1580(s1)
    2c80:	00812703          	lw	a4,8(sp)
    2c84:	00098593          	mv	a1,s3
    2c88:	00a78533          	add	a0,a5,a0
    2c8c:	00054783          	lbu	a5,0(a0)
    2c90:	00e7e7b3          	or	a5,a5,a4
    2c94:	00f50023          	sb	a5,0(a0)
    2c98:	621dcb03          	lbu	s6,1569(s11)
    2c9c:	62044503          	lbu	a0,1568(s0)
    2ca0:	019b0b33          	add	s6,s6,s9
    2ca4:	6f8000ef          	jal	339c <__mulsi3>
    2ca8:	62c4a783          	lw	a5,1580(s1)
    2cac:	ff5b0b13          	addi	s6,s6,-11
    2cb0:	403b5613          	srai	a2,s6,0x3
    2cb4:	00c50533          	add	a0,a0,a2
    2cb8:	00a787b3          	add	a5,a5,a0
    2cbc:	0007c603          	lbu	a2,0(a5)
    2cc0:	007b7b13          	andi	s6,s6,7
    2cc4:	416adb33          	sra	s6,s5,s6
    2cc8:	00cb6b33          	or	s6,s6,a2
    2ccc:	01678023          	sb	s6,0(a5)
    2cd0:	fffb8713          	addi	a4,s7,-1
    2cd4:	0ff77b93          	zext.b	s7,a4
    2cd8:	001d0d13          	addi	s10,s10,1
    2cdc:	00300713          	li	a4,3
    2ce0:	621dc783          	lbu	a5,1569(s11)
    2ce4:	f6ed10e3          	bne	s10,a4,2c44 <initframe+0xa50>
    2ce8:	ffda0a13          	addi	s4,s4,-3
    2cec:	0ffa7a13          	zext.b	s4,s4
    2cf0:	0ff00713          	li	a4,255
    2cf4:	fff98993          	addi	s3,s3,-1
    2cf8:	f2ea1ee3          	bne	s4,a4,2c34 <initframe+0xa40>
    2cfc:	0a078863          	beqz	a5,2dac <initframe+0xbb8>
    2d00:	00100a13          	li	s4,1
    2d04:	00000993          	li	s3,0
    2d08:	08000b13          	li	s6,128
    2d0c:	00000b93          	li	s7,0
    2d10:	0ff9fa93          	zext.b	s5,s3
    2d14:	00c0006f          	j	2d20 <initframe+0xb2c>
    2d18:	001b8b93          	addi	s7,s7,1
    2d1c:	094b8063          	beq	s7,s4,2d9c <initframe+0xba8>
    2d20:	62044503          	lbu	a0,1568(s0)
    2d24:	00098593          	mv	a1,s3
    2d28:	674000ef          	jal	339c <__mulsi3>
    2d2c:	62c4a783          	lw	a5,1580(s1)
    2d30:	003bd693          	srli	a3,s7,0x3
    2d34:	fffbc713          	not	a4,s7
    2d38:	00a787b3          	add	a5,a5,a0
    2d3c:	00d787b3          	add	a5,a5,a3
    2d40:	0007c783          	lbu	a5,0(a5)
    2d44:	00777713          	andi	a4,a4,7
    2d48:	40e7d7b3          	sra	a5,a5,a4
    2d4c:	0017f793          	andi	a5,a5,1
    2d50:	fc0784e3          	beqz	a5,2d18 <initframe+0xb24>
    2d54:	0ffbf793          	zext.b	a5,s7
    2d58:	0afaee63          	bltu	s5,a5,2e14 <initframe+0xc20>
    2d5c:	000b8c13          	mv	s8,s7
    2d60:	00098593          	mv	a1,s3
    2d64:	00158513          	addi	a0,a1,1
    2d68:	634000ef          	jal	339c <__mulsi3>
    2d6c:	62892783          	lw	a5,1576(s2)
    2d70:	00155513          	srli	a0,a0,0x1
    2d74:	01850533          	add	a0,a0,s8
    2d78:	00355713          	srli	a4,a0,0x3
    2d7c:	00e787b3          	add	a5,a5,a4
    2d80:	0007c703          	lbu	a4,0(a5)
    2d84:	00757513          	andi	a0,a0,7
    2d88:	40ab5533          	sra	a0,s6,a0
    2d8c:	00e56533          	or	a0,a0,a4
    2d90:	00a78023          	sb	a0,0(a5)
    2d94:	001b8b93          	addi	s7,s7,1
    2d98:	f94b94e3          	bne	s7,s4,2d20 <initframe+0xb2c>
    2d9c:	621dc783          	lbu	a5,1569(s11)
    2da0:	00198993          	addi	s3,s3,1
    2da4:	001a0a13          	addi	s4,s4,1
    2da8:	f6f9e2e3          	bltu	s3,a5,2d0c <initframe+0xb18>
    2dac:	09c12083          	lw	ra,156(sp)
    2db0:	09812403          	lw	s0,152(sp)
    2db4:	09412483          	lw	s1,148(sp)
    2db8:	09012903          	lw	s2,144(sp)
    2dbc:	08c12983          	lw	s3,140(sp)
    2dc0:	08812a03          	lw	s4,136(sp)
    2dc4:	08412a83          	lw	s5,132(sp)
    2dc8:	08012b03          	lw	s6,128(sp)
    2dcc:	07c12b83          	lw	s7,124(sp)
    2dd0:	07812c03          	lw	s8,120(sp)
    2dd4:	07412c83          	lw	s9,116(sp)
    2dd8:	07012d03          	lw	s10,112(sp)
    2ddc:	06c12d83          	lw	s11,108(sp)
    2de0:	0a010113          	addi	sp,sp,160
    2de4:	00008067          	ret
    2de8:	5b4000ef          	jal	339c <__mulsi3>
    2dec:	00155793          	srli	a5,a0,0x1
    2df0:	00678793          	addi	a5,a5,6
    2df4:	0037d693          	srli	a3,a5,0x3
    2df8:	00dc0c33          	add	s8,s8,a3
    2dfc:	000c4703          	lbu	a4,0(s8)
    2e00:	0077f793          	andi	a5,a5,7
    2e04:	40fad7b3          	sra	a5,s5,a5
    2e08:	00e7e733          	or	a4,a5,a4
    2e0c:	00ec0023          	sb	a4,0(s8)
    2e10:	dc5ff06f          	j	2bd4 <initframe+0x9e0>
    2e14:	00098c13          	mv	s8,s3
    2e18:	000b8593          	mv	a1,s7
    2e1c:	f49ff06f          	j	2d64 <initframe+0xb70>
    2e20:	ff778b13          	addi	s6,a5,-9
    2e24:	41ab0b33          	sub	s6,s6,s10
    2e28:	0ff9fc93          	zext.b	s9,s3
    2e2c:	0ffb7b13          	zext.b	s6,s6
    2e30:	000d0813          	mv	a6,s10
    2e34:	000c8513          	mv	a0,s9
    2e38:	019b6663          	bltu	s6,s9,2e44 <initframe+0xc50>
    2e3c:	000b0513          	mv	a0,s6
    2e40:	000c8b13          	mv	s6,s9
    2e44:	00150593          	addi	a1,a0,1
    2e48:	01012623          	sw	a6,12(sp)
    2e4c:	550000ef          	jal	339c <__mulsi3>
    2e50:	62892583          	lw	a1,1576(s2)
    2e54:	00155513          	srli	a0,a0,0x1
    2e58:	00ab0b33          	add	s6,s6,a0
    2e5c:	003b5793          	srli	a5,s6,0x3
    2e60:	00f585b3          	add	a1,a1,a5
    2e64:	0005c503          	lbu	a0,0(a1)
    2e68:	007b7b13          	andi	s6,s6,7
    2e6c:	416ad7b3          	sra	a5,s5,s6
    2e70:	00a7e7b3          	or	a5,a5,a0
    2e74:	00f58023          	sb	a5,0(a1)
    2e78:	621dc503          	lbu	a0,1569(s11)
    2e7c:	00c12803          	lw	a6,12(sp)
    2e80:	000c8893          	mv	a7,s9
    2e84:	ff750513          	addi	a0,a0,-9
    2e88:	41050533          	sub	a0,a0,a6
    2e8c:	0ff57513          	zext.b	a0,a0
    2e90:	00ace663          	bltu	s9,a0,2e9c <initframe+0xca8>
    2e94:	00050c93          	mv	s9,a0
    2e98:	00088513          	mv	a0,a7
    2e9c:	00150593          	addi	a1,a0,1
    2ea0:	4fc000ef          	jal	339c <__mulsi3>
    2ea4:	62892583          	lw	a1,1576(s2)
    2ea8:	00155513          	srli	a0,a0,0x1
    2eac:	00ac8633          	add	a2,s9,a0
    2eb0:	00365793          	srli	a5,a2,0x3
    2eb4:	00f585b3          	add	a1,a1,a5
    2eb8:	0005c503          	lbu	a0,0(a1)
    2ebc:	00767613          	andi	a2,a2,7
    2ec0:	40cad7b3          	sra	a5,s5,a2
    2ec4:	00a7e7b3          	or	a5,a5,a0
    2ec8:	00f58023          	sb	a5,0(a1)
    2ecc:	e05ff06f          	j	2cd0 <initframe+0xadc>
    2ed0:	621dc783          	lbu	a5,1569(s11)
    2ed4:	00500713          	li	a4,5
    2ed8:	04e12e23          	sw	a4,92(sp)
    2edc:	00200713          	li	a4,2
    2ee0:	00e12823          	sw	a4,16(sp)
    2ee4:	ffe78713          	addi	a4,a5,-2
    2ee8:	0ff77713          	zext.b	a4,a4
    2eec:	ff978693          	addi	a3,a5,-7
    2ef0:	02e12023          	sw	a4,32(sp)
    2ef4:	ffa78793          	addi	a5,a5,-6
    2ef8:	0ff7f993          	zext.b	s3,a5
    2efc:	02012783          	lw	a5,32(sp)
    2f00:	0ff6f693          	zext.b	a3,a3
    2f04:	00668713          	addi	a4,a3,6
    2f08:	02f12223          	sw	a5,36(sp)
    2f0c:	00500793          	li	a5,5
    2f10:	00f12e23          	sw	a5,28(sp)
    2f14:	00200793          	li	a5,2
    2f18:	04f12c23          	sw	a5,88(sp)
    2f1c:	00100793          	li	a5,1
    2f20:	00e12a23          	sw	a4,20(sp)
    2f24:	04f12a23          	sw	a5,84(sp)
    2f28:	00268713          	addi	a4,a3,2
    2f2c:	02f12423          	sw	a5,40(sp)
    2f30:	00800793          	li	a5,8
    2f34:	02e12823          	sw	a4,48(sp)
    2f38:	02f12a23          	sw	a5,52(sp)
    2f3c:	00468713          	addi	a4,a3,4
    2f40:	02000793          	li	a5,32
    2f44:	04d12023          	sw	a3,64(sp)
    2f48:	00068d13          	mv	s10,a3
    2f4c:	00368593          	addi	a1,a3,3
    2f50:	02e12c23          	sw	a4,56(sp)
    2f54:	02012e23          	sw	zero,60(sp)
    2f58:	04f12623          	sw	a5,76(sp)
    2f5c:	04012823          	sw	zero,80(sp)
    2f60:	00000c93          	li	s9,0
    2f64:	08000b13          	li	s6,128
    2f68:	00012c23          	sw	zero,24(sp)
    2f6c:	01000c13          	li	s8,16
    2f70:	00000a93          	li	s5,0
    2f74:	02012623          	sw	zero,44(sp)
    2f78:	00000613          	li	a2,0
    2f7c:	ba4ff06f          	j	2320 <initframe+0x12c>
    2f80:	622a4603          	lbu	a2,1570(s4)
    2f84:	00600713          	li	a4,6
    2f88:	c8c760e3          	bltu	a4,a2,2c08 <initframe+0xa14>
    2f8c:	d75ff06f          	j	2d00 <initframe+0xb0c>

00002f90 <freeframe>:
    2f90:	000017b7          	lui	a5,0x1
    2f94:	62c7a503          	lw	a0,1580(a5) # 162c <framebase>
    2f98:	ff010113          	addi	sp,sp,-16
    2f9c:	00112623          	sw	ra,12(sp)
    2fa0:	b78fd0ef          	jal	318 <free_beebs>
    2fa4:	000017b7          	lui	a5,0x1
    2fa8:	6287a503          	lw	a0,1576(a5) # 1628 <framask>
    2fac:	b6cfd0ef          	jal	318 <free_beebs>
    2fb0:	000017b7          	lui	a5,0x1
    2fb4:	00c12083          	lw	ra,12(sp)
    2fb8:	6247a503          	lw	a0,1572(a5) # 1624 <rlens>
    2fbc:	01010113          	addi	sp,sp,16
    2fc0:	b58fd06f          	j	318 <free_beebs>

00002fc4 <initecc>:
    2fc4:	00259793          	slli	a5,a1,0x2
    2fc8:	01178793          	addi	a5,a5,17
    2fcc:	fe010113          	addi	sp,sp,-32
    2fd0:	0ff7f793          	zext.b	a5,a5
    2fd4:	00812c23          	sw	s0,24(sp)
    2fd8:	00058413          	mv	s0,a1
    2fdc:	00778593          	addi	a1,a5,7
    2fe0:	01212823          	sw	s2,16(sp)
    2fe4:	4035d593          	srai	a1,a1,0x3
    2fe8:	00001637          	lui	a2,0x1
    2fec:	000016b7          	lui	a3,0x1
    2ff0:	00001737          	lui	a4,0x1
    2ff4:	00050913          	mv	s2,a0
    2ff8:	00078513          	mv	a0,a5
    2ffc:	00912a23          	sw	s1,20(sp)
    3000:	62f680a3          	sb	a5,1569(a3) # 1621 <WD>
    3004:	00112e23          	sw	ra,28(sp)
    3008:	01312623          	sw	s3,12(sp)
    300c:	01412423          	sw	s4,8(sp)
    3010:	01512223          	sw	s5,4(sp)
    3014:	62860123          	sb	s0,1570(a2) # 1622 <VERSION>
    3018:	62b70023          	sb	a1,1568(a4) # 1620 <WDB>
    301c:	380000ef          	jal	339c <__mulsi3>
    3020:	30000793          	li	a5,768
    3024:	00078493          	mv	s1,a5
    3028:	00f54463          	blt	a0,a5,3030 <initecc+0x6c>
    302c:	00050493          	mv	s1,a0
    3030:	00048513          	mv	a0,s1
    3034:	9d8fd0ef          	jal	20c <malloc_beebs>
    3038:	00241413          	slli	s0,s0,0x2
    303c:	01240433          	add	s0,s0,s2
    3040:	000017b7          	lui	a5,0x1
    3044:	00241413          	slli	s0,s0,0x2
    3048:	2a078793          	addi	a5,a5,672 # 12a0 <eccblocks>
    304c:	008787b3          	add	a5,a5,s0
    3050:	fec7c703          	lbu	a4,-20(a5)
    3054:	fed7c403          	lbu	s0,-19(a5)
    3058:	fee7c983          	lbu	s3,-18(a5)
    305c:	fef7c783          	lbu	a5,-17(a5)
    3060:	000018b7          	lui	a7,0x1
    3064:	00050813          	mv	a6,a0
    3068:	00001637          	lui	a2,0x1
    306c:	000016b7          	lui	a3,0x1
    3070:	01378533          	add	a0,a5,s3
    3074:	61288a23          	sb	s2,1556(a7) # 1614 <ECCLEVEL>
    3078:	008705b3          	add	a1,a4,s0
    307c:	00001a37          	lui	s4,0x1
    3080:	00001ab7          	lui	s5,0x1
    3084:	00001937          	lui	s2,0x1
    3088:	60f68823          	sb	a5,1552(a3) # 1610 <eccblkwid>
    308c:	61062c23          	sw	a6,1560(a2) # 1618 <qrframe>
    3090:	60ea09a3          	sb	a4,1555(s4) # 1613 <neccblk1>
    3094:	608a8923          	sb	s0,1554(s5) # 1612 <neccblk2>
    3098:	613908a3          	sb	s3,1553(s2) # 1611 <datablkw>
    309c:	300000ef          	jal	339c <__mulsi3>
    30a0:	013507b3          	add	a5,a0,s3
    30a4:	00878533          	add	a0,a5,s0
    30a8:	00957463          	bgeu	a0,s1,30b0 <initecc+0xec>
    30ac:	00048513          	mv	a0,s1
    30b0:	95cfd0ef          	jal	20c <malloc_beebs>
    30b4:	00050713          	mv	a4,a0
    30b8:	612ac403          	lbu	s0,1554(s5)
    30bc:	613a4503          	lbu	a0,1555(s4)
    30c0:	61194583          	lbu	a1,1553(s2)
    30c4:	000017b7          	lui	a5,0x1
    30c8:	00850533          	add	a0,a0,s0
    30cc:	60e7ae23          	sw	a4,1564(a5) # 161c <strinbuf>
    30d0:	2cc000ef          	jal	339c <__mulsi3>
    30d4:	01c12083          	lw	ra,28(sp)
    30d8:	00850533          	add	a0,a0,s0
    30dc:	01812403          	lw	s0,24(sp)
    30e0:	01412483          	lw	s1,20(sp)
    30e4:	01012903          	lw	s2,16(sp)
    30e8:	00c12983          	lw	s3,12(sp)
    30ec:	00812a03          	lw	s4,8(sp)
    30f0:	00412a83          	lw	s5,4(sp)
    30f4:	ffd50513          	addi	a0,a0,-3
    30f8:	02010113          	addi	sp,sp,32
    30fc:	00008067          	ret

00003100 <initeccsize>:
    3100:	fd010113          	addi	sp,sp,-48
    3104:	000017b7          	lui	a5,0x1
    3108:	02812423          	sw	s0,40(sp)
    310c:	2a078793          	addi	a5,a5,672 # 12a0 <eccblocks>
    3110:	00251413          	slli	s0,a0,0x2
    3114:	03212023          	sw	s2,32(sp)
    3118:	01512a23          	sw	s5,20(sp)
    311c:	01612823          	sw	s6,16(sp)
    3120:	01712623          	sw	s7,12(sp)
    3124:	02112623          	sw	ra,44(sp)
    3128:	02912223          	sw	s1,36(sp)
    312c:	01312e23          	sw	s3,28(sp)
    3130:	01412c23          	sw	s4,24(sp)
    3134:	00050b13          	mv	s6,a0
    3138:	00f40433          	add	s0,s0,a5
    313c:	00058a93          	mv	s5,a1
    3140:	00100913          	li	s2,1
    3144:	02800b93          	li	s7,40
    3148:	0100006f          	j	3158 <initeccsize+0x58>
    314c:	0ff7f913          	zext.b	s2,a5
    3150:	01040413          	addi	s0,s0,16
    3154:	03790663          	beq	s2,s7,3180 <initeccsize+0x80>
    3158:	ffd44483          	lbu	s1,-3(s0)
    315c:	ffc44a03          	lbu	s4,-4(s0)
    3160:	ffe44983          	lbu	s3,-2(s0)
    3164:	009a0533          	add	a0,s4,s1
    3168:	00098593          	mv	a1,s3
    316c:	230000ef          	jal	339c <__mulsi3>
    3170:	00950533          	add	a0,a0,s1
    3174:	ffd50513          	addi	a0,a0,-3
    3178:	00190793          	addi	a5,s2,1
    317c:	fcaaf8e3          	bgeu	s5,a0,314c <initeccsize+0x4c>
    3180:	02812403          	lw	s0,40(sp)
    3184:	000016b7          	lui	a3,0x1
    3188:	00001737          	lui	a4,0x1
    318c:	000017b7          	lui	a5,0x1
    3190:	02c12083          	lw	ra,44(sp)
    3194:	01412a83          	lw	s5,20(sp)
    3198:	00c12b83          	lw	s7,12(sp)
    319c:	614689a3          	sb	s4,1555(a3) # 1613 <neccblk1>
    31a0:	60970923          	sb	s1,1554(a4) # 1612 <neccblk2>
    31a4:	01812a03          	lw	s4,24(sp)
    31a8:	02412483          	lw	s1,36(sp)
    31ac:	613788a3          	sb	s3,1553(a5) # 1611 <datablkw>
    31b0:	00090593          	mv	a1,s2
    31b4:	01c12983          	lw	s3,28(sp)
    31b8:	02012903          	lw	s2,32(sp)
    31bc:	000b0513          	mv	a0,s6
    31c0:	01012b03          	lw	s6,16(sp)
    31c4:	03010113          	addi	sp,sp,48
    31c8:	dfdff06f          	j	2fc4 <initecc>

000031cc <freeecc>:
    31cc:	000017b7          	lui	a5,0x1
    31d0:	6187a503          	lw	a0,1560(a5) # 1618 <qrframe>
    31d4:	ff010113          	addi	sp,sp,-16
    31d8:	00112623          	sw	ra,12(sp)
    31dc:	93cfd0ef          	jal	318 <free_beebs>
    31e0:	000017b7          	lui	a5,0x1
    31e4:	00c12083          	lw	ra,12(sp)
    31e8:	61c7a503          	lw	a0,1564(a5) # 161c <strinbuf>
    31ec:	01010113          	addi	sp,sp,16
    31f0:	928fd06f          	j	318 <free_beebs>

000031f4 <benchmark_body.isra.0>:
    31f4:	0e058463          	beqz	a1,32dc <benchmark_body.isra.0+0xe8>
    31f8:	fd010113          	addi	sp,sp,-48
    31fc:	01412c23          	sw	s4,24(sp)
    3200:	01512a23          	sw	s5,20(sp)
    3204:	00001a37          	lui	s4,0x1
    3208:	00001ab7          	lui	s5,0x1
    320c:	02912223          	sw	s1,36(sp)
    3210:	03212023          	sw	s2,32(sp)
    3214:	01312e23          	sw	s3,28(sp)
    3218:	01612823          	sw	s6,16(sp)
    321c:	01712623          	sw	s7,12(sp)
    3220:	01812423          	sw	s8,8(sp)
    3224:	01912223          	sw	s9,4(sp)
    3228:	02112623          	sw	ra,44(sp)
    322c:	02812423          	sw	s0,40(sp)
    3230:	00050c13          	mv	s8,a0
    3234:	00058993          	mv	s3,a1
    3238:	5d4a8a93          	addi	s5,s5,1492 # 15d4 <adelta+0x2c>
    323c:	638a0a13          	addi	s4,s4,1592 # 1638 <heap>
    3240:	00000c93          	li	s9,0
    3244:	00001937          	lui	s2,0x1
    3248:	000014b7          	lui	s1,0x1
    324c:	00001bb7          	lui	s7,0x1
    3250:	01600b13          	li	s6,22
    3254:	00000413          	li	s0,0
    3258:	000025b7          	lui	a1,0x2
    325c:	000a0513          	mv	a0,s4
    3260:	63592a23          	sw	s5,1588(s2) # 1634 <encode>
    3264:	6364a823          	sw	s6,1584(s1) # 1630 <size>
    3268:	f59fc0ef          	jal	1c0 <init_heap_beebs>
    326c:	6304a583          	lw	a1,1584(s1)
    3270:	00100513          	li	a0,1
    3274:	00140413          	addi	s0,s0,1
    3278:	e89ff0ef          	jal	3100 <initeccsize>
    327c:	6304a603          	lw	a2,1584(s1)
    3280:	63492583          	lw	a1,1588(s2)
    3284:	61cba503          	lw	a0,1564(s7) # 161c <strinbuf>
    3288:	e49fc0ef          	jal	d0 <memcpy>
    328c:	f69fe0ef          	jal	21f4 <initframe>
    3290:	d59fd0ef          	jal	fe8 <qrencode>
    3294:	cfdff0ef          	jal	2f90 <freeframe>
    3298:	f35ff0ef          	jal	31cc <freeecc>
    329c:	fb341ee3          	bne	s0,s3,3258 <benchmark_body.isra.0+0x64>
    32a0:	001c8c93          	addi	s9,s9,1
    32a4:	fb9c18e3          	bne	s8,s9,3254 <benchmark_body.isra.0+0x60>
    32a8:	02c12083          	lw	ra,44(sp)
    32ac:	02812403          	lw	s0,40(sp)
    32b0:	02412483          	lw	s1,36(sp)
    32b4:	02012903          	lw	s2,32(sp)
    32b8:	01c12983          	lw	s3,28(sp)
    32bc:	01812a03          	lw	s4,24(sp)
    32c0:	01412a83          	lw	s5,20(sp)
    32c4:	01012b03          	lw	s6,16(sp)
    32c8:	00c12b83          	lw	s7,12(sp)
    32cc:	00812c03          	lw	s8,8(sp)
    32d0:	00412c83          	lw	s9,4(sp)
    32d4:	03010113          	addi	sp,sp,48
    32d8:	00008067          	ret
    32dc:	00008067          	ret

000032e0 <warm_caches>:
    32e0:	00050593          	mv	a1,a0
    32e4:	00100513          	li	a0,1
    32e8:	f0dff06f          	j	31f4 <benchmark_body.isra.0>

000032ec <benchmark>:
    32ec:	ff010113          	addi	sp,sp,-16
    32f0:	00200513          	li	a0,2
    32f4:	00100593          	li	a1,1
    32f8:	00112623          	sw	ra,12(sp)
    32fc:	ef9ff0ef          	jal	31f4 <benchmark_body.isra.0>
    3300:	00c12083          	lw	ra,12(sp)
    3304:	00000513          	li	a0,0
    3308:	01010113          	addi	sp,sp,16
    330c:	00008067          	ret

00003310 <initialise_benchmark>:
    3310:	00008067          	ret

00003314 <verify_benchmark>:
    3314:	000017b7          	lui	a5,0x1
    3318:	5ec78793          	addi	a5,a5,1516 # 15ec <adelta+0x44>
    331c:	00001637          	lui	a2,0x1
    3320:	0007a303          	lw	t1,0(a5)
    3324:	0047a883          	lw	a7,4(a5)
    3328:	0087a803          	lw	a6,8(a5)
    332c:	00c7a683          	lw	a3,12(a5)
    3330:	0107a703          	lw	a4,16(a5)
    3334:	61c62503          	lw	a0,1564(a2) # 161c <strinbuf>
    3338:	0147d783          	lhu	a5,20(a5)
    333c:	fd010113          	addi	sp,sp,-48
    3340:	01600613          	li	a2,22
    3344:	00810593          	addi	a1,sp,8
    3348:	00f11e23          	sh	a5,28(sp)
    334c:	02112623          	sw	ra,44(sp)
    3350:	00612423          	sw	t1,8(sp)
    3354:	01112623          	sw	a7,12(sp)
    3358:	01012823          	sw	a6,16(sp)
    335c:	00d12a23          	sw	a3,20(sp)
    3360:	00e12c23          	sw	a4,24(sp)
    3364:	e01fc0ef          	jal	164 <memcmp>
    3368:	00050793          	mv	a5,a0
    336c:	00000513          	li	a0,0
    3370:	00078863          	beqz	a5,3380 <verify_benchmark+0x6c>
    3374:	02c12083          	lw	ra,44(sp)
    3378:	03010113          	addi	sp,sp,48
    337c:	00008067          	ret
    3380:	00001537          	lui	a0,0x1
    3384:	63850513          	addi	a0,a0,1592 # 1638 <heap>
    3388:	e65fc0ef          	jal	1ec <check_heap_beebs>
    338c:	02c12083          	lw	ra,44(sp)
    3390:	00a03533          	snez	a0,a0
    3394:	03010113          	addi	sp,sp,48
    3398:	00008067          	ret

0000339c <__mulsi3>:
    339c:	00050613          	mv	a2,a0
    33a0:	00000513          	li	a0,0
    33a4:	0015f693          	andi	a3,a1,1
    33a8:	00068463          	beqz	a3,33b0 <__mulsi3+0x14>
    33ac:	00c50533          	add	a0,a0,a2
    33b0:	0015d593          	srli	a1,a1,0x1
    33b4:	00161613          	slli	a2,a2,0x1
    33b8:	fe0596e3          	bnez	a1,33a4 <__mulsi3+0x8>
    33bc:	00008067          	ret
