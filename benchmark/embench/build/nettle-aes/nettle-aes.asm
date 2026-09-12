
D:\aaa1verilog_project\rv32i_cpu\benchmark\embench\build\nettle-aes\nettle-aes.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
       0:	00008117          	auipc	sp,0x8
       4:	f0010113          	addi	sp,sp,-256 # 7f00 <__stack_top>
       8:	00004297          	auipc	t0,0x4
       c:	82428293          	addi	t0,t0,-2012 # 382c <decctx>
      10:	00004317          	auipc	t1,0x4
      14:	c0430313          	addi	t1,t1,-1020 # 3c14 <__bss_end>
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
      78:	779000ef          	jal	ff0 <initialise_benchmark>
      7c:	00000513          	li	a0,0
      80:	775000ef          	jal	ff4 <warm_caches>
      84:	fadff0ef          	jal	30 <start_trigger>
      88:	779000ef          	jal	1000 <benchmark>
      8c:	00a12623          	sw	a0,12(sp)
      90:	fb5ff0ef          	jal	44 <stop_trigger>
      94:	00c12503          	lw	a0,12(sp)
      98:	6f1000ef          	jal	f88 <verify_benchmark>
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

000000d0 <_aes_set_key.part.0>:
      d0:	fd010113          	addi	sp,sp,-48
      d4:	02912223          	sw	s1,36(sp)
      d8:	02112623          	sw	ra,44(sp)
      dc:	00150493          	addi	s1,a0,1
      e0:	00249493          	slli	s1,s1,0x2
      e4:	04058463          	beqz	a1,12c <_aes_set_key.part.0+0x5c>
      e8:	00259313          	slli	t1,a1,0x2
      ec:	00668333          	add	t1,a3,t1
      f0:	00060813          	mv	a6,a2
      f4:	0036c783          	lbu	a5,3(a3)
      f8:	0026c503          	lbu	a0,2(a3)
      fc:	0006c883          	lbu	a7,0(a3)
     100:	0016c703          	lbu	a4,1(a3)
     104:	01879793          	slli	a5,a5,0x18
     108:	01051513          	slli	a0,a0,0x10
     10c:	00a7e7b3          	or	a5,a5,a0
     110:	0117e7b3          	or	a5,a5,a7
     114:	00871713          	slli	a4,a4,0x8
     118:	00e7e7b3          	or	a5,a5,a4
     11c:	00f82023          	sw	a5,0(a6)
     120:	00468693          	addi	a3,a3,4
     124:	00480813          	addi	a6,a6,4
     128:	fcd316e3          	bne	t1,a3,f4 <_aes_set_key.part.0+0x24>
     12c:	1895f863          	bgeu	a1,s1,2bc <_aes_set_key.part.0+0x1ec>
     130:	00259793          	slli	a5,a1,0x2
     134:	01312e23          	sw	s3,28(sp)
     138:	01512a23          	sw	s5,20(sp)
     13c:	01712623          	sw	s7,12(sp)
     140:	00f607b3          	add	a5,a2,a5
     144:	0075ba93          	sltiu	s5,a1,7
     148:	000019b7          	lui	s3,0x1
     14c:	00002bb7          	lui	s7,0x2
     150:	02812423          	sw	s0,40(sp)
     154:	03212023          	sw	s2,32(sp)
     158:	01412c23          	sw	s4,24(sp)
     15c:	01612823          	sw	s6,16(sp)
     160:	01812423          	sw	s8,8(sp)
     164:	ffc7a403          	lw	s0,-4(a5)
     168:	00058913          	mv	s2,a1
     16c:	00060b13          	mv	s6,a2
     170:	001aca93          	xori	s5,s5,1
     174:	00098993          	mv	s3,s3
     178:	50cb8b93          	addi	s7,s7,1292 # 250c <_aes_encrypt_table>
     17c:	00259a13          	slli	s4,a1,0x2
     180:	00058c13          	mv	s8,a1
     184:	0540006f          	j	1d8 <_aes_set_key.part.0+0x108>
     188:	00064403          	lbu	s0,0(a2)
     18c:	0006c683          	lbu	a3,0(a3)
     190:	00074703          	lbu	a4,0(a4)
     194:	0007c783          	lbu	a5,0(a5)
     198:	01841413          	slli	s0,s0,0x18
     19c:	00d46433          	or	s0,s0,a3
     1a0:	00871713          	slli	a4,a4,0x8
     1a4:	0009c683          	lbu	a3,0(s3) # 1000 <benchmark>
     1a8:	00e46433          	or	s0,s0,a4
     1ac:	01079793          	slli	a5,a5,0x10
     1b0:	00f46433          	or	s0,s0,a5
     1b4:	00d44433          	xor	s0,s0,a3
     1b8:	00198993          	addi	s3,s3,1
     1bc:	000b2703          	lw	a4,0(s6)
     1c0:	014b07b3          	add	a5,s6,s4
     1c4:	001c0c13          	addi	s8,s8,1
     1c8:	00e44433          	xor	s0,s0,a4
     1cc:	0087a023          	sw	s0,0(a5)
     1d0:	004b0b13          	addi	s6,s6,4
     1d4:	0d848463          	beq	s1,s8,29c <_aes_set_key.part.0+0x1cc>
     1d8:	00090593          	mv	a1,s2
     1dc:	000c0513          	mv	a0,s8
     1e0:	695000ef          	jal	1074 <__umodsi3>
     1e4:	00845713          	srli	a4,s0,0x8
     1e8:	01841793          	slli	a5,s0,0x18
     1ec:	00e787b3          	add	a5,a5,a4
     1f0:	0187d693          	srli	a3,a5,0x18
     1f4:	0087d713          	srli	a4,a5,0x8
     1f8:	00db8633          	add	a2,s7,a3
     1fc:	0ff7f693          	zext.b	a3,a5
     200:	0107d793          	srli	a5,a5,0x10
     204:	0ff77713          	zext.b	a4,a4
     208:	0ff7f793          	zext.b	a5,a5
     20c:	00db86b3          	add	a3,s7,a3
     210:	00eb8733          	add	a4,s7,a4
     214:	00fb87b3          	add	a5,s7,a5
     218:	ffc50593          	addi	a1,a0,-4
     21c:	f60506e3          	beqz	a0,188 <_aes_set_key.part.0+0xb8>
     220:	f8059ee3          	bnez	a1,1bc <_aes_set_key.part.0+0xec>
     224:	f80a8ce3          	beqz	s5,1bc <_aes_set_key.part.0+0xec>
     228:	000027b7          	lui	a5,0x2
     22c:	50c78793          	addi	a5,a5,1292 # 250c <_aes_encrypt_table>
     230:	01845713          	srli	a4,s0,0x18
     234:	00845693          	srli	a3,s0,0x8
     238:	00e78733          	add	a4,a5,a4
     23c:	0ff47613          	zext.b	a2,s0
     240:	0ff6f693          	zext.b	a3,a3
     244:	00074703          	lbu	a4,0(a4)
     248:	00c78633          	add	a2,a5,a2
     24c:	00d786b3          	add	a3,a5,a3
     250:	01045413          	srli	s0,s0,0x10
     254:	0ff47413          	zext.b	s0,s0
     258:	00064603          	lbu	a2,0(a2)
     25c:	0006c683          	lbu	a3,0(a3)
     260:	008787b3          	add	a5,a5,s0
     264:	0007c403          	lbu	s0,0(a5)
     268:	01871793          	slli	a5,a4,0x18
     26c:	00c7e7b3          	or	a5,a5,a2
     270:	00869713          	slli	a4,a3,0x8
     274:	00e7e7b3          	or	a5,a5,a4
     278:	000b2703          	lw	a4,0(s6)
     27c:	01041413          	slli	s0,s0,0x10
     280:	0087e433          	or	s0,a5,s0
     284:	00e44433          	xor	s0,s0,a4
     288:	014b07b3          	add	a5,s6,s4
     28c:	001c0c13          	addi	s8,s8,1
     290:	0087a023          	sw	s0,0(a5)
     294:	004b0b13          	addi	s6,s6,4
     298:	f58490e3          	bne	s1,s8,1d8 <_aes_set_key.part.0+0x108>
     29c:	02812403          	lw	s0,40(sp)
     2a0:	02012903          	lw	s2,32(sp)
     2a4:	01c12983          	lw	s3,28(sp)
     2a8:	01812a03          	lw	s4,24(sp)
     2ac:	01412a83          	lw	s5,20(sp)
     2b0:	01012b03          	lw	s6,16(sp)
     2b4:	00c12b83          	lw	s7,12(sp)
     2b8:	00812c03          	lw	s8,8(sp)
     2bc:	02c12083          	lw	ra,44(sp)
     2c0:	02412483          	lw	s1,36(sp)
     2c4:	03010113          	addi	sp,sp,48
     2c8:	00008067          	ret

