
D:\aaa1verilog_project\rv32i_cpu\benchmark\embench\build\picojpeg\picojpeg.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
       0:	00008117          	auipc	sp,0x8
       4:	f0010113          	addi	sp,sp,-256 # 7f00 <__stack_top>
       8:	00001297          	auipc	t0,0x1
       c:	42c28293          	addi	t0,t0,1068 # 1434 <successive_low>
      10:	00002317          	auipc	t1,0x2
      14:	d9430313          	addi	t1,t1,-620 # 1da4 <__bss_end>
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
      78:	48d030ef          	jal	3d04 <initialise_benchmark>
      7c:	00000513          	li	a0,0
      80:	489030ef          	jal	3d08 <warm_caches>
      84:	fadff0ef          	jal	30 <start_trigger>
      88:	48d030ef          	jal	3d14 <benchmark>
      8c:	00a12623          	sw	a0,12(sp)
      90:	fb5ff0ef          	jal	44 <stop_trigger>
      94:	00c12503          	lw	a0,12(sp)
      98:	3ed030ef          	jal	3c84 <verify_benchmark>
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

00000128 <upsampleCb>:
     128:	000027b7          	lui	a5,0x2
     12c:	00151e93          	slli	t4,a0,0x1
     130:	cf478793          	addi	a5,a5,-780 # 1cf4 <gCoeffBuf>
     134:	00fe8eb3          	add	t4,t4,a5
     138:	00002e37          	lui	t3,0x2
     13c:	000027b7          	lui	a5,0x2
     140:	af4e0e13          	addi	t3,t3,-1292 # 1af4 <gMCUBufG>
     144:	9f478793          	addi	a5,a5,-1548 # 19f4 <gMCUBufB>
     148:	008e8893          	addi	a7,t4,8
     14c:	00be0e33          	add	t3,t3,a1
     150:	048e8e93          	addi	t4,t4,72
     154:	00b785b3          	add	a1,a5,a1
     158:	0ff00513          	li	a0,255
     15c:	fff00313          	li	t1,-1
     160:	ff888813          	addi	a6,a7,-8
     164:	00058613          	mv	a2,a1
     168:	000e0693          	mv	a3,t3
     16c:	00084283          	lbu	t0,0(a6)
     170:	0006cf03          	lbu	t5,0(a3)
     174:	0016cf83          	lbu	t6,1(a3)
     178:	00129793          	slli	a5,t0,0x1
     17c:	00578733          	add	a4,a5,t0
     180:	00271713          	slli	a4,a4,0x2
     184:	40570733          	sub	a4,a4,t0
     188:	00371713          	slli	a4,a4,0x3
     18c:	00875713          	srli	a4,a4,0x8
     190:	fd470713          	addi	a4,a4,-44
     194:	40ef0f33          	sub	t5,t5,a4
     198:	010f1f13          	slli	t5,t5,0x10
     19c:	40ef8fb3          	sub	t6,t6,a4
     1a0:	010f9f93          	slli	t6,t6,0x10
     1a4:	010f5f13          	srli	t5,t5,0x10
     1a8:	00280813          	addi	a6,a6,2
     1ac:	010fdf93          	srli	t6,t6,0x10
     1b0:	01e57a63          	bgeu	a0,t5,1c4 <upsampleCb+0x9c>
     1b4:	010f1393          	slli	t2,t5,0x10
     1b8:	4103d393          	srai	t2,t2,0x10
     1bc:	00000f13          	li	t5,0
     1c0:	1803d263          	bgez	t2,344 <upsampleCb+0x21c>
     1c4:	01e68023          	sb	t5,0(a3)
     1c8:	01f57a63          	bgeu	a0,t6,1dc <upsampleCb+0xb4>
     1cc:	010f9f13          	slli	t5,t6,0x10
     1d0:	410f5f13          	srai	t5,t5,0x10
     1d4:	00000f93          	li	t6,0
     1d8:	160f5a63          	bgez	t5,34c <upsampleCb+0x224>
     1dc:	0086cf03          	lbu	t5,8(a3)
     1e0:	01f680a3          	sb	t6,1(a3)
     1e4:	40ef0f33          	sub	t5,t5,a4
     1e8:	010f1f13          	slli	t5,t5,0x10
     1ec:	010f5f13          	srli	t5,t5,0x10
     1f0:	01e57a63          	bgeu	a0,t5,204 <upsampleCb+0xdc>
     1f4:	010f1f93          	slli	t6,t5,0x10
     1f8:	410fdf93          	srai	t6,t6,0x10
     1fc:	00000f13          	li	t5,0
     200:	160fd263          	bgez	t6,364 <upsampleCb+0x23c>
     204:	0096cf83          	lbu	t6,9(a3)
     208:	01e68423          	sb	t5,8(a3)
     20c:	40ef8733          	sub	a4,t6,a4
     210:	01071713          	slli	a4,a4,0x10
     214:	01075713          	srli	a4,a4,0x10
     218:	16e57463          	bgeu	a0,a4,380 <upsampleCb+0x258>
     21c:	fff74713          	not	a4,a4
     220:	01071f13          	slli	t5,a4,0x10
     224:	41ff5f93          	srai	t6,t5,0x1f
     228:	005787b3          	add	a5,a5,t0
     22c:	00579713          	slli	a4,a5,0x5
     230:	00e787b3          	add	a5,a5,a4
     234:	00064703          	lbu	a4,0(a2)
     238:	00164f03          	lbu	t5,1(a2)
     23c:	f1d28293          	addi	t0,t0,-227
     240:	0077d793          	srli	a5,a5,0x7
     244:	005787b3          	add	a5,a5,t0
     248:	00e78733          	add	a4,a5,a4
     24c:	01071713          	slli	a4,a4,0x10
     250:	01e78f33          	add	t5,a5,t5
     254:	010f1f13          	slli	t5,t5,0x10
     258:	01075713          	srli	a4,a4,0x10
     25c:	01f684a3          	sb	t6,9(a3)
     260:	010f5f13          	srli	t5,t5,0x10
     264:	00e57a63          	bgeu	a0,a4,278 <upsampleCb+0x150>
     268:	01071f93          	slli	t6,a4,0x10
     26c:	410fdf93          	srai	t6,t6,0x10
     270:	00000713          	li	a4,0
     274:	080fd663          	bgez	t6,300 <upsampleCb+0x1d8>
     278:	00e60023          	sb	a4,0(a2)
     27c:	01e57a63          	bgeu	a0,t5,290 <upsampleCb+0x168>
     280:	010f1713          	slli	a4,t5,0x10
     284:	41075713          	srai	a4,a4,0x10
     288:	00000f13          	li	t5,0
     28c:	06075e63          	bgez	a4,308 <upsampleCb+0x1e0>
     290:	00864703          	lbu	a4,8(a2)
     294:	01e600a3          	sb	t5,1(a2)
     298:	00e78733          	add	a4,a5,a4
     29c:	01071713          	slli	a4,a4,0x10
     2a0:	01075713          	srli	a4,a4,0x10
     2a4:	00e57a63          	bgeu	a0,a4,2b8 <upsampleCb+0x190>
     2a8:	01071f13          	slli	t5,a4,0x10
     2ac:	410f5f13          	srai	t5,t5,0x10
     2b0:	00000713          	li	a4,0
     2b4:	060f5663          	bgez	t5,320 <upsampleCb+0x1f8>
     2b8:	00964f03          	lbu	t5,9(a2)
     2bc:	00e60423          	sb	a4,8(a2)
     2c0:	01e787b3          	add	a5,a5,t5
     2c4:	01079793          	slli	a5,a5,0x10
     2c8:	0107d793          	srli	a5,a5,0x10
     2cc:	06f57863          	bgeu	a0,a5,33c <upsampleCb+0x214>
     2d0:	fff7c793          	not	a5,a5
     2d4:	01079f13          	slli	t5,a5,0x10
     2d8:	41ff5713          	srai	a4,t5,0x1f
     2dc:	00e604a3          	sb	a4,9(a2)
     2e0:	00268693          	addi	a3,a3,2
     2e4:	00260613          	addi	a2,a2,2
     2e8:	e91812e3          	bne	a6,a7,16c <upsampleCb+0x44>
     2ec:	01080893          	addi	a7,a6,16
     2f0:	010e0e13          	addi	t3,t3,16
     2f4:	01058593          	addi	a1,a1,16
     2f8:	e7d894e3          	bne	a7,t4,160 <upsampleCb+0x38>
     2fc:	00008067          	ret
     300:	00660023          	sb	t1,0(a2)
     304:	f9e576e3          	bgeu	a0,t5,290 <upsampleCb+0x168>
     308:	00864703          	lbu	a4,8(a2)
     30c:	006600a3          	sb	t1,1(a2)
     310:	00e78733          	add	a4,a5,a4
     314:	01071713          	slli	a4,a4,0x10
     318:	01075713          	srli	a4,a4,0x10
     31c:	f8e57ee3          	bgeu	a0,a4,2b8 <upsampleCb+0x190>
     320:	00964f03          	lbu	t5,9(a2)
     324:	00660423          	sb	t1,8(a2)
     328:	0ff00713          	li	a4,255
     32c:	01e787b3          	add	a5,a5,t5
     330:	01079793          	slli	a5,a5,0x10
     334:	0107d793          	srli	a5,a5,0x10
     338:	faf562e3          	bltu	a0,a5,2dc <upsampleCb+0x1b4>
     33c:	00078713          	mv	a4,a5
     340:	f9dff06f          	j	2dc <upsampleCb+0x1b4>
     344:	00668023          	sb	t1,0(a3)
     348:	e9f57ae3          	bgeu	a0,t6,1dc <upsampleCb+0xb4>
     34c:	0086cf03          	lbu	t5,8(a3)
     350:	006680a3          	sb	t1,1(a3)
     354:	40ef0f33          	sub	t5,t5,a4
     358:	010f1f13          	slli	t5,t5,0x10
     35c:	010f5f13          	srli	t5,t5,0x10
     360:	ebe572e3          	bgeu	a0,t5,204 <upsampleCb+0xdc>
     364:	0096cf03          	lbu	t5,9(a3)
     368:	00668423          	sb	t1,8(a3)
     36c:	0ff00f93          	li	t6,255
     370:	40ef0733          	sub	a4,t5,a4
     374:	01071713          	slli	a4,a4,0x10
     378:	01075713          	srli	a4,a4,0x10
     37c:	eae566e3          	bltu	a0,a4,228 <upsampleCb+0x100>
     380:	00070f93          	mv	t6,a4
     384:	ea5ff06f          	j	228 <upsampleCb+0x100>

00000388 <upsampleCbH>:
     388:	000027b7          	lui	a5,0x2
     38c:	cf478793          	addi	a5,a5,-780 # 1cf4 <gCoeffBuf>
     390:	00151e13          	slli	t3,a0,0x1
     394:	00fe0e33          	add	t3,t3,a5
     398:	00002337          	lui	t1,0x2
     39c:	000027b7          	lui	a5,0x2
     3a0:	af430313          	addi	t1,t1,-1292 # 1af4 <gMCUBufG>
     3a4:	9f478793          	addi	a5,a5,-1548 # 19f4 <gMCUBufB>
     3a8:	008e0893          	addi	a7,t3,8
     3ac:	00b30333          	add	t1,t1,a1
     3b0:	088e0e13          	addi	t3,t3,136
     3b4:	00b785b3          	add	a1,a5,a1
     3b8:	0ff00813          	li	a6,255
     3bc:	fff00e93          	li	t4,-1
     3c0:	ff888513          	addi	a0,a7,-8
     3c4:	00058613          	mv	a2,a1
     3c8:	00030693          	mv	a3,t1
     3cc:	00054f83          	lbu	t6,0(a0)
     3d0:	0006cf03          	lbu	t5,0(a3)
     3d4:	0016c283          	lbu	t0,1(a3)
     3d8:	001f9793          	slli	a5,t6,0x1
     3dc:	01f78733          	add	a4,a5,t6
     3e0:	00271713          	slli	a4,a4,0x2
     3e4:	41f70733          	sub	a4,a4,t6
     3e8:	00371713          	slli	a4,a4,0x3
     3ec:	00875713          	srli	a4,a4,0x8
     3f0:	fd470713          	addi	a4,a4,-44
     3f4:	40ef0f33          	sub	t5,t5,a4
     3f8:	010f1f13          	slli	t5,t5,0x10
     3fc:	40e28733          	sub	a4,t0,a4
     400:	01071713          	slli	a4,a4,0x10
     404:	010f5f13          	srli	t5,t5,0x10
     408:	00250513          	addi	a0,a0,2
     40c:	01075713          	srli	a4,a4,0x10
     410:	01e87a63          	bgeu	a6,t5,424 <upsampleCbH+0x9c>
     414:	010f1293          	slli	t0,t5,0x10
     418:	4102d293          	srai	t0,t0,0x10
     41c:	00000f13          	li	t5,0
     420:	0a02da63          	bgez	t0,4d4 <upsampleCbH+0x14c>
     424:	01e68023          	sb	t5,0(a3)
     428:	0ae87c63          	bgeu	a6,a4,4e0 <upsampleCbH+0x158>
     42c:	fff74713          	not	a4,a4
     430:	01071293          	slli	t0,a4,0x10
     434:	41f2df13          	srai	t5,t0,0x1f
     438:	01f787b3          	add	a5,a5,t6
     43c:	00579713          	slli	a4,a5,0x5
     440:	00e787b3          	add	a5,a5,a4
     444:	f1df8f93          	addi	t6,t6,-227
     448:	00064703          	lbu	a4,0(a2)
     44c:	0077d793          	srli	a5,a5,0x7
     450:	01f787b3          	add	a5,a5,t6
     454:	00164f83          	lbu	t6,1(a2)
     458:	00e78733          	add	a4,a5,a4
     45c:	01071713          	slli	a4,a4,0x10
     460:	01f787b3          	add	a5,a5,t6
     464:	01079793          	slli	a5,a5,0x10
     468:	01075713          	srli	a4,a4,0x10
     46c:	01e680a3          	sb	t5,1(a3)
     470:	0107d793          	srli	a5,a5,0x10
     474:	00e87a63          	bgeu	a6,a4,488 <upsampleCbH+0x100>
     478:	01071f13          	slli	t5,a4,0x10
     47c:	410f5f13          	srai	t5,t5,0x10
     480:	00000713          	li	a4,0
     484:	020f5e63          	bgez	t5,4c0 <upsampleCbH+0x138>
     488:	00e60023          	sb	a4,0(a2)
     48c:	04f87063          	bgeu	a6,a5,4cc <upsampleCbH+0x144>
     490:	fff7c793          	not	a5,a5
     494:	01079f13          	slli	t5,a5,0x10
     498:	41ff5713          	srai	a4,t5,0x1f
     49c:	00e600a3          	sb	a4,1(a2)
     4a0:	00268693          	addi	a3,a3,2
     4a4:	00260613          	addi	a2,a2,2
     4a8:	f31512e3          	bne	a0,a7,3cc <upsampleCbH+0x44>
     4ac:	01050893          	addi	a7,a0,16
     4b0:	00858593          	addi	a1,a1,8
     4b4:	00830313          	addi	t1,t1,8
     4b8:	f11e14e3          	bne	t3,a7,3c0 <upsampleCbH+0x38>
     4bc:	00008067          	ret
     4c0:	01d60023          	sb	t4,0(a2)
     4c4:	0ff00713          	li	a4,255
     4c8:	fcf86ae3          	bltu	a6,a5,49c <upsampleCbH+0x114>
     4cc:	00078713          	mv	a4,a5
     4d0:	fcdff06f          	j	49c <upsampleCbH+0x114>
     4d4:	01d68023          	sb	t4,0(a3)
     4d8:	0ff00f13          	li	t5,255
     4dc:	f4e86ee3          	bltu	a6,a4,438 <upsampleCbH+0xb0>
     4e0:	00070f13          	mv	t5,a4
     4e4:	f55ff06f          	j	438 <upsampleCbH+0xb0>

000004e8 <upsampleCbV>:
     4e8:	000027b7          	lui	a5,0x2
     4ec:	cf478793          	addi	a5,a5,-780 # 1cf4 <gCoeffBuf>
     4f0:	00002337          	lui	t1,0x2
     4f4:	00151513          	slli	a0,a0,0x1
     4f8:	00f50533          	add	a0,a0,a5
     4fc:	af430313          	addi	t1,t1,-1292 # 1af4 <gMCUBufG>
     500:	000027b7          	lui	a5,0x2
     504:	00b30333          	add	t1,t1,a1
     508:	9f478793          	addi	a5,a5,-1548 # 19f4 <gMCUBufB>
     50c:	00b785b3          	add	a1,a5,a1
     510:	01050893          	addi	a7,a0,16
     514:	04030e93          	addi	t4,t1,64
     518:	0ff00813          	li	a6,255
     51c:	fff00e13          	li	t3,-1
     520:	ff088513          	addi	a0,a7,-16
     524:	00058613          	mv	a2,a1
     528:	00030693          	mv	a3,t1
     52c:	0840006f          	j	5b0 <upsampleCbV+0xc8>
     530:	fff74713          	not	a4,a4
     534:	01071293          	slli	t0,a4,0x10
     538:	41f2df13          	srai	t5,t0,0x1f
     53c:	01f787b3          	add	a5,a5,t6
     540:	00579713          	slli	a4,a5,0x5
     544:	00e787b3          	add	a5,a5,a4
     548:	f1df8f93          	addi	t6,t6,-227
     54c:	00064703          	lbu	a4,0(a2)
     550:	0077d793          	srli	a5,a5,0x7
     554:	01f787b3          	add	a5,a5,t6
     558:	00864f83          	lbu	t6,8(a2)
     55c:	00e78733          	add	a4,a5,a4
     560:	01071713          	slli	a4,a4,0x10
     564:	01f787b3          	add	a5,a5,t6
     568:	01079793          	slli	a5,a5,0x10
     56c:	01075713          	srli	a4,a4,0x10
     570:	01e68423          	sb	t5,8(a3)
     574:	0107d793          	srli	a5,a5,0x10
     578:	00e87a63          	bgeu	a6,a4,58c <upsampleCbV+0xa4>
     57c:	01071f13          	slli	t5,a4,0x10
     580:	410f5f13          	srai	t5,t5,0x10
     584:	00000713          	li	a4,0
     588:	080f5863          	bgez	t5,618 <upsampleCbV+0x130>
     58c:	00e60023          	sb	a4,0(a2)
     590:	08f87a63          	bgeu	a6,a5,624 <upsampleCbV+0x13c>
     594:	fff7c793          	not	a5,a5
     598:	01079f13          	slli	t5,a5,0x10
     59c:	41ff5713          	srai	a4,t5,0x1f
     5a0:	00e60423          	sb	a4,8(a2)
     5a4:	00168693          	addi	a3,a3,1
     5a8:	00160613          	addi	a2,a2,1
     5ac:	09150663          	beq	a0,a7,638 <upsampleCbV+0x150>
     5b0:	00054f83          	lbu	t6,0(a0)
     5b4:	0006cf03          	lbu	t5,0(a3)
     5b8:	0086c283          	lbu	t0,8(a3)
     5bc:	001f9793          	slli	a5,t6,0x1
     5c0:	01f78733          	add	a4,a5,t6
     5c4:	00271713          	slli	a4,a4,0x2
     5c8:	41f70733          	sub	a4,a4,t6
     5cc:	00371713          	slli	a4,a4,0x3
     5d0:	00875713          	srli	a4,a4,0x8
     5d4:	fd470713          	addi	a4,a4,-44
     5d8:	40ef0f33          	sub	t5,t5,a4
     5dc:	010f1f13          	slli	t5,t5,0x10
     5e0:	40e28733          	sub	a4,t0,a4
     5e4:	01071713          	slli	a4,a4,0x10
     5e8:	010f5f13          	srli	t5,t5,0x10
     5ec:	00250513          	addi	a0,a0,2
     5f0:	01075713          	srli	a4,a4,0x10
     5f4:	01e87a63          	bgeu	a6,t5,608 <upsampleCbV+0x120>
     5f8:	010f1293          	slli	t0,t5,0x10
     5fc:	4102d293          	srai	t0,t0,0x10
     600:	00000f13          	li	t5,0
     604:	0402d463          	bgez	t0,64c <upsampleCbV+0x164>
     608:	01e68023          	sb	t5,0(a3)
     60c:	f2e862e3          	bltu	a6,a4,530 <upsampleCbV+0x48>
     610:	00070f13          	mv	t5,a4
     614:	f29ff06f          	j	53c <upsampleCbV+0x54>
     618:	01c60023          	sb	t3,0(a2)
     61c:	0ff00713          	li	a4,255
     620:	f8f860e3          	bltu	a6,a5,5a0 <upsampleCbV+0xb8>
     624:	00078713          	mv	a4,a5
     628:	00e60423          	sb	a4,8(a2)
     62c:	00168693          	addi	a3,a3,1
     630:	00160613          	addi	a2,a2,1
     634:	f7151ee3          	bne	a0,a7,5b0 <upsampleCbV+0xc8>
     638:	01030313          	addi	t1,t1,16
     63c:	01058593          	addi	a1,a1,16
     640:	01050893          	addi	a7,a0,16
     644:	edd31ee3          	bne	t1,t4,520 <upsampleCbV+0x38>
     648:	00008067          	ret
     64c:	01c68023          	sb	t3,0(a3)
     650:	0ff00f13          	li	t5,255
     654:	eee864e3          	bltu	a6,a4,53c <upsampleCbV+0x54>
     658:	00070f13          	mv	t5,a4
     65c:	ee1ff06f          	j	53c <upsampleCbV+0x54>

00000660 <upsampleCr>:
     660:	000027b7          	lui	a5,0x2
     664:	cf478793          	addi	a5,a5,-780 # 1cf4 <gCoeffBuf>
     668:	00151f13          	slli	t5,a0,0x1
     66c:	00ff0f33          	add	t5,t5,a5
     670:	00002eb7          	lui	t4,0x2
     674:	000027b7          	lui	a5,0x2
     678:	bf4e8e93          	addi	t4,t4,-1036 # 1bf4 <gMCUBufR>
     67c:	af478793          	addi	a5,a5,-1292 # 1af4 <gMCUBufG>
     680:	008f0313          	addi	t1,t5,8
     684:	00be8eb3          	add	t4,t4,a1
     688:	048f0f13          	addi	t5,t5,72
     68c:	00b785b3          	add	a1,a5,a1
     690:	0ff00813          	li	a6,255
     694:	fff00e13          	li	t3,-1
     698:	ff830893          	addi	a7,t1,-8
     69c:	00058513          	mv	a0,a1
     6a0:	000e8613          	mv	a2,t4
     6a4:	0008cf83          	lbu	t6,0(a7)
     6a8:	00064283          	lbu	t0,0(a2)
     6ac:	00164383          	lbu	t2,1(a2)
     6b0:	001f9693          	slli	a3,t6,0x1
     6b4:	01f68733          	add	a4,a3,t6
     6b8:	00271713          	slli	a4,a4,0x2
     6bc:	01f70733          	add	a4,a4,t6
     6c0:	00371713          	slli	a4,a4,0x3
     6c4:	41f70733          	sub	a4,a4,t6
     6c8:	00875713          	srli	a4,a4,0x8
     6cc:	f4df8793          	addi	a5,t6,-179
     6d0:	00f707b3          	add	a5,a4,a5
     6d4:	00578733          	add	a4,a5,t0
     6d8:	01071713          	slli	a4,a4,0x10
     6dc:	007782b3          	add	t0,a5,t2
     6e0:	01029293          	slli	t0,t0,0x10
     6e4:	01075713          	srli	a4,a4,0x10
     6e8:	00288893          	addi	a7,a7,2
     6ec:	0102d293          	srli	t0,t0,0x10
     6f0:	00e87a63          	bgeu	a6,a4,704 <upsampleCr+0xa4>
     6f4:	01071393          	slli	t2,a4,0x10
     6f8:	4103d393          	srai	t2,t2,0x10
     6fc:	00000713          	li	a4,0
     700:	1803d463          	bgez	t2,888 <upsampleCr+0x228>
     704:	00e60023          	sb	a4,0(a2)
     708:	00587a63          	bgeu	a6,t0,71c <upsampleCr+0xbc>
     70c:	01029713          	slli	a4,t0,0x10
     710:	41075713          	srai	a4,a4,0x10
     714:	00000293          	li	t0,0
     718:	16075c63          	bgez	a4,890 <upsampleCr+0x230>
     71c:	00864703          	lbu	a4,8(a2)
     720:	005600a3          	sb	t0,1(a2)
     724:	00e78733          	add	a4,a5,a4
     728:	01071713          	slli	a4,a4,0x10
     72c:	01075713          	srli	a4,a4,0x10
     730:	00e87a63          	bgeu	a6,a4,744 <upsampleCr+0xe4>
     734:	01071293          	slli	t0,a4,0x10
     738:	4102d293          	srai	t0,t0,0x10
     73c:	00000713          	li	a4,0
     740:	1602d463          	bgez	t0,8a8 <upsampleCr+0x248>
     744:	00964283          	lbu	t0,9(a2)
     748:	00e60423          	sb	a4,8(a2)
     74c:	00578733          	add	a4,a5,t0
     750:	01071713          	slli	a4,a4,0x10
     754:	01075713          	srli	a4,a4,0x10
     758:	16e87663          	bgeu	a6,a4,8c4 <upsampleCr+0x264>
     75c:	fff74713          	not	a4,a4
     760:	01071793          	slli	a5,a4,0x10
     764:	41f7d293          	srai	t0,a5,0x1f
     768:	01f687b3          	add	a5,a3,t6
     76c:	00379793          	slli	a5,a5,0x3
     770:	41f787b3          	sub	a5,a5,t6
     774:	00379793          	slli	a5,a5,0x3
     778:	00054703          	lbu	a4,0(a0)
     77c:	41f787b3          	sub	a5,a5,t6
     780:	00154683          	lbu	a3,1(a0)
     784:	0087d793          	srli	a5,a5,0x8
     788:	fa578793          	addi	a5,a5,-91
     78c:	40f70733          	sub	a4,a4,a5
     790:	01071713          	slli	a4,a4,0x10
     794:	40f686b3          	sub	a3,a3,a5
     798:	01069693          	slli	a3,a3,0x10
     79c:	005604a3          	sb	t0,9(a2)
     7a0:	01075713          	srli	a4,a4,0x10
     7a4:	0106d693          	srli	a3,a3,0x10
     7a8:	00e87a63          	bgeu	a6,a4,7bc <upsampleCr+0x15c>
     7ac:	01071f93          	slli	t6,a4,0x10
     7b0:	410fdf93          	srai	t6,t6,0x10
     7b4:	00000713          	li	a4,0
     7b8:	080fd663          	bgez	t6,844 <upsampleCr+0x1e4>
     7bc:	00e50023          	sb	a4,0(a0)
     7c0:	00d87a63          	bgeu	a6,a3,7d4 <upsampleCr+0x174>
     7c4:	01069713          	slli	a4,a3,0x10
     7c8:	41075713          	srai	a4,a4,0x10
     7cc:	00000693          	li	a3,0
     7d0:	06075e63          	bgez	a4,84c <upsampleCr+0x1ec>
     7d4:	00854703          	lbu	a4,8(a0)
     7d8:	00d500a3          	sb	a3,1(a0)
     7dc:	40f70733          	sub	a4,a4,a5
     7e0:	01071713          	slli	a4,a4,0x10
     7e4:	01075713          	srli	a4,a4,0x10
     7e8:	00e87a63          	bgeu	a6,a4,7fc <upsampleCr+0x19c>
     7ec:	01071693          	slli	a3,a4,0x10
     7f0:	4106d693          	srai	a3,a3,0x10
     7f4:	00000713          	li	a4,0
     7f8:	0606d663          	bgez	a3,864 <upsampleCr+0x204>
     7fc:	00954683          	lbu	a3,9(a0)
     800:	00e50423          	sb	a4,8(a0)
     804:	40f687b3          	sub	a5,a3,a5
     808:	01079793          	slli	a5,a5,0x10
     80c:	0107d793          	srli	a5,a5,0x10
     810:	06f87863          	bgeu	a6,a5,880 <upsampleCr+0x220>
     814:	fff7c793          	not	a5,a5
     818:	01079713          	slli	a4,a5,0x10
     81c:	41f75693          	srai	a3,a4,0x1f
     820:	00d504a3          	sb	a3,9(a0)
     824:	00260613          	addi	a2,a2,2
     828:	00250513          	addi	a0,a0,2
     82c:	e6689ce3          	bne	a7,t1,6a4 <upsampleCr+0x44>
     830:	01088313          	addi	t1,a7,16
     834:	010e8e93          	addi	t4,t4,16
     838:	01058593          	addi	a1,a1,16
     83c:	e5e31ee3          	bne	t1,t5,698 <upsampleCr+0x38>
     840:	00008067          	ret
     844:	01c50023          	sb	t3,0(a0)
     848:	f8d876e3          	bgeu	a6,a3,7d4 <upsampleCr+0x174>
     84c:	00854703          	lbu	a4,8(a0)
     850:	01c500a3          	sb	t3,1(a0)
     854:	40f70733          	sub	a4,a4,a5
     858:	01071713          	slli	a4,a4,0x10
     85c:	01075713          	srli	a4,a4,0x10
     860:	f8e87ee3          	bgeu	a6,a4,7fc <upsampleCr+0x19c>
     864:	00954703          	lbu	a4,9(a0)
     868:	01c50423          	sb	t3,8(a0)
     86c:	0ff00693          	li	a3,255
     870:	40f707b3          	sub	a5,a4,a5
     874:	01079793          	slli	a5,a5,0x10
     878:	0107d793          	srli	a5,a5,0x10
     87c:	faf862e3          	bltu	a6,a5,820 <upsampleCr+0x1c0>
     880:	00078693          	mv	a3,a5
     884:	f9dff06f          	j	820 <upsampleCr+0x1c0>
     888:	01c60023          	sb	t3,0(a2)
     88c:	e85878e3          	bgeu	a6,t0,71c <upsampleCr+0xbc>
     890:	00864703          	lbu	a4,8(a2)
     894:	01c600a3          	sb	t3,1(a2)
     898:	00e78733          	add	a4,a5,a4
     89c:	01071713          	slli	a4,a4,0x10
     8a0:	01075713          	srli	a4,a4,0x10
     8a4:	eae870e3          	bgeu	a6,a4,744 <upsampleCr+0xe4>
     8a8:	00964703          	lbu	a4,9(a2)
     8ac:	01c60423          	sb	t3,8(a2)
     8b0:	0ff00293          	li	t0,255
     8b4:	00e787b3          	add	a5,a5,a4
     8b8:	01079713          	slli	a4,a5,0x10
     8bc:	01075713          	srli	a4,a4,0x10
     8c0:	eae864e3          	bltu	a6,a4,768 <upsampleCr+0x108>
     8c4:	00070293          	mv	t0,a4
     8c8:	ea1ff06f          	j	768 <upsampleCr+0x108>