000002cc <_nettle_aes_encrypt.part.0>:
     2cc:	50068263          	beqz	a3,7d0 <_nettle_aes_encrypt.part.0+0x504>
     2d0:	fd010113          	addi	sp,sp,-48
     2d4:	03312023          	sw	s3,32(sp)
     2d8:	00050993          	mv	s3,a0
     2dc:	01412e23          	sw	s4,28(sp)
     2e0:	00499a13          	slli	s4,s3,0x4
     2e4:	02812623          	sw	s0,44(sp)
     2e8:	02912423          	sw	s1,40(sp)
     2ec:	03212223          	sw	s2,36(sp)
     2f0:	01512c23          	sw	s5,24(sp)
     2f4:	01612a23          	sw	s6,20(sp)
     2f8:	01712823          	sw	s7,16(sp)
     2fc:	01812623          	sw	s8,12(sp)
     300:	01912423          	sw	s9,8(sp)
     304:	01a12223          	sw	s10,4(sp)
     308:	01b12023          	sw	s11,0(sp)
     30c:	00078413          	mv	s0,a5
     310:	00058493          	mv	s1,a1
     314:	00070513          	mv	a0,a4
     318:	00d70ab3          	add	s5,a4,a3
     31c:	01458933          	add	s2,a1,s4
     320:	00100b13          	li	s6,1
     324:	00144703          	lbu	a4,1(s0)
     328:	00544783          	lbu	a5,5(s0)
     32c:	00944c83          	lbu	s9,9(s0)
     330:	00d44c03          	lbu	s8,13(s0)
     334:	00044f83          	lbu	t6,0(s0)
     338:	00444f03          	lbu	t5,4(s0)
     33c:	00244b83          	lbu	s7,2(s0)
     340:	00644383          	lbu	t2,6(s0)
     344:	00844d83          	lbu	s11,8(s0)
     348:	00a44283          	lbu	t0,10(s0)
     34c:	00c44d03          	lbu	s10,12(s0)
     350:	00e44583          	lbu	a1,14(s0)
     354:	00344303          	lbu	t1,3(s0)
     358:	00744803          	lbu	a6,7(s0)
     35c:	00b44883          	lbu	a7,11(s0)
     360:	00f44683          	lbu	a3,15(s0)
     364:	00871e93          	slli	t4,a4,0x8
     368:	00879e13          	slli	t3,a5,0x8
     36c:	008c9c93          	slli	s9,s9,0x8
     370:	008c1c13          	slli	s8,s8,0x8
     374:	01fee733          	or	a4,t4,t6
     378:	01ee67b3          	or	a5,t3,t5
     37c:	0004af83          	lw	t6,0(s1)
     380:	0044af03          	lw	t5,4(s1)
     384:	0084ae83          	lw	t4,8(s1)
     388:	00c4ae03          	lw	t3,12(s1)
     38c:	010b9b93          	slli	s7,s7,0x10
     390:	01039393          	slli	t2,t2,0x10
     394:	01bcecb3          	or	s9,s9,s11
     398:	01029293          	slli	t0,t0,0x10
     39c:	01ac6c33          	or	s8,s8,s10
     3a0:	01059593          	slli	a1,a1,0x10
     3a4:	00ebebb3          	or	s7,s7,a4
     3a8:	00f3e3b3          	or	t2,t2,a5
     3ac:	01831313          	slli	t1,t1,0x18
     3b0:	01881813          	slli	a6,a6,0x18
     3b4:	0192e733          	or	a4,t0,s9
     3b8:	01889893          	slli	a7,a7,0x18
     3bc:	0185e7b3          	or	a5,a1,s8
     3c0:	01869693          	slli	a3,a3,0x18
     3c4:	01736333          	or	t1,t1,s7
     3c8:	00786833          	or	a6,a6,t2
     3cc:	00e8e8b3          	or	a7,a7,a4
     3d0:	00f6e6b3          	or	a3,a3,a5
     3d4:	01f34333          	xor	t1,t1,t6
     3d8:	01e84833          	xor	a6,a6,t5
     3dc:	01d8c8b3          	xor	a7,a7,t4
     3e0:	01c6c6b3          	xor	a3,a3,t3
     3e4:	3d3b7c63          	bgeu	s6,s3,7bc <_nettle_aes_encrypt.part.0+0x4f0>
     3e8:	01048593          	addi	a1,s1,16
     3ec:	0186dc13          	srli	s8,a3,0x18
     3f0:	01835d13          	srli	s10,t1,0x18
     3f4:	0188de93          	srli	t4,a7,0x18
     3f8:	0ff37c93          	zext.b	s9,t1
     3fc:	0ff87b93          	zext.b	s7,a6
     400:	01885713          	srli	a4,a6,0x18
     404:	0ff6f393          	zext.b	t2,a3
     408:	01085e13          	srli	t3,a6,0x10
     40c:	340c0c13          	addi	s8,s8,832
     410:	00885813          	srli	a6,a6,0x8
     414:	340d0d13          	addi	s10,s10,832
     418:	340e8e93          	addi	t4,t4,832
     41c:	0ff8f793          	zext.b	a5,a7
     420:	0088d293          	srli	t0,a7,0x8
     424:	0086df93          	srli	t6,a3,0x8
     428:	0ff87813          	zext.b	a6,a6
     42c:	0108d893          	srli	a7,a7,0x10
     430:	002c9c93          	slli	s9,s9,0x2
     434:	002c1c13          	slli	s8,s8,0x2
     438:	002d1d13          	slli	s10,s10,0x2
     43c:	002b9b93          	slli	s7,s7,0x2
     440:	0106d693          	srli	a3,a3,0x10
     444:	002e9e93          	slli	t4,t4,0x2
     448:	00239393          	slli	t2,t2,0x2
     44c:	00080d93          	mv	s11,a6
     450:	01760bb3          	add	s7,a2,s7
     454:	0ff8f813          	zext.b	a6,a7
     458:	34070713          	addi	a4,a4,832
     45c:	01960cb3          	add	s9,a2,s9
     460:	01860c33          	add	s8,a2,s8
     464:	01a60d33          	add	s10,a2,s10
     468:	0ff6f693          	zext.b	a3,a3
     46c:	0ffe7e13          	zext.b	t3,t3
     470:	01d60eb3          	add	t4,a2,t4
     474:	007603b3          	add	t2,a2,t2
     478:	100cac83          	lw	s9,256(s9)
     47c:	000d2d03          	lw	s10,0(s10)
     480:	000eae83          	lw	t4,0(t4)
     484:	00835f13          	srli	t5,t1,0x8
     488:	24080893          	addi	a7,a6,576
     48c:	000c2c03          	lw	s8,0(s8)
     490:	100ba803          	lw	a6,256(s7)
     494:	1003a383          	lw	t2,256(t2)
     498:	00271713          	slli	a4,a4,0x2
     49c:	00279793          	slli	a5,a5,0x2
     4a0:	01035313          	srli	t1,t1,0x10
     4a4:	24068693          	addi	a3,a3,576
     4a8:	240e0e13          	addi	t3,t3,576
     4ac:	0ff2f293          	zext.b	t0,t0
     4b0:	0fffff93          	zext.b	t6,t6
     4b4:	0fff7f13          	zext.b	t5,t5
     4b8:	00e60733          	add	a4,a2,a4
     4bc:	00f607b3          	add	a5,a2,a5
     4c0:	0ff37313          	zext.b	t1,t1
     4c4:	002d9d93          	slli	s11,s11,0x2
     4c8:	00289893          	slli	a7,a7,0x2
     4cc:	00269693          	slli	a3,a3,0x2
     4d0:	002e1e13          	slli	t3,t3,0x2
     4d4:	00072703          	lw	a4,0(a4)
     4d8:	01b60db3          	add	s11,a2,s11
     4dc:	011608b3          	add	a7,a2,a7
     4e0:	00d606b3          	add	a3,a2,a3
     4e4:	01c60e33          	add	t3,a2,t3
     4e8:	1007a783          	lw	a5,256(a5)
     4ec:	00229293          	slli	t0,t0,0x2
     4f0:	002f9f93          	slli	t6,t6,0x2
     4f4:	24030313          	addi	t1,t1,576
     4f8:	002f1f13          	slli	t5,t5,0x2
     4fc:	500dab83          	lw	s7,1280(s11)
     500:	018ccc33          	xor	s8,s9,s8
     504:	0008ad83          	lw	s11,0(a7)
     508:	0005ac83          	lw	s9,0(a1)
     50c:	0006a883          	lw	a7,0(a3)
     510:	01a84833          	xor	a6,a6,s10
     514:	000e2683          	lw	a3,0(t3)
     518:	0045ad03          	lw	s10,4(a1)
     51c:	0085ae03          	lw	t3,8(a1)
     520:	01d3c3b3          	xor	t2,t2,t4
     524:	005602b3          	add	t0,a2,t0
     528:	00c5ae83          	lw	t4,12(a1)
     52c:	01f60fb3          	add	t6,a2,t6
     530:	00231313          	slli	t1,t1,0x2
     534:	01e60f33          	add	t5,a2,t5
     538:	00660333          	add	t1,a2,t1
     53c:	5002a283          	lw	t0,1280(t0)
     540:	500faf83          	lw	t6,1280(t6)
     544:	500f2f03          	lw	t5,1280(t5)
     548:	00e7c7b3          	xor	a5,a5,a4
     54c:	00032703          	lw	a4,0(t1)
     550:	019c4cb3          	xor	s9,s8,s9
     554:	01a84833          	xor	a6,a6,s10
     558:	01c7c7b3          	xor	a5,a5,t3
     55c:	01d3c3b3          	xor	t2,t2,t4
     560:	017cccb3          	xor	s9,s9,s7
     564:	00584833          	xor	a6,a6,t0
     568:	01f7c7b3          	xor	a5,a5,t6
     56c:	01e3c3b3          	xor	t2,t2,t5
     570:	01058593          	addi	a1,a1,16
     574:	01184833          	xor	a6,a6,a7
     578:	01bcc333          	xor	t1,s9,s11
     57c:	00e7c8b3          	xor	a7,a5,a4
     580:	00d3c6b3          	xor	a3,t2,a3
     584:	e72594e3          	bne	a1,s2,3ec <_nettle_aes_encrypt.part.0+0x120>
     588:	00ca0b93          	addi	s7,s4,12
     58c:	008a0f13          	addi	t5,s4,8
     590:	004a0f93          	addi	t6,s4,4
     594:	000a0293          	mv	t0,s4
     598:	0186d593          	srli	a1,a3,0x18
     59c:	0ff37c13          	zext.b	s8,t1
     5a0:	00b605b3          	add	a1,a2,a1
     5a4:	0005c583          	lbu	a1,0(a1)
     5a8:	01860c33          	add	s8,a2,s8
     5ac:	000c4c83          	lbu	s9,0(s8)
     5b0:	00885793          	srli	a5,a6,0x8
     5b4:	01835713          	srli	a4,t1,0x18
     5b8:	01859593          	slli	a1,a1,0x18
     5bc:	0195e5b3          	or	a1,a1,s9
     5c0:	0ff7f793          	zext.b	a5,a5
     5c4:	0ff87c93          	zext.b	s9,a6
     5c8:	00e60733          	add	a4,a2,a4
     5cc:	00074703          	lbu	a4,0(a4)
     5d0:	00f607b3          	add	a5,a2,a5
     5d4:	01960cb3          	add	s9,a2,s9
     5d8:	0007cc03          	lbu	s8,0(a5)
     5dc:	000ccc83          	lbu	s9,0(s9)
     5e0:	01871713          	slli	a4,a4,0x18
     5e4:	0088dd13          	srli	s10,a7,0x8
     5e8:	01976733          	or	a4,a4,s9
     5ec:	01885e93          	srli	t4,a6,0x18
     5f0:	0106dc93          	srli	s9,a3,0x10
     5f4:	008c1c13          	slli	s8,s8,0x8
     5f8:	0185ec33          	or	s8,a1,s8
     5fc:	0ffd7d13          	zext.b	s10,s10
     600:	0ff8f593          	zext.b	a1,a7
     604:	01d60eb3          	add	t4,a2,t4
     608:	0ffcfc93          	zext.b	s9,s9
     60c:	000ece83          	lbu	t4,0(t4)
     610:	01a60d33          	add	s10,a2,s10
     614:	01960cb3          	add	s9,a2,s9
     618:	00b605b3          	add	a1,a2,a1
     61c:	000d4783          	lbu	a5,0(s10)
     620:	000ccd03          	lbu	s10,0(s9)
     624:	0005cc83          	lbu	s9,0(a1)
     628:	0108de13          	srli	t3,a7,0x10
     62c:	0188d893          	srli	a7,a7,0x18
     630:	0086d393          	srli	t2,a3,0x8
     634:	018e9e93          	slli	t4,t4,0x18
     638:	011608b3          	add	a7,a2,a7
     63c:	0008c583          	lbu	a1,0(a7)
     640:	0ff3f393          	zext.b	t2,t2
     644:	019ee8b3          	or	a7,t4,s9
     648:	01035e93          	srli	t4,t1,0x10
     64c:	00835313          	srli	t1,t1,0x8
     650:	0ffe7e13          	zext.b	t3,t3
     654:	007603b3          	add	t2,a2,t2
     658:	01085813          	srli	a6,a6,0x10
     65c:	0ff6f693          	zext.b	a3,a3
     660:	0ffefe93          	zext.b	t4,t4
     664:	0ff37313          	zext.b	t1,t1
     668:	0003c383          	lbu	t2,0(t2)
     66c:	01c60e33          	add	t3,a2,t3
     670:	0ff87813          	zext.b	a6,a6
     674:	00d606b3          	add	a3,a2,a3
     678:	01d60eb3          	add	t4,a2,t4
     67c:	00660333          	add	t1,a2,t1
     680:	0006c683          	lbu	a3,0(a3)
     684:	000e4e03          	lbu	t3,0(t3)
     688:	000ece83          	lbu	t4,0(t4)
     68c:	00034303          	lbu	t1,0(t1)
     690:	01060833          	add	a6,a2,a6
     694:	00084803          	lbu	a6,0(a6)
     698:	005482b3          	add	t0,s1,t0
     69c:	01f48fb3          	add	t6,s1,t6
     6a0:	01e48f33          	add	t5,s1,t5
     6a4:	0002a283          	lw	t0,0(t0)
     6a8:	000faf83          	lw	t6,0(t6)
     6ac:	000f2f03          	lw	t5,0(t5)
     6b0:	01859593          	slli	a1,a1,0x18
     6b4:	01748bb3          	add	s7,s1,s7
     6b8:	00879793          	slli	a5,a5,0x8
     6bc:	00839393          	slli	t2,t2,0x8
     6c0:	000bab83          	lw	s7,0(s7)
     6c4:	010e1e13          	slli	t3,t3,0x10
     6c8:	00f767b3          	or	a5,a4,a5
     6cc:	010e9e93          	slli	t4,t4,0x10
     6d0:	00d5e733          	or	a4,a1,a3
     6d4:	00831313          	slli	t1,t1,0x8
     6d8:	010d1d13          	slli	s10,s10,0x10
     6dc:	0078e8b3          	or	a7,a7,t2
     6e0:	01cc6c33          	or	s8,s8,t3
     6e4:	01081813          	slli	a6,a6,0x10
     6e8:	01d8e8b3          	or	a7,a7,t4
     6ec:	00676733          	or	a4,a4,t1
     6f0:	01a7e7b3          	or	a5,a5,s10
     6f4:	01f7c7b3          	xor	a5,a5,t6
     6f8:	01e8c8b3          	xor	a7,a7,t5
     6fc:	005c4c33          	xor	s8,s8,t0
     700:	01076733          	or	a4,a4,a6
     704:	01774733          	xor	a4,a4,s7
     708:	0187de93          	srli	t4,a5,0x18
     70c:	0107de13          	srli	t3,a5,0x10
     710:	0087d313          	srli	t1,a5,0x8
     714:	0108d593          	srli	a1,a7,0x10
     718:	0088d693          	srli	a3,a7,0x8
     71c:	018c5293          	srli	t0,s8,0x18
     720:	010c5f93          	srli	t6,s8,0x10
     724:	008c5f13          	srli	t5,s8,0x8
     728:	0188d813          	srli	a6,a7,0x18
     72c:	00f50223          	sb	a5,4(a0)
     730:	00b50523          	sb	a1,10(a0)
     734:	00d504a3          	sb	a3,9(a0)
     738:	01850023          	sb	s8,0(a0)
     73c:	01150423          	sb	a7,8(a0)
     740:	005501a3          	sb	t0,3(a0)
     744:	01f50123          	sb	t6,2(a0)
     748:	01e500a3          	sb	t5,1(a0)
     74c:	01d503a3          	sb	t4,7(a0)
     750:	01c50323          	sb	t3,6(a0)
     754:	006502a3          	sb	t1,5(a0)
     758:	010505a3          	sb	a6,11(a0)
     75c:	01875593          	srli	a1,a4,0x18
     760:	01075693          	srli	a3,a4,0x10
     764:	00875793          	srli	a5,a4,0x8
     768:	00b507a3          	sb	a1,15(a0)
     76c:	00e50623          	sb	a4,12(a0)
     770:	00d50723          	sb	a3,14(a0)
     774:	00f506a3          	sb	a5,13(a0)
     778:	01050513          	addi	a0,a0,16
     77c:	01040413          	addi	s0,s0,16
     780:	bb5512e3          	bne	a0,s5,324 <_nettle_aes_encrypt.part.0+0x58>
     784:	02c12403          	lw	s0,44(sp)
     788:	02812483          	lw	s1,40(sp)
     78c:	02412903          	lw	s2,36(sp)
     790:	02012983          	lw	s3,32(sp)
     794:	01c12a03          	lw	s4,28(sp)
     798:	01812a83          	lw	s5,24(sp)
     79c:	01412b03          	lw	s6,20(sp)
     7a0:	01012b83          	lw	s7,16(sp)
     7a4:	00c12c03          	lw	s8,12(sp)
     7a8:	00812c83          	lw	s9,8(sp)
     7ac:	00412d03          	lw	s10,4(sp)
     7b0:	00012d83          	lw	s11,0(sp)
     7b4:	03010113          	addi	sp,sp,48
     7b8:	00008067          	ret
     7bc:	01c00b93          	li	s7,28
     7c0:	01800f13          	li	t5,24
     7c4:	01400f93          	li	t6,20
     7c8:	01000293          	li	t0,16
     7cc:	dcdff06f          	j	598 <_nettle_aes_encrypt.part.0+0x2cc>
     7d0:	00008067          	ret

000007d4 <_nettle_aes_decrypt.part.0>:
     7d4:	50068063          	beqz	a3,cd4 <_nettle_aes_decrypt.part.0+0x500>
     7d8:	fd010113          	addi	sp,sp,-48
     7dc:	01512c23          	sw	s5,24(sp)
     7e0:	00451a93          	slli	s5,a0,0x4
     7e4:	02812623          	sw	s0,44(sp)
     7e8:	02912423          	sw	s1,40(sp)
     7ec:	03212223          	sw	s2,36(sp)
     7f0:	03312023          	sw	s3,32(sp)
     7f4:	01412e23          	sw	s4,28(sp)
     7f8:	01612a23          	sw	s6,20(sp)
     7fc:	01712823          	sw	s7,16(sp)
     800:	01812623          	sw	s8,12(sp)
     804:	01912423          	sw	s9,8(sp)
     808:	01a12223          	sw	s10,4(sp)
     80c:	01b12023          	sw	s11,0(sp)
     810:	00078493          	mv	s1,a5
     814:	00050a13          	mv	s4,a0
     818:	00058913          	mv	s2,a1
     81c:	00070413          	mv	s0,a4
     820:	00d70b33          	add	s6,a4,a3
     824:	015589b3          	add	s3,a1,s5
     828:	00100b93          	li	s7,1
     82c:	0014c703          	lbu	a4,1(s1)
     830:	0054c783          	lbu	a5,5(s1)
     834:	0094cc83          	lbu	s9,9(s1)
     838:	00d4cc03          	lbu	s8,13(s1)
     83c:	0004cf03          	lbu	t5,0(s1)
     840:	0044ce83          	lbu	t4,4(s1)
     844:	0024c383          	lbu	t2,2(s1)
     848:	0064c283          	lbu	t0,6(s1)
     84c:	0084cd83          	lbu	s11,8(s1)
     850:	00a4cf83          	lbu	t6,10(s1)
     854:	00c4cd03          	lbu	s10,12(s1)
     858:	00e4c583          	lbu	a1,14(s1)
     85c:	0034c303          	lbu	t1,3(s1)
     860:	0074c683          	lbu	a3,7(s1)
     864:	00b4c803          	lbu	a6,11(s1)
     868:	00f4c883          	lbu	a7,15(s1)
     86c:	00871e13          	slli	t3,a4,0x8
     870:	00879513          	slli	a0,a5,0x8
     874:	008c9c93          	slli	s9,s9,0x8
     878:	008c1c13          	slli	s8,s8,0x8
     87c:	01ee6733          	or	a4,t3,t5
     880:	01d567b3          	or	a5,a0,t4
     884:	00092f03          	lw	t5,0(s2)
     888:	00492e83          	lw	t4,4(s2)
     88c:	00892e03          	lw	t3,8(s2)
     890:	00c92503          	lw	a0,12(s2)
     894:	01039393          	slli	t2,t2,0x10
     898:	01029293          	slli	t0,t0,0x10
     89c:	01bcecb3          	or	s9,s9,s11
     8a0:	010f9f93          	slli	t6,t6,0x10
     8a4:	01ac6c33          	or	s8,s8,s10
     8a8:	01059593          	slli	a1,a1,0x10
     8ac:	00e3e3b3          	or	t2,t2,a4
     8b0:	00f2e2b3          	or	t0,t0,a5
     8b4:	01831313          	slli	t1,t1,0x18
     8b8:	01869693          	slli	a3,a3,0x18
     8bc:	019fe733          	or	a4,t6,s9
     8c0:	01881813          	slli	a6,a6,0x18
     8c4:	0185e7b3          	or	a5,a1,s8
     8c8:	01889893          	slli	a7,a7,0x18
     8cc:	00736333          	or	t1,t1,t2
     8d0:	0056e6b3          	or	a3,a3,t0
     8d4:	00e86833          	or	a6,a6,a4
     8d8:	00f8e8b3          	or	a7,a7,a5
     8dc:	01e34333          	xor	t1,t1,t5
     8e0:	01d6c6b3          	xor	a3,a3,t4
     8e4:	01c84833          	xor	a6,a6,t3
     8e8:	00a8c8b3          	xor	a7,a7,a0
     8ec:	3d4bfa63          	bgeu	s7,s4,cc0 <_nettle_aes_decrypt.part.0+0x4ec>
     8f0:	01090513          	addi	a0,s2,16
     8f4:	01885293          	srli	t0,a6,0x18
     8f8:	0ff37c93          	zext.b	s9,t1
     8fc:	0ff6f793          	zext.b	a5,a3
     900:	34028293          	addi	t0,t0,832
     904:	0186dc13          	srli	s8,a3,0x18
     908:	01835593          	srli	a1,t1,0x18
     90c:	0ff87393          	zext.b	t2,a6
     910:	00885e13          	srli	t3,a6,0x8
     914:	0086df13          	srli	t5,a3,0x8
     918:	00835e93          	srli	t4,t1,0x8
     91c:	0106d693          	srli	a3,a3,0x10
     920:	01035313          	srli	t1,t1,0x10
     924:	002c9c93          	slli	s9,s9,0x2
     928:	01085813          	srli	a6,a6,0x10
     92c:	00279793          	slli	a5,a5,0x2
     930:	00229293          	slli	t0,t0,0x2
     934:	0ff8f713          	zext.b	a4,a7
     938:	0188dd13          	srli	s10,a7,0x18
     93c:	01960cb3          	add	s9,a2,s9
     940:	0ff87813          	zext.b	a6,a6
     944:	0ff6fd93          	zext.b	s11,a3
     948:	005602b3          	add	t0,a2,t0
     94c:	0ff37693          	zext.b	a3,t1
     950:	34058593          	addi	a1,a1,832
     954:	00f607b3          	add	a5,a2,a5
     958:	100ca303          	lw	t1,256(s9)
     95c:	1007a783          	lw	a5,256(a5)
     960:	24080c93          	addi	s9,a6,576
     964:	340d0d13          	addi	s10,s10,832
     968:	0002a803          	lw	a6,0(t0)
     96c:	00259593          	slli	a1,a1,0x2
     970:	00271713          	slli	a4,a4,0x2
     974:	24068693          	addi	a3,a3,576
     978:	002d1d13          	slli	s10,s10,0x2
     97c:	00239393          	slli	t2,t2,0x2
     980:	00b605b3          	add	a1,a2,a1
     984:	00e60733          	add	a4,a2,a4
     988:	00269693          	slli	a3,a3,0x2
     98c:	0005a583          	lw	a1,0(a1)
     990:	00d606b3          	add	a3,a2,a3
     994:	10072703          	lw	a4,256(a4)
     998:	340c0c13          	addi	s8,s8,832
     99c:	01a60d33          	add	s10,a2,s10
     9a0:	007603b3          	add	t2,a2,t2
     9a4:	0107c833          	xor	a6,a5,a6
     9a8:	000d2d03          	lw	s10,0(s10)
     9ac:	0006a783          	lw	a5,0(a3)
     9b0:	0088df93          	srli	t6,a7,0x8
     9b4:	00c52683          	lw	a3,12(a0)
     9b8:	1003a383          	lw	t2,256(t2)
     9bc:	002c1c13          	slli	s8,s8,0x2
     9c0:	0108d893          	srli	a7,a7,0x10
     9c4:	0fffff93          	zext.b	t6,t6
     9c8:	0ffe7e13          	zext.b	t3,t3
     9cc:	0fff7f13          	zext.b	t5,t5
     9d0:	0ffefe93          	zext.b	t4,t4
     9d4:	01860c33          	add	s8,a2,s8
     9d8:	0ff8f893          	zext.b	a7,a7
     9dc:	00b74733          	xor	a4,a4,a1
     9e0:	000c2c03          	lw	s8,0(s8)
     9e4:	002f9f93          	slli	t6,t6,0x2
     9e8:	002e1e13          	slli	t3,t3,0x2
     9ec:	24088893          	addi	a7,a7,576
     9f0:	240d8d93          	addi	s11,s11,576
     9f4:	002f1f13          	slli	t5,t5,0x2
     9f8:	002e9e93          	slli	t4,t4,0x2
     9fc:	00052283          	lw	t0,0(a0)
     a00:	01a3c3b3          	xor	t2,t2,s10
     a04:	00d74733          	xor	a4,a4,a3
     a08:	00852d03          	lw	s10,8(a0)
     a0c:	00452683          	lw	a3,4(a0)
     a10:	01f60fb3          	add	t6,a2,t6
     a14:	002c9c93          	slli	s9,s9,0x2
     a18:	01c60e33          	add	t3,a2,t3
     a1c:	00289893          	slli	a7,a7,0x2
     a20:	002d9d93          	slli	s11,s11,0x2
     a24:	01e60f33          	add	t5,a2,t5
     a28:	01d60eb3          	add	t4,a2,t4
     a2c:	011608b3          	add	a7,a2,a7
     a30:	500faf83          	lw	t6,1280(t6)
     a34:	500e2e03          	lw	t3,1280(t3)
     a38:	500f2f03          	lw	t5,1280(t5)
     a3c:	500eae83          	lw	t4,1280(t4)
     a40:	01960cb3          	add	s9,a2,s9
     a44:	01b60db3          	add	s11,a2,s11
     a48:	0008a583          	lw	a1,0(a7)
     a4c:	01834c33          	xor	s8,t1,s8
     a50:	000cac83          	lw	s9,0(s9)
     a54:	000dad83          	lw	s11,0(s11)
     a58:	00d846b3          	xor	a3,a6,a3
     a5c:	005c42b3          	xor	t0,s8,t0
     a60:	01a3c3b3          	xor	t2,t2,s10
     a64:	01f2c333          	xor	t1,t0,t6
     a68:	01c748b3          	xor	a7,a4,t3
     a6c:	01e3c833          	xor	a6,t2,t5
     a70:	01d6c6b3          	xor	a3,a3,t4
     a74:	01050513          	addi	a0,a0,16
     a78:	01934333          	xor	t1,t1,s9
     a7c:	01b8c8b3          	xor	a7,a7,s11
     a80:	00f84833          	xor	a6,a6,a5
     a84:	00b6c6b3          	xor	a3,a3,a1
     a88:	e73516e3          	bne	a0,s3,8f4 <_nettle_aes_decrypt.part.0+0x120>
     a8c:	00ca8c13          	addi	s8,s5,12
     a90:	008a8393          	addi	t2,s5,8
     a94:	004a8f13          	addi	t5,s5,4
     a98:	000a8f93          	mv	t6,s5
     a9c:	0186d593          	srli	a1,a3,0x18
     aa0:	0088d793          	srli	a5,a7,0x8
     aa4:	0ff37713          	zext.b	a4,t1
     aa8:	00b605b3          	add	a1,a2,a1
     aac:	0ff7f793          	zext.b	a5,a5
     ab0:	0005c583          	lbu	a1,0(a1)
     ab4:	00e60733          	add	a4,a2,a4
     ab8:	00f607b3          	add	a5,a2,a5
     abc:	00074d03          	lbu	s10,0(a4)
     ac0:	00835293          	srli	t0,t1,0x8
     ac4:	0007c703          	lbu	a4,0(a5)
     ac8:	0086de13          	srli	t3,a3,0x8
     acc:	01085513          	srli	a0,a6,0x10
     ad0:	0ff2f293          	zext.b	t0,t0
     ad4:	0ffe7e13          	zext.b	t3,t3
     ad8:	0ff57513          	zext.b	a0,a0
     adc:	005602b3          	add	t0,a2,t0
     ae0:	01c60e33          	add	t3,a2,t3
     ae4:	00a60533          	add	a0,a2,a0
     ae8:	01859593          	slli	a1,a1,0x18
     aec:	0002c783          	lbu	a5,0(t0)
     af0:	01a5e5b3          	or	a1,a1,s10
     af4:	000e4283          	lbu	t0,0(t3)
     af8:	01885c93          	srli	s9,a6,0x18
     afc:	00054e03          	lbu	t3,0(a0)
     b00:	0188de93          	srli	t4,a7,0x18
     b04:	00790533          	add	a0,s2,t2
     b08:	01f90fb3          	add	t6,s2,t6
     b0c:	01e90f33          	add	t5,s2,t5
     b10:	00871713          	slli	a4,a4,0x8
     b14:	000fa383          	lw	t2,0(t6)
     b18:	00e5e733          	or	a4,a1,a4
     b1c:	000f2f83          	lw	t6,0(t5)
     b20:	0ff87593          	zext.b	a1,a6
     b24:	00052f03          	lw	t5,0(a0)
     b28:	01960cb3          	add	s9,a2,s9
     b2c:	0ff6f513          	zext.b	a0,a3
     b30:	01d60eb3          	add	t4,a2,t4
     b34:	000ccc83          	lbu	s9,0(s9)
     b38:	000ece83          	lbu	t4,0(t4)
     b3c:	00a60533          	add	a0,a2,a0
     b40:	00b605b3          	add	a1,a2,a1
     b44:	00054d03          	lbu	s10,0(a0)
     b48:	0005c583          	lbu	a1,0(a1)
     b4c:	00885813          	srli	a6,a6,0x8
     b50:	0ff87813          	zext.b	a6,a6
     b54:	018c9c93          	slli	s9,s9,0x18
     b58:	018e9e93          	slli	t4,t4,0x18
     b5c:	0106d693          	srli	a3,a3,0x10
     b60:	01060833          	add	a6,a2,a6
     b64:	0ff6f513          	zext.b	a0,a3
     b68:	01ace6b3          	or	a3,s9,s10
     b6c:	00084d03          	lbu	s10,0(a6)
     b70:	0108dc93          	srli	s9,a7,0x10
     b74:	00bee833          	or	a6,t4,a1
     b78:	01035e93          	srli	t4,t1,0x10
     b7c:	01835313          	srli	t1,t1,0x18
     b80:	00660333          	add	t1,a2,t1
     b84:	0ffcfc93          	zext.b	s9,s9
     b88:	0ff8f893          	zext.b	a7,a7
     b8c:	0ffefe93          	zext.b	t4,t4
     b90:	00034583          	lbu	a1,0(t1)
     b94:	01d60eb3          	add	t4,a2,t4
     b98:	01960cb3          	add	s9,a2,s9
     b9c:	011608b3          	add	a7,a2,a7
     ba0:	0008c883          	lbu	a7,0(a7)
     ba4:	000ec303          	lbu	t1,0(t4)
     ba8:	000ccc83          	lbu	s9,0(s9)
     bac:	00a60533          	add	a0,a2,a0
     bb0:	00054503          	lbu	a0,0(a0)
     bb4:	00829293          	slli	t0,t0,0x8
     bb8:	01859593          	slli	a1,a1,0x18
     bbc:	01890c33          	add	s8,s2,s8
     bc0:	00879793          	slli	a5,a5,0x8
     bc4:	000c2c03          	lw	s8,0(s8)
     bc8:	00586833          	or	a6,a6,t0
     bcc:	010e1e13          	slli	t3,t3,0x10
     bd0:	00f6e7b3          	or	a5,a3,a5
     bd4:	01031313          	slli	t1,t1,0x10
     bd8:	0115e6b3          	or	a3,a1,a7
     bdc:	010c9c93          	slli	s9,s9,0x10
     be0:	008d1d13          	slli	s10,s10,0x8
     be4:	006865b3          	or	a1,a6,t1
     be8:	01c76733          	or	a4,a4,t3
     bec:	01051513          	slli	a0,a0,0x10
     bf0:	0197e7b3          	or	a5,a5,s9
     bf4:	01a6e6b3          	or	a3,a3,s10
     bf8:	01f7c7b3          	xor	a5,a5,t6
     bfc:	01e5c5b3          	xor	a1,a1,t5
     c00:	00774733          	xor	a4,a4,t2
     c04:	00a6e6b3          	or	a3,a3,a0
     c08:	0186c6b3          	xor	a3,a3,s8
     c0c:	01875293          	srli	t0,a4,0x18
     c10:	01075f93          	srli	t6,a4,0x10
     c14:	00875f13          	srli	t5,a4,0x8
     c18:	0187de93          	srli	t4,a5,0x18
     c1c:	0107de13          	srli	t3,a5,0x10
     c20:	0087d313          	srli	t1,a5,0x8
     c24:	0185d893          	srli	a7,a1,0x18
     c28:	0105d813          	srli	a6,a1,0x10
     c2c:	0085d513          	srli	a0,a1,0x8
     c30:	00e40023          	sb	a4,0(s0)
     c34:	00f40223          	sb	a5,4(s0)
     c38:	00b40423          	sb	a1,8(s0)
     c3c:	005401a3          	sb	t0,3(s0)
     c40:	01f40123          	sb	t6,2(s0)
     c44:	01e400a3          	sb	t5,1(s0)
     c48:	01d403a3          	sb	t4,7(s0)
     c4c:	01c40323          	sb	t3,6(s0)
     c50:	006402a3          	sb	t1,5(s0)
     c54:	011405a3          	sb	a7,11(s0)
     c58:	01040523          	sb	a6,10(s0)
     c5c:	00a404a3          	sb	a0,9(s0)
     c60:	0186d593          	srli	a1,a3,0x18
     c64:	0106d713          	srli	a4,a3,0x10
     c68:	0086d793          	srli	a5,a3,0x8
     c6c:	00b407a3          	sb	a1,15(s0)
     c70:	00d40623          	sb	a3,12(s0)
     c74:	00e40723          	sb	a4,14(s0)
     c78:	00f406a3          	sb	a5,13(s0)
     c7c:	01040413          	addi	s0,s0,16
     c80:	01048493          	addi	s1,s1,16
     c84:	bb6414e3          	bne	s0,s6,82c <_nettle_aes_decrypt.part.0+0x58>
     c88:	02c12403          	lw	s0,44(sp)
     c8c:	02812483          	lw	s1,40(sp)
     c90:	02412903          	lw	s2,36(sp)
     c94:	02012983          	lw	s3,32(sp)
     c98:	01c12a03          	lw	s4,28(sp)
     c9c:	01812a83          	lw	s5,24(sp)
     ca0:	01412b03          	lw	s6,20(sp)
     ca4:	01012b83          	lw	s7,16(sp)
     ca8:	00c12c03          	lw	s8,12(sp)
     cac:	00812c83          	lw	s9,8(sp)
     cb0:	00412d03          	lw	s10,4(sp)
     cb4:	00012d83          	lw	s11,0(sp)
     cb8:	03010113          	addi	sp,sp,48
     cbc:	00008067          	ret
     cc0:	01c00c13          	li	s8,28
     cc4:	01800393          	li	t2,24
     cc8:	01400f13          	li	t5,20
     ccc:	01000f93          	li	t6,16
     cd0:	dcdff06f          	j	a9c <_nettle_aes_decrypt.part.0+0x2c8>
     cd4:	00008067          	ret