000008cc <upsampleCrH>:
     8cc:	000027b7          	lui	a5,0x2
     8d0:	cf478793          	addi	a5,a5,-780 # 1cf4 <gCoeffBuf>
     8d4:	00151e13          	slli	t3,a0,0x1
     8d8:	00fe0e33          	add	t3,t3,a5
     8dc:	00002337          	lui	t1,0x2
     8e0:	000027b7          	lui	a5,0x2
     8e4:	bf430313          	addi	t1,t1,-1036 # 1bf4 <gMCUBufR>
     8e8:	af478793          	addi	a5,a5,-1292 # 1af4 <gMCUBufG>
     8ec:	008e0893          	addi	a7,t3,8
     8f0:	00b30333          	add	t1,t1,a1
     8f4:	088e0e13          	addi	t3,t3,136
     8f8:	00b785b3          	add	a1,a5,a1
     8fc:	0ff00813          	li	a6,255
     900:	fff00e93          	li	t4,-1
     904:	ff888513          	addi	a0,a7,-8
     908:	00058613          	mv	a2,a1
     90c:	00030693          	mv	a3,t1
     910:	00054f03          	lbu	t5,0(a0)
     914:	0006cf83          	lbu	t6,0(a3)
     918:	0016c283          	lbu	t0,1(a3)
     91c:	001f1713          	slli	a4,t5,0x1
     920:	01e707b3          	add	a5,a4,t5
     924:	00279793          	slli	a5,a5,0x2
     928:	01e787b3          	add	a5,a5,t5
     92c:	00379793          	slli	a5,a5,0x3
     930:	41e787b3          	sub	a5,a5,t5
     934:	0087d793          	srli	a5,a5,0x8
     938:	f4df0393          	addi	t2,t5,-179
     93c:	007787b3          	add	a5,a5,t2
     940:	01f78fb3          	add	t6,a5,t6
     944:	010f9f93          	slli	t6,t6,0x10
     948:	005787b3          	add	a5,a5,t0
     94c:	01079793          	slli	a5,a5,0x10
     950:	010fdf93          	srli	t6,t6,0x10
     954:	00250513          	addi	a0,a0,2
     958:	0107d793          	srli	a5,a5,0x10
     95c:	01f87a63          	bgeu	a6,t6,970 <upsampleCrH+0xa4>
     960:	010f9293          	slli	t0,t6,0x10
     964:	4102d293          	srai	t0,t0,0x10
     968:	00000f93          	li	t6,0
     96c:	0a02dc63          	bgez	t0,a24 <upsampleCrH+0x158>
     970:	01f68023          	sb	t6,0(a3)
     974:	0af87e63          	bgeu	a6,a5,a30 <upsampleCrH+0x164>
     978:	fff7c793          	not	a5,a5
     97c:	01079293          	slli	t0,a5,0x10
     980:	41f2df93          	srai	t6,t0,0x1f
     984:	01e707b3          	add	a5,a4,t5
     988:	00379793          	slli	a5,a5,0x3
     98c:	41e787b3          	sub	a5,a5,t5
     990:	00379793          	slli	a5,a5,0x3
     994:	41e787b3          	sub	a5,a5,t5
     998:	00064703          	lbu	a4,0(a2)
     99c:	00164f03          	lbu	t5,1(a2)
     9a0:	0087d793          	srli	a5,a5,0x8
     9a4:	fa578793          	addi	a5,a5,-91
     9a8:	40f70733          	sub	a4,a4,a5
     9ac:	01071713          	slli	a4,a4,0x10
     9b0:	40ff07b3          	sub	a5,t5,a5
     9b4:	01079793          	slli	a5,a5,0x10
     9b8:	01f680a3          	sb	t6,1(a3)
     9bc:	01075713          	srli	a4,a4,0x10
     9c0:	0107d793          	srli	a5,a5,0x10
     9c4:	00e87a63          	bgeu	a6,a4,9d8 <upsampleCrH+0x10c>
     9c8:	01071f13          	slli	t5,a4,0x10
     9cc:	410f5f13          	srai	t5,t5,0x10
     9d0:	00000713          	li	a4,0
     9d4:	020f5e63          	bgez	t5,a10 <upsampleCrH+0x144>
     9d8:	00e60023          	sb	a4,0(a2)
     9dc:	04f87063          	bgeu	a6,a5,a1c <upsampleCrH+0x150>
     9e0:	fff7c793          	not	a5,a5
     9e4:	01079f13          	slli	t5,a5,0x10
     9e8:	41ff5713          	srai	a4,t5,0x1f
     9ec:	00e600a3          	sb	a4,1(a2)
     9f0:	00268693          	addi	a3,a3,2
     9f4:	00260613          	addi	a2,a2,2
     9f8:	f1151ce3          	bne	a0,a7,910 <upsampleCrH+0x44>
     9fc:	01050893          	addi	a7,a0,16
     a00:	00858593          	addi	a1,a1,8
     a04:	00830313          	addi	t1,t1,8
     a08:	ef1e1ee3          	bne	t3,a7,904 <upsampleCrH+0x38>
     a0c:	00008067          	ret
     a10:	01d60023          	sb	t4,0(a2)
     a14:	0ff00713          	li	a4,255
     a18:	fcf86ae3          	bltu	a6,a5,9ec <upsampleCrH+0x120>
     a1c:	00078713          	mv	a4,a5
     a20:	fcdff06f          	j	9ec <upsampleCrH+0x120>
     a24:	01d68023          	sb	t4,0(a3)
     a28:	0ff00f93          	li	t6,255
     a2c:	f4f86ce3          	bltu	a6,a5,984 <upsampleCrH+0xb8>
     a30:	00078f93          	mv	t6,a5
     a34:	f51ff06f          	j	984 <upsampleCrH+0xb8>

00000a38 <upsampleCrV>:
     a38:	000027b7          	lui	a5,0x2
     a3c:	cf478793          	addi	a5,a5,-780 # 1cf4 <gCoeffBuf>
     a40:	00002337          	lui	t1,0x2
     a44:	00151513          	slli	a0,a0,0x1
     a48:	00f50533          	add	a0,a0,a5
     a4c:	bf430313          	addi	t1,t1,-1036 # 1bf4 <gMCUBufR>
     a50:	000027b7          	lui	a5,0x2
     a54:	00b30333          	add	t1,t1,a1
     a58:	af478793          	addi	a5,a5,-1292 # 1af4 <gMCUBufG>
     a5c:	00b785b3          	add	a1,a5,a1
     a60:	01050893          	addi	a7,a0,16
     a64:	04030e93          	addi	t4,t1,64
     a68:	0ff00813          	li	a6,255
     a6c:	fff00e13          	li	t3,-1
     a70:	ff088513          	addi	a0,a7,-16
     a74:	00058613          	mv	a2,a1
     a78:	00030693          	mv	a3,t1
     a7c:	0880006f          	j	b04 <upsampleCrV+0xcc>
     a80:	fff7c793          	not	a5,a5
     a84:	01079293          	slli	t0,a5,0x10
     a88:	41f2df93          	srai	t6,t0,0x1f
     a8c:	01e707b3          	add	a5,a4,t5
     a90:	00379793          	slli	a5,a5,0x3
     a94:	41e787b3          	sub	a5,a5,t5
     a98:	00379793          	slli	a5,a5,0x3
     a9c:	41e787b3          	sub	a5,a5,t5
     aa0:	00064703          	lbu	a4,0(a2)
     aa4:	00864f03          	lbu	t5,8(a2)
     aa8:	0087d793          	srli	a5,a5,0x8
     aac:	fa578793          	addi	a5,a5,-91
     ab0:	40f70733          	sub	a4,a4,a5
     ab4:	01071713          	slli	a4,a4,0x10
     ab8:	40ff07b3          	sub	a5,t5,a5
     abc:	01079793          	slli	a5,a5,0x10
     ac0:	01f68423          	sb	t6,8(a3)
     ac4:	01075713          	srli	a4,a4,0x10
     ac8:	0107d793          	srli	a5,a5,0x10
     acc:	00e87a63          	bgeu	a6,a4,ae0 <upsampleCrV+0xa8>
     ad0:	01071f13          	slli	t5,a4,0x10
     ad4:	410f5f13          	srai	t5,t5,0x10
     ad8:	00000713          	li	a4,0
     adc:	080f5c63          	bgez	t5,b74 <upsampleCrV+0x13c>
     ae0:	00e60023          	sb	a4,0(a2)
     ae4:	08f87e63          	bgeu	a6,a5,b80 <upsampleCrV+0x148>
     ae8:	fff7c793          	not	a5,a5
     aec:	01079f13          	slli	t5,a5,0x10
     af0:	41ff5713          	srai	a4,t5,0x1f
     af4:	00e60423          	sb	a4,8(a2)
     af8:	00168693          	addi	a3,a3,1
     afc:	00160613          	addi	a2,a2,1
     b00:	09150a63          	beq	a0,a7,b94 <upsampleCrV+0x15c>
     b04:	00054f03          	lbu	t5,0(a0)
     b08:	0006cf83          	lbu	t6,0(a3)
     b0c:	0086c283          	lbu	t0,8(a3)
     b10:	001f1713          	slli	a4,t5,0x1
     b14:	01e707b3          	add	a5,a4,t5
     b18:	00279793          	slli	a5,a5,0x2
     b1c:	01e787b3          	add	a5,a5,t5
     b20:	00379793          	slli	a5,a5,0x3
     b24:	41e787b3          	sub	a5,a5,t5
     b28:	0087d793          	srli	a5,a5,0x8
     b2c:	f4df0393          	addi	t2,t5,-179
     b30:	007787b3          	add	a5,a5,t2
     b34:	01f78fb3          	add	t6,a5,t6
     b38:	010f9f93          	slli	t6,t6,0x10
     b3c:	005787b3          	add	a5,a5,t0
     b40:	01079793          	slli	a5,a5,0x10
     b44:	010fdf93          	srli	t6,t6,0x10
     b48:	00250513          	addi	a0,a0,2
     b4c:	0107d793          	srli	a5,a5,0x10
     b50:	01f87a63          	bgeu	a6,t6,b64 <upsampleCrV+0x12c>
     b54:	010f9293          	slli	t0,t6,0x10
     b58:	4102d293          	srai	t0,t0,0x10
     b5c:	00000f93          	li	t6,0
     b60:	0402d463          	bgez	t0,ba8 <upsampleCrV+0x170>
     b64:	01f68023          	sb	t6,0(a3)
     b68:	f0f86ce3          	bltu	a6,a5,a80 <upsampleCrV+0x48>
     b6c:	00078f93          	mv	t6,a5
     b70:	f1dff06f          	j	a8c <upsampleCrV+0x54>
     b74:	01c60023          	sb	t3,0(a2)
     b78:	0ff00713          	li	a4,255
     b7c:	f6f86ce3          	bltu	a6,a5,af4 <upsampleCrV+0xbc>
     b80:	00078713          	mv	a4,a5
     b84:	00e60423          	sb	a4,8(a2)
     b88:	00168693          	addi	a3,a3,1
     b8c:	00160613          	addi	a2,a2,1
     b90:	f7151ae3          	bne	a0,a7,b04 <upsampleCrV+0xcc>
     b94:	01030313          	addi	t1,t1,16
     b98:	01058593          	addi	a1,a1,16
     b9c:	01050893          	addi	a7,a0,16
     ba0:	edd318e3          	bne	t1,t4,a70 <upsampleCrV+0x38>
     ba4:	00008067          	ret
     ba8:	01c68023          	sb	t3,0(a3)
     bac:	0ff00f93          	li	t6,255
     bb0:	ecf86ee3          	bltu	a6,a5,a8c <upsampleCrV+0x54>
     bb4:	00078f93          	mv	t6,a5
     bb8:	ed5ff06f          	j	a8c <upsampleCrV+0x54>

00000bbc <getChar>:
     bbc:	00001837          	lui	a6,0x1
     bc0:	48484703          	lbu	a4,1156(a6) # 1484 <gInBufLeft>
     bc4:	ff010113          	addi	sp,sp,-16
     bc8:	00112623          	sw	ra,12(sp)
     bcc:	000018b7          	lui	a7,0x1
     bd0:	02070a63          	beqz	a4,c04 <getChar+0x48>
     bd4:	4858c683          	lbu	a3,1157(a7) # 1485 <gInBufOfs>
     bd8:	000017b7          	lui	a5,0x1
     bdc:	00c12083          	lw	ra,12(sp)
     be0:	48878793          	addi	a5,a5,1160 # 1488 <gInBuf>
     be4:	00d787b3          	add	a5,a5,a3
     be8:	fff70713          	addi	a4,a4,-1
     bec:	00168693          	addi	a3,a3,1
     bf0:	48e80223          	sb	a4,1156(a6)
     bf4:	48d882a3          	sb	a3,1157(a7)
     bf8:	0007c503          	lbu	a0,0(a5)
     bfc:	01010113          	addi	sp,sp,16
     c00:	00008067          	ret
     c04:	00001737          	lui	a4,0x1
     c08:	000017b7          	lui	a5,0x1
     c0c:	43c72683          	lw	a3,1084(a4) # 143c <g_pCallback_data>
     c10:	4407a783          	lw	a5,1088(a5) # 1440 <g_pNeedBytesCallback>
     c14:	00001537          	lui	a0,0x1
     c18:	00400713          	li	a4,4
     c1c:	48480613          	addi	a2,a6,1156
     c20:	48c50513          	addi	a0,a0,1164 # 148c <gInBuf+0x4>
     c24:	0fc00593          	li	a1,252
     c28:	48e882a3          	sb	a4,1157(a7)
     c2c:	48080223          	sb	zero,1156(a6)
     c30:	000780e7          	jalr	a5
     c34:	00001837          	lui	a6,0x1
     c38:	000018b7          	lui	a7,0x1
     c3c:	00050663          	beqz	a0,c48 <getChar+0x8c>
     c40:	000017b7          	lui	a5,0x1
     c44:	42a78ca3          	sb	a0,1081(a5) # 1439 <gCallbackStatus>
     c48:	48484703          	lbu	a4,1156(a6) # 1484 <gInBufLeft>
     c4c:	f80714e3          	bnez	a4,bd4 <getChar+0x18>
     c50:	00001737          	lui	a4,0x1
     c54:	58874783          	lbu	a5,1416(a4) # 1588 <gTemFlag>
     c58:	00c12083          	lw	ra,12(sp)
     c5c:	0ff7c793          	xori	a5,a5,255
     c60:	0017b513          	seqz	a0,a5
     c64:	40a00533          	neg	a0,a0
     c68:	fda57513          	andi	a0,a0,-38
     c6c:	58f70423          	sb	a5,1416(a4)
     c70:	0ff50513          	addi	a0,a0,255
     c74:	01010113          	addi	sp,sp,16
     c78:	00008067          	ret

00000c7c <getOctet>:
     c7c:	fe010113          	addi	sp,sp,-32
     c80:	00812c23          	sw	s0,24(sp)
     c84:	00112e23          	sw	ra,28(sp)
     c88:	00050413          	mv	s0,a0
     c8c:	f31ff0ef          	jal	bbc <getChar>
     c90:	f0150713          	addi	a4,a0,-255
     c94:	00050793          	mv	a5,a0
     c98:	00071663          	bnez	a4,ca4 <getOctet+0x28>
     c9c:	00147713          	andi	a4,s0,1
     ca0:	00071c63          	bnez	a4,cb8 <getOctet+0x3c>
     ca4:	01c12083          	lw	ra,28(sp)
     ca8:	01812403          	lw	s0,24(sp)
     cac:	00078513          	mv	a0,a5
     cb0:	02010113          	addi	sp,sp,32
     cb4:	00008067          	ret
     cb8:	00a12623          	sw	a0,12(sp)
     cbc:	f01ff0ef          	jal	bbc <getChar>
     cc0:	00c12783          	lw	a5,12(sp)
     cc4:	fe0500e3          	beqz	a0,ca4 <getOctet+0x28>
     cc8:	000018b7          	lui	a7,0x1
     ccc:	4858c703          	lbu	a4,1157(a7) # 1485 <gInBufOfs>
     cd0:	000016b7          	lui	a3,0x1
     cd4:	48868693          	addi	a3,a3,1160 # 1488 <gInBuf>
     cd8:	fff70613          	addi	a2,a4,-1
     cdc:	0ff67613          	zext.b	a2,a2
     ce0:	ffe70713          	addi	a4,a4,-2
     ce4:	00c68633          	add	a2,a3,a2
     ce8:	00001837          	lui	a6,0x1
     cec:	0ff77713          	zext.b	a4,a4
     cf0:	00a60023          	sb	a0,0(a2)
     cf4:	48484583          	lbu	a1,1156(a6) # 1484 <gInBufLeft>
     cf8:	00e686b3          	add	a3,a3,a4
     cfc:	fff00613          	li	a2,-1
     d00:	00c68023          	sb	a2,0(a3)
     d04:	01c12083          	lw	ra,28(sp)
     d08:	01812403          	lw	s0,24(sp)
     d0c:	00258593          	addi	a1,a1,2
     d10:	48e882a3          	sb	a4,1157(a7)
     d14:	48b80223          	sb	a1,1156(a6)
     d18:	00078513          	mv	a0,a5
     d1c:	02010113          	addi	sp,sp,32
     d20:	00008067          	ret

00000d24 <getBits>:
     d24:	000018b7          	lui	a7,0x1
     d28:	4828d783          	lhu	a5,1154(a7) # 1482 <gBitBuf>
     d2c:	fe010113          	addi	sp,sp,-32
     d30:	00001337          	lui	t1,0x1
     d34:	00112e23          	sw	ra,28(sp)
     d38:	00800e13          	li	t3,8
     d3c:	48034683          	lbu	a3,1152(t1) # 1480 <gBitsLeft>
     d40:	00050813          	mv	a6,a0
     d44:	00078713          	mv	a4,a5
     d48:	00050613          	mv	a2,a0
     d4c:	02ae6c63          	bltu	t3,a0,d84 <getBits+0x60>
     d50:	0ac6e263          	bltu	a3,a2,df4 <getBits+0xd0>
     d54:	00c71733          	sll	a4,a4,a2
     d58:	48e89123          	sh	a4,1154(a7)
     d5c:	01000713          	li	a4,16
     d60:	01c12083          	lw	ra,28(sp)
     d64:	41070733          	sub	a4,a4,a6
     d68:	40c686b3          	sub	a3,a3,a2
     d6c:	40e7d533          	sra	a0,a5,a4
     d70:	48d30023          	sb	a3,1152(t1)
     d74:	01051513          	slli	a0,a0,0x10
     d78:	01055513          	srli	a0,a0,0x10
     d7c:	02010113          	addi	sp,sp,32
     d80:	00008067          	ret
     d84:	ff850613          	addi	a2,a0,-8
     d88:	00d796b3          	sll	a3,a5,a3
     d8c:	0ff67613          	zext.b	a2,a2
     d90:	00a12423          	sw	a0,8(sp)
     d94:	00058513          	mv	a0,a1
     d98:	48d89123          	sh	a3,1154(a7)
     d9c:	00f12623          	sw	a5,12(sp)
     da0:	00b12223          	sw	a1,4(sp)
     da4:	00c12023          	sw	a2,0(sp)
     da8:	ed5ff0ef          	jal	c7c <getOctet>
     dac:	000018b7          	lui	a7,0x1
     db0:	00001337          	lui	t1,0x1
     db4:	4828d703          	lhu	a4,1154(a7) # 1482 <gBitBuf>
     db8:	48034683          	lbu	a3,1152(t1) # 1480 <gBitsLeft>
     dbc:	00800e13          	li	t3,8
     dc0:	00e56733          	or	a4,a0,a4
     dc4:	40de0e33          	sub	t3,t3,a3
     dc8:	00c12783          	lw	a5,12(sp)
     dcc:	01c71733          	sll	a4,a4,t3
     dd0:	01071713          	slli	a4,a4,0x10
     dd4:	00012603          	lw	a2,0(sp)
     dd8:	01075713          	srli	a4,a4,0x10
     ddc:	f007f793          	andi	a5,a5,-256
     de0:	00875513          	srli	a0,a4,0x8
     de4:	00812803          	lw	a6,8(sp)
     de8:	00412583          	lw	a1,4(sp)
     dec:	00f567b3          	or	a5,a0,a5
     df0:	f6c6f2e3          	bgeu	a3,a2,d54 <getBits+0x30>
     df4:	00d71733          	sll	a4,a4,a3
     df8:	00058513          	mv	a0,a1
     dfc:	01012423          	sw	a6,8(sp)
     e00:	00f12223          	sw	a5,4(sp)
     e04:	00c12023          	sw	a2,0(sp)
     e08:	48e89123          	sh	a4,1154(a7)
     e0c:	e71ff0ef          	jal	c7c <getOctet>
     e10:	000018b7          	lui	a7,0x1
     e14:	00001337          	lui	t1,0x1
     e18:	4828d683          	lhu	a3,1154(a7) # 1482 <gBitBuf>
     e1c:	48034703          	lbu	a4,1152(t1) # 1480 <gBitsLeft>
     e20:	00012603          	lw	a2,0(sp)
     e24:	00812803          	lw	a6,8(sp)
     e28:	00d56533          	or	a0,a0,a3
     e2c:	40e606b3          	sub	a3,a2,a4
     e30:	00870713          	addi	a4,a4,8
     e34:	00412783          	lw	a5,4(sp)
     e38:	40c70733          	sub	a4,a4,a2
     e3c:	48e30023          	sb	a4,1152(t1)
     e40:	01000713          	li	a4,16
     e44:	01c12083          	lw	ra,28(sp)
     e48:	00d51533          	sll	a0,a0,a3
     e4c:	41070733          	sub	a4,a4,a6
     e50:	48a89123          	sh	a0,1154(a7)
     e54:	40e7d533          	sra	a0,a5,a4
     e58:	01051513          	slli	a0,a0,0x10
     e5c:	01055513          	srli	a0,a0,0x10
     e60:	02010113          	addi	sp,sp,32
     e64:	00008067          	ret

00000e68 <getBit>:
     e68:	00001737          	lui	a4,0x1
     e6c:	000016b7          	lui	a3,0x1
     e70:	48275503          	lhu	a0,1154(a4) # 1482 <gBitBuf>
     e74:	4806c783          	lbu	a5,1152(a3) # 1480 <gBitsLeft>
     e78:	00f55613          	srli	a2,a0,0xf
     e7c:	00078e63          	beqz	a5,e98 <getBit+0x30>
     e80:	fff78793          	addi	a5,a5,-1
     e84:	00151513          	slli	a0,a0,0x1
     e88:	48a71123          	sh	a0,1154(a4)
     e8c:	48f68023          	sb	a5,1152(a3)
     e90:	00060513          	mv	a0,a2
     e94:	00008067          	ret
     e98:	fe010113          	addi	sp,sp,-32
     e9c:	00100513          	li	a0,1
     ea0:	00112e23          	sw	ra,28(sp)
     ea4:	00c12623          	sw	a2,12(sp)
     ea8:	dd5ff0ef          	jal	c7c <getOctet>
     eac:	00001737          	lui	a4,0x1
     eb0:	000016b7          	lui	a3,0x1
     eb4:	48275583          	lhu	a1,1154(a4) # 1482 <gBitBuf>
     eb8:	4806c783          	lbu	a5,1152(a3) # 1480 <gBitsLeft>
     ebc:	00c12603          	lw	a2,12(sp)
     ec0:	01c12083          	lw	ra,28(sp)
     ec4:	00b56533          	or	a0,a0,a1
     ec8:	00878793          	addi	a5,a5,8
     ecc:	00151513          	slli	a0,a0,0x1
     ed0:	fff78793          	addi	a5,a5,-1
     ed4:	48a71123          	sh	a0,1154(a4)
     ed8:	48f68023          	sb	a5,1152(a3)
     edc:	00060513          	mv	a0,a2
     ee0:	02010113          	addi	sp,sp,32
     ee4:	00008067          	ret

00000ee8 <huffDecode>:
     ee8:	fe010113          	addi	sp,sp,-32
     eec:	01312623          	sw	s3,12(sp)
     ef0:	01412423          	sw	s4,8(sp)
     ef4:	00050993          	mv	s3,a0
     ef8:	ffff0a37          	lui	s4,0xffff0
     efc:	00812c23          	sw	s0,24(sp)
     f00:	00912a23          	sw	s1,20(sp)
     f04:	01512223          	sw	s5,4(sp)
     f08:	01612023          	sw	s6,0(sp)
     f0c:	00112e23          	sw	ra,28(sp)
     f10:	01212823          	sw	s2,16(sp)
     f14:	00058b13          	mv	s6,a1
     f18:	02098493          	addi	s1,s3,32
     f1c:	f4dff0ef          	jal	e68 <getBit>
     f20:	001a0a13          	addi	s4,s4,1 # ffff0001 <__stack_top+0xfffe8101>
     f24:	00000413          	li	s0,0
     f28:	01000a93          	li	s5,16
     f2c:	0004d783          	lhu	a5,0(s1)
     f30:	00151913          	slli	s2,a0,0x1
     f34:	01478733          	add	a4,a5,s4
     f38:	00a7e463          	bltu	a5,a0,f40 <huffDecode+0x58>
     f3c:	04071663          	bnez	a4,f88 <huffDecode+0xa0>
     f40:	f29ff0ef          	jal	e68 <getBit>
     f44:	01256533          	or	a0,a0,s2
     f48:	01051513          	slli	a0,a0,0x10
     f4c:	00140413          	addi	s0,s0,1
     f50:	01055513          	srli	a0,a0,0x10
     f54:	00248493          	addi	s1,s1,2
     f58:	fd541ae3          	bne	s0,s5,f2c <huffDecode+0x44>
     f5c:	00000513          	li	a0,0
     f60:	01c12083          	lw	ra,28(sp)
     f64:	01812403          	lw	s0,24(sp)
     f68:	01412483          	lw	s1,20(sp)
     f6c:	01012903          	lw	s2,16(sp)
     f70:	00c12983          	lw	s3,12(sp)
     f74:	00812a03          	lw	s4,8(sp)
     f78:	00412a83          	lw	s5,4(sp)
     f7c:	00012b03          	lw	s6,0(sp)
     f80:	02010113          	addi	sp,sp,32
     f84:	00008067          	ret
     f88:	008987b3          	add	a5,s3,s0
     f8c:	00141413          	slli	s0,s0,0x1
     f90:	0407c783          	lbu	a5,64(a5)
     f94:	008989b3          	add	s3,s3,s0
     f98:	0009d703          	lhu	a4,0(s3)
     f9c:	00a787b3          	add	a5,a5,a0
     fa0:	40e787b3          	sub	a5,a5,a4
     fa4:	0ff7f793          	zext.b	a5,a5
     fa8:	00fb07b3          	add	a5,s6,a5
     fac:	0007c503          	lbu	a0,0(a5)
     fb0:	fb1ff06f          	j	f60 <huffDecode+0x78>