00000cd8 <_nettle_aes_invert>:
     cd8:	00251e93          	slli	t4,a0,0x2
     cdc:	0eb60263          	beq	a2,a1,dc0 <_nettle_aes_invert+0xe8>
     ce0:	00451793          	slli	a5,a0,0x4
     ce4:	00f60633          	add	a2,a2,a5
     ce8:	00058893          	mv	a7,a1
     cec:	00000e13          	li	t3,0
     cf0:	01000313          	li	t1,16
     cf4:	00000793          	li	a5,0
     cf8:	00f60733          	add	a4,a2,a5
     cfc:	00072683          	lw	a3,0(a4)
     d00:	00f88733          	add	a4,a7,a5
     d04:	00478793          	addi	a5,a5,4
     d08:	00d72023          	sw	a3,0(a4)
     d0c:	fe6796e3          	bne	a5,t1,cf8 <_nettle_aes_invert+0x20>
     d10:	004e0e13          	addi	t3,t3,4
     d14:	ff060613          	addi	a2,a2,-16
     d18:	01088893          	addi	a7,a7,16
     d1c:	fdcefce3          	bgeu	t4,t3,cf4 <_nettle_aes_invert+0x1c>
     d20:	00400793          	li	a5,4
     d24:	0fd7fa63          	bgeu	a5,t4,e18 <_nettle_aes_invert+0x140>
     d28:	00451813          	slli	a6,a0,0x4
     d2c:	00001537          	lui	a0,0x1
     d30:	01058833          	add	a6,a1,a6
     d34:	00c50513          	addi	a0,a0,12 # 100c <mtable>
     d38:	01058593          	addi	a1,a1,16
     d3c:	0005a783          	lw	a5,0(a1)
     d40:	00458593          	addi	a1,a1,4
     d44:	0187d613          	srli	a2,a5,0x18
     d48:	0067d693          	srli	a3,a5,0x6
     d4c:	00261613          	slli	a2,a2,0x2
     d50:	00c50633          	add	a2,a0,a2
     d54:	0ff7f713          	zext.b	a4,a5
     d58:	3fc6f693          	andi	a3,a3,1020
     d5c:	00e7d793          	srli	a5,a5,0xe
     d60:	00062883          	lw	a7,0(a2)
     d64:	00d506b3          	add	a3,a0,a3
     d68:	00271713          	slli	a4,a4,0x2
     d6c:	3fc7f793          	andi	a5,a5,1020
     d70:	0006a603          	lw	a2,0(a3)
     d74:	00e50733          	add	a4,a0,a4
     d78:	00f507b3          	add	a5,a0,a5
     d7c:	0007a683          	lw	a3,0(a5)
     d80:	00072303          	lw	t1,0(a4)
     d84:	0088d793          	srli	a5,a7,0x8
     d88:	01889893          	slli	a7,a7,0x18
     d8c:	01865713          	srli	a4,a2,0x18
     d90:	011787b3          	add	a5,a5,a7
     d94:	00861613          	slli	a2,a2,0x8
     d98:	00c70633          	add	a2,a4,a2
     d9c:	0067c7b3          	xor	a5,a5,t1
     da0:	0106d713          	srli	a4,a3,0x10
     da4:	01069693          	slli	a3,a3,0x10
     da8:	00c7c7b3          	xor	a5,a5,a2
     dac:	00d70733          	add	a4,a4,a3
     db0:	00f747b3          	xor	a5,a4,a5
     db4:	fef5ae23          	sw	a5,-4(a1)
     db8:	f8b812e3          	bne	a6,a1,d3c <_nettle_aes_invert+0x64>
     dbc:	00008067          	ret
     dc0:	040e8e63          	beqz	t4,e1c <_nettle_aes_invert+0x144>
     dc4:	00351813          	slli	a6,a0,0x3
     dc8:	01058833          	add	a6,a1,a6
     dcc:	00181813          	slli	a6,a6,0x1
     dd0:	01080813          	addi	a6,a6,16
     dd4:	01058693          	addi	a3,a1,16
     dd8:	000e8e13          	mv	t3,t4
     ddc:	00000313          	li	t1,0
     de0:	ff068793          	addi	a5,a3,-16
     de4:	40d80733          	sub	a4,a6,a3
     de8:	00072883          	lw	a7,0(a4)
     dec:	0007a603          	lw	a2,0(a5)
     df0:	00478793          	addi	a5,a5,4
     df4:	ff17ae23          	sw	a7,-4(a5)
     df8:	00c72023          	sw	a2,0(a4)
     dfc:	00470713          	addi	a4,a4,4
     e00:	fef694e3          	bne	a3,a5,de8 <_nettle_aes_invert+0x110>
     e04:	00430313          	addi	t1,t1,4
     e08:	ffce0e13          	addi	t3,t3,-4
     e0c:	01068693          	addi	a3,a3,16
     e10:	fdc368e3          	bltu	t1,t3,de0 <_nettle_aes_invert+0x108>
     e14:	f0dff06f          	j	d20 <_nettle_aes_invert+0x48>
     e18:	00008067          	ret
     e1c:	00008067          	ret