00000fb4 <processMarkers>:
     fb4:	fa010113          	addi	sp,sp,-96
     fb8:	04812c23          	sw	s0,88(sp)
     fbc:	03712e23          	sw	s7,60(sp)
     fc0:	03912a23          	sw	s9,52(sp)
     fc4:	04112e23          	sw	ra,92(sp)
     fc8:	00a12623          	sw	a0,12(sp)
     fcc:	0ff00413          	li	s0,255
     fd0:	0d700c93          	li	s9,215
     fd4:	00001bb7          	lui	s7,0x1
     fd8:	00000593          	li	a1,0
     fdc:	00800513          	li	a0,8
     fe0:	d45ff0ef          	jal	d24 <getBits>
     fe4:	0ff57513          	zext.b	a0,a0
     fe8:	fe8518e3          	bne	a0,s0,fd8 <processMarkers+0x24>
     fec:	00000593          	li	a1,0
     ff0:	00800513          	li	a0,8
     ff4:	d31ff0ef          	jal	d24 <getBits>
     ff8:	0ff57513          	zext.b	a0,a0
     ffc:	fe8508e3          	beq	a0,s0,fec <processMarkers+0x38>
    1000:	fc050ce3          	beqz	a0,fd8 <processMarkers+0x24>
    1004:	04ace663          	bltu	s9,a0,1050 <processMarkers+0x9c>
    1008:	0c400793          	li	a5,196
    100c:	08a7f263          	bgeu	a5,a0,1090 <CSWTCH.291+0x18>
    1010:	03b50693          	addi	a3,a0,59
    1014:	00100793          	li	a5,1
    1018:	00080737          	lui	a4,0x80
    101c:	00d797b3          	sll	a5,a5,a3
    1020:	80870713          	addi	a4,a4,-2040 # 7f808 <__stack_top+0x77908>
    1024:	00e7f733          	and	a4,a5,a4
    1028:	26071063          	bnez	a4,1288 <jpeg_data+0x90>
    102c:	7777f793          	andi	a5,a5,1911
    1030:	22079a63          	bnez	a5,1264 <jpeg_data+0x6c>
    1034:	05c12083          	lw	ra,92(sp)
    1038:	05812403          	lw	s0,88(sp)
    103c:	03c12b83          	lw	s7,60(sp)
    1040:	03412c83          	lw	s9,52(sp)
    1044:	01100513          	li	a0,17
    1048:	06010113          	addi	sp,sp,96
    104c:	00008067          	ret
    1050:	0db00793          	li	a5,219
    1054:	2cf50463          	beq	a0,a5,131c <jpeg_data+0x124>
    1058:	20a7f663          	bgeu	a5,a0,1264 <jpeg_data+0x6c>
    105c:	0dd00793          	li	a5,221
    1060:	26f51863          	bne	a0,a5,12d0 <jpeg_data+0xd8>
    1064:	00000593          	li	a1,0
    1068:	01000513          	li	a0,16
    106c:	cb9ff0ef          	jal	d24 <getBits>
    1070:	00400793          	li	a5,4
    1074:	f6f512e3          	bne	a0,a5,fd8 <processMarkers+0x24>
    1078:	00000593          	li	a1,0
    107c:	01000513          	li	a0,16
    1080:	ca5ff0ef          	jal	d24 <getBits>
    1084:	000017b7          	lui	a5,0x1
    1088:	46a79423          	sh	a0,1128(a5) # 1468 <pjpeg_decode_mcu>
    108c:	f4dff06f          	j	fd8 <processMarkers+0x24>
    1090:	1af51e63          	bne	a0,a5,124c <jpeg_data+0x54>
    1094:	00000593          	li	a1,0
    1098:	01000513          	li	a0,16
    109c:	c89ff0ef          	jal	d24 <getBits>
    10a0:	00100793          	li	a5,1
    10a4:	f2a7fae3          	bgeu	a5,a0,fd8 <processMarkers+0x24>
    10a8:	ffe50513          	addi	a0,a0,-2
    10ac:	05612023          	sw	s6,64(sp)
    10b0:	01051b13          	slli	s6,a0,0x10
    10b4:	010b5b13          	srli	s6,s6,0x10
    10b8:	3a0b0463          	beqz	s6,1460 <gCompList>
    10bc:	000017b7          	lui	a5,0x1
    10c0:	03b12623          	sw	s11,44(sp)
    10c4:	05878793          	addi	a5,a5,88 # 1058 <CSWTCH.298>
    10c8:	00001db7          	lui	s11,0x1
    10cc:	05312623          	sw	s3,76(sp)
    10d0:	04912a23          	sw	s1,84(sp)
    10d4:	05212823          	sw	s2,80(sp)
    10d8:	05412423          	sw	s4,72(sp)
    10dc:	05512223          	sw	s5,68(sp)
    10e0:	03812c23          	sw	s8,56(sp)
    10e4:	03a12823          	sw	s10,48(sp)
    10e8:	068d8d93          	addi	s11,s11,104 # 1068 <CSWTCH.296>
    10ec:	00f12423          	sw	a5,8(sp)
    10f0:	000109b7          	lui	s3,0x10
    10f4:	00000593          	li	a1,0
    10f8:	00800513          	li	a0,8
    10fc:	c29ff0ef          	jal	d24 <getBits>
    1100:	00e57793          	andi	a5,a0,14
    1104:	1a079263          	bnez	a5,12a8 <jpeg_data+0xb0>
    1108:	0f057793          	andi	a5,a0,240
    110c:	01000713          	li	a4,16
    1110:	18f76c63          	bltu	a4,a5,12a8 <jpeg_data+0xb0>
    1114:	00355a13          	srli	s4,a0,0x3
    1118:	00812683          	lw	a3,8(sp)
    111c:	002a7a13          	andi	s4,s4,2
    1120:	00157513          	andi	a0,a0,1
    1124:	00aa6a33          	or	s4,s4,a0
    1128:	00001637          	lui	a2,0x1
    112c:	58a64703          	lbu	a4,1418(a2) # 158a <gValidHuffTables>
    1130:	002a1793          	slli	a5,s4,0x2
    1134:	00fd85b3          	add	a1,s11,a5
    1138:	00f687b3          	add	a5,a3,a5
    113c:	00100693          	li	a3,1
    1140:	0007aa83          	lw	s5,0(a5)
    1144:	0005a483          	lw	s1,0(a1)
    1148:	014697b3          	sll	a5,a3,s4
    114c:	00f767b3          	or	a5,a4,a5
    1150:	01010c13          	addi	s8,sp,16
    1154:	58f60523          	sb	a5,1418(a2)
    1158:	000c0d13          	mv	s10,s8
    115c:	00000913          	li	s2,0
    1160:	00000593          	li	a1,0
    1164:	00800513          	li	a0,8
    1168:	bbdff0ef          	jal	d24 <getBits>
    116c:	0ff57713          	zext.b	a4,a0
    1170:	00e90733          	add	a4,s2,a4
    1174:	00ad0023          	sb	a0,0(s10)
    1178:	01071913          	slli	s2,a4,0x10
    117c:	001d0d13          	addi	s10,s10,1
    1180:	02010793          	addi	a5,sp,32
    1184:	01095913          	srli	s2,s2,0x10
    1188:	fda79ce3          	bne	a5,s10,1160 <b_ref.0+0x28>
    118c:	00100793          	li	a5,1
    1190:	0147b7b3          	sltu	a5,a5,s4
    1194:	40f007b3          	neg	a5,a5
    1198:	0f37f793          	andi	a5,a5,243
    119c:	00c78793          	addi	a5,a5,12
    11a0:	1127e463          	bltu	a5,s2,12a8 <jpeg_data+0xb0>
    11a4:	00000a13          	li	s4,0
    11a8:	02090263          	beqz	s2,11cc <r_ref.2+0x14>
    11ac:	00000593          	li	a1,0
    11b0:	00800513          	li	a0,8
    11b4:	b71ff0ef          	jal	d24 <getBits>
    11b8:	014a87b3          	add	a5,s5,s4
    11bc:	001a0a13          	addi	s4,s4,1
    11c0:	00a78023          	sb	a0,0(a5)
    11c4:	0ffa7a13          	zext.b	s4,s4
    11c8:	ff2a62e3          	bltu	s4,s2,11ac <g_ref.1+0x34>
    11cc:	01190793          	addi	a5,s2,17
    11d0:	01079793          	slli	a5,a5,0x10
    11d4:	0107d793          	srli	a5,a5,0x10
    11d8:	0cfb6863          	bltu	s6,a5,12a8 <jpeg_data+0xb0>
    11dc:	40fb07b3          	sub	a5,s6,a5
    11e0:	01079b13          	slli	s6,a5,0x10
    11e4:	010b5b13          	srli	s6,s6,0x10
    11e8:	04048613          	addi	a2,s1,64
    11ec:	00000713          	li	a4,0
    11f0:	00000813          	li	a6,0
    11f4:	0380006f          	j	122c <jpeg_data+0x34>
    11f8:	00080793          	mv	a5,a6
    11fc:	fff88593          	addi	a1,a7,-1
    1200:	0ff37813          	zext.b	a6,t1
    1204:	00088713          	mv	a4,a7
    1208:	00a49023          	sh	a0,0(s1)
    120c:	02b49023          	sh	a1,32(s1)
    1210:	00f60023          	sb	a5,0(a2)
    1214:	001c0c13          	addi	s8,s8,1
    1218:	02010793          	addi	a5,sp,32
    121c:	00171713          	slli	a4,a4,0x1
    1220:	00248493          	addi	s1,s1,2
    1224:	00160613          	addi	a2,a2,1
    1228:	07878e63          	beq	a5,s8,12a4 <jpeg_data+0xac>
    122c:	000c4783          	lbu	a5,0(s8)
    1230:	00070513          	mv	a0,a4
    1234:	fff98593          	addi	a1,s3,-1 # ffff <__stack_top+0x80ff>
    1238:	00e788b3          	add	a7,a5,a4
    123c:	01078333          	add	t1,a5,a6
    1240:	fa079ce3          	bnez	a5,11f8 <jpeg_data>
    1244:	00000513          	li	a0,0
    1248:	fc1ff06f          	j	1208 <jpeg_data+0x10>
    124c:	00100793          	li	a5,1
    1250:	02f50c63          	beq	a0,a5,1288 <jpeg_data+0x90>
    1254:	04050793          	addi	a5,a0,64
    1258:	0ff7f793          	zext.b	a5,a5
    125c:	00300713          	li	a4,3
    1260:	06f76863          	bltu	a4,a5,12d0 <jpeg_data+0xd8>
    1264:	00c12783          	lw	a5,12(sp)
    1268:	00a78023          	sb	a0,0(a5)
    126c:	05c12083          	lw	ra,92(sp)
    1270:	05812403          	lw	s0,88(sp)
    1274:	03c12b83          	lw	s7,60(sp)
    1278:	03412c83          	lw	s9,52(sp)
    127c:	00000513          	li	a0,0
    1280:	06010113          	addi	sp,sp,96
    1284:	00008067          	ret
    1288:	05c12083          	lw	ra,92(sp)
    128c:	05812403          	lw	s0,88(sp)
    1290:	03c12b83          	lw	s7,60(sp)
    1294:	03412c83          	lw	s9,52(sp)
    1298:	01200513          	li	a0,18
    129c:	06010113          	addi	sp,sp,96
    12a0:	00008067          	ret
    12a4:	e40b18e3          	bnez	s6,10f4 <gWinogradQuant+0x3c>
    12a8:	05412483          	lw	s1,84(sp)
    12ac:	05012903          	lw	s2,80(sp)
    12b0:	04c12983          	lw	s3,76(sp)
    12b4:	04812a03          	lw	s4,72(sp)
    12b8:	04412a83          	lw	s5,68(sp)
    12bc:	04012b03          	lw	s6,64(sp)
    12c0:	03812c03          	lw	s8,56(sp)
    12c4:	03012d03          	lw	s10,48(sp)
    12c8:	02c12d83          	lw	s11,44(sp)
    12cc:	d0dff06f          	j	fd8 <processMarkers+0x24>
    12d0:	00000593          	li	a1,0
    12d4:	01000513          	li	a0,16
    12d8:	a4dff0ef          	jal	d24 <getBits>
    12dc:	00100793          	li	a5,1
    12e0:	cea7fce3          	bgeu	a5,a0,fd8 <processMarkers+0x24>
    12e4:	ffe50513          	addi	a0,a0,-2
    12e8:	04912a23          	sw	s1,84(sp)
    12ec:	01051493          	slli	s1,a0,0x10
    12f0:	0104d493          	srli	s1,s1,0x10
    12f4:	02048063          	beqz	s1,1314 <jpeg_data+0x11c>
    12f8:	fff48493          	addi	s1,s1,-1
    12fc:	01049493          	slli	s1,s1,0x10
    1300:	00000593          	li	a1,0
    1304:	00800513          	li	a0,8
    1308:	0104d493          	srli	s1,s1,0x10
    130c:	a19ff0ef          	jal	d24 <getBits>
    1310:	fe0494e3          	bnez	s1,12f8 <jpeg_data+0x100>
    1314:	05412483          	lw	s1,84(sp)
    1318:	cc1ff06f          	j	fd8 <processMarkers+0x24>
    131c:	00000593          	li	a1,0
    1320:	01000513          	li	a0,16
    1324:	a01ff0ef          	jal	d24 <getBits>
    1328:	00100793          	li	a5,1
    132c:	caa7f6e3          	bgeu	a5,a0,fd8 <processMarkers+0x24>
    1330:	ffe50513          	addi	a0,a0,-2
    1334:	05512223          	sw	s5,68(sp)
    1338:	01051a93          	slli	s5,a0,0x10
    133c:	010ada93          	srli	s5,s5,0x10
    1340:	100a8c63          	beqz	s5,1458 <gCompACTab>
    1344:	03b12623          	sw	s11,44(sp)
    1348:	00002db7          	lui	s11,0x2
    134c:	8f4d8d93          	addi	s11,s11,-1804 # 18f4 <gQuant1>
    1350:	05412423          	sw	s4,72(sp)
    1354:	05612023          	sw	s6,64(sp)
    1358:	04912a23          	sw	s1,84(sp)
    135c:	05212823          	sw	s2,80(sp)
    1360:	05312623          	sw	s3,76(sp)
    1364:	03812c23          	sw	s8,56(sp)
    1368:	03a12823          	sw	s10,48(sp)
    136c:	080d8a13          	addi	s4,s11,128
    1370:	00002b37          	lui	s6,0x2
    1374:	00000593          	li	a1,0
    1378:	00800513          	li	a0,8
    137c:	9a9ff0ef          	jal	d24 <getBits>
    1380:	00e57793          	andi	a5,a0,14
    1384:	0ff57513          	zext.b	a0,a0
    1388:	f20790e3          	bnez	a5,12a8 <jpeg_data+0xb0>
    138c:	589bc783          	lbu	a5,1417(s7) # 1589 <gValidQuantTables>
    1390:	00f57993          	andi	s3,a0,15
    1394:	00198713          	addi	a4,s3,1
    1398:	00e7e7b3          	or	a5,a5,a4
    139c:	58fb84a3          	sb	a5,1417(s7)
    13a0:	00455913          	srli	s2,a0,0x4
    13a4:	000d8d13          	mv	s10,s11
    13a8:	974b0493          	addi	s1,s6,-1676 # 1974 <gQuant0>
    13ac:	00000593          	li	a1,0
    13b0:	00800513          	li	a0,8
    13b4:	971ff0ef          	jal	d24 <getBits>
    13b8:	00050c13          	mv	s8,a0
    13bc:	06091e63          	bnez	s2,1438 <gReduce>
    13c0:	08098863          	beqz	s3,1450 <gMaxMCUYSize>
    13c4:	018d1023          	sh	s8,0(s10)
    13c8:	002d0d13          	addi	s10,s10,2
    13cc:	00248493          	addi	s1,s1,2
    13d0:	fd4d1ee3          	bne	s10,s4,13ac <jpeg_data+0x1b4>
    13d4:	974b0793          	addi	a5,s6,-1676
    13d8:	00098463          	beqz	s3,13e0 <jpeg_data+0x1e8>
    13dc:	000d8793          	mv	a5,s11
    13e0:	00001737          	lui	a4,0x1
    13e4:	0b870d13          	addi	s10,a4,184 # 10b8 <gWinogradQuant>
    13e8:	00078993          	mv	s3,a5
    13ec:	040d0493          	addi	s1,s10,64
    13f0:	00099583          	lh	a1,0(s3)
    13f4:	000d4503          	lbu	a0,0(s10)
    13f8:	001d0d13          	addi	s10,s10,1
    13fc:	00298993          	addi	s3,s3,2
    1400:	139020ef          	jal	3d38 <__mulsi3>
    1404:	00450513          	addi	a0,a0,4
    1408:	40355513          	srai	a0,a0,0x3
    140c:	fea99f23          	sh	a0,-2(s3)
    1410:	ffa490e3          	bne	s1,s10,13f0 <jpeg_data+0x1f8>
    1414:	012037b3          	snez	a5,s2
    1418:	00679793          	slli	a5,a5,0x6
    141c:	04178793          	addi	a5,a5,65
    1420:	e8fae4e3          	bltu	s5,a5,12a8 <jpeg_data+0xb0>
    1424:	40fa87b3          	sub	a5,s5,a5
    1428:	01079a93          	slli	s5,a5,0x10
    142c:	010ada93          	srli	s5,s5,0x10
    1430:	f40a92e3          	bnez	s5,1374 <jpeg_data+0x17c>
    1434:	e75ff06f          	j	12a8 <jpeg_data+0xb0>
    1438:	00000593          	li	a1,0
    143c:	00800513          	li	a0,8
    1440:	8e5ff0ef          	jal	d24 <getBits>
    1444:	008c1793          	slli	a5,s8,0x8
    1448:	00f50c33          	add	s8,a0,a5
    144c:	f6099ce3          	bnez	s3,13c4 <jpeg_data+0x1cc>
    1450:	01849023          	sh	s8,0(s1)
    1454:	f75ff06f          	j	13c8 <jpeg_data+0x1d0>
    1458:	04412a83          	lw	s5,68(sp)
    145c:	b7dff06f          	j	fd8 <processMarkers+0x24>
    1460:	04012b03          	lw	s6,64(sp)
    1464:	b75ff06f          	j	fd8 <processMarkers+0x24>