00000e20 <benchmark_body.isra.0>:
     e20:	16058263          	beqz	a1,f84 <benchmark_body.isra.0+0x164>
     e24:	fb010113          	addi	sp,sp,-80
     e28:	04812423          	sw	s0,72(sp)
     e2c:	05212023          	sw	s2,64(sp)
     e30:	03312e23          	sw	s3,60(sp)
     e34:	03412c23          	sw	s4,56(sp)
     e38:	000049b7          	lui	s3,0x4
     e3c:	00004a37          	lui	s4,0x4
     e40:	00004937          	lui	s2,0x4
     e44:	00004437          	lui	s0,0x4
     e48:	04912223          	sw	s1,68(sp)
     e4c:	03512a23          	sw	s5,52(sp)
     e50:	03712623          	sw	s7,44(sp)
     e54:	03812423          	sw	s8,40(sp)
     e58:	03912223          	sw	s9,36(sp)
     e5c:	03a12023          	sw	s10,32(sp)
     e60:	01b12e23          	sw	s11,28(sp)
     e64:	04112623          	sw	ra,76(sp)
     e68:	03612823          	sw	s6,48(sp)
     e6c:	00a12623          	sw	a0,12(sp)
     e70:	00b12223          	sw	a1,4(sp)
     e74:	80ca0a13          	addi	s4,s4,-2036 # 380c <key>
     e78:	92498993          	addi	s3,s3,-1756 # 3924 <encctx+0x4>
     e7c:	b1490913          	addi	s2,s2,-1260 # 3b14 <encrypted>
     e80:	83040413          	addi	s0,s0,-2000 # 3830 <decctx+0x4>
     e84:	00012423          	sw	zero,8(sp)
     e88:	00004db7          	lui	s11,0x4
     e8c:	00003d37          	lui	s10,0x3
     e90:	00002cb7          	lui	s9,0x2
     e94:	00004ab7          	lui	s5,0x4
     e98:	00004c37          	lui	s8,0x4
     e9c:	00001bb7          	lui	s7,0x1
     ea0:	00e00493          	li	s1,14
     ea4:	00000b13          	li	s6,0
     ea8:	000a0693          	mv	a3,s4
     eac:	00098613          	mv	a2,s3
     eb0:	00800593          	li	a1,8
     eb4:	00e00513          	li	a0,14
     eb8:	929da023          	sw	s1,-1760(s11) # 3920 <encctx>
     ebc:	a14ff0ef          	jal	d0 <_aes_set_key.part.0>
     ec0:	70cd0793          	addi	a5,s10,1804 # 370c <plaintext>
     ec4:	00090713          	mv	a4,s2
     ec8:	50cc8613          	addi	a2,s9,1292 # 250c <_aes_encrypt_table>
     ecc:	00098593          	mv	a1,s3
     ed0:	10000693          	li	a3,256
     ed4:	00e00513          	li	a0,14
     ed8:	bf4ff0ef          	jal	2cc <_nettle_aes_encrypt.part.0>
     edc:	000a0693          	mv	a3,s4
     ee0:	00040613          	mv	a2,s0
     ee4:	00800593          	li	a1,8
     ee8:	00e00513          	li	a0,14
     eec:	829aa623          	sw	s1,-2004(s5) # 382c <decctx>
     ef0:	9e0ff0ef          	jal	d0 <_aes_set_key.part.0>
     ef4:	00040613          	mv	a2,s0
     ef8:	00040593          	mv	a1,s0
     efc:	00e00513          	li	a0,14
     f00:	dd9ff0ef          	jal	cd8 <_nettle_aes_invert>
     f04:	00090793          	mv	a5,s2
     f08:	a14c0713          	addi	a4,s8,-1516 # 3a14 <decrypted>
     f0c:	40cb8613          	addi	a2,s7,1036 # 140c <_aes_decrypt_table>
     f10:	00040593          	mv	a1,s0
     f14:	10000693          	li	a3,256
     f18:	00e00513          	li	a0,14
     f1c:	829aa623          	sw	s1,-2004(s5)
     f20:	8b5ff0ef          	jal	7d4 <_nettle_aes_decrypt.part.0>
     f24:	00412783          	lw	a5,4(sp)
     f28:	001b0b13          	addi	s6,s6,1
     f2c:	f6fb1ee3          	bne	s6,a5,ea8 <benchmark_body.isra.0+0x88>
     f30:	00812783          	lw	a5,8(sp)
     f34:	00178793          	addi	a5,a5,1
     f38:	00f12423          	sw	a5,8(sp)
     f3c:	00812703          	lw	a4,8(sp)
     f40:	00c12783          	lw	a5,12(sp)
     f44:	f6e790e3          	bne	a5,a4,ea4 <benchmark_body.isra.0+0x84>
     f48:	04c12083          	lw	ra,76(sp)
     f4c:	04812403          	lw	s0,72(sp)
     f50:	04412483          	lw	s1,68(sp)
     f54:	04012903          	lw	s2,64(sp)
     f58:	03c12983          	lw	s3,60(sp)
     f5c:	03812a03          	lw	s4,56(sp)
     f60:	03412a83          	lw	s5,52(sp)
     f64:	03012b03          	lw	s6,48(sp)
     f68:	02c12b83          	lw	s7,44(sp)
     f6c:	02812c03          	lw	s8,40(sp)
     f70:	02412c83          	lw	s9,36(sp)
     f74:	02012d03          	lw	s10,32(sp)
     f78:	01c12d83          	lw	s11,28(sp)
     f7c:	05010113          	addi	sp,sp,80
     f80:	00008067          	ret
     f84:	00008067          	ret