00001468 <pjpeg_decode_mcu>:
    1468:	fa010113          	addi	sp,sp,-96
    146c:	03812c23          	sw	s8,56(sp)
    1470:	00001c37          	lui	s8,0x1
    1474:	03912a23          	sw	s9,52(sp)
    1478:	439c4c83          	lbu	s9,1081(s8) # 1439 <gCallbackStatus>
    147c:	04112e23          	sw	ra,92(sp)
    1480:	000c9a63          	bnez	s9,1494 <gInBuf+0xc>
    1484:	000017b7          	lui	a5,0x1
    1488:	44a7d783          	lhu	a5,1098(a5) # 144a <gNumMCUSRemaining>
    148c:	02079063          	bnez	a5,14ac <gInBuf+0x24>
    1490:	00100c93          	li	s9,1
    1494:	05c12083          	lw	ra,92(sp)
    1498:	03812c03          	lw	s8,56(sp)
    149c:	000c8513          	mv	a0,s9
    14a0:	03412c83          	lw	s9,52(sp)
    14a4:	06010113          	addi	sp,sp,96
    14a8:	00008067          	ret
    14ac:	05312623          	sw	s3,76(sp)
    14b0:	000019b7          	lui	s3,0x1
    14b4:	4689d783          	lhu	a5,1128(s3) # 1468 <pjpeg_decode_mcu>
    14b8:	04812c23          	sw	s0,88(sp)
    14bc:	04912a23          	sw	s1,84(sp)
    14c0:	05212823          	sw	s2,80(sp)
    14c4:	1c079663          	bnez	a5,1690 <gHuffTab3+0x4>
    14c8:	00001e37          	lui	t3,0x1
    14cc:	452e4783          	lbu	a5,1106(t3) # 1452 <gMaxBlocksPerMCU>
    14d0:	1e078463          	beqz	a5,16b8 <gHuffTab3+0x2c>
    14d4:	000027b7          	lui	a5,0x2
    14d8:	00001637          	lui	a2,0x1
    14dc:	8ec78f13          	addi	t5,a5,-1812 # 18ec <gLastDC>
    14e0:	000016b7          	lui	a3,0x1
    14e4:	45c60793          	addi	a5,a2,1116 # 145c <gCompDCTab>
    14e8:	00001737          	lui	a4,0x1
    14ec:	00f12023          	sw	a5,0(sp)
    14f0:	46c68793          	addi	a5,a3,1132 # 146c <gCompQuant>
    14f4:	05512223          	sw	s5,68(sp)
    14f8:	03712e23          	sw	s7,60(sp)
    14fc:	000014b7          	lui	s1,0x1
    1500:	00001bb7          	lui	s7,0x1
    1504:	00002437          	lui	s0,0x2
    1508:	00001ab7          	lui	s5,0x1
    150c:	00f12223          	sw	a5,4(sp)
    1510:	45870793          	addi	a5,a4,1112 # 1458 <gCompACTab>
    1514:	05612023          	sw	s6,64(sp)
    1518:	05412423          	sw	s4,72(sp)
    151c:	03a12823          	sw	s10,48(sp)
    1520:	03b12623          	sw	s11,44(sp)
    1524:	0f848493          	addi	s1,s1,248 # 10f8 <ZAG>
    1528:	444b8b93          	addi	s7,s7,1092 # 1444 <gMCUOrg>
    152c:	cf440413          	addi	s0,s0,-780 # 1cf4 <gCoeffBuf>
    1530:	00f12423          	sw	a5,8(sp)
    1534:	098a8a93          	addi	s5,s5,152 # 1098 <CSWTCH.289>
    1538:	00000b13          	li	s6,0
    153c:	01912e23          	sw	s9,28(sp)
    1540:	01c12823          	sw	t3,16(sp)
    1544:	01e12623          	sw	t5,12(sp)
    1548:	000027b7          	lui	a5,0x2
    154c:	000bc903          	lbu	s2,0(s7)
    1550:	97478a13          	addi	s4,a5,-1676 # 1974 <gQuant0>
    1554:	00412783          	lw	a5,4(sp)
    1558:	012787b3          	add	a5,a5,s2
    155c:	0007c703          	lbu	a4,0(a5)
    1560:	00012783          	lw	a5,0(sp)
    1564:	012787b3          	add	a5,a5,s2
    1568:	0007c783          	lbu	a5,0(a5)
    156c:	00070663          	beqz	a4,1578 <gInBuf+0xf0>
    1570:	00002a37          	lui	s4,0x2
    1574:	8f4a0a13          	addi	s4,s4,-1804 # 18f4 <gQuant1>
    1578:	4a078263          	beqz	a5,1a1c <gMCUBufB+0x28>
    157c:	00002537          	lui	a0,0x2
    1580:	000025b7          	lui	a1,0x2
    1584:	83c50513          	addi	a0,a0,-1988 # 183c <gHuffTab1>
    1588:	82c58593          	addi	a1,a1,-2004 # 182c <gHuffVal1>
    158c:	95dff0ef          	jal	ee8 <huffDecode>
    1590:	00050993          	mv	s3,a0
    1594:	00f57513          	andi	a0,a0,15
    1598:	00000793          	li	a5,0
    159c:	4a051263          	bnez	a0,1a40 <gMCUBufB+0x4c>
    15a0:	00c12683          	lw	a3,12(sp)
    15a4:	00191713          	slli	a4,s2,0x1
    15a8:	000a5583          	lhu	a1,0(s4)
    15ac:	00e68733          	add	a4,a3,a4
    15b0:	00075683          	lhu	a3,0(a4)
    15b4:	00d78533          	add	a0,a5,a3
    15b8:	01051513          	slli	a0,a0,0x10
    15bc:	01055513          	srli	a0,a0,0x10
    15c0:	00a71023          	sh	a0,0(a4)
    15c4:	774020ef          	jal	3d38 <__mulsi3>
    15c8:	000017b7          	lui	a5,0x1
    15cc:	4387c703          	lbu	a4,1080(a5) # 1438 <gReduce>
    15d0:	00812783          	lw	a5,8(sp)
    15d4:	00a41023          	sh	a0,0(s0)
    15d8:	012787b3          	add	a5,a5,s2
    15dc:	0007c783          	lbu	a5,0(a5)
    15e0:	10070863          	beqz	a4,16f0 <gHuffVal2+0x14>
    15e4:	340784e3          	beqz	a5,212c <__bss_end+0x388>
    15e8:	000019b7          	lui	s3,0x1
    15ec:	00001a37          	lui	s4,0x1
    15f0:	58c98993          	addi	s3,s3,1420 # 158c <gHuffVal3>
    15f4:	68ca0a13          	addi	s4,s4,1676 # 168c <gHuffTab3>
    15f8:	00100c93          	li	s9,1
    15fc:	00f00d13          	li	s10,15
    1600:	03000d93          	li	s11,48
    1604:	03f00913          	li	s2,63
    1608:	01612a23          	sw	s6,20(sp)
    160c:	01c0006f          	j	1628 <gHuffVal3+0x9c>
    1610:	47ab1e63          	bne	s6,s10,1a8c <gMCUBufB+0x98>
    1614:	059de263          	bltu	s11,s9,1658 <gHuffVal3+0xcc>
    1618:	00fc8c93          	addi	s9,s9,15
    161c:	001c8c93          	addi	s9,s9,1
    1620:	0ffcfc93          	zext.b	s9,s9
    1624:	47996463          	bltu	s2,s9,1a8c <gMCUBufB+0x98>
    1628:	00098593          	mv	a1,s3
    162c:	000a0513          	mv	a0,s4
    1630:	8b9ff0ef          	jal	ee8 <huffDecode>
    1634:	00455793          	srli	a5,a0,0x4
    1638:	00f57513          	andi	a0,a0,15
    163c:	0ff7fb13          	zext.b	s6,a5
    1640:	fc0508e3          	beqz	a0,1610 <gHuffVal3+0x84>
    1644:	00100593          	li	a1,1
    1648:	edcff0ef          	jal	d24 <getBits>
    164c:	fc0b08e3          	beqz	s6,161c <gHuffVal3+0x90>
    1650:	016c8cb3          	add	s9,s9,s6
    1654:	fd9954e3          	bge	s2,s9,161c <gHuffVal3+0x90>
    1658:	04812a03          	lw	s4,72(sp)
    165c:	04412a83          	lw	s5,68(sp)
    1660:	04012b03          	lw	s6,64(sp)
    1664:	03c12b83          	lw	s7,60(sp)
    1668:	03012d03          	lw	s10,48(sp)
    166c:	02c12d83          	lw	s11,44(sp)
    1670:	01c00c93          	li	s9,28
    1674:	439c4783          	lbu	a5,1081(s8)
    1678:	30079ae3          	bnez	a5,218c <__bss_end+0x3e8>
    167c:	05812403          	lw	s0,88(sp)
    1680:	05412483          	lw	s1,84(sp)
    1684:	05012903          	lw	s2,80(sp)
    1688:	04c12983          	lw	s3,76(sp)
    168c:	e09ff06f          	j	1494 <gInBuf+0xc>
    1690:	00001937          	lui	s2,0x1
    1694:	46495783          	lhu	a5,1124(s2) # 1464 <gRestartsLeft>
    1698:	300786e3          	beqz	a5,21a4 <__bss_end+0x400>
    169c:	00001e37          	lui	t3,0x1
    16a0:	452e4703          	lbu	a4,1106(t3) # 1452 <gMaxBlocksPerMCU>
    16a4:	fff78793          	addi	a5,a5,-1
    16a8:	46f91223          	sh	a5,1124(s2)
    16ac:	e20714e3          	bnez	a4,14d4 <gInBuf+0x4c>
    16b0:	439c4783          	lbu	a5,1081(s8)
    16b4:	2c079ce3          	bnez	a5,218c <__bss_end+0x3e8>
    16b8:	00001737          	lui	a4,0x1
    16bc:	44a75783          	lhu	a5,1098(a4) # 144a <gNumMCUSRemaining>
    16c0:	05812403          	lw	s0,88(sp)
    16c4:	05c12083          	lw	ra,92(sp)
    16c8:	fff78793          	addi	a5,a5,-1
    16cc:	44f71523          	sh	a5,1098(a4)
    16d0:	05412483          	lw	s1,84(sp)
    16d4:	05012903          	lw	s2,80(sp)
    16d8:	04c12983          	lw	s3,76(sp)
    16dc:	03812c03          	lw	s8,56(sp)
    16e0:	000c8513          	mv	a0,s9
    16e4:	03412c83          	lw	s9,52(sp)
    16e8:	06010113          	addi	sp,sp,96
    16ec:	00008067          	ret
    16f0:	220784e3          	beqz	a5,2118 <__bss_end+0x374>
    16f4:	00001937          	lui	s2,0x1
    16f8:	000019b7          	lui	s3,0x1
    16fc:	58c90913          	addi	s2,s2,1420 # 158c <gHuffVal3>
    1700:	68c98993          	addi	s3,s3,1676 # 168c <gHuffTab3>
    1704:	00001db7          	lui	s11,0x1
    1708:	078d8d93          	addi	s11,s11,120 # 1078 <CSWTCH.291>
    170c:	00100c93          	li	s9,1
    1710:	00f00d13          	li	s10,15
    1714:	01612a23          	sw	s6,20(sp)
    1718:	01712c23          	sw	s7,24(sp)
    171c:	00090593          	mv	a1,s2
    1720:	00098513          	mv	a0,s3
    1724:	fc4ff0ef          	jal	ee8 <huffDecode>
    1728:	00455793          	srli	a5,a0,0x4
    172c:	00f57b13          	andi	s6,a0,15
    1730:	0ff7fb93          	zext.b	s7,a5
    1734:	220b1863          	bnez	s6,1964 <gQuant1+0x70>
    1738:	21ab94e3          	bne	s7,s10,2140 <__bss_end+0x39c>
    173c:	03000793          	li	a5,48
    1740:	f197ece3          	bltu	a5,s9,1658 <gHuffVal3+0xcc>
    1744:	010c8713          	addi	a4,s9,16
    1748:	0ff77713          	zext.b	a4,a4
    174c:	019487b3          	add	a5,s1,s9
    1750:	00078783          	lb	a5,0(a5)
    1754:	001c8c93          	addi	s9,s9,1
    1758:	0ffcfc93          	zext.b	s9,s9
    175c:	00179793          	slli	a5,a5,0x1
    1760:	00f407b3          	add	a5,s0,a5
    1764:	00079023          	sh	zero,0(a5)
    1768:	feec92e3          	bne	s9,a4,174c <gHuffVal2+0x70>
    176c:	03f00793          	li	a5,63
    1770:	fb97f6e3          	bgeu	a5,s9,171c <gHuffVal2+0x40>
    1774:	01412b03          	lw	s6,20(sp)
    1778:	01812b83          	lw	s7,24(sp)
    177c:	00002637          	lui	a2,0x2
    1780:	d7460613          	addi	a2,a2,-652 # 1d74 <pInfo>
    1784:	00040793          	mv	a5,s0
    1788:	1840006f          	j	190c <gQuant1+0x18>
    178c:	41d88f33          	sub	t5,a7,t4
    1790:	01d888b3          	add	a7,a7,t4
    1794:	40b30eb3          	sub	t4,t1,a1
    1798:	010e9e93          	slli	t4,t4,0x10
    179c:	00b30733          	add	a4,t1,a1
    17a0:	410ede93          	srai	t4,t4,0x10
    17a4:	406f0333          	sub	t1,t5,t1
    17a8:	006585b3          	add	a1,a1,t1
    17ac:	41170333          	sub	t1,a4,a7
    17b0:	00e888b3          	add	a7,a7,a4
    17b4:	004e9713          	slli	a4,t4,0x4
    17b8:	01d70733          	add	a4,a4,t4
    17bc:	01059f93          	slli	t6,a1,0x10
    17c0:	00271713          	slli	a4,a4,0x2
    17c4:	410fdf93          	srai	t6,t6,0x10
    17c8:	01d70733          	add	a4,a4,t4
    17cc:	010f1f13          	slli	t5,t5,0x10
    17d0:	410f5f13          	srai	t5,t5,0x10
    17d4:	001f9593          	slli	a1,t6,0x1
    17d8:	00271713          	slli	a4,a4,0x2
    17dc:	01f585b3          	add	a1,a1,t6
    17e0:	01d70733          	add	a4,a4,t4
    17e4:	003f1e93          	slli	t4,t5,0x3
    17e8:	41ee8eb3          	sub	t4,t4,t5
    17ec:	00459593          	slli	a1,a1,0x4
    17f0:	01f585b3          	add	a1,a1,t6
    17f4:	005e9e93          	slli	t4,t4,0x5
    17f8:	41c50fb3          	sub	t6,a0,t3
    17fc:	41ee8eb3          	sub	t4,t4,t5
    1800:	01031313          	slli	t1,t1,0x10
    1804:	010f9f93          	slli	t6,t6,0x10
    1808:	41035313          	srai	t1,t1,0x10
    180c:	410fdf93          	srai	t6,t6,0x10
    1810:	002e9f13          	slli	t5,t4,0x2
    1814:	00131393          	slli	t2,t1,0x1
    1818:	41df0eb3          	sub	t4,t5,t4
    181c:	001f9f13          	slli	t5,t6,0x1
    1820:	006383b3          	add	t2,t2,t1
    1824:	01ff0f33          	add	t5,t5,t6
    1828:	01c50e33          	add	t3,a0,t3
    182c:	00439293          	slli	t0,t2,0x4
    1830:	004f1513          	slli	a0,t5,0x4
    1834:	407282b3          	sub	t0,t0,t2
    1838:	41e50533          	sub	a0,a0,t5
    183c:	00229293          	slli	t0,t0,0x2
    1840:	00251513          	slli	a0,a0,0x2
    1844:	006282b3          	add	t0,t0,t1
    1848:	08070713          	addi	a4,a4,128
    184c:	01f50533          	add	a0,a0,t6
    1850:	00259593          	slli	a1,a1,0x2
    1854:	40875313          	srai	t1,a4,0x8
    1858:	08058593          	addi	a1,a1,128
    185c:	00129713          	slli	a4,t0,0x1
    1860:	00151513          	slli	a0,a0,0x1
    1864:	4085df13          	srai	t5,a1,0x8
    1868:	40688fb3          	sub	t6,a7,t1
    186c:	410685b3          	sub	a1,a3,a6
    1870:	08070713          	addi	a4,a4,128
    1874:	080e8e93          	addi	t4,t4,128
    1878:	08050513          	addi	a0,a0,128
    187c:	40855513          	srai	a0,a0,0x8
    1880:	010686b3          	add	a3,a3,a6
    1884:	41c582b3          	sub	t0,a1,t3
    1888:	01ff0fb3          	add	t6,t5,t6
    188c:	408ede93          	srai	t4,t4,0x8
    1890:	40875713          	srai	a4,a4,0x8
    1894:	00ef8733          	add	a4,t6,a4
    1898:	005502b3          	add	t0,a0,t0
    189c:	41130333          	sub	t1,t1,a7
    18a0:	41df0833          	sub	a6,t5,t4
    18a4:	01c68eb3          	add	t4,a3,t3
    18a8:	01070833          	add	a6,a4,a6
    18ac:	41c686b3          	sub	a3,a3,t3
    18b0:	01d883b3          	add	t2,a7,t4
    18b4:	01c585b3          	add	a1,a1,t3
    18b8:	00628333          	add	t1,t0,t1
    18bc:	411e8eb3          	sub	t4,t4,a7
    18c0:	40a585b3          	sub	a1,a1,a0
    18c4:	41e30533          	sub	a0,t1,t5
    18c8:	41068333          	sub	t1,a3,a6
    18cc:	00d80833          	add	a6,a6,a3
    18d0:	010e9693          	slli	a3,t4,0x10
    18d4:	00b70e33          	add	t3,a4,a1
    18d8:	005f88b3          	add	a7,t6,t0
    18dc:	40e58733          	sub	a4,a1,a4
    18e0:	00779023          	sh	t2,0(a5)
    18e4:	4106d693          	srai	a3,a3,0x10
    18e8:	00a79123          	sh	a0,2(a5)
    18ec:	01c79223          	sh	t3,4(a5)
    18f0:	00679323          	sh	t1,6(a5)
    18f4:	01079423          	sh	a6,8(a5)
    18f8:	00e79523          	sh	a4,10(a5)
    18fc:	01179623          	sh	a7,12(a5)
    1900:	00d79723          	sh	a3,14(a5)
    1904:	01078793          	addi	a5,a5,16
    1908:	2cc78863          	beq	a5,a2,1bd8 <gMCUBufG+0xe4>
    190c:	00279303          	lh	t1,2(a5)
    1910:	00479503          	lh	a0,4(a5)
    1914:	00679e83          	lh	t4,6(a5)
    1918:	00879803          	lh	a6,8(a5)
    191c:	00a79883          	lh	a7,10(a5)
    1920:	00a36733          	or	a4,t1,a0
    1924:	00c79e03          	lh	t3,12(a5)
    1928:	00eee733          	or	a4,t4,a4
    192c:	00e79583          	lh	a1,14(a5)
    1930:	00e86733          	or	a4,a6,a4
    1934:	00e8e733          	or	a4,a7,a4
    1938:	00ee6733          	or	a4,t3,a4
    193c:	00e5e733          	or	a4,a1,a4
    1940:	00079683          	lh	a3,0(a5)
    1944:	e40714e3          	bnez	a4,178c <gHuffVal2+0xb0>
    1948:	00068513          	mv	a0,a3
    194c:	00068e13          	mv	t3,a3
    1950:	00068313          	mv	t1,a3
    1954:	00068813          	mv	a6,a3
    1958:	00068713          	mv	a4,a3
    195c:	00068893          	mv	a7,a3
    1960:	f89ff06f          	j	18e8 <gHuffTab0+0x4c>
    1964:	00100593          	li	a1,1
    1968:	000b0513          	mv	a0,s6
    196c:	bb8ff0ef          	jal	d24 <getBits>
    1970:	060b9463          	bnez	s7,19d8 <gQuant0+0x64>
    1974:	fffb0713          	addi	a4,s6,-1
    1978:	0ff77713          	zext.b	a4,a4
    197c:	00171713          	slli	a4,a4,0x1
    1980:	00ea87b3          	add	a5,s5,a4
    1984:	0007d783          	lhu	a5,0(a5)
    1988:	00f57c63          	bgeu	a0,a5,19a0 <gQuant0+0x2c>
    198c:	00ed8733          	add	a4,s11,a4
    1990:	00075783          	lhu	a5,0(a4)
    1994:	00f507b3          	add	a5,a0,a5
    1998:	01079513          	slli	a0,a5,0x10
    199c:	01055513          	srli	a0,a0,0x10
    19a0:	019487b3          	add	a5,s1,s9
    19a4:	001c9713          	slli	a4,s9,0x1
    19a8:	00ea0733          	add	a4,s4,a4
    19ac:	00078783          	lb	a5,0(a5)
    19b0:	00075583          	lhu	a1,0(a4)
    19b4:	001c8c93          	addi	s9,s9,1
    19b8:	00179793          	slli	a5,a5,0x1
    19bc:	00f40b33          	add	s6,s0,a5
    19c0:	378020ef          	jal	3d38 <__mulsi3>
    19c4:	0ffcfc93          	zext.b	s9,s9
    19c8:	00ab1023          	sh	a0,0(s6)
    19cc:	03f00793          	li	a5,63
    19d0:	d597f6e3          	bgeu	a5,s9,171c <gHuffVal2+0x40>
    19d4:	da1ff06f          	j	1774 <gHuffVal2+0x98>
    19d8:	019b8cb3          	add	s9,s7,s9
    19dc:	03f00693          	li	a3,63
    19e0:	c796cce3          	blt	a3,s9,1658 <gHuffVal3+0xcc>
    19e4:	000b8793          	mv	a5,s7
    19e8:	0ffcfc93          	zext.b	s9,s9
    19ec:	40fc86b3          	sub	a3,s9,a5
    19f0:	0ff6f693          	zext.b	a3,a3
    19f4:	00d486b3          	add	a3,s1,a3
    19f8:	00068683          	lb	a3,0(a3)
    19fc:	fff78793          	addi	a5,a5,-1
    1a00:	01079793          	slli	a5,a5,0x10
    1a04:	00169693          	slli	a3,a3,0x1
    1a08:	00d406b3          	add	a3,s0,a3
    1a0c:	0107d793          	srli	a5,a5,0x10
    1a10:	00069023          	sh	zero,0(a3)
    1a14:	fc079ce3          	bnez	a5,19ec <gQuant0+0x78>
    1a18:	f5dff06f          	j	1974 <gQuant0>
    1a1c:	00002537          	lui	a0,0x2
    1a20:	000025b7          	lui	a1,0x2
    1a24:	89c50513          	addi	a0,a0,-1892 # 189c <gHuffTab0>
    1a28:	88c58593          	addi	a1,a1,-1908 # 188c <gHuffVal0>
    1a2c:	cbcff0ef          	jal	ee8 <huffDecode>
    1a30:	00050993          	mv	s3,a0
    1a34:	00f57513          	andi	a0,a0,15
    1a38:	00000793          	li	a5,0
    1a3c:	b60502e3          	beqz	a0,15a0 <gHuffVal3+0x14>
    1a40:	00100593          	li	a1,1
    1a44:	ae0ff0ef          	jal	d24 <getBits>
    1a48:	fff98713          	addi	a4,s3,-1
    1a4c:	0ff77713          	zext.b	a4,a4
    1a50:	00e00693          	li	a3,14
    1a54:	00050793          	mv	a5,a0
    1a58:	b4e6e4e3          	bltu	a3,a4,15a0 <gHuffVal3+0x14>
    1a5c:	000016b7          	lui	a3,0x1
    1a60:	00171713          	slli	a4,a4,0x1
    1a64:	09868693          	addi	a3,a3,152 # 1098 <CSWTCH.289>
    1a68:	00e686b3          	add	a3,a3,a4
    1a6c:	0006d683          	lhu	a3,0(a3)
    1a70:	b2d578e3          	bgeu	a0,a3,15a0 <gHuffVal3+0x14>
    1a74:	000016b7          	lui	a3,0x1
    1a78:	07868693          	addi	a3,a3,120 # 1078 <CSWTCH.291>
    1a7c:	00e68733          	add	a4,a3,a4
    1a80:	00075703          	lhu	a4,0(a4)
    1a84:	00e507b3          	add	a5,a0,a4
    1a88:	b19ff06f          	j	15a0 <gHuffVal3+0x14>
    1a8c:	00041783          	lh	a5,0(s0)
    1a90:	0ff00713          	li	a4,255
    1a94:	01412b03          	lw	s6,20(sp)
    1a98:	04078793          	addi	a5,a5,64
    1a9c:	0077d793          	srli	a5,a5,0x7
    1aa0:	08078793          	addi	a5,a5,128
    1aa4:	01079793          	slli	a5,a5,0x10
    1aa8:	0107d793          	srli	a5,a5,0x10
    1aac:	6cf77c63          	bgeu	a4,a5,2184 <__bss_end+0x3e0>
    1ab0:	fff7c793          	not	a5,a5
    1ab4:	01079713          	slli	a4,a5,0x10
    1ab8:	41f75793          	srai	a5,a4,0x1f
    1abc:	0ff7f793          	zext.b	a5,a5
    1ac0:	00001737          	lui	a4,0x1
    1ac4:	45472703          	lw	a4,1108(a4) # 1454 <gScanType>
    1ac8:	00400693          	li	a3,4
    1acc:	0ae6ea63          	bltu	a3,a4,1b80 <gMCUBufG+0x8c>
    1ad0:	000016b7          	lui	a3,0x1
    1ad4:	00271713          	slli	a4,a4,0x2
    1ad8:	00068693          	mv	a3,a3
    1adc:	00d70733          	add	a4,a4,a3
    1ae0:	00072703          	lw	a4,0(a4)
    1ae4:	00070067          	jr	a4
    1ae8:	00200713          	li	a4,2
    1aec:	70eb0e63          	beq	s6,a4,2208 <__bss_end+0x464>
    1af0:	01677463          	bgeu	a4,s6,1af8 <gMCUBufG+0x4>
    1af4:	0dc0106f          	j	2bd0 <__bss_end+0xe2c>
    1af8:	060b0263          	beqz	s6,1b5c <gMCUBufG+0x68>
    1afc:	00002737          	lui	a4,0x2
    1b00:	c6f70a23          	sb	a5,-908(a4) # 1c74 <gMCUBufR+0x80>
    1b04:	00002737          	lui	a4,0x2
    1b08:	b6f70a23          	sb	a5,-1164(a4) # 1b74 <gMCUBufG+0x80>
    1b0c:	00002737          	lui	a4,0x2
    1b10:	a6f70a23          	sb	a5,-1420(a4) # 1a74 <gMCUBufB+0x80>
    1b14:	06c0006f          	j	1b80 <gMCUBufG+0x8c>
    1b18:	00200713          	li	a4,2
    1b1c:	7eeb0063          	beq	s6,a4,22fc <__bss_end+0x558>
    1b20:	796766e3          	bltu	a4,s6,2aac <__bss_end+0xd08>
    1b24:	020b0c63          	beqz	s6,1b5c <gMCUBufG+0x68>
    1b28:	00002737          	lui	a4,0x2
    1b2c:	c2f70a23          	sb	a5,-972(a4) # 1c34 <gMCUBufR+0x40>
    1b30:	00002737          	lui	a4,0x2
    1b34:	b2f70a23          	sb	a5,-1228(a4) # 1b34 <gMCUBufG+0x40>
    1b38:	00002737          	lui	a4,0x2
    1b3c:	a2f70a23          	sb	a5,-1484(a4) # 1a34 <gMCUBufB+0x40>
    1b40:	0400006f          	j	1b80 <gMCUBufG+0x8c>
    1b44:	00100713          	li	a4,1
    1b48:	0aeb04e3          	beq	s6,a4,23f0 <__bss_end+0x64c>
    1b4c:	00200713          	li	a4,2
    1b50:	00eb1463          	bne	s6,a4,1b58 <gMCUBufG+0x64>
    1b54:	2f80106f          	j	2e4c <__bss_end+0x10a8>
    1b58:	020b1463          	bnez	s6,1b80 <gMCUBufG+0x8c>
    1b5c:	00002737          	lui	a4,0x2
    1b60:	bef70a23          	sb	a5,-1036(a4) # 1bf4 <gMCUBufR>
    1b64:	00002737          	lui	a4,0x2
    1b68:	aef70a23          	sb	a5,-1292(a4) # 1af4 <gMCUBufG>
    1b6c:	00002737          	lui	a4,0x2
    1b70:	9ef70a23          	sb	a5,-1548(a4) # 19f4 <gMCUBufB>
    1b74:	00c0006f          	j	1b80 <gMCUBufG+0x8c>
    1b78:	00002737          	lui	a4,0x2
    1b7c:	bef70a23          	sb	a5,-1036(a4) # 1bf4 <gMCUBufR>
    1b80:	01012783          	lw	a5,16(sp)
    1b84:	001b0b13          	addi	s6,s6,1
    1b88:	0ffb7b13          	zext.b	s6,s6
    1b8c:	4527c783          	lbu	a5,1106(a5)
    1b90:	001b8b93          	addi	s7,s7,1
    1b94:	9afb6ae3          	bltu	s6,a5,1548 <gInBuf+0xc0>
    1b98:	01c12c83          	lw	s9,28(sp)
    1b9c:	04812a03          	lw	s4,72(sp)
    1ba0:	04412a83          	lw	s5,68(sp)
    1ba4:	04012b03          	lw	s6,64(sp)
    1ba8:	03c12b83          	lw	s7,60(sp)
    1bac:	03012d03          	lw	s10,48(sp)
    1bb0:	02c12d83          	lw	s11,44(sp)
    1bb4:	afdff06f          	j	16b0 <gHuffTab3+0x24>
    1bb8:	00500713          	li	a4,5
    1bbc:	fb6760e3          	bltu	a4,s6,1b5c <gMCUBufG+0x68>
    1bc0:	000016b7          	lui	a3,0x1
    1bc4:	01468693          	addi	a3,a3,20 # 1014 <processMarkers+0x60>
    1bc8:	002b1713          	slli	a4,s6,0x2
    1bcc:	00d70733          	add	a4,a4,a3
    1bd0:	00072703          	lw	a4,0(a4)
    1bd4:	00070067          	jr	a4
    1bd8:	00002537          	lui	a0,0x2
    1bdc:	d0450513          	addi	a0,a0,-764 # 1d04 <gCoeffBuf+0x10>
    1be0:	00040713          	mv	a4,s0
    1be4:	0ff00593          	li	a1,255
    1be8:	0740006f          	j	1c5c <gMCUBufR+0x68>
    1bec:	04078793          	addi	a5,a5,64
    1bf0:	0077d793          	srli	a5,a5,0x7
    1bf4:	08078793          	addi	a5,a5,128
    1bf8:	01079693          	slli	a3,a5,0x10
    1bfc:	0106d693          	srli	a3,a3,0x10
    1c00:	0ff7f793          	zext.b	a5,a5
    1c04:	00d5fa63          	bgeu	a1,a3,1c18 <gMCUBufR+0x24>
    1c08:	fff6c693          	not	a3,a3
    1c0c:	01069793          	slli	a5,a3,0x10
    1c10:	41f7d693          	srai	a3,a5,0x1f
    1c14:	0ff6f793          	zext.b	a5,a3
    1c18:	00078e93          	mv	t4,a5
    1c1c:	00078e13          	mv	t3,a5
    1c20:	00078313          	mv	t1,a5
    1c24:	00078893          	mv	a7,a5
    1c28:	00078693          	mv	a3,a5
    1c2c:	00078f13          	mv	t5,a5
    1c30:	00078813          	mv	a6,a5
    1c34:	01d71023          	sh	t4,0(a4)
    1c38:	01c71823          	sh	t3,16(a4)
    1c3c:	02671023          	sh	t1,32(a4)
    1c40:	03171823          	sh	a7,48(a4)
    1c44:	04d71023          	sh	a3,64(a4)
    1c48:	05e71823          	sh	t5,80(a4)
    1c4c:	07071023          	sh	a6,96(a4)
    1c50:	06f71823          	sh	a5,112(a4)
    1c54:	00270713          	addi	a4,a4,2
    1c58:	32a70a63          	beq	a4,a0,1f8c <__bss_end+0x1e8>
    1c5c:	01071883          	lh	a7,16(a4)
    1c60:	02071283          	lh	t0,32(a4)
    1c64:	03071e83          	lh	t4,48(a4)
    1c68:	04071803          	lh	a6,64(a4)
    1c6c:	05071303          	lh	t1,80(a4)
    1c70:	0112e6b3          	or	a3,t0,a7
    1c74:	06071f03          	lh	t5,96(a4)
    1c78:	00dee6b3          	or	a3,t4,a3
    1c7c:	07071e03          	lh	t3,112(a4)
    1c80:	00d866b3          	or	a3,a6,a3
    1c84:	00d366b3          	or	a3,t1,a3
    1c88:	00df66b3          	or	a3,t5,a3
    1c8c:	00de66b3          	or	a3,t3,a3
    1c90:	00071783          	lh	a5,0(a4)
    1c94:	f4068ce3          	beqz	a3,1bec <gMCUBufG+0xf8>
    1c98:	006e86b3          	add	a3,t4,t1
    1c9c:	011e03b3          	add	t2,t3,a7
    1ca0:	40d38933          	sub	s2,t2,a3
    1ca4:	01091913          	slli	s2,s2,0x10
    1ca8:	41095913          	srai	s2,s2,0x10
    1cac:	41d30333          	sub	t1,t1,t4
    1cb0:	00d383b3          	add	t2,t2,a3
    1cb4:	41c88fb3          	sub	t6,a7,t3
    1cb8:	411306b3          	sub	a3,t1,a7
    1cbc:	00191893          	slli	a7,s2,0x1
    1cc0:	00de0e33          	add	t3,t3,a3
    1cc4:	010f9f93          	slli	t6,t6,0x10
    1cc8:	012886b3          	add	a3,a7,s2
    1ccc:	410fdf93          	srai	t6,t6,0x10
    1cd0:	00469893          	slli	a7,a3,0x4
    1cd4:	40d888b3          	sub	a7,a7,a3
    1cd8:	004f9693          	slli	a3,t6,0x4
    1cdc:	01f686b3          	add	a3,a3,t6
    1ce0:	00269693          	slli	a3,a3,0x2
    1ce4:	01f686b3          	add	a3,a3,t6
    1ce8:	00289893          	slli	a7,a7,0x2
    1cec:	012888b3          	add	a7,a7,s2
    1cf0:	00269693          	slli	a3,a3,0x2
    1cf4:	01f686b3          	add	a3,a3,t6
    1cf8:	00189893          	slli	a7,a7,0x1
    1cfc:	01031313          	slli	t1,t1,0x10
    1d00:	08088893          	addi	a7,a7,128
    1d04:	08068693          	addi	a3,a3,128
    1d08:	41035313          	srai	t1,t1,0x10
    1d0c:	4086d693          	srai	a3,a3,0x8
    1d10:	010e1e13          	slli	t3,t3,0x10
    1d14:	4088d893          	srai	a7,a7,0x8
    1d18:	40768933          	sub	s2,a3,t2
    1d1c:	410e5e13          	srai	t3,t3,0x10
    1d20:	40d888b3          	sub	a7,a7,a3
    1d24:	00331693          	slli	a3,t1,0x3
    1d28:	01039f93          	slli	t6,t2,0x10
    1d2c:	011388b3          	add	a7,t2,a7
    1d30:	406686b3          	sub	a3,a3,t1
    1d34:	001e1393          	slli	t2,t3,0x1
    1d38:	41e28eb3          	sub	t4,t0,t5
    1d3c:	01c383b3          	add	t2,t2,t3
    1d40:	00569693          	slli	a3,a3,0x5
    1d44:	406686b3          	sub	a3,a3,t1
    1d48:	00439393          	slli	t2,t2,0x4
    1d4c:	010e9e93          	slli	t4,t4,0x10
    1d50:	410ede93          	srai	t4,t4,0x10
    1d54:	01c38e33          	add	t3,t2,t3
    1d58:	00269393          	slli	t2,a3,0x2
    1d5c:	40d386b3          	sub	a3,t2,a3
    1d60:	001e9393          	slli	t2,t4,0x1
    1d64:	005f0f33          	add	t5,t5,t0
    1d68:	01d383b3          	add	t2,t2,t4
    1d6c:	00f802b3          	add	t0,a6,a5
    1d70:	002e1313          	slli	t1,t3,0x2
    1d74:	41078833          	sub	a6,a5,a6
    1d78:	00439e13          	slli	t3,t2,0x4
    1d7c:	005f07b3          	add	a5,t5,t0
    1d80:	407e0e33          	sub	t3,t3,t2
    1d84:	01079793          	slli	a5,a5,0x10
    1d88:	410fdf93          	srai	t6,t6,0x10
    1d8c:	4107d793          	srai	a5,a5,0x10
    1d90:	002e1e13          	slli	t3,t3,0x2
    1d94:	01de0e33          	add	t3,t3,t4
    1d98:	00ff83b3          	add	t2,t6,a5
    1d9c:	04038393          	addi	t2,t2,64
    1da0:	08030313          	addi	t1,t1,128
    1da4:	08068693          	addi	a3,a3,128
    1da8:	001e1e13          	slli	t3,t3,0x1
    1dac:	40835313          	srai	t1,t1,0x8
    1db0:	0073de93          	srli	t4,t2,0x7
    1db4:	4086d693          	srai	a3,a3,0x8
    1db8:	080e0e13          	addi	t3,t3,128
    1dbc:	010f03b3          	add	t2,t5,a6
    1dc0:	011308b3          	add	a7,t1,a7
    1dc4:	40d306b3          	sub	a3,t1,a3
    1dc8:	080e8e93          	addi	t4,t4,128
    1dcc:	40690333          	sub	t1,s2,t1
    1dd0:	408e5e13          	srai	t3,t3,0x8
    1dd4:	41e80933          	sub	s2,a6,t5
    1dd8:	012e0833          	add	a6,t3,s2
    1ddc:	010e9993          	slli	s3,t4,0x10
    1de0:	41c38e33          	sub	t3,t2,t3
    1de4:	41e282b3          	sub	t0,t0,t5
    1de8:	00d886b3          	add	a3,a7,a3
    1dec:	01031393          	slli	t2,t1,0x10
    1df0:	01069693          	slli	a3,a3,0x10
    1df4:	01089913          	slli	s2,a7,0x10
    1df8:	01081813          	slli	a6,a6,0x10
    1dfc:	010e1f13          	slli	t5,t3,0x10
    1e00:	01029293          	slli	t0,t0,0x10
    1e04:	0109d993          	srli	s3,s3,0x10
    1e08:	4103d393          	srai	t2,t2,0x10
    1e0c:	4106d693          	srai	a3,a3,0x10
    1e10:	41095913          	srai	s2,s2,0x10
    1e14:	41085813          	srai	a6,a6,0x10
    1e18:	410f5f13          	srai	t5,t5,0x10
    1e1c:	4102d293          	srai	t0,t0,0x10
    1e20:	0ffefe93          	zext.b	t4,t4
    1e24:	0135fa63          	bgeu	a1,s3,1e38 <__bss_end+0x94>
    1e28:	fff9c993          	not	s3,s3
    1e2c:	01099893          	slli	a7,s3,0x10
    1e30:	41f8d993          	srai	s3,a7,0x1f
    1e34:	0ff9fe93          	zext.b	t4,s3
    1e38:	01038e33          	add	t3,t2,a6
    1e3c:	040e0e13          	addi	t3,t3,64
    1e40:	007e5e13          	srli	t3,t3,0x7
    1e44:	080e0e13          	addi	t3,t3,128
    1e48:	010e1893          	slli	a7,t3,0x10
    1e4c:	0108d893          	srli	a7,a7,0x10
    1e50:	0ffe7e13          	zext.b	t3,t3
    1e54:	0115fa63          	bgeu	a1,a7,1e68 <__bss_end+0xc4>
    1e58:	fff8c893          	not	a7,a7
    1e5c:	01089313          	slli	t1,a7,0x10
    1e60:	41f35893          	srai	a7,t1,0x1f
    1e64:	0ff8fe13          	zext.b	t3,a7
    1e68:	01e90333          	add	t1,s2,t5
    1e6c:	04030313          	addi	t1,t1,64
    1e70:	00735313          	srli	t1,t1,0x7
    1e74:	08030313          	addi	t1,t1,128
    1e78:	01031893          	slli	a7,t1,0x10
    1e7c:	0108d893          	srli	a7,a7,0x10
    1e80:	0ff37313          	zext.b	t1,t1
    1e84:	0115fa63          	bgeu	a1,a7,1e98 <__bss_end+0xf4>
    1e88:	fff8c893          	not	a7,a7
    1e8c:	01089313          	slli	t1,a7,0x10
    1e90:	41f35893          	srai	a7,t1,0x1f
    1e94:	0ff8f313          	zext.b	t1,a7
    1e98:	40d288b3          	sub	a7,t0,a3
    1e9c:	04088893          	addi	a7,a7,64
    1ea0:	0078d893          	srli	a7,a7,0x7
    1ea4:	08088893          	addi	a7,a7,128
    1ea8:	01089993          	slli	s3,a7,0x10
    1eac:	0109d993          	srli	s3,s3,0x10
    1eb0:	0ff8f893          	zext.b	a7,a7
    1eb4:	0135fa63          	bgeu	a1,s3,1ec8 <__bss_end+0x124>
    1eb8:	fff9c993          	not	s3,s3
    1ebc:	01099893          	slli	a7,s3,0x10
    1ec0:	41f8d993          	srai	s3,a7,0x1f
    1ec4:	0ff9f893          	zext.b	a7,s3
    1ec8:	005686b3          	add	a3,a3,t0
    1ecc:	04068693          	addi	a3,a3,64
    1ed0:	0076d693          	srli	a3,a3,0x7
    1ed4:	08068693          	addi	a3,a3,128
    1ed8:	01069293          	slli	t0,a3,0x10
    1edc:	0102d293          	srli	t0,t0,0x10
    1ee0:	0ff6f693          	zext.b	a3,a3
    1ee4:	0055fa63          	bgeu	a1,t0,1ef8 <__bss_end+0x154>
    1ee8:	fff2c293          	not	t0,t0
    1eec:	01029693          	slli	a3,t0,0x10
    1ef0:	41f6d293          	srai	t0,a3,0x1f
    1ef4:	0ff2f693          	zext.b	a3,t0
    1ef8:	412f0f33          	sub	t5,t5,s2
    1efc:	040f0f13          	addi	t5,t5,64
    1f00:	007f5f13          	srli	t5,t5,0x7
    1f04:	080f0f13          	addi	t5,t5,128
    1f08:	010f1293          	slli	t0,t5,0x10
    1f0c:	0102d293          	srli	t0,t0,0x10
    1f10:	0fff7f13          	zext.b	t5,t5
    1f14:	0055fa63          	bgeu	a1,t0,1f28 <__bss_end+0x184>
    1f18:	fff2c293          	not	t0,t0
    1f1c:	01029f13          	slli	t5,t0,0x10
    1f20:	41ff5293          	srai	t0,t5,0x1f
    1f24:	0ff2ff13          	zext.b	t5,t0
    1f28:	40780833          	sub	a6,a6,t2
    1f2c:	04080813          	addi	a6,a6,64
    1f30:	00785813          	srli	a6,a6,0x7
    1f34:	08080813          	addi	a6,a6,128
    1f38:	01081293          	slli	t0,a6,0x10
    1f3c:	0102d293          	srli	t0,t0,0x10
    1f40:	0ff87813          	zext.b	a6,a6
    1f44:	0055fa63          	bgeu	a1,t0,1f58 <__bss_end+0x1b4>
    1f48:	fff2c293          	not	t0,t0
    1f4c:	01029813          	slli	a6,t0,0x10
    1f50:	41f85293          	srai	t0,a6,0x1f
    1f54:	0ff2f813          	zext.b	a6,t0
    1f58:	41f787b3          	sub	a5,a5,t6
    1f5c:	04078793          	addi	a5,a5,64
    1f60:	0077d793          	srli	a5,a5,0x7
    1f64:	08078793          	addi	a5,a5,128
    1f68:	01079f93          	slli	t6,a5,0x10
    1f6c:	010fdf93          	srli	t6,t6,0x10
    1f70:	0ff7f793          	zext.b	a5,a5
    1f74:	cdf5f0e3          	bgeu	a1,t6,1c34 <gMCUBufR+0x40>
    1f78:	ffffcf93          	not	t6,t6
    1f7c:	010f9793          	slli	a5,t6,0x10
    1f80:	41f7df93          	srai	t6,a5,0x1f
    1f84:	0ffff793          	zext.b	a5,t6
    1f88:	cadff06f          	j	1c34 <gMCUBufR+0x40>
    1f8c:	000017b7          	lui	a5,0x1
    1f90:	4547a783          	lw	a5,1108(a5) # 1454 <gScanType>
    1f94:	00400713          	li	a4,4
    1f98:	bef764e3          	bltu	a4,a5,1b80 <gMCUBufG+0x8c>
    1f9c:	00001737          	lui	a4,0x1
    1fa0:	00279793          	slli	a5,a5,0x2
    1fa4:	02c70713          	addi	a4,a4,44 # 102c <processMarkers+0x78>
    1fa8:	00e787b3          	add	a5,a5,a4
    1fac:	0007a783          	lw	a5,0(a5)
    1fb0:	00078067          	jr	a5
    1fb4:	00002537          	lui	a0,0x2
    1fb8:	000025b7          	lui	a1,0x2
    1fbc:	000026b7          	lui	a3,0x2
    1fc0:	9f450513          	addi	a0,a0,-1548 # 19f4 <gMCUBufB>
    1fc4:	af458593          	addi	a1,a1,-1292 # 1af4 <gMCUBufG>
    1fc8:	bf468693          	addi	a3,a3,-1036 # 1bf4 <gMCUBufR>
    1fcc:	00040793          	mv	a5,s0
    1fd0:	0007d703          	lhu	a4,0(a5)
    1fd4:	00278793          	addi	a5,a5,2
    1fd8:	00168693          	addi	a3,a3,1
    1fdc:	fee68fa3          	sb	a4,-1(a3)
    1fe0:	00e58023          	sb	a4,0(a1)
    1fe4:	00e50023          	sb	a4,0(a0)
    1fe8:	00158593          	addi	a1,a1,1
    1fec:	00150513          	addi	a0,a0,1
    1ff0:	fec790e3          	bne	a5,a2,1fd0 <__bss_end+0x22c>
    1ff4:	b8dff06f          	j	1b80 <gMCUBufG+0x8c>
    1ff8:	00500793          	li	a5,5
    1ffc:	2167e6e3          	bltu	a5,s6,2a08 <__bss_end+0xc64>
    2000:	00001737          	lui	a4,0x1
    2004:	04070713          	addi	a4,a4,64 # 1040 <processMarkers+0x8c>
    2008:	002b1793          	slli	a5,s6,0x2
    200c:	00e787b3          	add	a5,a5,a4
    2010:	0007a783          	lw	a5,0(a5)
    2014:	00078067          	jr	a5
    2018:	00200793          	li	a5,2
    201c:	1cfb0863          	beq	s6,a5,21ec <__bss_end+0x448>
    2020:	3967e4e3          	bltu	a5,s6,2ba8 <__bss_end+0xe04>
    2024:	4c0b0ae3          	beqz	s6,2cf8 <__bss_end+0xf54>
    2028:	00002537          	lui	a0,0x2
    202c:	000025b7          	lui	a1,0x2
    2030:	000026b7          	lui	a3,0x2
    2034:	a7450513          	addi	a0,a0,-1420 # 1a74 <gMCUBufB+0x80>
    2038:	b7458593          	addi	a1,a1,-1164 # 1b74 <gMCUBufG+0x80>
    203c:	c7468693          	addi	a3,a3,-908 # 1c74 <gMCUBufR+0x80>
    2040:	00040793          	mv	a5,s0
    2044:	0007d703          	lhu	a4,0(a5)
    2048:	00278793          	addi	a5,a5,2
    204c:	00168693          	addi	a3,a3,1
    2050:	fee68fa3          	sb	a4,-1(a3)
    2054:	00e58023          	sb	a4,0(a1)
    2058:	00e50023          	sb	a4,0(a0)
    205c:	00158593          	addi	a1,a1,1
    2060:	00150513          	addi	a0,a0,1
    2064:	fec790e3          	bne	a5,a2,2044 <__bss_end+0x2a0>
    2068:	b19ff06f          	j	1b80 <gMCUBufG+0x8c>
    206c:	00200793          	li	a5,2
    2070:	4efb0263          	beq	s6,a5,2554 <__bss_end+0x7b0>
    2074:	4567eee3          	bltu	a5,s6,2cd0 <__bss_end+0xf2c>
    2078:	4c0b02e3          	beqz	s6,2d3c <__bss_end+0xf98>
    207c:	00002737          	lui	a4,0x2
    2080:	000027b7          	lui	a5,0x2
    2084:	00002537          	lui	a0,0x2
    2088:	a3470713          	addi	a4,a4,-1484 # 1a34 <gMCUBufB+0x40>
    208c:	b3478793          	addi	a5,a5,-1228 # 1b34 <gMCUBufG+0x40>
    2090:	c3450513          	addi	a0,a0,-972 # 1c34 <gMCUBufR+0x40>
    2094:	00040693          	mv	a3,s0
    2098:	0006d583          	lhu	a1,0(a3)
    209c:	00268693          	addi	a3,a3,2
    20a0:	00150513          	addi	a0,a0,1
    20a4:	feb50fa3          	sb	a1,-1(a0)
    20a8:	00b78023          	sb	a1,0(a5)
    20ac:	00b70023          	sb	a1,0(a4)
    20b0:	00178793          	addi	a5,a5,1
    20b4:	00170713          	addi	a4,a4,1
    20b8:	fec690e3          	bne	a3,a2,2098 <__bss_end+0x2f4>
    20bc:	ac5ff06f          	j	1b80 <gMCUBufG+0x8c>
    20c0:	00100793          	li	a5,1
    20c4:	3cfb0863          	beq	s6,a5,2494 <__bss_end+0x6f0>
    20c8:	00200793          	li	a5,2
    20cc:	4afb0ae3          	beq	s6,a5,2d80 <__bss_end+0xfdc>
    20d0:	aa0b18e3          	bnez	s6,1b80 <gMCUBufG+0x8c>
    20d4:	00002537          	lui	a0,0x2
    20d8:	000025b7          	lui	a1,0x2
    20dc:	000026b7          	lui	a3,0x2
    20e0:	9f450513          	addi	a0,a0,-1548 # 19f4 <gMCUBufB>
    20e4:	af458593          	addi	a1,a1,-1292 # 1af4 <gMCUBufG>
    20e8:	bf468693          	addi	a3,a3,-1036 # 1bf4 <gMCUBufR>
    20ec:	00040793          	mv	a5,s0
    20f0:	0007d703          	lhu	a4,0(a5)
    20f4:	00278793          	addi	a5,a5,2
    20f8:	00168693          	addi	a3,a3,1
    20fc:	fee68fa3          	sb	a4,-1(a3)
    2100:	00e58023          	sb	a4,0(a1)
    2104:	00e50023          	sb	a4,0(a0)
    2108:	00158593          	addi	a1,a1,1
    210c:	00150513          	addi	a0,a0,1
    2110:	fec790e3          	bne	a5,a2,20f0 <__bss_end+0x34c>
    2114:	a6dff06f          	j	1b80 <gMCUBufG+0x8c>
    2118:	00001937          	lui	s2,0x1
    211c:	000019b7          	lui	s3,0x1
    2120:	6dc90913          	addi	s2,s2,1756 # 16dc <gHuffVal2>
    2124:	7dc98993          	addi	s3,s3,2012 # 17dc <gHuffTab2>
    2128:	ddcff06f          	j	1704 <gHuffVal2+0x28>
    212c:	000019b7          	lui	s3,0x1
    2130:	00001a37          	lui	s4,0x1
    2134:	6dc98993          	addi	s3,s3,1756 # 16dc <gHuffVal2>
    2138:	7dca0a13          	addi	s4,s4,2012 # 17dc <gHuffTab2>
    213c:	cbcff06f          	j	15f8 <gHuffVal3+0x6c>
    2140:	03f00713          	li	a4,63
    2144:	000017b7          	lui	a5,0x1
    2148:	0f978793          	addi	a5,a5,249 # 10f9 <ZAG+0x1>
    214c:	41970733          	sub	a4,a4,s9
    2150:	01412b03          	lw	s6,20(sp)
    2154:	01812b83          	lw	s7,24(sp)
    2158:	019786b3          	add	a3,a5,s9
    215c:	0ff77713          	zext.b	a4,a4
    2160:	00e686b3          	add	a3,a3,a4
    2164:	019487b3          	add	a5,s1,s9
    2168:	00078703          	lb	a4,0(a5)
    216c:	00178793          	addi	a5,a5,1
    2170:	00171713          	slli	a4,a4,0x1
    2174:	00e40733          	add	a4,s0,a4
    2178:	00071023          	sh	zero,0(a4)
    217c:	fef696e3          	bne	a3,a5,2168 <__bss_end+0x3c4>
    2180:	dfcff06f          	j	177c <gHuffVal2+0xa0>
    2184:	0ff7f793          	zext.b	a5,a5
    2188:	939ff06f          	j	1ac0 <gMCUBufB+0xcc>
    218c:	05812403          	lw	s0,88(sp)
    2190:	05412483          	lw	s1,84(sp)
    2194:	05012903          	lw	s2,80(sp)
    2198:	04c12983          	lw	s3,76(sp)
    219c:	00078c93          	mv	s9,a5
    21a0:	af4ff06f          	j	1494 <gInBuf+0xc>
    21a4:	60000413          	li	s0,1536
    21a8:	0ff00493          	li	s1,255
    21ac:	0140006f          	j	21c0 <__bss_end+0x41c>
    21b0:	fff40413          	addi	s0,s0,-1
    21b4:	01041413          	slli	s0,s0,0x10
    21b8:	01045413          	srli	s0,s0,0x10
    21bc:	02040463          	beqz	s0,21e4 <__bss_end+0x440>
    21c0:	9fdfe0ef          	jal	bbc <getChar>
    21c4:	fe9516e3          	bne	a0,s1,21b0 <__bss_end+0x40c>
    21c8:	0ff00493          	li	s1,255
    21cc:	9f1fe0ef          	jal	bbc <getChar>
    21d0:	06951ee3          	bne	a0,s1,2a4c <__bss_end+0xca8>
    21d4:	fff40413          	addi	s0,s0,-1
    21d8:	01041413          	slli	s0,s0,0x10
    21dc:	01045413          	srli	s0,s0,0x10
    21e0:	fe0416e3          	bnez	s0,21cc <__bss_end+0x428>
    21e4:	01d00c93          	li	s9,29
    21e8:	c8cff06f          	j	1674 <gHuffVal3+0xe8>
    21ec:	00000593          	li	a1,0
    21f0:	00000513          	li	a0,0
    21f4:	af4fe0ef          	jal	4e8 <upsampleCbV>
    21f8:	08000593          	li	a1,128
    21fc:	02000513          	li	a0,32
    2200:	ae8fe0ef          	jal	4e8 <upsampleCbV>
    2204:	97dff06f          	j	1b80 <gMCUBufG+0x8c>
    2208:	00179713          	slli	a4,a5,0x1
    220c:	00f70633          	add	a2,a4,a5
    2210:	00261613          	slli	a2,a2,0x2
    2214:	000026b7          	lui	a3,0x2
    2218:	af468693          	addi	a3,a3,-1292 # 1af4 <gMCUBufG>
    221c:	40f60633          	sub	a2,a2,a5
    2220:	0006c503          	lbu	a0,0(a3)
    2224:	00361613          	slli	a2,a2,0x3
    2228:	0806c583          	lbu	a1,128(a3)
    222c:	00865613          	srli	a2,a2,0x8
    2230:	fd460613          	addi	a2,a2,-44
    2234:	40c50533          	sub	a0,a0,a2
    2238:	01051513          	slli	a0,a0,0x10
    223c:	40c58633          	sub	a2,a1,a2
    2240:	01061613          	slli	a2,a2,0x10
    2244:	01055513          	srli	a0,a0,0x10
    2248:	0ff00813          	li	a6,255
    224c:	01065613          	srli	a2,a2,0x10
    2250:	00a87a63          	bgeu	a6,a0,2264 <__bss_end+0x4c0>
    2254:	01051593          	slli	a1,a0,0x10
    2258:	4105d593          	srai	a1,a1,0x10
    225c:	00000513          	li	a0,0
    2260:	4805d6e3          	bgez	a1,2eec <__bss_end+0x1148>
    2264:	00a68023          	sb	a0,0(a3)
    2268:	0ff00593          	li	a1,255
    226c:	48c5f8e3          	bgeu	a1,a2,2efc <__bss_end+0x1158>
    2270:	fff64613          	not	a2,a2
    2274:	01061513          	slli	a0,a2,0x10
    2278:	41f55593          	srai	a1,a0,0x1f
    227c:	00f70733          	add	a4,a4,a5
    2280:	f1d78613          	addi	a2,a5,-227
    2284:	08b68023          	sb	a1,128(a3)
    2288:	00571793          	slli	a5,a4,0x5
    228c:	000026b7          	lui	a3,0x2
    2290:	00f70733          	add	a4,a4,a5
    2294:	9f468693          	addi	a3,a3,-1548 # 19f4 <gMCUBufB>
    2298:	00171793          	slli	a5,a4,0x1
    229c:	0006c703          	lbu	a4,0(a3)
    22a0:	0806c583          	lbu	a1,128(a3)
    22a4:	0087d793          	srli	a5,a5,0x8
    22a8:	00c787b3          	add	a5,a5,a2
    22ac:	00e78733          	add	a4,a5,a4
    22b0:	01071713          	slli	a4,a4,0x10
    22b4:	00b787b3          	add	a5,a5,a1
    22b8:	01079793          	slli	a5,a5,0x10
    22bc:	01075713          	srli	a4,a4,0x10
    22c0:	0ff00613          	li	a2,255
    22c4:	0107d793          	srli	a5,a5,0x10
    22c8:	00e67a63          	bgeu	a2,a4,22dc <__bss_end+0x538>
    22cc:	01071593          	slli	a1,a4,0x10
    22d0:	4105d593          	srai	a1,a1,0x10
    22d4:	00000713          	li	a4,0
    22d8:	4205d6e3          	bgez	a1,2f04 <__bss_end+0x1160>
    22dc:	00e68023          	sb	a4,0(a3)
    22e0:	0ff00713          	li	a4,255
    22e4:	1ef770e3          	bgeu	a4,a5,2cc4 <__bss_end+0xf20>
    22e8:	fff7c793          	not	a5,a5
    22ec:	01079613          	slli	a2,a5,0x10
    22f0:	41f65713          	srai	a4,a2,0x1f
    22f4:	08e68023          	sb	a4,128(a3)
    22f8:	889ff06f          	j	1b80 <gMCUBufG+0x8c>
    22fc:	00179713          	slli	a4,a5,0x1
    2300:	00f70633          	add	a2,a4,a5
    2304:	00261613          	slli	a2,a2,0x2
    2308:	000026b7          	lui	a3,0x2
    230c:	af468693          	addi	a3,a3,-1292 # 1af4 <gMCUBufG>
    2310:	40f60633          	sub	a2,a2,a5
    2314:	0006c503          	lbu	a0,0(a3)
    2318:	00361613          	slli	a2,a2,0x3
    231c:	0406c583          	lbu	a1,64(a3)
    2320:	00865613          	srli	a2,a2,0x8
    2324:	fd460613          	addi	a2,a2,-44
    2328:	40c50533          	sub	a0,a0,a2
    232c:	01051513          	slli	a0,a0,0x10
    2330:	40c58633          	sub	a2,a1,a2
    2334:	01061613          	slli	a2,a2,0x10
    2338:	01055513          	srli	a0,a0,0x10
    233c:	0ff00813          	li	a6,255
    2340:	01065613          	srli	a2,a2,0x10
    2344:	00a87a63          	bgeu	a6,a0,2358 <__bss_end+0x5b4>
    2348:	01051593          	slli	a1,a0,0x10
    234c:	4105d593          	srai	a1,a1,0x10
    2350:	00000513          	li	a0,0
    2354:	4405d6e3          	bgez	a1,2fa0 <__bss_end+0x11fc>
    2358:	00a68023          	sb	a0,0(a3)
    235c:	0ff00593          	li	a1,255
    2360:	44c5f8e3          	bgeu	a1,a2,2fb0 <__bss_end+0x120c>
    2364:	fff64613          	not	a2,a2
    2368:	01061513          	slli	a0,a2,0x10
    236c:	41f55593          	srai	a1,a0,0x1f
    2370:	00f70733          	add	a4,a4,a5
    2374:	f1d78613          	addi	a2,a5,-227
    2378:	04b68023          	sb	a1,64(a3)
    237c:	00571793          	slli	a5,a4,0x5
    2380:	000026b7          	lui	a3,0x2
    2384:	00f70733          	add	a4,a4,a5
    2388:	9f468693          	addi	a3,a3,-1548 # 19f4 <gMCUBufB>
    238c:	00171793          	slli	a5,a4,0x1
    2390:	0006c703          	lbu	a4,0(a3)
    2394:	0406c583          	lbu	a1,64(a3)
    2398:	0087d793          	srli	a5,a5,0x8
    239c:	00c787b3          	add	a5,a5,a2
    23a0:	00e78733          	add	a4,a5,a4
    23a4:	01071713          	slli	a4,a4,0x10
    23a8:	00b787b3          	add	a5,a5,a1
    23ac:	01079793          	slli	a5,a5,0x10
    23b0:	01075713          	srli	a4,a4,0x10
    23b4:	0ff00613          	li	a2,255
    23b8:	0107d793          	srli	a5,a5,0x10
    23bc:	00e67a63          	bgeu	a2,a4,23d0 <__bss_end+0x62c>
    23c0:	01071593          	slli	a1,a4,0x10
    23c4:	4105d593          	srai	a1,a1,0x10
    23c8:	00000713          	li	a4,0
    23cc:	3e05d6e3          	bgez	a1,2fb8 <__bss_end+0x1214>
    23d0:	00e68023          	sb	a4,0(a3)
    23d4:	0ff00713          	li	a4,255
    23d8:	7cf77263          	bgeu	a4,a5,2b9c <__bss_end+0xdf8>
    23dc:	fff7c793          	not	a5,a5
    23e0:	01079613          	slli	a2,a5,0x10
    23e4:	41f65713          	srai	a4,a2,0x1f
    23e8:	04e68023          	sb	a4,64(a3)
    23ec:	f94ff06f          	j	1b80 <gMCUBufG+0x8c>
    23f0:	00179713          	slli	a4,a5,0x1
    23f4:	000026b7          	lui	a3,0x2
    23f8:	00f705b3          	add	a1,a4,a5
    23fc:	af468693          	addi	a3,a3,-1292 # 1af4 <gMCUBufG>
    2400:	0006c603          	lbu	a2,0(a3)
    2404:	00259593          	slli	a1,a1,0x2
    2408:	40f585b3          	sub	a1,a1,a5
    240c:	00359593          	slli	a1,a1,0x3
    2410:	0085d593          	srli	a1,a1,0x8
    2414:	02c60613          	addi	a2,a2,44
    2418:	40b60633          	sub	a2,a2,a1
    241c:	01061613          	slli	a2,a2,0x10
    2420:	01065613          	srli	a2,a2,0x10
    2424:	0ff00513          	li	a0,255
    2428:	00060593          	mv	a1,a2
    242c:	00c57863          	bgeu	a0,a2,243c <__bss_end+0x698>
    2430:	fff64613          	not	a2,a2
    2434:	01061513          	slli	a0,a2,0x10
    2438:	41f55593          	srai	a1,a0,0x1f
    243c:	00f70733          	add	a4,a4,a5
    2440:	00b68023          	sb	a1,0(a3)
    2444:	000026b7          	lui	a3,0x2
    2448:	00571613          	slli	a2,a4,0x5
    244c:	9f468693          	addi	a3,a3,-1548 # 19f4 <gMCUBufB>
    2450:	00c70633          	add	a2,a4,a2
    2454:	0006c703          	lbu	a4,0(a3)
    2458:	00161613          	slli	a2,a2,0x1
    245c:	00865613          	srli	a2,a2,0x8
    2460:	f1d70713          	addi	a4,a4,-227
    2464:	00e787b3          	add	a5,a5,a4
    2468:	00c787b3          	add	a5,a5,a2
    246c:	01079793          	slli	a5,a5,0x10
    2470:	0107d793          	srli	a5,a5,0x10
    2474:	0ff00613          	li	a2,255
    2478:	00078713          	mv	a4,a5
    247c:	00f67863          	bgeu	a2,a5,248c <__bss_end+0x6e8>
    2480:	fff7c793          	not	a5,a5
    2484:	01079613          	slli	a2,a5,0x10
    2488:	41f65713          	srai	a4,a2,0x1f
    248c:	00e68023          	sb	a4,0(a3)
    2490:	ef0ff06f          	j	1b80 <gMCUBufG+0x8c>
    2494:	00002637          	lui	a2,0x2
    2498:	000025b7          	lui	a1,0x2
    249c:	00002737          	lui	a4,0x2
    24a0:	9f460613          	addi	a2,a2,-1548 # 19f4 <gMCUBufB>
    24a4:	af458593          	addi	a1,a1,-1292 # 1af4 <gMCUBufG>
    24a8:	a3470693          	addi	a3,a4,-1484 # 1a34 <gMCUBufB+0x40>
    24ac:	00040513          	mv	a0,s0
    24b0:	02c00893          	li	a7,44
    24b4:	0ff00813          	li	a6,255
    24b8:	00054303          	lbu	t1,0(a0)
    24bc:	0005ce03          	lbu	t3,0(a1)
    24c0:	00250513          	addi	a0,a0,2
    24c4:	00131793          	slli	a5,t1,0x1
    24c8:	00678733          	add	a4,a5,t1
    24cc:	00271713          	slli	a4,a4,0x2
    24d0:	40670733          	sub	a4,a4,t1
    24d4:	00371713          	slli	a4,a4,0x3
    24d8:	00875713          	srli	a4,a4,0x8
    24dc:	40e88733          	sub	a4,a7,a4
    24e0:	01c70733          	add	a4,a4,t3
    24e4:	01071713          	slli	a4,a4,0x10
    24e8:	01075713          	srli	a4,a4,0x10
    24ec:	00070e13          	mv	t3,a4
    24f0:	00e87863          	bgeu	a6,a4,2500 <__bss_end+0x75c>
    24f4:	fff74713          	not	a4,a4
    24f8:	01071e93          	slli	t4,a4,0x10
    24fc:	41fede13          	srai	t3,t4,0x1f
    2500:	006787b3          	add	a5,a5,t1
    2504:	00579713          	slli	a4,a5,0x5
    2508:	00e787b3          	add	a5,a5,a4
    250c:	00064703          	lbu	a4,0(a2)
    2510:	f1d30313          	addi	t1,t1,-227
    2514:	0077d793          	srli	a5,a5,0x7
    2518:	006787b3          	add	a5,a5,t1
    251c:	00e787b3          	add	a5,a5,a4
    2520:	01079793          	slli	a5,a5,0x10
    2524:	01c58023          	sb	t3,0(a1)
    2528:	0107d793          	srli	a5,a5,0x10
    252c:	00158593          	addi	a1,a1,1
    2530:	00078713          	mv	a4,a5
    2534:	00f87863          	bgeu	a6,a5,2544 <__bss_end+0x7a0>
    2538:	fff7c793          	not	a5,a5
    253c:	01079313          	slli	t1,a5,0x10
    2540:	41f35713          	srai	a4,t1,0x1f
    2544:	00e60023          	sb	a4,0(a2)
    2548:	00160613          	addi	a2,a2,1
    254c:	f6d616e3          	bne	a2,a3,24b8 <__bss_end+0x714>
    2550:	e30ff06f          	j	1b80 <gMCUBufG+0x8c>
    2554:	00000593          	li	a1,0
    2558:	00000513          	li	a0,0
    255c:	e2dfd0ef          	jal	388 <upsampleCbH>
    2560:	04000593          	li	a1,64
    2564:	00400513          	li	a0,4
    2568:	e21fd0ef          	jal	388 <upsampleCbH>
    256c:	e14ff06f          	j	1b80 <gMCUBufG+0x8c>
    2570:	00179713          	slli	a4,a5,0x1
    2574:	00f70633          	add	a2,a4,a5
    2578:	00261613          	slli	a2,a2,0x2
    257c:	00f60633          	add	a2,a2,a5
    2580:	000026b7          	lui	a3,0x2
    2584:	00361613          	slli	a2,a2,0x3
    2588:	bf468693          	addi	a3,a3,-1036 # 1bf4 <gMCUBufR>
    258c:	40f60633          	sub	a2,a2,a5
    2590:	f4d78593          	addi	a1,a5,-179
    2594:	0006c503          	lbu	a0,0(a3)
    2598:	00865613          	srli	a2,a2,0x8
    259c:	00b60633          	add	a2,a2,a1
    25a0:	0406c583          	lbu	a1,64(a3)
    25a4:	00a60533          	add	a0,a2,a0
    25a8:	01051513          	slli	a0,a0,0x10
    25ac:	00b605b3          	add	a1,a2,a1
    25b0:	01059593          	slli	a1,a1,0x10
    25b4:	01055513          	srli	a0,a0,0x10
    25b8:	0ff00813          	li	a6,255
    25bc:	0105d593          	srli	a1,a1,0x10
    25c0:	00a87a63          	bgeu	a6,a0,25d4 <__bss_end+0x830>
    25c4:	01051893          	slli	a7,a0,0x10
    25c8:	4108d893          	srai	a7,a7,0x10
    25cc:	00000513          	li	a0,0
    25d0:	1408d6e3          	bgez	a7,2f1c <__bss_end+0x1178>
    25d4:	00a68023          	sb	a0,0(a3)
    25d8:	0ff00513          	li	a0,255
    25dc:	00b57a63          	bgeu	a0,a1,25f0 <__bss_end+0x84c>
    25e0:	01059513          	slli	a0,a1,0x10
    25e4:	41055513          	srai	a0,a0,0x10
    25e8:	00000593          	li	a1,0
    25ec:	12055ee3          	bgez	a0,2f28 <__bss_end+0x1184>
    25f0:	04b68023          	sb	a1,64(a3)
    25f4:	0806c583          	lbu	a1,128(a3)
    25f8:	0ff00513          	li	a0,255
    25fc:	00b605b3          	add	a1,a2,a1
    2600:	01059593          	slli	a1,a1,0x10
    2604:	0105d593          	srli	a1,a1,0x10
    2608:	00b57a63          	bgeu	a0,a1,261c <__bss_end+0x878>
    260c:	01059513          	slli	a0,a1,0x10
    2610:	41055513          	srai	a0,a0,0x10
    2614:	00000593          	li	a1,0
    2618:	120558e3          	bgez	a0,2f48 <__bss_end+0x11a4>
    261c:	0c06c503          	lbu	a0,192(a3)
    2620:	08b68023          	sb	a1,128(a3)
    2624:	0ff00593          	li	a1,255
    2628:	00a60633          	add	a2,a2,a0
    262c:	01061613          	slli	a2,a2,0x10
    2630:	01065613          	srli	a2,a2,0x10
    2634:	12c5fae3          	bgeu	a1,a2,2f68 <__bss_end+0x11c4>
    2638:	fff64613          	not	a2,a2
    263c:	01061513          	slli	a0,a2,0x10
    2640:	41f55593          	srai	a1,a0,0x1f
    2644:	00f70733          	add	a4,a4,a5
    2648:	00371713          	slli	a4,a4,0x3
    264c:	0cb68023          	sb	a1,192(a3)
    2650:	40f70733          	sub	a4,a4,a5
    2654:	000026b7          	lui	a3,0x2
    2658:	00371713          	slli	a4,a4,0x3
    265c:	af468693          	addi	a3,a3,-1292 # 1af4 <gMCUBufG>
    2660:	40f707b3          	sub	a5,a4,a5
    2664:	0006c603          	lbu	a2,0(a3)
    2668:	0406c703          	lbu	a4,64(a3)
    266c:	0087d793          	srli	a5,a5,0x8
    2670:	fa578793          	addi	a5,a5,-91
    2674:	40f60633          	sub	a2,a2,a5
    2678:	01061613          	slli	a2,a2,0x10
    267c:	40f70733          	sub	a4,a4,a5
    2680:	01071713          	slli	a4,a4,0x10
    2684:	01065613          	srli	a2,a2,0x10
    2688:	0ff00593          	li	a1,255
    268c:	01075713          	srli	a4,a4,0x10
    2690:	00c5fa63          	bgeu	a1,a2,26a4 <__bss_end+0x900>
    2694:	01061513          	slli	a0,a2,0x10
    2698:	41055513          	srai	a0,a0,0x10
    269c:	00000613          	li	a2,0
    26a0:	200554e3          	bgez	a0,30a8 <__bss_end+0x1304>
    26a4:	00c68023          	sb	a2,0(a3)
    26a8:	0ff00613          	li	a2,255
    26ac:	00e67a63          	bgeu	a2,a4,26c0 <__bss_end+0x91c>
    26b0:	01071613          	slli	a2,a4,0x10
    26b4:	41065613          	srai	a2,a2,0x10
    26b8:	00000713          	li	a4,0
    26bc:	1e065ce3          	bgez	a2,30b4 <__bss_end+0x1310>
    26c0:	04e68023          	sb	a4,64(a3)
    26c4:	0806c703          	lbu	a4,128(a3)
    26c8:	0ff00613          	li	a2,255
    26cc:	40f70733          	sub	a4,a4,a5
    26d0:	01071713          	slli	a4,a4,0x10
    26d4:	01075713          	srli	a4,a4,0x10
    26d8:	00e67a63          	bgeu	a2,a4,26ec <__bss_end+0x948>
    26dc:	01071613          	slli	a2,a4,0x10
    26e0:	41065613          	srai	a2,a2,0x10
    26e4:	00000713          	li	a4,0
    26e8:	1e0656e3          	bgez	a2,30d4 <__bss_end+0x1330>
    26ec:	08e68023          	sb	a4,128(a3)
    26f0:	0c06c703          	lbu	a4,192(a3)
    26f4:	0ff00613          	li	a2,255
    26f8:	40f707b3          	sub	a5,a4,a5
    26fc:	01079793          	slli	a5,a5,0x10
    2700:	0107d793          	srli	a5,a5,0x10
    2704:	24f67a63          	bgeu	a2,a5,2958 <__bss_end+0xbb4>
    2708:	fff7c793          	not	a5,a5
    270c:	01079613          	slli	a2,a5,0x10
    2710:	41f65713          	srai	a4,a2,0x1f
    2714:	0ce68023          	sb	a4,192(a3)
    2718:	c68ff06f          	j	1b80 <gMCUBufG+0x8c>
    271c:	00000593          	li	a1,0
    2720:	00000513          	li	a0,0
    2724:	a05fd0ef          	jal	128 <upsampleCb>
    2728:	04000593          	li	a1,64
    272c:	00400513          	li	a0,4
    2730:	9f9fd0ef          	jal	128 <upsampleCb>
    2734:	08000593          	li	a1,128
    2738:	02000513          	li	a0,32
    273c:	9edfd0ef          	jal	128 <upsampleCb>
    2740:	0c000593          	li	a1,192
    2744:	02400513          	li	a0,36
    2748:	9e1fd0ef          	jal	128 <upsampleCb>
    274c:	c34ff06f          	j	1b80 <gMCUBufG+0x8c>
    2750:	00002537          	lui	a0,0x2
    2754:	000025b7          	lui	a1,0x2
    2758:	000026b7          	lui	a3,0x2
    275c:	ab450513          	addi	a0,a0,-1356 # 1ab4 <gMCUBufB+0xc0>
    2760:	bb458593          	addi	a1,a1,-1100 # 1bb4 <gMCUBufG+0xc0>
    2764:	cb468693          	addi	a3,a3,-844 # 1cb4 <gMCUBufR+0xc0>
    2768:	00040793          	mv	a5,s0
    276c:	0007d703          	lhu	a4,0(a5)
    2770:	00278793          	addi	a5,a5,2
    2774:	00168693          	addi	a3,a3,1
    2778:	fee68fa3          	sb	a4,-1(a3)
    277c:	00e58023          	sb	a4,0(a1)
    2780:	00e50023          	sb	a4,0(a0)
    2784:	00158593          	addi	a1,a1,1
    2788:	00150513          	addi	a0,a0,1
    278c:	fec790e3          	bne	a5,a2,276c <__bss_end+0x9c8>
    2790:	bf0ff06f          	j	1b80 <gMCUBufG+0x8c>
    2794:	00000593          	li	a1,0
    2798:	00000513          	li	a0,0
    279c:	ec5fd0ef          	jal	660 <upsampleCr>
    27a0:	04000593          	li	a1,64
    27a4:	00400513          	li	a0,4
    27a8:	eb9fd0ef          	jal	660 <upsampleCr>
    27ac:	08000593          	li	a1,128
    27b0:	02000513          	li	a0,32
    27b4:	eadfd0ef          	jal	660 <upsampleCr>
    27b8:	0c000593          	li	a1,192
    27bc:	02400513          	li	a0,36
    27c0:	ea1fd0ef          	jal	660 <upsampleCr>
    27c4:	bbcff06f          	j	1b80 <gMCUBufG+0x8c>
    27c8:	00179713          	slli	a4,a5,0x1
    27cc:	00f705b3          	add	a1,a4,a5
    27d0:	00259593          	slli	a1,a1,0x2
    27d4:	000026b7          	lui	a3,0x2
    27d8:	af468693          	addi	a3,a3,-1292 # 1af4 <gMCUBufG>
    27dc:	40f585b3          	sub	a1,a1,a5
    27e0:	0006c503          	lbu	a0,0(a3)
    27e4:	00359593          	slli	a1,a1,0x3
    27e8:	0406c603          	lbu	a2,64(a3)
    27ec:	0085d593          	srli	a1,a1,0x8
    27f0:	fd458593          	addi	a1,a1,-44
    27f4:	40b50533          	sub	a0,a0,a1
    27f8:	01051513          	slli	a0,a0,0x10
    27fc:	40b60633          	sub	a2,a2,a1
    2800:	01061613          	slli	a2,a2,0x10
    2804:	01055513          	srli	a0,a0,0x10
    2808:	0ff00813          	li	a6,255
    280c:	01065613          	srli	a2,a2,0x10
    2810:	00a87a63          	bgeu	a6,a0,2824 <__bss_end+0xa80>
    2814:	01051893          	slli	a7,a0,0x10
    2818:	4108d893          	srai	a7,a7,0x10
    281c:	00000513          	li	a0,0
    2820:	7e08d063          	bgez	a7,3000 <__bss_end+0x125c>
    2824:	00a68023          	sb	a0,0(a3)
    2828:	0ff00513          	li	a0,255
    282c:	00c57a63          	bgeu	a0,a2,2840 <__bss_end+0xa9c>
    2830:	01061513          	slli	a0,a2,0x10
    2834:	41055513          	srai	a0,a0,0x10
    2838:	00000613          	li	a2,0
    283c:	7c055863          	bgez	a0,300c <__bss_end+0x1268>
    2840:	04c68023          	sb	a2,64(a3)
    2844:	0806c603          	lbu	a2,128(a3)
    2848:	0ff00513          	li	a0,255
    284c:	40b60633          	sub	a2,a2,a1
    2850:	01061613          	slli	a2,a2,0x10
    2854:	01065613          	srli	a2,a2,0x10
    2858:	00c57a63          	bgeu	a0,a2,286c <__bss_end+0xac8>
    285c:	01061513          	slli	a0,a2,0x10
    2860:	41055513          	srai	a0,a0,0x10
    2864:	00000613          	li	a2,0
    2868:	7c055263          	bgez	a0,302c <__bss_end+0x1288>
    286c:	08c68023          	sb	a2,128(a3)
    2870:	0c06c603          	lbu	a2,192(a3)
    2874:	0ff00513          	li	a0,255
    2878:	40b60633          	sub	a2,a2,a1
    287c:	01061613          	slli	a2,a2,0x10
    2880:	01065613          	srli	a2,a2,0x10
    2884:	7cc57463          	bgeu	a0,a2,304c <__bss_end+0x12a8>
    2888:	fff64613          	not	a2,a2
    288c:	01061513          	slli	a0,a2,0x10
    2890:	41f55593          	srai	a1,a0,0x1f
    2894:	00f70733          	add	a4,a4,a5
    2898:	0cb68023          	sb	a1,192(a3)
    289c:	00571693          	slli	a3,a4,0x5
    28a0:	00d70733          	add	a4,a4,a3
    28a4:	000026b7          	lui	a3,0x2
    28a8:	9f468693          	addi	a3,a3,-1548 # 19f4 <gMCUBufB>
    28ac:	00171713          	slli	a4,a4,0x1
    28b0:	0006c603          	lbu	a2,0(a3)
    28b4:	f1d78593          	addi	a1,a5,-227
    28b8:	00875793          	srli	a5,a4,0x8
    28bc:	0406c703          	lbu	a4,64(a3)
    28c0:	00b787b3          	add	a5,a5,a1
    28c4:	00c78633          	add	a2,a5,a2
    28c8:	01061613          	slli	a2,a2,0x10
    28cc:	00e78733          	add	a4,a5,a4
    28d0:	01071713          	slli	a4,a4,0x10
    28d4:	01065613          	srli	a2,a2,0x10
    28d8:	0ff00593          	li	a1,255
    28dc:	01075713          	srli	a4,a4,0x10
    28e0:	00c5fa63          	bgeu	a1,a2,28f4 <__bss_end+0xb50>
    28e4:	01061513          	slli	a0,a2,0x10
    28e8:	41055513          	srai	a0,a0,0x10
    28ec:	00000613          	li	a2,0
    28f0:	76055263          	bgez	a0,3054 <__bss_end+0x12b0>
    28f4:	00c68023          	sb	a2,0(a3)
    28f8:	0ff00613          	li	a2,255
    28fc:	00e67a63          	bgeu	a2,a4,2910 <__bss_end+0xb6c>
    2900:	01071613          	slli	a2,a4,0x10
    2904:	41065613          	srai	a2,a2,0x10
    2908:	00000713          	li	a4,0
    290c:	74065a63          	bgez	a2,3060 <__bss_end+0x12bc>
    2910:	04e68023          	sb	a4,64(a3)
    2914:	0806c703          	lbu	a4,128(a3)
    2918:	0ff00613          	li	a2,255
    291c:	00e78733          	add	a4,a5,a4
    2920:	01071713          	slli	a4,a4,0x10
    2924:	01075713          	srli	a4,a4,0x10
    2928:	00e67a63          	bgeu	a2,a4,293c <__bss_end+0xb98>
    292c:	01071613          	slli	a2,a4,0x10
    2930:	41065613          	srai	a2,a2,0x10
    2934:	00000713          	li	a4,0
    2938:	74065463          	bgez	a2,3080 <__bss_end+0x12dc>
    293c:	0c06c603          	lbu	a2,192(a3)
    2940:	08e68023          	sb	a4,128(a3)
    2944:	0ff00713          	li	a4,255
    2948:	00c787b3          	add	a5,a5,a2
    294c:	01079793          	slli	a5,a5,0x10
    2950:	0107d793          	srli	a5,a5,0x10
    2954:	daf76ae3          	bltu	a4,a5,2708 <__bss_end+0x964>
    2958:	00078713          	mv	a4,a5
    295c:	0ce68023          	sb	a4,192(a3)
    2960:	a20ff06f          	j	1b80 <gMCUBufG+0x8c>
    2964:	00002537          	lui	a0,0x2
    2968:	000025b7          	lui	a1,0x2
    296c:	000026b7          	lui	a3,0x2
    2970:	a7450513          	addi	a0,a0,-1420 # 1a74 <gMCUBufB+0x80>
    2974:	b7458593          	addi	a1,a1,-1164 # 1b74 <gMCUBufG+0x80>
    2978:	c7468693          	addi	a3,a3,-908 # 1c74 <gMCUBufR+0x80>
    297c:	00040793          	mv	a5,s0
    2980:	0007d703          	lhu	a4,0(a5)
    2984:	00278793          	addi	a5,a5,2
    2988:	00168693          	addi	a3,a3,1
    298c:	fee68fa3          	sb	a4,-1(a3)
    2990:	00e58023          	sb	a4,0(a1)
    2994:	00e50023          	sb	a4,0(a0)
    2998:	00158593          	addi	a1,a1,1
    299c:	00150513          	addi	a0,a0,1
    29a0:	fec790e3          	bne	a5,a2,2980 <__bss_end+0xbdc>
    29a4:	9dcff06f          	j	1b80 <gMCUBufG+0x8c>
    29a8:	00002737          	lui	a4,0x2
    29ac:	000027b7          	lui	a5,0x2
    29b0:	00002537          	lui	a0,0x2
    29b4:	a3470713          	addi	a4,a4,-1484 # 1a34 <gMCUBufB+0x40>
    29b8:	b3478793          	addi	a5,a5,-1228 # 1b34 <gMCUBufG+0x40>
    29bc:	c3450513          	addi	a0,a0,-972 # 1c34 <gMCUBufR+0x40>
    29c0:	00040693          	mv	a3,s0
    29c4:	0006d583          	lhu	a1,0(a3)
    29c8:	00268693          	addi	a3,a3,2
    29cc:	00150513          	addi	a0,a0,1
    29d0:	feb50fa3          	sb	a1,-1(a0)
    29d4:	00b78023          	sb	a1,0(a5)
    29d8:	00b70023          	sb	a1,0(a4)
    29dc:	00178793          	addi	a5,a5,1
    29e0:	00170713          	addi	a4,a4,1
    29e4:	fec690e3          	bne	a3,a2,29c4 <__bss_end+0xc20>
    29e8:	998ff06f          	j	1b80 <gMCUBufG+0x8c>
    29ec:	00002737          	lui	a4,0x2
    29f0:	caf70a23          	sb	a5,-844(a4) # 1cb4 <gMCUBufR+0xc0>
    29f4:	00002737          	lui	a4,0x2
    29f8:	baf70a23          	sb	a5,-1100(a4) # 1bb4 <gMCUBufG+0xc0>
    29fc:	00002737          	lui	a4,0x2
    2a00:	aaf70a23          	sb	a5,-1356(a4) # 1ab4 <gMCUBufB+0xc0>
    2a04:	97cff06f          	j	1b80 <gMCUBufG+0x8c>
    2a08:	00002537          	lui	a0,0x2
    2a0c:	000025b7          	lui	a1,0x2
    2a10:	000026b7          	lui	a3,0x2
    2a14:	9f450513          	addi	a0,a0,-1548 # 19f4 <gMCUBufB>
    2a18:	af458593          	addi	a1,a1,-1292 # 1af4 <gMCUBufG>
    2a1c:	bf468693          	addi	a3,a3,-1036 # 1bf4 <gMCUBufR>
    2a20:	00040793          	mv	a5,s0
    2a24:	0007d703          	lhu	a4,0(a5)
    2a28:	00278793          	addi	a5,a5,2
    2a2c:	00168693          	addi	a3,a3,1
    2a30:	fee68fa3          	sb	a4,-1(a3)
    2a34:	00e58023          	sb	a4,0(a1)
    2a38:	00e50023          	sb	a4,0(a0)
    2a3c:	00158593          	addi	a1,a1,1
    2a40:	00150513          	addi	a0,a0,1
    2a44:	fec790e3          	bne	a5,a2,2a24 <__bss_end+0xc80>
    2a48:	938ff06f          	j	1b80 <gMCUBufG+0x8c>
    2a4c:	000016b7          	lui	a3,0x1
    2a50:	4666d783          	lhu	a5,1126(a3) # 1466 <gNextRestartNum>
    2a54:	0d078713          	addi	a4,a5,208
    2a58:	f8e51663          	bne	a0,a4,21e4 <__bss_end+0x440>
    2a5c:	4689d803          	lhu	a6,1128(s3)
    2a60:	00800413          	li	s0,8
    2a64:	00178713          	addi	a4,a5,1
    2a68:	000027b7          	lui	a5,0x2
    2a6c:	8ec78f13          	addi	t5,a5,-1812 # 18ec <gLastDC>
    2a70:	00777713          	andi	a4,a4,7
    2a74:	00001637          	lui	a2,0x1
    2a78:	00100593          	li	a1,1
    2a7c:	00040513          	mv	a0,s0
    2a80:	8e07a623          	sw	zero,-1812(a5)
    2a84:	46e69323          	sh	a4,1126(a3)
    2a88:	47091223          	sh	a6,1124(s2)
    2a8c:	000f1223          	sh	zero,4(t5)
    2a90:	48860023          	sb	s0,1152(a2) # 1480 <gBitsLeft>
    2a94:	a90fe0ef          	jal	d24 <getBits>
    2a98:	00040513          	mv	a0,s0
    2a9c:	00100593          	li	a1,1
    2aa0:	a84fe0ef          	jal	d24 <getBits>
    2aa4:	46495783          	lhu	a5,1124(s2)
    2aa8:	bf5fe06f          	j	169c <gHuffTab3+0x10>
    2aac:	00300713          	li	a4,3
    2ab0:	8ceb1863          	bne	s6,a4,1b80 <gMCUBufG+0x8c>
    2ab4:	00179713          	slli	a4,a5,0x1
    2ab8:	00f70633          	add	a2,a4,a5
    2abc:	00261613          	slli	a2,a2,0x2
    2ac0:	00f60633          	add	a2,a2,a5
    2ac4:	000026b7          	lui	a3,0x2
    2ac8:	bf468693          	addi	a3,a3,-1036 # 1bf4 <gMCUBufR>
    2acc:	00361613          	slli	a2,a2,0x3
    2ad0:	0006c583          	lbu	a1,0(a3)
    2ad4:	40f60633          	sub	a2,a2,a5
    2ad8:	f4d78513          	addi	a0,a5,-179
    2adc:	0406c803          	lbu	a6,64(a3)
    2ae0:	00865613          	srli	a2,a2,0x8
    2ae4:	00a60633          	add	a2,a2,a0
    2ae8:	00b605b3          	add	a1,a2,a1
    2aec:	01059593          	slli	a1,a1,0x10
    2af0:	01060633          	add	a2,a2,a6
    2af4:	01061613          	slli	a2,a2,0x10
    2af8:	0105d593          	srli	a1,a1,0x10
    2afc:	0ff00513          	li	a0,255
    2b00:	01065613          	srli	a2,a2,0x10
    2b04:	00b57a63          	bgeu	a0,a1,2b18 <__bss_end+0xd74>
    2b08:	01059813          	slli	a6,a1,0x10
    2b0c:	41085813          	srai	a6,a6,0x10
    2b10:	00000593          	li	a1,0
    2b14:	4a085e63          	bgez	a6,2fd0 <__bss_end+0x122c>
    2b18:	00b68023          	sb	a1,0(a3)
    2b1c:	0ff00593          	li	a1,255
    2b20:	4cc5f063          	bgeu	a1,a2,2fe0 <__bss_end+0x123c>
    2b24:	fff64613          	not	a2,a2
    2b28:	01061513          	slli	a0,a2,0x10
    2b2c:	41f55593          	srai	a1,a0,0x1f
    2b30:	00f70733          	add	a4,a4,a5
    2b34:	00371713          	slli	a4,a4,0x3
    2b38:	04b68023          	sb	a1,64(a3)
    2b3c:	40f70733          	sub	a4,a4,a5
    2b40:	000026b7          	lui	a3,0x2
    2b44:	00371713          	slli	a4,a4,0x3
    2b48:	af468693          	addi	a3,a3,-1292 # 1af4 <gMCUBufG>
    2b4c:	40f707b3          	sub	a5,a4,a5
    2b50:	0006c603          	lbu	a2,0(a3)
    2b54:	0406c703          	lbu	a4,64(a3)
    2b58:	0087d793          	srli	a5,a5,0x8
    2b5c:	fa578793          	addi	a5,a5,-91
    2b60:	40f60633          	sub	a2,a2,a5
    2b64:	01061613          	slli	a2,a2,0x10
    2b68:	40f707b3          	sub	a5,a4,a5
    2b6c:	01079793          	slli	a5,a5,0x10
    2b70:	01065613          	srli	a2,a2,0x10
    2b74:	0ff00593          	li	a1,255
    2b78:	0107d793          	srli	a5,a5,0x10
    2b7c:	00c5fa63          	bgeu	a1,a2,2b90 <__bss_end+0xdec>
    2b80:	01061713          	slli	a4,a2,0x10
    2b84:	41075713          	srai	a4,a4,0x10
    2b88:	00000613          	li	a2,0
    2b8c:	44075e63          	bgez	a4,2fe8 <__bss_end+0x1244>
    2b90:	00c68023          	sb	a2,0(a3)
    2b94:	0ff00713          	li	a4,255
    2b98:	84f762e3          	bltu	a4,a5,23dc <__bss_end+0x638>
    2b9c:	00078713          	mv	a4,a5
    2ba0:	04e68023          	sb	a4,64(a3)
    2ba4:	fddfe06f          	j	1b80 <gMCUBufG+0x8c>
    2ba8:	00300793          	li	a5,3
    2bac:	00fb0463          	beq	s6,a5,2bb4 <__bss_end+0xe10>
    2bb0:	fd1fe06f          	j	1b80 <gMCUBufG+0x8c>
    2bb4:	00000593          	li	a1,0
    2bb8:	00000513          	li	a0,0
    2bbc:	e7dfd0ef          	jal	a38 <upsampleCrV>
    2bc0:	08000593          	li	a1,128
    2bc4:	02000513          	li	a0,32
    2bc8:	e71fd0ef          	jal	a38 <upsampleCrV>
    2bcc:	fb5fe06f          	j	1b80 <gMCUBufG+0x8c>
    2bd0:	00300713          	li	a4,3
    2bd4:	00eb0463          	beq	s6,a4,2bdc <__bss_end+0xe38>
    2bd8:	fa9fe06f          	j	1b80 <gMCUBufG+0x8c>
    2bdc:	00179713          	slli	a4,a5,0x1
    2be0:	00f70633          	add	a2,a4,a5
    2be4:	00261613          	slli	a2,a2,0x2
    2be8:	00f60633          	add	a2,a2,a5
    2bec:	000026b7          	lui	a3,0x2
    2bf0:	bf468693          	addi	a3,a3,-1036 # 1bf4 <gMCUBufR>
    2bf4:	00361613          	slli	a2,a2,0x3
    2bf8:	0006c583          	lbu	a1,0(a3)
    2bfc:	40f60633          	sub	a2,a2,a5
    2c00:	f4d78513          	addi	a0,a5,-179
    2c04:	0806c803          	lbu	a6,128(a3)
    2c08:	00865613          	srli	a2,a2,0x8
    2c0c:	00a60633          	add	a2,a2,a0
    2c10:	00b605b3          	add	a1,a2,a1
    2c14:	01059593          	slli	a1,a1,0x10
    2c18:	01060633          	add	a2,a2,a6
    2c1c:	01061613          	slli	a2,a2,0x10
    2c20:	0105d593          	srli	a1,a1,0x10
    2c24:	0ff00513          	li	a0,255
    2c28:	01065613          	srli	a2,a2,0x10
    2c2c:	00b57a63          	bgeu	a0,a1,2c40 <__bss_end+0xe9c>
    2c30:	01059813          	slli	a6,a1,0x10
    2c34:	41085813          	srai	a6,a6,0x10
    2c38:	00000593          	li	a1,0
    2c3c:	32085a63          	bgez	a6,2f70 <__bss_end+0x11cc>
    2c40:	00b68023          	sb	a1,0(a3)
    2c44:	0ff00593          	li	a1,255
    2c48:	32c5fc63          	bgeu	a1,a2,2f80 <__bss_end+0x11dc>
    2c4c:	fff64613          	not	a2,a2
    2c50:	01061513          	slli	a0,a2,0x10
    2c54:	41f55593          	srai	a1,a0,0x1f
    2c58:	00f70733          	add	a4,a4,a5
    2c5c:	00371713          	slli	a4,a4,0x3
    2c60:	08b68023          	sb	a1,128(a3)
    2c64:	40f70733          	sub	a4,a4,a5
    2c68:	000026b7          	lui	a3,0x2
    2c6c:	00371713          	slli	a4,a4,0x3
    2c70:	af468693          	addi	a3,a3,-1292 # 1af4 <gMCUBufG>
    2c74:	40f707b3          	sub	a5,a4,a5
    2c78:	0006c603          	lbu	a2,0(a3)
    2c7c:	0806c703          	lbu	a4,128(a3)
    2c80:	0087d793          	srli	a5,a5,0x8
    2c84:	fa578793          	addi	a5,a5,-91
    2c88:	40f60633          	sub	a2,a2,a5
    2c8c:	01061613          	slli	a2,a2,0x10
    2c90:	40f707b3          	sub	a5,a4,a5
    2c94:	01079793          	slli	a5,a5,0x10
    2c98:	01065613          	srli	a2,a2,0x10
    2c9c:	0ff00593          	li	a1,255
    2ca0:	0107d793          	srli	a5,a5,0x10
    2ca4:	00c5fa63          	bgeu	a1,a2,2cb8 <__bss_end+0xf14>
    2ca8:	01061713          	slli	a4,a2,0x10
    2cac:	41075713          	srai	a4,a4,0x10
    2cb0:	00000613          	li	a2,0
    2cb4:	2c075a63          	bgez	a4,2f88 <__bss_end+0x11e4>
    2cb8:	00c68023          	sb	a2,0(a3)
    2cbc:	0ff00713          	li	a4,255
    2cc0:	e2f76463          	bltu	a4,a5,22e8 <__bss_end+0x544>
    2cc4:	00078713          	mv	a4,a5
    2cc8:	08e68023          	sb	a4,128(a3)
    2ccc:	eb5fe06f          	j	1b80 <gMCUBufG+0x8c>
    2cd0:	00300793          	li	a5,3
    2cd4:	00fb0463          	beq	s6,a5,2cdc <__bss_end+0xf38>
    2cd8:	ea9fe06f          	j	1b80 <gMCUBufG+0x8c>
    2cdc:	00000593          	li	a1,0
    2ce0:	00000513          	li	a0,0
    2ce4:	be9fd0ef          	jal	8cc <upsampleCrH>
    2ce8:	04000593          	li	a1,64
    2cec:	00400513          	li	a0,4
    2cf0:	bddfd0ef          	jal	8cc <upsampleCrH>
    2cf4:	e8dfe06f          	j	1b80 <gMCUBufG+0x8c>
    2cf8:	00002537          	lui	a0,0x2
    2cfc:	000025b7          	lui	a1,0x2
    2d00:	000026b7          	lui	a3,0x2
    2d04:	9f450513          	addi	a0,a0,-1548 # 19f4 <gMCUBufB>
    2d08:	af458593          	addi	a1,a1,-1292 # 1af4 <gMCUBufG>
    2d0c:	bf468693          	addi	a3,a3,-1036 # 1bf4 <gMCUBufR>
    2d10:	00040793          	mv	a5,s0
    2d14:	0007d703          	lhu	a4,0(a5)
    2d18:	00278793          	addi	a5,a5,2
    2d1c:	00168693          	addi	a3,a3,1
    2d20:	fee68fa3          	sb	a4,-1(a3)
    2d24:	00e58023          	sb	a4,0(a1)
    2d28:	00e50023          	sb	a4,0(a0)
    2d2c:	00158593          	addi	a1,a1,1
    2d30:	00150513          	addi	a0,a0,1
    2d34:	fec790e3          	bne	a5,a2,2d14 <__bss_end+0xf70>
    2d38:	e49fe06f          	j	1b80 <gMCUBufG+0x8c>
    2d3c:	00002537          	lui	a0,0x2
    2d40:	000025b7          	lui	a1,0x2
    2d44:	000026b7          	lui	a3,0x2
    2d48:	9f450513          	addi	a0,a0,-1548 # 19f4 <gMCUBufB>
    2d4c:	af458593          	addi	a1,a1,-1292 # 1af4 <gMCUBufG>
    2d50:	bf468693          	addi	a3,a3,-1036 # 1bf4 <gMCUBufR>
    2d54:	00040793          	mv	a5,s0
    2d58:	0007d703          	lhu	a4,0(a5)
    2d5c:	00278793          	addi	a5,a5,2
    2d60:	00168693          	addi	a3,a3,1
    2d64:	fee68fa3          	sb	a4,-1(a3)
    2d68:	00e58023          	sb	a4,0(a1)
    2d6c:	00e50023          	sb	a4,0(a0)
    2d70:	00158593          	addi	a1,a1,1
    2d74:	00150513          	addi	a0,a0,1
    2d78:	fec790e3          	bne	a5,a2,2d58 <__bss_end+0xfb4>
    2d7c:	e05fe06f          	j	1b80 <gMCUBufG+0x8c>
    2d80:	00002637          	lui	a2,0x2
    2d84:	000025b7          	lui	a1,0x2
    2d88:	000027b7          	lui	a5,0x2
    2d8c:	af460613          	addi	a2,a2,-1292 # 1af4 <gMCUBufG>
    2d90:	bf458593          	addi	a1,a1,-1036 # 1bf4 <gMCUBufR>
    2d94:	b3478693          	addi	a3,a5,-1228 # 1b34 <gMCUBufG+0x40>
    2d98:	00040513          	mv	a0,s0
    2d9c:	0ff00813          	li	a6,255
    2da0:	05b00893          	li	a7,91
    2da4:	00054303          	lbu	t1,0(a0)
    2da8:	0005ce03          	lbu	t3,0(a1)
    2dac:	00250513          	addi	a0,a0,2
    2db0:	00131793          	slli	a5,t1,0x1
    2db4:	00678733          	add	a4,a5,t1
    2db8:	00271713          	slli	a4,a4,0x2
    2dbc:	00670733          	add	a4,a4,t1
    2dc0:	00371713          	slli	a4,a4,0x3
    2dc4:	40670733          	sub	a4,a4,t1
    2dc8:	00875713          	srli	a4,a4,0x8
    2dcc:	f4d30e93          	addi	t4,t1,-179
    2dd0:	01d70733          	add	a4,a4,t4
    2dd4:	01c70733          	add	a4,a4,t3
    2dd8:	01071713          	slli	a4,a4,0x10
    2ddc:	01075713          	srli	a4,a4,0x10
    2de0:	00070e13          	mv	t3,a4
    2de4:	00e87863          	bgeu	a6,a4,2df4 <__bss_end+0x1050>
    2de8:	fff74713          	not	a4,a4
    2dec:	01071e93          	slli	t4,a4,0x10
    2df0:	41fede13          	srai	t3,t4,0x1f
    2df4:	006787b3          	add	a5,a5,t1
    2df8:	00379793          	slli	a5,a5,0x3
    2dfc:	406787b3          	sub	a5,a5,t1
    2e00:	00379793          	slli	a5,a5,0x3
    2e04:	00064703          	lbu	a4,0(a2)
    2e08:	406787b3          	sub	a5,a5,t1
    2e0c:	0087d793          	srli	a5,a5,0x8
    2e10:	40f887b3          	sub	a5,a7,a5
    2e14:	00e787b3          	add	a5,a5,a4
    2e18:	01079793          	slli	a5,a5,0x10
    2e1c:	0107d793          	srli	a5,a5,0x10
    2e20:	01c58023          	sb	t3,0(a1)
    2e24:	00078713          	mv	a4,a5
    2e28:	00158593          	addi	a1,a1,1
    2e2c:	00f87863          	bgeu	a6,a5,2e3c <__bss_end+0x1098>
    2e30:	fff7c793          	not	a5,a5
    2e34:	01079313          	slli	t1,a5,0x10
    2e38:	41f35713          	srai	a4,t1,0x1f
    2e3c:	00e60023          	sb	a4,0(a2)
    2e40:	00160613          	addi	a2,a2,1
    2e44:	f6d610e3          	bne	a2,a3,2da4 <__bss_end+0x1000>
    2e48:	d39fe06f          	j	1b80 <gMCUBufG+0x8c>
    2e4c:	00179713          	slli	a4,a5,0x1
    2e50:	000026b7          	lui	a3,0x2
    2e54:	00f705b3          	add	a1,a4,a5
    2e58:	bf468693          	addi	a3,a3,-1036 # 1bf4 <gMCUBufR>
    2e5c:	0006c603          	lbu	a2,0(a3)
    2e60:	00259593          	slli	a1,a1,0x2
    2e64:	00f585b3          	add	a1,a1,a5
    2e68:	00359593          	slli	a1,a1,0x3
    2e6c:	40f585b3          	sub	a1,a1,a5
    2e70:	f4d60613          	addi	a2,a2,-179
    2e74:	0085d593          	srli	a1,a1,0x8
    2e78:	00c78633          	add	a2,a5,a2
    2e7c:	00b60633          	add	a2,a2,a1
    2e80:	01061613          	slli	a2,a2,0x10
    2e84:	01065613          	srli	a2,a2,0x10
    2e88:	0ff00513          	li	a0,255
    2e8c:	00060593          	mv	a1,a2
    2e90:	00c57863          	bgeu	a0,a2,2ea0 <__bss_end+0x10fc>
    2e94:	fff64613          	not	a2,a2
    2e98:	01061513          	slli	a0,a2,0x10
    2e9c:	41f55593          	srai	a1,a0,0x1f
    2ea0:	00f70733          	add	a4,a4,a5
    2ea4:	00371713          	slli	a4,a4,0x3
    2ea8:	40f70733          	sub	a4,a4,a5
    2eac:	00b68023          	sb	a1,0(a3)
    2eb0:	000026b7          	lui	a3,0x2
    2eb4:	00371713          	slli	a4,a4,0x3
    2eb8:	af468693          	addi	a3,a3,-1292 # 1af4 <gMCUBufG>
    2ebc:	40f70733          	sub	a4,a4,a5
    2ec0:	0006c783          	lbu	a5,0(a3)
    2ec4:	00875713          	srli	a4,a4,0x8
    2ec8:	0ff00613          	li	a2,255
    2ecc:	05b78793          	addi	a5,a5,91
    2ed0:	40e787b3          	sub	a5,a5,a4
    2ed4:	01079793          	slli	a5,a5,0x10
    2ed8:	0107d793          	srli	a5,a5,0x10
    2edc:	00078713          	mv	a4,a5
    2ee0:	daf66063          	bltu	a2,a5,2480 <__bss_end+0x6dc>
    2ee4:	00e68023          	sb	a4,0(a3)
    2ee8:	c99fe06f          	j	1b80 <gMCUBufG+0x8c>
    2eec:	fff00513          	li	a0,-1
    2ef0:	00a68023          	sb	a0,0(a3)
    2ef4:	00080593          	mv	a1,a6
    2ef8:	b8c86263          	bltu	a6,a2,227c <__bss_end+0x4d8>
    2efc:	00060593          	mv	a1,a2
    2f00:	b7cff06f          	j	227c <__bss_end+0x4d8>
    2f04:	fff00593          	li	a1,-1
    2f08:	00b68023          	sb	a1,0(a3)
    2f0c:	00060713          	mv	a4,a2
    2f10:	daf67ae3          	bgeu	a2,a5,2cc4 <__bss_end+0xf20>
    2f14:	08e68023          	sb	a4,128(a3)
    2f18:	c69fe06f          	j	1b80 <gMCUBufG+0x8c>
    2f1c:	fff00513          	li	a0,-1
    2f20:	00a68023          	sb	a0,0(a3)
    2f24:	ecb87663          	bgeu	a6,a1,25f0 <__bss_end+0x84c>
    2f28:	0806c583          	lbu	a1,128(a3)
    2f2c:	fff00513          	li	a0,-1
    2f30:	04a68023          	sb	a0,64(a3)
    2f34:	00b605b3          	add	a1,a2,a1
    2f38:	01059593          	slli	a1,a1,0x10
    2f3c:	0105d593          	srli	a1,a1,0x10
    2f40:	0ff00513          	li	a0,255
    2f44:	ecb57c63          	bgeu	a0,a1,261c <__bss_end+0x878>
    2f48:	0c06c583          	lbu	a1,192(a3)
    2f4c:	fff00513          	li	a0,-1
    2f50:	08a68023          	sb	a0,128(a3)
    2f54:	00b60633          	add	a2,a2,a1
    2f58:	01061613          	slli	a2,a2,0x10
    2f5c:	01065613          	srli	a2,a2,0x10
    2f60:	0ff00593          	li	a1,255
    2f64:	eec5e063          	bltu	a1,a2,2644 <__bss_end+0x8a0>
    2f68:	00060593          	mv	a1,a2
    2f6c:	ed8ff06f          	j	2644 <__bss_end+0x8a0>
    2f70:	fff00813          	li	a6,-1
    2f74:	01068023          	sb	a6,0(a3)
    2f78:	00050593          	mv	a1,a0
    2f7c:	ccc56ee3          	bltu	a0,a2,2c58 <__bss_end+0xeb4>
    2f80:	00060593          	mv	a1,a2
    2f84:	cd5ff06f          	j	2c58 <__bss_end+0xeb4>
    2f88:	fff00613          	li	a2,-1
    2f8c:	00c68023          	sb	a2,0(a3)
    2f90:	00058713          	mv	a4,a1
    2f94:	d2f5f8e3          	bgeu	a1,a5,2cc4 <__bss_end+0xf20>
    2f98:	08e68023          	sb	a4,128(a3)
    2f9c:	be5fe06f          	j	1b80 <gMCUBufG+0x8c>
    2fa0:	fff00513          	li	a0,-1
    2fa4:	00a68023          	sb	a0,0(a3)
    2fa8:	00080593          	mv	a1,a6
    2fac:	bcc86263          	bltu	a6,a2,2370 <__bss_end+0x5cc>
    2fb0:	00060593          	mv	a1,a2
    2fb4:	bbcff06f          	j	2370 <__bss_end+0x5cc>
    2fb8:	fff00593          	li	a1,-1
    2fbc:	00b68023          	sb	a1,0(a3)
    2fc0:	00060713          	mv	a4,a2
    2fc4:	bcf67ce3          	bgeu	a2,a5,2b9c <__bss_end+0xdf8>
    2fc8:	04e68023          	sb	a4,64(a3)
    2fcc:	bb5fe06f          	j	1b80 <gMCUBufG+0x8c>
    2fd0:	fff00813          	li	a6,-1
    2fd4:	01068023          	sb	a6,0(a3)
    2fd8:	00050593          	mv	a1,a0
    2fdc:	b4c56ae3          	bltu	a0,a2,2b30 <__bss_end+0xd8c>
    2fe0:	00060593          	mv	a1,a2
    2fe4:	b4dff06f          	j	2b30 <__bss_end+0xd8c>
    2fe8:	fff00613          	li	a2,-1
    2fec:	00c68023          	sb	a2,0(a3)
    2ff0:	00058713          	mv	a4,a1
    2ff4:	baf5f4e3          	bgeu	a1,a5,2b9c <__bss_end+0xdf8>
    2ff8:	04e68023          	sb	a4,64(a3)
    2ffc:	b85fe06f          	j	1b80 <gMCUBufG+0x8c>
    3000:	fff00513          	li	a0,-1
    3004:	00a68023          	sb	a0,0(a3)
    3008:	82c87ce3          	bgeu	a6,a2,2840 <__bss_end+0xa9c>
    300c:	0806c603          	lbu	a2,128(a3)
    3010:	fff00513          	li	a0,-1
    3014:	04a68023          	sb	a0,64(a3)
    3018:	40b60633          	sub	a2,a2,a1
    301c:	01061613          	slli	a2,a2,0x10
    3020:	01065613          	srli	a2,a2,0x10
    3024:	0ff00513          	li	a0,255
    3028:	84c572e3          	bgeu	a0,a2,286c <__bss_end+0xac8>
    302c:	0c06c603          	lbu	a2,192(a3)
    3030:	fff00513          	li	a0,-1
    3034:	08a68023          	sb	a0,128(a3)
    3038:	40b60633          	sub	a2,a2,a1
    303c:	01061613          	slli	a2,a2,0x10
    3040:	01065613          	srli	a2,a2,0x10
    3044:	0ff00593          	li	a1,255
    3048:	84c5e6e3          	bltu	a1,a2,2894 <__bss_end+0xaf0>
    304c:	00060593          	mv	a1,a2
    3050:	845ff06f          	j	2894 <__bss_end+0xaf0>
    3054:	fff00613          	li	a2,-1
    3058:	00c68023          	sb	a2,0(a3)
    305c:	8ae5fae3          	bgeu	a1,a4,2910 <__bss_end+0xb6c>
    3060:	0806c703          	lbu	a4,128(a3)
    3064:	fff00613          	li	a2,-1
    3068:	04c68023          	sb	a2,64(a3)
    306c:	00e78733          	add	a4,a5,a4
    3070:	01071713          	slli	a4,a4,0x10
    3074:	01075713          	srli	a4,a4,0x10
    3078:	0ff00613          	li	a2,255
    307c:	8ce670e3          	bgeu	a2,a4,293c <__bss_end+0xb98>
    3080:	0c06c703          	lbu	a4,192(a3)
    3084:	fff00613          	li	a2,-1
    3088:	08c68023          	sb	a2,128(a3)
    308c:	00e787b3          	add	a5,a5,a4
    3090:	01079793          	slli	a5,a5,0x10
    3094:	0107d793          	srli	a5,a5,0x10
    3098:	0ff00713          	li	a4,255
    309c:	8af77ee3          	bgeu	a4,a5,2958 <__bss_end+0xbb4>
    30a0:	0ce68023          	sb	a4,192(a3)
    30a4:	addfe06f          	j	1b80 <gMCUBufG+0x8c>
    30a8:	fff00613          	li	a2,-1
    30ac:	00c68023          	sb	a2,0(a3)
    30b0:	e0e5f863          	bgeu	a1,a4,26c0 <__bss_end+0x91c>
    30b4:	0806c703          	lbu	a4,128(a3)
    30b8:	fff00613          	li	a2,-1
    30bc:	04c68023          	sb	a2,64(a3)
    30c0:	40f70733          	sub	a4,a4,a5
    30c4:	01071713          	slli	a4,a4,0x10
    30c8:	01075713          	srli	a4,a4,0x10
    30cc:	0ff00613          	li	a2,255
    30d0:	e0e67e63          	bgeu	a2,a4,26ec <__bss_end+0x948>
    30d4:	0c06c703          	lbu	a4,192(a3)
    30d8:	fff00613          	li	a2,-1
    30dc:	08c68023          	sb	a2,128(a3)
    30e0:	40f707b3          	sub	a5,a4,a5
    30e4:	01079793          	slli	a5,a5,0x10
    30e8:	0107d793          	srli	a5,a5,0x10
    30ec:	0ff00713          	li	a4,255
    30f0:	86f774e3          	bgeu	a4,a5,2958 <__bss_end+0xbb4>
    30f4:	0ce68023          	sb	a4,192(a3)
    30f8:	a89fe06f          	j	1b80 <gMCUBufG+0x8c>

000030fc <pjpeg_decode_init>:
    30fc:	000017b7          	lui	a5,0x1
    3100:	fa010113          	addi	sp,sp,-96
    3104:	44b7a023          	sw	a1,1088(a5) # 1440 <g_pNeedBytesCallback>
    3108:	000017b7          	lui	a5,0x1
    310c:	42c7ae23          	sw	a2,1084(a5) # 143c <g_pCallback_data>
    3110:	000017b7          	lui	a5,0x1
    3114:	42d78c23          	sb	a3,1080(a5) # 1438 <gReduce>
    3118:	000017b7          	lui	a5,0x1
    311c:	58078423          	sb	zero,1416(a5) # 1588 <gTemFlag>
    3120:	000017b7          	lui	a5,0x1
    3124:	46079f23          	sh	zero,1150(a5) # 147e <gImageXSize>
    3128:	000017b7          	lui	a5,0x1
    312c:	46079e23          	sh	zero,1148(a5) # 147c <gImageYSize>
    3130:	000017b7          	lui	a5,0x1
    3134:	46079423          	sh	zero,1128(a5) # 1468 <pjpeg_decode_mcu>
    3138:	000017b7          	lui	a5,0x1
    313c:	04112e23          	sw	ra,92(sp)
    3140:	04812c23          	sw	s0,88(sp)
    3144:	04912a23          	sw	s1,84(sp)
    3148:	05512223          	sw	s5,68(sp)
    314c:	03712e23          	sw	s7,60(sp)
    3150:	03812c23          	sw	s8,56(sp)
    3154:	03912a23          	sw	s9,52(sp)
    3158:	03b12623          	sw	s11,44(sp)
    315c:	00800c93          	li	s9,8
    3160:	00001437          	lui	s0,0x1
    3164:	460781a3          	sb	zero,1123(a5) # 1463 <gCompsInScan>
    3168:	00001c37          	lui	s8,0x1
    316c:	000017b7          	lui	a5,0x1
    3170:	000014b7          	lui	s1,0x1
    3174:	00052023          	sw	zero,0(a0)
    3178:	00052223          	sw	zero,4(a0)
    317c:	00052423          	sw	zero,8(a0)
    3180:	00052623          	sw	zero,12(a0)
    3184:	00052823          	sw	zero,16(a0)
    3188:	00052a23          	sw	zero,20(a0)
    318c:	00052c23          	sw	zero,24(a0)
    3190:	00052e23          	sw	zero,28(a0)
    3194:	02052023          	sw	zero,32(a0)
    3198:	02052223          	sw	zero,36(a0)
    319c:	02052423          	sw	zero,40(a0)
    31a0:	58078523          	sb	zero,1418(a5) # 158a <gValidHuffTables>
    31a4:	499c0023          	sb	s9,1152(s8) # 1480 <gBitsLeft>
    31a8:	000017b7          	lui	a5,0x1
    31ac:	42040ca3          	sb	zero,1081(s0) # 1439 <gCallbackStatus>
    31b0:	46048da3          	sb	zero,1147(s1) # 147b <gCompsInFrame>
    31b4:	580784a3          	sb	zero,1417(a5) # 1589 <gValidQuantTables>
    31b8:	000017b7          	lui	a5,0x1
    31bc:	00000593          	li	a1,0
    31c0:	480782a3          	sb	zero,1157(a5) # 1485 <gInBufOfs>
    31c4:	00050a93          	mv	s5,a0
    31c8:	000017b7          	lui	a5,0x1
    31cc:	000c8513          	mv	a0,s9
    31d0:	00001bb7          	lui	s7,0x1
    31d4:	48078223          	sb	zero,1156(a5) # 1484 <gInBufLeft>
    31d8:	480b9123          	sh	zero,1154(s7) # 1482 <gBitBuf>
    31dc:	b49fd0ef          	jal	d24 <getBits>
    31e0:	000c8513          	mv	a0,s9
    31e4:	00000593          	li	a1,0
    31e8:	b3dfd0ef          	jal	d24 <getBits>
    31ec:	43944d83          	lbu	s11,1081(s0)
    31f0:	020d8863          	beqz	s11,3220 <pjpeg_decode_init+0x124>
    31f4:	05c12083          	lw	ra,92(sp)
    31f8:	05812403          	lw	s0,88(sp)
    31fc:	05412483          	lw	s1,84(sp)
    3200:	04412a83          	lw	s5,68(sp)
    3204:	03c12b83          	lw	s7,60(sp)
    3208:	03812c03          	lw	s8,56(sp)
    320c:	03412c83          	lw	s9,52(sp)
    3210:	000d8513          	mv	a0,s11
    3214:	02c12d83          	lw	s11,44(sp)
    3218:	06010113          	addi	sp,sp,96
    321c:	00008067          	ret
    3220:	00000593          	li	a1,0
    3224:	000c8513          	mv	a0,s9
    3228:	05612023          	sw	s6,64(sp)
    322c:	03a12823          	sw	s10,48(sp)
    3230:	af5fd0ef          	jal	d24 <getBits>
    3234:	0ff57d13          	zext.b	s10,a0
    3238:	00000593          	li	a1,0
    323c:	000c8513          	mv	a0,s9
    3240:	ae5fd0ef          	jal	d24 <getBits>
    3244:	f01d0d13          	addi	s10,s10,-255
    3248:	0ff57b13          	zext.b	s6,a0
    324c:	060d1463          	bnez	s10,32b4 <pjpeg_decode_init+0x1b8>
    3250:	f28b0793          	addi	a5,s6,-216
    3254:	06079063          	bnez	a5,32b4 <pjpeg_decode_init+0x1b8>
    3258:	01f10513          	addi	a0,sp,31
    325c:	d59fd0ef          	jal	fb4 <processMarkers>
    3260:	00050d93          	mv	s11,a0
    3264:	0c051c63          	bnez	a0,333c <pjpeg_decode_init+0x240>
    3268:	01f14703          	lbu	a4,31(sp)
    326c:	0c200693          	li	a3,194
    3270:	10d70863          	beq	a4,a3,3380 <pjpeg_decode_init+0x284>
    3274:	0c900693          	li	a3,201
    3278:	12d70c63          	beq	a4,a3,33b0 <pjpeg_decode_init+0x2b4>
    327c:	0c000693          	li	a3,192
    3280:	12d71463          	bne	a4,a3,33a8 <pjpeg_decode_init+0x2ac>
    3284:	00000593          	li	a1,0
    3288:	01000513          	li	a0,16
    328c:	a99fd0ef          	jal	d24 <getBits>
    3290:	00050c93          	mv	s9,a0
    3294:	00000593          	li	a1,0
    3298:	00800513          	li	a0,8
    329c:	a89fd0ef          	jal	d24 <getBits>
    32a0:	00800713          	li	a4,8
    32a4:	00050d13          	mv	s10,a0
    32a8:	10e50863          	beq	a0,a4,33b8 <pjpeg_decode_init+0x2bc>
    32ac:	00700d93          	li	s11,7
    32b0:	08c0006f          	j	333c <pjpeg_decode_init+0x240>
    32b4:	000016b7          	lui	a3,0x1
    32b8:	05312623          	sw	s3,76(sp)
    32bc:	05412423          	sw	s4,72(sp)
    32c0:	01512223          	sw	s5,4(sp)
    32c4:	05212823          	sw	s2,80(sp)
    32c8:	000b0a93          	mv	s5,s6
    32cc:	00700993          	li	s3,7
    32d0:	00800d13          	li	s10,8
    32d4:	0ff00a13          	li	s4,255
    32d8:	0d800c93          	li	s9,216
    32dc:	0d900d93          	li	s11,217
    32e0:	fff68b13          	addi	s6,a3,-1 # fff <processMarkers+0x4b>
    32e4:	00c0006f          	j	32f0 <pjpeg_decode_init+0x1f4>
    32e8:	0ff97a93          	zext.b	s5,s2
    32ec:	040b0063          	beqz	s6,332c <pjpeg_decode_init+0x230>
    32f0:	480c4783          	lbu	a5,1152(s8)
    32f4:	482bd903          	lhu	s2,1154(s7)
    32f8:	ff878613          	addi	a2,a5,-8
    32fc:	0ff97713          	zext.b	a4,s2
    3300:	04f9f863          	bgeu	s3,a5,3350 <pjpeg_decode_init+0x254>
    3304:	48cc0023          	sb	a2,1152(s8)
    3308:	00871713          	slli	a4,a4,0x8
    330c:	fffb0b13          	addi	s6,s6,-1
    3310:	010b1b13          	slli	s6,s6,0x10
    3314:	48eb9123          	sh	a4,1154(s7)
    3318:	010b5b13          	srli	s6,s6,0x10
    331c:	40895913          	srai	s2,s2,0x8
    3320:	fd4a94e3          	bne	s5,s4,32e8 <pjpeg_decode_init+0x1ec>
    3324:	07990263          	beq	s2,s9,3388 <pjpeg_decode_init+0x28c>
    3328:	fdb910e3          	bne	s2,s11,32e8 <pjpeg_decode_init+0x1ec>
    332c:	05012903          	lw	s2,80(sp)
    3330:	04c12983          	lw	s3,76(sp)
    3334:	04812a03          	lw	s4,72(sp)
    3338:	01300d93          	li	s11,19
    333c:	43944703          	lbu	a4,1081(s0)
    3340:	1c071063          	bnez	a4,3500 <pjpeg_decode_init+0x404>
    3344:	04012b03          	lw	s6,64(sp)
    3348:	03012d03          	lw	s10,48(sp)
    334c:	ea9ff06f          	j	31f4 <pjpeg_decode_init+0xf8>
    3350:	00f917b3          	sll	a5,s2,a5
    3354:	00000513          	li	a0,0
    3358:	48fb9123          	sh	a5,1154(s7)
    335c:	921fd0ef          	jal	c7c <getOctet>
    3360:	482bd703          	lhu	a4,1154(s7)
    3364:	480c4783          	lbu	a5,1152(s8)
    3368:	00e56733          	or	a4,a0,a4
    336c:	40fd07b3          	sub	a5,s10,a5
    3370:	00f71733          	sll	a4,a4,a5
    3374:	01071713          	slli	a4,a4,0x10
    3378:	01075713          	srli	a4,a4,0x10
    337c:	f91ff06f          	j	330c <pjpeg_decode_init+0x210>
    3380:	02500d93          	li	s11,37
    3384:	fb9ff06f          	j	333c <pjpeg_decode_init+0x240>
    3388:	000a8b13          	mv	s6,s5
    338c:	00875713          	srli	a4,a4,0x8
    3390:	00412a83          	lw	s5,4(sp)
    3394:	f9671ce3          	bne	a4,s6,332c <pjpeg_decode_init+0x230>
    3398:	05012903          	lw	s2,80(sp)
    339c:	04c12983          	lw	s3,76(sp)
    33a0:	04812a03          	lw	s4,72(sp)
    33a4:	eb5ff06f          	j	3258 <pjpeg_decode_init+0x15c>
    33a8:	01400d93          	li	s11,20
    33ac:	f91ff06f          	j	333c <pjpeg_decode_init+0x240>
    33b0:	01100d93          	li	s11,17
    33b4:	f89ff06f          	j	333c <pjpeg_decode_init+0x240>
    33b8:	00000593          	li	a1,0
    33bc:	01000513          	li	a0,16
    33c0:	05212823          	sw	s2,80(sp)
    33c4:	961fd0ef          	jal	d24 <getBits>
    33c8:	fff50713          	addi	a4,a0,-1
    33cc:	01071713          	slli	a4,a4,0x10
    33d0:	000017b7          	lui	a5,0x1
    33d4:	01075713          	srli	a4,a4,0x10
    33d8:	46a79e23          	sh	a0,1148(a5) # 147c <gImageYSize>
    33dc:	00004937          	lui	s2,0x4
    33e0:	13277863          	bgeu	a4,s2,3510 <pjpeg_decode_init+0x414>
    33e4:	00000593          	li	a1,0
    33e8:	01000513          	li	a0,16
    33ec:	939fd0ef          	jal	d24 <getBits>
    33f0:	fff50713          	addi	a4,a0,-1
    33f4:	01071713          	slli	a4,a4,0x10
    33f8:	000017b7          	lui	a5,0x1
    33fc:	01075713          	srli	a4,a4,0x10
    3400:	46a79f23          	sh	a0,1150(a5) # 147e <gImageXSize>
    3404:	11277c63          	bgeu	a4,s2,351c <pjpeg_decode_init+0x420>
    3408:	000d0513          	mv	a0,s10
    340c:	00000593          	li	a1,0
    3410:	915fd0ef          	jal	d24 <getBits>
    3414:	0ff57613          	zext.b	a2,a0
    3418:	46c48da3          	sb	a2,1147(s1)
    341c:	00300713          	li	a4,3
    3420:	10c76a63          	bltu	a4,a2,3534 <pjpeg_decode_init+0x438>
    3424:	0ff57693          	zext.b	a3,a0
    3428:	00169713          	slli	a4,a3,0x1
    342c:	00d70733          	add	a4,a4,a3
    3430:	01a70733          	add	a4,a4,s10
    3434:	0eec9a63          	bne	s9,a4,3528 <pjpeg_decode_init+0x42c>
    3438:	70060863          	beqz	a2,3b48 <pjpeg_decode_init+0xa4c>
    343c:	000017b7          	lui	a5,0x1
    3440:	00001637          	lui	a2,0x1
    3444:	00001737          	lui	a4,0x1
    3448:	05312623          	sw	s3,76(sp)
    344c:	05412423          	sw	s4,72(sp)
    3450:	47460913          	addi	s2,a2,1140 # 1474 <gCompHSamp>
    3454:	46c70993          	addi	s3,a4,1132 # 146c <gCompQuant>
    3458:	47078a13          	addi	s4,a5,1136 # 1470 <gCompVSamp>
    345c:	000017b7          	lui	a5,0x1
    3460:	01512223          	sw	s5,4(sp)
    3464:	00090b13          	mv	s6,s2
    3468:	47878d13          	addi	s10,a5,1144 # 1478 <gCompIdent>
    346c:	00100c93          	li	s9,1
    3470:	00098a93          	mv	s5,s3
    3474:	0280006f          	j	349c <pjpeg_decode_init+0x3a0>
    3478:	47b4c703          	lbu	a4,1147(s1)
    347c:	000017b7          	lui	a5,0x1
    3480:	001d0d13          	addi	s10,s10,1
    3484:	001b0b13          	addi	s6,s6,1
    3488:	001a0a13          	addi	s4,s4,1
    348c:	001a8a93          	addi	s5,s5,1
    3490:	47078693          	addi	a3,a5,1136 # 1470 <gCompVSamp>
    3494:	00001637          	lui	a2,0x1
    3498:	0aedf463          	bgeu	s11,a4,3540 <pjpeg_decode_init+0x444>
    349c:	00000593          	li	a1,0
    34a0:	00800513          	li	a0,8
    34a4:	881fd0ef          	jal	d24 <getBits>
    34a8:	00ad0023          	sb	a0,0(s10)
    34ac:	00000593          	li	a1,0
    34b0:	00400513          	li	a0,4
    34b4:	871fd0ef          	jal	d24 <getBits>
    34b8:	00ab0023          	sb	a0,0(s6)
    34bc:	00000593          	li	a1,0
    34c0:	00400513          	li	a0,4
    34c4:	861fd0ef          	jal	d24 <getBits>
    34c8:	00aa0023          	sb	a0,0(s4)
    34cc:	00000593          	li	a1,0
    34d0:	00800513          	li	a0,8
    34d4:	851fd0ef          	jal	d24 <getBits>
    34d8:	0ff57793          	zext.b	a5,a0
    34dc:	001d8d93          	addi	s11,s11,1
    34e0:	00fa8023          	sb	a5,0(s5)
    34e4:	0ffdfd93          	zext.b	s11,s11
    34e8:	f8fcf8e3          	bgeu	s9,a5,3478 <pjpeg_decode_init+0x37c>
    34ec:	05012903          	lw	s2,80(sp)
    34f0:	04c12983          	lw	s3,76(sp)
    34f4:	04812a03          	lw	s4,72(sp)
    34f8:	02400d93          	li	s11,36
    34fc:	e41ff06f          	j	333c <pjpeg_decode_init+0x240>
    3500:	04012b03          	lw	s6,64(sp)
    3504:	03012d03          	lw	s10,48(sp)
    3508:	00070d93          	mv	s11,a4
    350c:	ce9ff06f          	j	31f4 <pjpeg_decode_init+0xf8>
    3510:	05012903          	lw	s2,80(sp)
    3514:	000d0d93          	mv	s11,s10
    3518:	e25ff06f          	j	333c <pjpeg_decode_init+0x240>
    351c:	05012903          	lw	s2,80(sp)
    3520:	00900d93          	li	s11,9
    3524:	e19ff06f          	j	333c <pjpeg_decode_init+0x240>
    3528:	05012903          	lw	s2,80(sp)
    352c:	00b00d93          	li	s11,11
    3530:	e0dff06f          	j	333c <pjpeg_decode_init+0x240>
    3534:	05012903          	lw	s2,80(sp)
    3538:	00a00d93          	li	s11,10
    353c:	e01ff06f          	j	333c <pjpeg_decode_init+0x240>
    3540:	43944d83          	lbu	s11,1081(s0)
    3544:	00412a83          	lw	s5,4(sp)
    3548:	000d8e63          	beqz	s11,3564 <pjpeg_decode_init+0x468>
    354c:	05012903          	lw	s2,80(sp)
    3550:	04c12983          	lw	s3,76(sp)
    3554:	04812a03          	lw	s4,72(sp)
    3558:	04012b03          	lw	s6,64(sp)
    355c:	03012d03          	lw	s10,48(sp)
    3560:	c95ff06f          	j	31f4 <pjpeg_decode_init+0xf8>
    3564:	23970263          	beq	a4,s9,3788 <pjpeg_decode_init+0x68c>
    3568:	00300793          	li	a5,3
    356c:	28f71463          	bne	a4,a5,37f4 <pjpeg_decode_init+0x6f8>
    3570:	00194703          	lbu	a4,1(s2) # 4001 <__mulsi3+0x2c9>
    3574:	01b00d93          	li	s11,27
    3578:	fd971ae3          	bne	a4,s9,354c <pjpeg_decode_init+0x450>
    357c:	0016c703          	lbu	a4,1(a3)
    3580:	fd9716e3          	bne	a4,s9,354c <pjpeg_decode_init+0x450>
    3584:	00294703          	lbu	a4,2(s2)
    3588:	fd9712e3          	bne	a4,s9,354c <pjpeg_decode_init+0x450>
    358c:	0026c703          	lbu	a4,2(a3)
    3590:	fb971ee3          	bne	a4,s9,354c <pjpeg_decode_init+0x450>
    3594:	47464703          	lbu	a4,1140(a2) # 1474 <gCompHSamp>
    3598:	29970a63          	beq	a4,s9,382c <pjpeg_decode_init+0x730>
    359c:	00200693          	li	a3,2
    35a0:	01b00d93          	li	s11,27
    35a4:	fad714e3          	bne	a4,a3,354c <pjpeg_decode_init+0x450>
    35a8:	000017b7          	lui	a5,0x1
    35ac:	4707c683          	lbu	a3,1136(a5) # 1470 <gCompVSamp>
    35b0:	00100613          	li	a2,1
    35b4:	52c68c63          	beq	a3,a2,3aec <pjpeg_decode_init+0x9f0>
    35b8:	f8e69ae3          	bne	a3,a4,354c <pjpeg_decode_init+0x450>
    35bc:	000017b7          	lui	a5,0x1
    35c0:	44478713          	addi	a4,a5,1092 # 1444 <gMCUOrg>
    35c4:	4407a223          	sw	zero,1092(a5)
    35c8:	20100793          	li	a5,513
    35cc:	00f71223          	sh	a5,4(a4)
    35d0:	00001d37          	lui	s10,0x1
    35d4:	00400793          	li	a5,4
    35d8:	00600713          	li	a4,6
    35dc:	44fd2a23          	sw	a5,1108(s10) # 1454 <gScanType>
    35e0:	000017b7          	lui	a5,0x1
    35e4:	44e78923          	sb	a4,1106(a5) # 1452 <gMaxBlocksPerMCU>
    35e8:	00f00713          	li	a4,15
    35ec:	01000793          	li	a5,16
    35f0:	000016b7          	lui	a3,0x1
    35f4:	47e6d503          	lhu	a0,1150(a3) # 147e <gImageXSize>
    35f8:	000016b7          	lui	a3,0x1
    35fc:	00d12423          	sw	a3,8(sp)
    3600:	00001637          	lui	a2,0x1
    3604:	01000693          	li	a3,16
    3608:	44d608a3          	sb	a3,1105(a2) # 1451 <gMaxMCUXSize>
    360c:	000016b7          	lui	a3,0x1
    3610:	00d12223          	sw	a3,4(sp)
    3614:	44f68823          	sb	a5,1104(a3) # 1450 <gMaxMCUYSize>
    3618:	00f50513          	addi	a0,a0,15
    361c:	00400693          	li	a3,4
    3620:	40d55533          	sra	a0,a0,a3
    3624:	000016b7          	lui	a3,0x1
    3628:	47c6d583          	lhu	a1,1148(a3) # 147c <gImageYSize>
    362c:	ff878793          	addi	a5,a5,-8
    3630:	00f037b3          	snez	a5,a5
    3634:	00e585b3          	add	a1,a1,a4
    3638:	00378793          	addi	a5,a5,3
    363c:	40f5d5b3          	sra	a1,a1,a5
    3640:	01059593          	slli	a1,a1,0x10
    3644:	0105d593          	srli	a1,a1,0x10
    3648:	000017b7          	lui	a5,0x1
    364c:	01051513          	slli	a0,a0,0x10
    3650:	44b79623          	sh	a1,1100(a5) # 144c <gMaxMCUSPerCol>
    3654:	01055513          	srli	a0,a0,0x10
    3658:	000017b7          	lui	a5,0x1
    365c:	44a79723          	sh	a0,1102(a5) # 144e <gMaxMCUSPerRow>
    3660:	00001cb7          	lui	s9,0x1
    3664:	6d4000ef          	jal	3d38 <__mulsi3>
    3668:	44ac9523          	sh	a0,1098(s9) # 144a <gNumMCUSRemaining>
    366c:	01f10513          	addi	a0,sp,31
    3670:	945fd0ef          	jal	fb4 <processMarkers>
    3674:	00050d93          	mv	s11,a0
    3678:	18051e63          	bnez	a0,3814 <pjpeg_decode_init+0x718>
    367c:	01f14683          	lbu	a3,31(sp)
    3680:	0da00713          	li	a4,218
    3684:	18e69663          	bne	a3,a4,3810 <pjpeg_decode_init+0x714>
    3688:	00000593          	li	a1,0
    368c:	01000513          	li	a0,16
    3690:	e94fd0ef          	jal	d24 <getBits>
    3694:	00050c93          	mv	s9,a0
    3698:	00000593          	li	a1,0
    369c:	00800513          	li	a0,8
    36a0:	e84fd0ef          	jal	d24 <getBits>
    36a4:	ffdc8e93          	addi	t4,s9,-3
    36a8:	0ff57713          	zext.b	a4,a0
    36ac:	010e9e93          	slli	t4,t4,0x10
    36b0:	00171713          	slli	a4,a4,0x1
    36b4:	000017b7          	lui	a5,0x1
    36b8:	010ede93          	srli	t4,t4,0x10
    36bc:	46a781a3          	sb	a0,1123(a5) # 1463 <gCompsInScan>
    36c0:	00370713          	addi	a4,a4,3
    36c4:	16ee9063          	bne	t4,a4,3824 <pjpeg_decode_init+0x728>
    36c8:	fff50713          	addi	a4,a0,-1
    36cc:	0ff77713          	zext.b	a4,a4
    36d0:	00200693          	li	a3,2
    36d4:	14e6e863          	bltu	a3,a4,3824 <pjpeg_decode_init+0x728>
    36d8:	00001cb7          	lui	s9,0x1
    36dc:	460c8c93          	addi	s9,s9,1120 # 1460 <gCompList>
    36e0:	000e8b13          	mv	s6,t4
    36e4:	000c8a13          	mv	s4,s9
    36e8:	00000593          	li	a1,0
    36ec:	00800513          	li	a0,8
    36f0:	e34fd0ef          	jal	d24 <getBits>
    36f4:	00050913          	mv	s2,a0
    36f8:	00000593          	li	a1,0
    36fc:	00800513          	li	a0,8
    3700:	e24fd0ef          	jal	d24 <getBits>
    3704:	47b4c883          	lbu	a7,1147(s1)
    3708:	3c088e63          	beqz	a7,3ae4 <pjpeg_decode_init+0x9e8>
    370c:	000016b7          	lui	a3,0x1
    3710:	000017b7          	lui	a5,0x1
    3714:	45868613          	addi	a2,a3,1112 # 1458 <gCompACTab>
    3718:	000016b7          	lui	a3,0x1
    371c:	47878713          	addi	a4,a5,1144 # 1478 <gCompIdent>
    3720:	0ff97813          	zext.b	a6,s2
    3724:	00000793          	li	a5,0
    3728:	45c68693          	addi	a3,a3,1116 # 145c <gCompDCTab>
    372c:	0100006f          	j	373c <pjpeg_decode_init+0x640>
    3730:	00178793          	addi	a5,a5,1
    3734:	0ff7f593          	zext.b	a1,a5
    3738:	3b15f663          	bgeu	a1,a7,3ae4 <pjpeg_decode_init+0x9e8>
    373c:	00074583          	lbu	a1,0(a4)
    3740:	00170713          	addi	a4,a4,1
    3744:	ff0596e3          	bne	a1,a6,3730 <pjpeg_decode_init+0x634>
    3748:	0ff57713          	zext.b	a4,a0
    374c:	00f685b3          	add	a1,a3,a5
    3750:	00475513          	srli	a0,a4,0x4
    3754:	00a58023          	sb	a0,0(a1)
    3758:	000015b7          	lui	a1,0x1
    375c:	4635c583          	lbu	a1,1123(a1) # 1463 <gCompsInScan>
    3760:	00fa0023          	sb	a5,0(s4)
    3764:	001d8d93          	addi	s11,s11,1
    3768:	00f77713          	andi	a4,a4,15
    376c:	00f607b3          	add	a5,a2,a5
    3770:	0ffdfd93          	zext.b	s11,s11
    3774:	00e78023          	sb	a4,0(a5)
    3778:	001a0a13          	addi	s4,s4,1
    377c:	0ebdfe63          	bgeu	s11,a1,3878 <pjpeg_decode_init+0x77c>
    3780:	ffeb0b13          	addi	s6,s6,-2
    3784:	f65ff06f          	j	36e8 <pjpeg_decode_init+0x5ec>
    3788:	47464703          	lbu	a4,1140(a2)
    378c:	01b00d93          	li	s11,27
    3790:	db971ee3          	bne	a4,s9,354c <pjpeg_decode_init+0x450>
    3794:	000017b7          	lui	a5,0x1
    3798:	4707c703          	lbu	a4,1136(a5) # 1470 <gCompVSamp>
    379c:	db9718e3          	bne	a4,s9,354c <pjpeg_decode_init+0x450>
    37a0:	000017b7          	lui	a5,0x1
    37a4:	00001d37          	lui	s10,0x1
    37a8:	45978923          	sb	s9,1106(a5) # 1452 <gMaxBlocksPerMCU>
    37ac:	000017b7          	lui	a5,0x1
    37b0:	440d2a23          	sw	zero,1108(s10) # 1454 <gScanType>
    37b4:	44078223          	sb	zero,1092(a5) # 1444 <gMCUOrg>
    37b8:	00700713          	li	a4,7
    37bc:	00800793          	li	a5,8
    37c0:	000016b7          	lui	a3,0x1
    37c4:	47e6d503          	lhu	a0,1150(a3) # 147e <gImageXSize>
    37c8:	000016b7          	lui	a3,0x1
    37cc:	00d12423          	sw	a3,8(sp)
    37d0:	00001637          	lui	a2,0x1
    37d4:	00800693          	li	a3,8
    37d8:	44d608a3          	sb	a3,1105(a2) # 1451 <gMaxMCUXSize>
    37dc:	000016b7          	lui	a3,0x1
    37e0:	00d12223          	sw	a3,4(sp)
    37e4:	44f68823          	sb	a5,1104(a3) # 1450 <gMaxMCUYSize>
    37e8:	00750513          	addi	a0,a0,7
    37ec:	00300693          	li	a3,3
    37f0:	e31ff06f          	j	3620 <pjpeg_decode_init+0x524>
    37f4:	04c12983          	lw	s3,76(sp)
    37f8:	04812a03          	lw	s4,72(sp)
    37fc:	05012903          	lw	s2,80(sp)
    3800:	04012b03          	lw	s6,64(sp)
    3804:	03012d03          	lw	s10,48(sp)
    3808:	01a00d93          	li	s11,26
    380c:	9e9ff06f          	j	31f4 <pjpeg_decode_init+0xf8>
    3810:	01200d93          	li	s11,18
    3814:	43944703          	lbu	a4,1081(s0)
    3818:	d2070ae3          	beqz	a4,354c <pjpeg_decode_init+0x450>
    381c:	00070d93          	mv	s11,a4
    3820:	d2dff06f          	j	354c <pjpeg_decode_init+0x450>
    3824:	00e00d93          	li	s11,14
    3828:	fedff06f          	j	3814 <pjpeg_decode_init+0x718>
    382c:	000017b7          	lui	a5,0x1
    3830:	4707c703          	lbu	a4,1136(a5) # 1470 <gCompVSamp>
    3834:	00100793          	li	a5,1
    3838:	2ef70063          	beq	a4,a5,3b18 <pjpeg_decode_init+0xa1c>
    383c:	00200693          	li	a3,2
    3840:	01b00d93          	li	s11,27
    3844:	d0d714e3          	bne	a4,a3,354c <pjpeg_decode_init+0x450>
    3848:	00300793          	li	a5,3
    384c:	00001d37          	lui	s10,0x1
    3850:	00400713          	li	a4,4
    3854:	44fd2a23          	sw	a5,1108(s10) # 1454 <gScanType>
    3858:	000017b7          	lui	a5,0x1
    385c:	44e78923          	sb	a4,1106(a5) # 1452 <gMaxBlocksPerMCU>
    3860:	000017b7          	lui	a5,0x1
    3864:	02010737          	lui	a4,0x2010
    3868:	44e7a223          	sw	a4,1092(a5) # 1444 <gMCUOrg>
    386c:	00f00713          	li	a4,15
    3870:	01000793          	li	a5,16
    3874:	f4dff06f          	j	37c0 <pjpeg_decode_init+0x6c4>
    3878:	00000593          	li	a1,0
    387c:	00800513          	li	a0,8
    3880:	01612623          	sw	s6,12(sp)
    3884:	ca0fd0ef          	jal	d24 <getBits>
    3888:	00001737          	lui	a4,0x1
    388c:	42a70ba3          	sb	a0,1079(a4) # 1437 <spectral_start>
    3890:	00000593          	li	a1,0
    3894:	00800513          	li	a0,8
    3898:	c8cfd0ef          	jal	d24 <getBits>
    389c:	00001737          	lui	a4,0x1
    38a0:	42a70b23          	sb	a0,1078(a4) # 1436 <spectral_end>
    38a4:	00000593          	li	a1,0
    38a8:	00400513          	li	a0,4
    38ac:	c78fd0ef          	jal	d24 <getBits>
    38b0:	00001737          	lui	a4,0x1
    38b4:	42a70aa3          	sb	a0,1077(a4) # 1435 <successive_high>
    38b8:	00000593          	li	a1,0
    38bc:	00400513          	li	a0,4
    38c0:	c64fd0ef          	jal	d24 <getBits>
    38c4:	00c12e83          	lw	t4,12(sp)
    38c8:	000015b7          	lui	a1,0x1
    38cc:	42a58a23          	sb	a0,1076(a1) # 1434 <successive_low>
    38d0:	ffbe8793          	addi	a5,t4,-5
    38d4:	01079d93          	slli	s11,a5,0x10
    38d8:	010ddd93          	srli	s11,s11,0x10
    38dc:	01c0006f          	j	38f8 <pjpeg_decode_init+0x7fc>
    38e0:	fffd8d93          	addi	s11,s11,-1
    38e4:	00000593          	li	a1,0
    38e8:	00800513          	li	a0,8
    38ec:	010d9d93          	slli	s11,s11,0x10
    38f0:	c34fd0ef          	jal	d24 <getBits>
    38f4:	010ddd93          	srli	s11,s11,0x10
    38f8:	000017b7          	lui	a5,0x1
    38fc:	45c78693          	addi	a3,a5,1116 # 145c <gCompDCTab>
    3900:	000017b7          	lui	a5,0x1
    3904:	45878613          	addi	a2,a5,1112 # 1458 <gCompACTab>
    3908:	fc0d9ce3          	bnez	s11,38e0 <pjpeg_decode_init+0x7e4>
    390c:	000017b7          	lui	a5,0x1
    3910:	4637ce03          	lbu	t3,1123(a5) # 1463 <gCompsInScan>
    3914:	080e0863          	beqz	t3,39a4 <pjpeg_decode_init+0x8a8>
    3918:	000017b7          	lui	a5,0x1
    391c:	58a7ce83          	lbu	t4,1418(a5) # 158a <gValidHuffTables>
    3920:	019e0e33          	add	t3,t3,s9
    3924:	000c8593          	mv	a1,s9
    3928:	00100513          	li	a0,1
    392c:	0080006f          	j	3934 <pjpeg_decode_init+0x838>
    3930:	03c58e63          	beq	a1,t3,396c <pjpeg_decode_init+0x870>
    3934:	0005c703          	lbu	a4,0(a1)
    3938:	00158593          	addi	a1,a1,1
    393c:	00e607b3          	add	a5,a2,a4
    3940:	0007c783          	lbu	a5,0(a5)
    3944:	00e68733          	add	a4,a3,a4
    3948:	00074703          	lbu	a4,0(a4)
    394c:	00278793          	addi	a5,a5,2
    3950:	00f517b3          	sll	a5,a0,a5
    3954:	00e51733          	sll	a4,a0,a4
    3958:	00e7e7b3          	or	a5,a5,a4
    395c:	00fef733          	and	a4,t4,a5
    3960:	fcf708e3          	beq	a4,a5,3930 <pjpeg_decode_init+0x834>
    3964:	01800d93          	li	s11,24
    3968:	eadff06f          	j	3814 <pjpeg_decode_init+0x718>
    396c:	000017b7          	lui	a5,0x1
    3970:	5897c703          	lbu	a4,1417(a5) # 1589 <gValidQuantTables>
    3974:	0080006f          	j	397c <pjpeg_decode_init+0x880>
    3978:	03cc8663          	beq	s9,t3,39a4 <pjpeg_decode_init+0x8a8>
    397c:	000cc783          	lbu	a5,0(s9)
    3980:	001c8c93          	addi	s9,s9,1
    3984:	00f987b3          	add	a5,s3,a5
    3988:	0007c783          	lbu	a5,0(a5)
    398c:	00f037b3          	snez	a5,a5
    3990:	00178793          	addi	a5,a5,1
    3994:	00f777b3          	and	a5,a4,a5
    3998:	fe0790e3          	bnez	a5,3978 <pjpeg_decode_init+0x87c>
    399c:	01700d93          	li	s11,23
    39a0:	e75ff06f          	j	3814 <pjpeg_decode_init+0x718>
    39a4:	000017b7          	lui	a5,0x1
    39a8:	4687d703          	lhu	a4,1128(a5) # 1468 <pjpeg_decode_mcu>
    39ac:	000027b7          	lui	a5,0x2
    39b0:	8e07a623          	sw	zero,-1812(a5) # 18ec <gLastDC>
    39b4:	8ec78793          	addi	a5,a5,-1812
    39b8:	00079223          	sh	zero,4(a5)
    39bc:	00070a63          	beqz	a4,39d0 <pjpeg_decode_init+0x8d4>
    39c0:	000017b7          	lui	a5,0x1
    39c4:	46e79223          	sh	a4,1124(a5) # 1464 <gRestartsLeft>
    39c8:	000017b7          	lui	a5,0x1
    39cc:	46079323          	sh	zero,1126(a5) # 1466 <gNextRestartNum>
    39d0:	480c4703          	lbu	a4,1152(s8)
    39d4:	000017b7          	lui	a5,0x1
    39d8:	000016b7          	lui	a3,0x1
    39dc:	482bd603          	lhu	a2,1154(s7)
    39e0:	4857c783          	lbu	a5,1157(a5) # 1485 <gInBufOfs>
    39e4:	4846c683          	lbu	a3,1156(a3) # 1484 <gInBufLeft>
    39e8:	0c071e63          	bnez	a4,3ac4 <pjpeg_decode_init+0x9c8>
    39ec:	00001737          	lui	a4,0x1
    39f0:	48870713          	addi	a4,a4,1160 # 1488 <gInBuf>
    39f4:	fff78793          	addi	a5,a5,-1
    39f8:	0ff7f793          	zext.b	a5,a5
    39fc:	00800993          	li	s3,8
    3a00:	000015b7          	lui	a1,0x1
    3a04:	00f70733          	add	a4,a4,a5
    3a08:	00865613          	srli	a2,a2,0x8
    3a0c:	00168693          	addi	a3,a3,1
    3a10:	48f582a3          	sb	a5,1157(a1) # 1485 <gInBufOfs>
    3a14:	00098513          	mv	a0,s3
    3a18:	000017b7          	lui	a5,0x1
    3a1c:	00100593          	li	a1,1
    3a20:	00c70023          	sb	a2,0(a4)
    3a24:	48d78223          	sb	a3,1156(a5) # 1484 <gInBufLeft>
    3a28:	493c0023          	sb	s3,1152(s8)
    3a2c:	af8fd0ef          	jal	d24 <getBits>
    3a30:	00098513          	mv	a0,s3
    3a34:	00100593          	li	a1,1
    3a38:	aecfd0ef          	jal	d24 <getBits>
    3a3c:	43944d83          	lbu	s11,1081(s0)
    3a40:	b00d96e3          	bnez	s11,354c <pjpeg_decode_init+0x450>
    3a44:	000017b7          	lui	a5,0x1
    3a48:	47e7df83          	lhu	t6,1150(a5) # 147e <gImageXSize>
    3a4c:	000017b7          	lui	a5,0x1
    3a50:	47c7df03          	lhu	t5,1148(a5) # 147c <gImageYSize>
    3a54:	000017b7          	lui	a5,0x1
    3a58:	44e7d303          	lhu	t1,1102(a5) # 144e <gMaxMCUSPerRow>
    3a5c:	000017b7          	lui	a5,0x1
    3a60:	44c7d803          	lhu	a6,1100(a5) # 144c <gMaxMCUSPerCol>
    3a64:	00812783          	lw	a5,8(sp)
    3a68:	47b4ce83          	lbu	t4,1147(s1)
    3a6c:	454d2e03          	lw	t3,1108(s10)
    3a70:	4517c503          	lbu	a0,1105(a5)
    3a74:	00412783          	lw	a5,4(sp)
    3a78:	00002637          	lui	a2,0x2
    3a7c:	000026b7          	lui	a3,0x2
    3a80:	4507c583          	lbu	a1,1104(a5)
    3a84:	00002737          	lui	a4,0x2
    3a88:	bf460613          	addi	a2,a2,-1036 # 1bf4 <gMCUBufR>
    3a8c:	af468693          	addi	a3,a3,-1292 # 1af4 <gMCUBufG>
    3a90:	9f470713          	addi	a4,a4,-1548 # 19f4 <gMCUBufB>
    3a94:	01faa023          	sw	t6,0(s5)
    3a98:	01eaa223          	sw	t5,4(s5)
    3a9c:	01daa423          	sw	t4,8(s5)
    3aa0:	01caaa23          	sw	t3,20(s5)
    3aa4:	006aa623          	sw	t1,12(s5)
    3aa8:	010aa823          	sw	a6,16(s5)
    3aac:	00aaac23          	sw	a0,24(s5)
    3ab0:	00baae23          	sw	a1,28(s5)
    3ab4:	02caa023          	sw	a2,32(s5)
    3ab8:	02daa223          	sw	a3,36(s5)
    3abc:	02eaa423          	sw	a4,40(s5)
    3ac0:	a8dff06f          	j	354c <pjpeg_decode_init+0x450>
    3ac4:	fff78793          	addi	a5,a5,-1
    3ac8:	00001737          	lui	a4,0x1
    3acc:	0ff7f793          	zext.b	a5,a5
    3ad0:	48870713          	addi	a4,a4,1160 # 1488 <gInBuf>
    3ad4:	00f705b3          	add	a1,a4,a5
    3ad8:	00168693          	addi	a3,a3,1
    3adc:	00c58023          	sb	a2,0(a1)
    3ae0:	f15ff06f          	j	39f4 <pjpeg_decode_init+0x8f8>
    3ae4:	00f00d93          	li	s11,15
    3ae8:	d2dff06f          	j	3814 <pjpeg_decode_init+0x718>
    3aec:	00001d37          	lui	s10,0x1
    3af0:	000017b7          	lui	a5,0x1
    3af4:	44ed2a23          	sw	a4,1108(s10) # 1454 <gScanType>
    3af8:	00400713          	li	a4,4
    3afc:	44e78923          	sb	a4,1106(a5) # 1452 <gMaxBlocksPerMCU>
    3b00:	000017b7          	lui	a5,0x1
    3b04:	02010737          	lui	a4,0x2010
    3b08:	44e7a223          	sw	a4,1092(a5) # 1444 <gMCUOrg>
    3b0c:	00700713          	li	a4,7
    3b10:	00800793          	li	a5,8
    3b14:	addff06f          	j	35f0 <pjpeg_decode_init+0x4f4>
    3b18:	000017b7          	lui	a5,0x1
    3b1c:	10000693          	li	a3,256
    3b20:	44d79223          	sh	a3,1092(a5) # 1444 <gMCUOrg>
    3b24:	00001d37          	lui	s10,0x1
    3b28:	44478793          	addi	a5,a5,1092
    3b2c:	00200693          	li	a3,2
    3b30:	00d78123          	sb	a3,2(a5)
    3b34:	44ed2a23          	sw	a4,1108(s10) # 1454 <gScanType>
    3b38:	000017b7          	lui	a5,0x1
    3b3c:	00300713          	li	a4,3
    3b40:	44e78923          	sb	a4,1106(a5) # 1452 <gMaxBlocksPerMCU>
    3b44:	c75ff06f          	j	37b8 <pjpeg_decode_init+0x6bc>
    3b48:	43944d83          	lbu	s11,1081(s0)
    3b4c:	ca0d88e3          	beqz	s11,37fc <pjpeg_decode_init+0x700>
    3b50:	05012903          	lw	s2,80(sp)
    3b54:	04012b03          	lw	s6,64(sp)
    3b58:	03012d03          	lw	s10,48(sp)
    3b5c:	e98ff06f          	j	31f4 <pjpeg_decode_init+0xf8>