00000f88 <verify_benchmark>:
     f88:	000046b7          	lui	a3,0x4
     f8c:	b1468693          	addi	a3,a3,-1260 # 3b14 <encrypted>
     f90:	00003837          	lui	a6,0x3
     f94:	000035b7          	lui	a1,0x3
     f98:	00004637          	lui	a2,0x4
     f9c:	10068e13          	addi	t3,a3,256
     fa0:	60c80813          	addi	a6,a6,1548 # 360c <expected>
     fa4:	70c58593          	addi	a1,a1,1804 # 370c <plaintext>
     fa8:	a1460613          	addi	a2,a2,-1516 # 3a14 <decrypted>
     fac:	00100513          	li	a0,1
     fb0:	0005c783          	lbu	a5,0(a1)
     fb4:	00064303          	lbu	t1,0(a2)
     fb8:	0006c703          	lbu	a4,0(a3)
     fbc:	00084883          	lbu	a7,0(a6)
     fc0:	406787b3          	sub	a5,a5,t1
     fc4:	0017b793          	seqz	a5,a5
     fc8:	41170733          	sub	a4,a4,a7
     fcc:	00173713          	seqz	a4,a4
     fd0:	00e7f7b3          	and	a5,a5,a4
     fd4:	00168693          	addi	a3,a3,1
     fd8:	00158593          	addi	a1,a1,1
     fdc:	00160613          	addi	a2,a2,1
     fe0:	00f57533          	and	a0,a0,a5
     fe4:	00180813          	addi	a6,a6,1
     fe8:	fdc694e3          	bne	a3,t3,fb0 <verify_benchmark+0x28>
     fec:	00008067          	ret