00003b60 <pjpeg_need_bytes_callback>:
    3b60:	ff010113          	addi	sp,sp,-16
    3b64:	00912223          	sw	s1,4(sp)
    3b68:	000024b7          	lui	s1,0x2
    3b6c:	da04a783          	lw	a5,-608(s1) # 1da0 <jpeg_off>
    3b70:	00812423          	sw	s0,8(sp)
    3b74:	23a00413          	li	s0,570
    3b78:	01212023          	sw	s2,0(sp)
    3b7c:	00112623          	sw	ra,12(sp)
    3b80:	40f40433          	sub	s0,s0,a5
    3b84:	00060913          	mv	s2,a2
    3b88:	0085f463          	bgeu	a1,s0,3b90 <pjpeg_need_bytes_callback+0x30>
    3b8c:	00058413          	mv	s0,a1
    3b90:	000015b7          	lui	a1,0x1
    3b94:	1f858593          	addi	a1,a1,504 # 11f8 <jpeg_data>
    3b98:	00f585b3          	add	a1,a1,a5
    3b9c:	00040613          	mv	a2,s0
    3ba0:	d30fc0ef          	jal	d0 <memcpy>
    3ba4:	00890023          	sb	s0,0(s2)
    3ba8:	da04a783          	lw	a5,-608(s1)
    3bac:	00c12083          	lw	ra,12(sp)
    3bb0:	00012903          	lw	s2,0(sp)
    3bb4:	008787b3          	add	a5,a5,s0
    3bb8:	00812403          	lw	s0,8(sp)
    3bbc:	daf4a023          	sw	a5,-608(s1)
    3bc0:	00000513          	li	a0,0
    3bc4:	00412483          	lw	s1,4(sp)
    3bc8:	01010113          	addi	sp,sp,16
    3bcc:	00008067          	ret