00000ff0 <initialise_benchmark>:
     ff0:	00008067          	ret

00000ff4 <warm_caches>:
     ff4:	00050593          	mv	a1,a0
     ff8:	00100513          	li	a0,1
     ffc:	e25ff06f          	j	e20 <benchmark_body.isra.0>

00001000 <benchmark>:
    1000:	ff010113          	addi	sp,sp,-16
    1004:	00200513          	li	a0,2
    1008:	00100593          	li	a1,1
    100c:	00112623          	sw	ra,12(sp)
    1010:	e11ff0ef          	jal	e20 <benchmark_body.isra.0>
    1014:	00c12083          	lw	ra,12(sp)
    1018:	00000513          	li	a0,0
    101c:	01010113          	addi	sp,sp,16
    1020:	00008067          	ret

00001024 <__divsi3>:
    1024:	06054063          	bltz	a0,1084 <__umodsi3+0x10>
    1028:	0605c663          	bltz	a1,1094 <__umodsi3+0x20>

0000102c <__hidden___udivsi3>:
    102c:	00058613          	mv	a2,a1
    1030:	00050593          	mv	a1,a0
    1034:	fff00513          	li	a0,-1
    1038:	02060c63          	beqz	a2,1070 <__hidden___udivsi3+0x44>
    103c:	00100693          	li	a3,1
    1040:	00b67a63          	bgeu	a2,a1,1054 <__hidden___udivsi3+0x28>
    1044:	00c05863          	blez	a2,1054 <__hidden___udivsi3+0x28>
    1048:	00161613          	slli	a2,a2,0x1
    104c:	00169693          	slli	a3,a3,0x1
    1050:	feb66ae3          	bltu	a2,a1,1044 <__hidden___udivsi3+0x18>
    1054:	00000513          	li	a0,0
    1058:	00c5e663          	bltu	a1,a2,1064 <__hidden___udivsi3+0x38>
    105c:	40c585b3          	sub	a1,a1,a2
    1060:	00d56533          	or	a0,a0,a3
    1064:	0016d693          	srli	a3,a3,0x1
    1068:	00165613          	srli	a2,a2,0x1
    106c:	fe0696e3          	bnez	a3,1058 <__hidden___udivsi3+0x2c>
    1070:	00008067          	ret