00003bd0 <benchmark_body.isra.0>:
    3bd0:	0a058863          	beqz	a1,3c80 <benchmark_body.isra.0+0xb0>
    3bd4:	fd010113          	addi	sp,sp,-48
    3bd8:	01312e23          	sw	s3,28(sp)
    3bdc:	01412c23          	sw	s4,24(sp)
    3be0:	000029b7          	lui	s3,0x2
    3be4:	00004a37          	lui	s4,0x4
    3be8:	02812423          	sw	s0,40(sp)
    3bec:	03212023          	sw	s2,32(sp)
    3bf0:	01512a23          	sw	s5,20(sp)
    3bf4:	01612823          	sw	s6,16(sp)
    3bf8:	01712623          	sw	s7,12(sp)
    3bfc:	02112623          	sw	ra,44(sp)
    3c00:	02912223          	sw	s1,36(sp)
    3c04:	00050b93          	mv	s7,a0
    3c08:	00058913          	mv	s2,a1
    3c0c:	b60a0a13          	addi	s4,s4,-1184 # 3b60 <pjpeg_need_bytes_callback>
    3c10:	d7498993          	addi	s3,s3,-652 # 1d74 <pInfo>
    3c14:	00000b13          	li	s6,0
    3c18:	00002ab7          	lui	s5,0x2
    3c1c:	00100413          	li	s0,1
    3c20:	00000493          	li	s1,0
    3c24:	00000693          	li	a3,0
    3c28:	00000613          	li	a2,0
    3c2c:	000a0593          	mv	a1,s4
    3c30:	00098513          	mv	a0,s3
    3c34:	da0aa023          	sw	zero,-608(s5) # 1da0 <jpeg_off>
    3c38:	cc4ff0ef          	jal	30fc <pjpeg_decode_init>
    3c3c:	82dfd0ef          	jal	1468 <pjpeg_decode_mcu>
    3c40:	fe851ee3          	bne	a0,s0,3c3c <benchmark_body.isra.0+0x6c>
    3c44:	00148493          	addi	s1,s1,1
    3c48:	fd249ee3          	bne	s1,s2,3c24 <benchmark_body.isra.0+0x54>
    3c4c:	001b0b13          	addi	s6,s6,1
    3c50:	fd6b98e3          	bne	s7,s6,3c20 <benchmark_body.isra.0+0x50>
    3c54:	02c12083          	lw	ra,44(sp)
    3c58:	02812403          	lw	s0,40(sp)
    3c5c:	02412483          	lw	s1,36(sp)
    3c60:	02012903          	lw	s2,32(sp)
    3c64:	01c12983          	lw	s3,28(sp)
    3c68:	01812a03          	lw	s4,24(sp)
    3c6c:	01412a83          	lw	s5,20(sp)
    3c70:	01012b03          	lw	s6,16(sp)
    3c74:	00c12b83          	lw	s7,12(sp)
    3c78:	03010113          	addi	sp,sp,48
    3c7c:	00008067          	ret
    3c80:	00008067          	ret

00003c84 <verify_benchmark>:
    3c84:	ff010113          	addi	sp,sp,-16
    3c88:	00812423          	sw	s0,8(sp)
    3c8c:	00002437          	lui	s0,0x2
    3c90:	d7440413          	addi	s0,s0,-652 # 1d74 <pInfo>
    3c94:	02042503          	lw	a0,32(s0)
    3c98:	000015b7          	lui	a1,0x1
    3c9c:	1b858593          	addi	a1,a1,440 # 11b8 <r_ref.2>
    3ca0:	04000613          	li	a2,64
    3ca4:	00112623          	sw	ra,12(sp)
    3ca8:	c4cfc0ef          	jal	f4 <memcmp>
    3cac:	00050c63          	beqz	a0,3cc4 <verify_benchmark+0x40>
    3cb0:	00c12083          	lw	ra,12(sp)
    3cb4:	00812403          	lw	s0,8(sp)
    3cb8:	00000513          	li	a0,0
    3cbc:	01010113          	addi	sp,sp,16
    3cc0:	00008067          	ret
    3cc4:	02442503          	lw	a0,36(s0)
    3cc8:	000015b7          	lui	a1,0x1
    3ccc:	17858593          	addi	a1,a1,376 # 1178 <g_ref.1>
    3cd0:	04000613          	li	a2,64
    3cd4:	c20fc0ef          	jal	f4 <memcmp>
    3cd8:	fc051ce3          	bnez	a0,3cb0 <verify_benchmark+0x2c>
    3cdc:	02842503          	lw	a0,40(s0)
    3ce0:	000015b7          	lui	a1,0x1
    3ce4:	13858593          	addi	a1,a1,312 # 1138 <b_ref.0>
    3ce8:	04000613          	li	a2,64
    3cec:	c08fc0ef          	jal	f4 <memcmp>
    3cf0:	00c12083          	lw	ra,12(sp)
    3cf4:	00812403          	lw	s0,8(sp)
    3cf8:	00153513          	seqz	a0,a0
    3cfc:	01010113          	addi	sp,sp,16
    3d00:	00008067          	ret

00003d04 <initialise_benchmark>:
    3d04:	00008067          	ret

00003d08 <warm_caches>:
    3d08:	00050593          	mv	a1,a0
    3d0c:	00100513          	li	a0,1
    3d10:	ec1ff06f          	j	3bd0 <benchmark_body.isra.0>

00003d14 <benchmark>:
    3d14:	ff010113          	addi	sp,sp,-16
    3d18:	00200513          	li	a0,2
    3d1c:	00100593          	li	a1,1
    3d20:	00112623          	sw	ra,12(sp)
    3d24:	eadff0ef          	jal	3bd0 <benchmark_body.isra.0>
    3d28:	00c12083          	lw	ra,12(sp)
    3d2c:	00000513          	li	a0,0
    3d30:	01010113          	addi	sp,sp,16
    3d34:	00008067          	ret

00003d38 <__mulsi3>:
    3d38:	00050613          	mv	a2,a0
    3d3c:	00000513          	li	a0,0
    3d40:	0015f693          	andi	a3,a1,1
    3d44:	00068463          	beqz	a3,3d4c <__mulsi3+0x14>
    3d48:	00c50533          	add	a0,a0,a2
    3d4c:	0015d593          	srli	a1,a1,0x1
    3d50:	00161613          	slli	a2,a2,0x1
    3d54:	fe0596e3          	bnez	a1,3d40 <__mulsi3+0x8>
    3d58:	00008067          	ret