00001074 <__umodsi3>:
    1074:	00008293          	mv	t0,ra
    1078:	fb5ff0ef          	jal	102c <__hidden___udivsi3>
    107c:	00058513          	mv	a0,a1
    1080:	00028067          	jr	t0
    1084:	40a00533          	neg	a0,a0
    1088:	00b04863          	bgtz	a1,1098 <__umodsi3+0x24>
    108c:	40b005b3          	neg	a1,a1
    1090:	f9dff06f          	j	102c <__hidden___udivsi3>
    1094:	40b005b3          	neg	a1,a1
    1098:	00008293          	mv	t0,ra
    109c:	f91ff0ef          	jal	102c <__hidden___udivsi3>
    10a0:	40a00533          	neg	a0,a0
    10a4:	00028067          	jr	t0

000010a8 <__modsi3>:
    10a8:	00008293          	mv	t0,ra
    10ac:	0005ca63          	bltz	a1,10c0 <__modsi3+0x18>
    10b0:	00054c63          	bltz	a0,10c8 <__modsi3+0x20>
    10b4:	f79ff0ef          	jal	102c <__hidden___udivsi3>
    10b8:	00058513          	mv	a0,a1
    10bc:	00028067          	jr	t0
    10c0:	40b005b3          	neg	a1,a1
    10c4:	fe0558e3          	bgez	a0,10b4 <__modsi3+0xc>
    10c8:	40a00533          	neg	a0,a0
    10cc:	f61ff0ef          	jal	102c <__hidden___udivsi3>
    10d0:	40b00533          	neg	a0,a1
    10d4:	00028067          	jr	t0
