
D:\aaa1verilog_project\rv32i_cpu\benchmark\embench\build\slre\slre.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
       0:	00008117          	auipc	sp,0x8
       4:	f0010113          	addi	sp,sp,-256 # 7f00 <__stack_top>
       8:	00001297          	auipc	t0,0x1
       c:	07828293          	addi	t0,t0,120 # 1080 <__bss_end>
      10:	00001317          	auipc	t1,0x1
      14:	07030313          	addi	t1,t1,112 # 1080 <__bss_end>
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
      78:	054010ef          	jal	10cc <initialise_benchmark>
      7c:	00000513          	li	a0,0
      80:	050010ef          	jal	10d0 <warm_caches>
      84:	fadff0ef          	jal	30 <start_trigger>
      88:	054010ef          	jal	10dc <benchmark>
      8c:	00a12623          	sw	a0,12(sp)
      90:	fb5ff0ef          	jal	44 <stop_trigger>
      94:	00c12503          	lw	a0,12(sp)
      98:	050010ef          	jal	10e8 <verify_benchmark>
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

00000104 <strlen>:
     104:	00054783          	lbu	a5,0(a0)
     108:	00078e63          	beqz	a5,124 <strlen+0x20>
     10c:	00050793          	mv	a5,a0
     110:	0017c703          	lbu	a4,1(a5)
     114:	00178793          	addi	a5,a5,1
     118:	fe071ce3          	bnez	a4,110 <strlen+0xc>
     11c:	40a78533          	sub	a0,a5,a0
     120:	00008067          	ret
     124:	00000513          	li	a0,0
     128:	00008067          	ret

0000012c <strchr>:
     12c:	00054783          	lbu	a5,0(a0)
     130:	0ff5f593          	zext.b	a1,a1
     134:	00f59863          	bne	a1,a5,144 <strchr+0x18>
     138:	00008067          	ret
     13c:	00054783          	lbu	a5,0(a0)
     140:	00b78a63          	beq	a5,a1,154 <strchr+0x28>
     144:	00150513          	addi	a0,a0,1
     148:	fe079ae3          	bnez	a5,13c <strchr+0x10>
     14c:	00000513          	li	a0,0
     150:	00008067          	ret
     154:	00008067          	ret

00000158 <match_op>:
     158:	00054783          	lbu	a5,0(a0)
     15c:	05c00713          	li	a4,92
     160:	04e78e63          	beq	a5,a4,1bc <match_op+0x64>
     164:	02f76063          	bltu	a4,a5,184 <match_op+0x2c>
     168:	02400713          	li	a4,36
     16c:	fff00513          	li	a0,-1
     170:	00e78863          	beq	a5,a4,180 <match_op+0x28>
     174:	02e00713          	li	a4,46
     178:	00100513          	li	a0,1
     17c:	06e79e63          	bne	a5,a4,1f8 <match_op+0xa0>
     180:	00008067          	ret
     184:	07c00713          	li	a4,124
     188:	ffc00513          	li	a0,-4
     18c:	fee78ae3          	beq	a5,a4,180 <match_op+0x28>
     190:	7ff60613          	addi	a2,a2,2047
     194:	17162683          	lw	a3,369(a2)
     198:	0005c703          	lbu	a4,0(a1)
     19c:	0016f693          	andi	a3,a3,1
     1a0:	00068863          	beqz	a3,1b0 <match_op+0x58>
     1a4:	fbf70613          	addi	a2,a4,-65
     1a8:	01900693          	li	a3,25
     1ac:	0ec6f063          	bgeu	a3,a2,28c <match_op+0x134>
     1b0:	0ae79e63          	bne	a5,a4,26c <match_op+0x114>
     1b4:	00100513          	li	a0,1
     1b8:	00008067          	ret
     1bc:	00154703          	lbu	a4,1(a0)
     1c0:	07300693          	li	a3,115
     1c4:	0005c783          	lbu	a5,0(a1)
     1c8:	0ad70663          	beq	a4,a3,274 <match_op+0x11c>
     1cc:	04e6ea63          	bltu	a3,a4,220 <match_op+0xc8>
     1d0:	05300693          	li	a3,83
     1d4:	0cd70063          	beq	a4,a3,294 <match_op+0x13c>
     1d8:	06400693          	li	a3,100
     1dc:	fcd71ae3          	bne	a4,a3,1b0 <match_op+0x58>
     1e0:	fd078513          	addi	a0,a5,-48
     1e4:	00900793          	li	a5,9
     1e8:	00a7b533          	sltu	a0,a5,a0
     1ec:	40a00533          	neg	a0,a0
     1f0:	00156513          	ori	a0,a0,1
     1f4:	00008067          	ret
     1f8:	7ff60613          	addi	a2,a2,2047
     1fc:	17162683          	lw	a3,369(a2)
     200:	0005c703          	lbu	a4,0(a1)
     204:	0016f693          	andi	a3,a3,1
     208:	fa0684e3          	beqz	a3,1b0 <match_op+0x58>
     20c:	fbf78613          	addi	a2,a5,-65
     210:	01900693          	li	a3,25
     214:	f8c6e8e3          	bltu	a3,a2,1a4 <match_op+0x4c>
     218:	02078793          	addi	a5,a5,32
     21c:	f89ff06f          	j	1a4 <match_op+0x4c>
     220:	07800693          	li	a3,120
     224:	f8d716e3          	bne	a4,a3,1b0 <match_op+0x58>
     228:	00254683          	lbu	a3,2(a0)
     22c:	01900713          	li	a4,25
     230:	fbf68613          	addi	a2,a3,-65
     234:	08c77263          	bgeu	a4,a2,2b8 <match_op+0x160>
     238:	fd068713          	addi	a4,a3,-48
     23c:	00900613          	li	a2,9
     240:	06e66e63          	bltu	a2,a4,2bc <match_op+0x164>
     244:	00354603          	lbu	a2,3(a0)
     248:	01900693          	li	a3,25
     24c:	00471713          	slli	a4,a4,0x4
     250:	fbf60593          	addi	a1,a2,-65
     254:	04b6fc63          	bgeu	a3,a1,2ac <match_op+0x154>
     258:	fd060693          	addi	a3,a2,-48
     25c:	00900593          	li	a1,9
     260:	04d5e863          	bltu	a1,a3,2b0 <match_op+0x158>
     264:	00d76733          	or	a4,a4,a3
     268:	f4e786e3          	beq	a5,a4,1b4 <match_op+0x5c>
     26c:	fff00513          	li	a0,-1
     270:	00008067          	ret
     274:	ff778713          	addi	a4,a5,-9
     278:	00573713          	sltiu	a4,a4,5
     27c:	f2071ce3          	bnez	a4,1b4 <match_op+0x5c>
     280:	fe078793          	addi	a5,a5,-32
     284:	fe0794e3          	bnez	a5,26c <match_op+0x114>
     288:	f2dff06f          	j	1b4 <match_op+0x5c>
     28c:	02070713          	addi	a4,a4,32
     290:	f21ff06f          	j	1b0 <match_op+0x58>
     294:	ff778713          	addi	a4,a5,-9
     298:	00573713          	sltiu	a4,a4,5
     29c:	fc0718e3          	bnez	a4,26c <match_op+0x114>
     2a0:	fe078793          	addi	a5,a5,-32
     2a4:	f00798e3          	bnez	a5,1b4 <match_op+0x5c>
     2a8:	fc5ff06f          	j	26c <match_op+0x114>
     2ac:	02060613          	addi	a2,a2,32
     2b0:	fa960693          	addi	a3,a2,-87
     2b4:	fb1ff06f          	j	264 <match_op+0x10c>
     2b8:	02068693          	addi	a3,a3,32
     2bc:	fa968713          	addi	a4,a3,-87
     2c0:	f85ff06f          	j	244 <match_op+0xec>

000002c4 <bar>:
     2c4:	fff6c813          	not	a6,a3
     2c8:	fa010113          	addi	sp,sp,-96
     2cc:	01f85813          	srli	a6,a6,0x1f
     2d0:	00b02333          	sgtz	t1,a1
     2d4:	04112e23          	sw	ra,92(sp)
     2d8:	03a12823          	sw	s10,48(sp)
     2dc:	01037333          	and	t1,t1,a6
     2e0:	00f12023          	sw	a5,0(sp)
     2e4:	74030663          	beqz	t1,a30 <bar+0x76c>
     2e8:	05212823          	sw	s2,80(sp)
     2ec:	05312623          	sw	s3,76(sp)
     2f0:	05512223          	sw	s5,68(sp)
     2f4:	05612023          	sw	s6,64(sp)
     2f8:	03912a23          	sw	s9,52(sp)
     2fc:	03b12623          	sw	s11,44(sp)
     300:	04812c23          	sw	s0,88(sp)
     304:	04912a23          	sw	s1,84(sp)
     308:	05412423          	sw	s4,72(sp)
     30c:	03712e23          	sw	s7,60(sp)
     310:	03812c23          	sw	s8,56(sp)
     314:	00c12223          	sw	a2,4(sp)
     318:	00058993          	mv	s3,a1
     31c:	00000a93          	li	s5,0
     320:	00000b13          	li	s6,0
     324:	00612623          	sw	t1,12(sp)
     328:	00068c93          	mv	s9,a3
     32c:	00050913          	mv	s2,a0
     330:	00070d93          	mv	s11,a4
     334:	01690533          	add	a0,s2,s6
     338:	00054883          	lbu	a7,0(a0)
     33c:	02800793          	li	a5,40
     340:	0ef89863          	bne	a7,a5,430 <bar+0x16c>
     344:	00012783          	lw	a5,0(sp)
     348:	00178493          	addi	s1,a5,1
     34c:	00449793          	slli	a5,s1,0x4
     350:	00fd87b3          	add	a5,s11,a5
     354:	0047aa03          	lw	s4,4(a5)
     358:	002a0a13          	addi	s4,s4,2
     35c:	6b405863          	blez	s4,a0c <bar+0x748>
     360:	016a0c33          	add	s8,s4,s6
     364:	000c0613          	mv	a2,s8
     368:	193c4063          	blt	s8,s3,4e8 <bar+0x224>
     36c:	640da783          	lw	a5,1600(s11)
     370:	6ef4d063          	bge	s1,a5,a50 <bar+0x78c>
     374:	40c987b3          	sub	a5,s3,a2
     378:	00f12423          	sw	a5,8(sp)
     37c:	00412783          	lw	a5,4(sp)
     380:	415c8433          	sub	s0,s9,s5
     384:	01578b33          	add	s6,a5,s5
     388:	00812783          	lw	a5,8(sp)
     38c:	3af04e63          	bgtz	a5,748 <bar+0x484>
     390:	00040593          	mv	a1,s0
     394:	00048693          	mv	a3,s1
     398:	000d8613          	mv	a2,s11
     39c:	000b0513          	mv	a0,s6
     3a0:	6b8000ef          	jal	a58 <doh>
     3a4:	00050d13          	mv	s10,a0
     3a8:	040d4463          	bltz	s10,3f0 <bar+0x12c>
     3ac:	015d0333          	add	t1,s10,s5
     3b0:	7ffd8793          	addi	a5,s11,2047
     3b4:	1697a783          	lw	a5,361(a5)
     3b8:	00078c63          	beqz	a5,3d0 <bar+0x10c>
     3bc:	00012703          	lw	a4,0(sp)
     3c0:	00371b93          	slli	s7,a4,0x3
     3c4:	017787b3          	add	a5,a5,s7
     3c8:	0167a023          	sw	s6,0(a5)
     3cc:	01a7a223          	sw	s10,4(a5)
     3d0:	006ca633          	slt	a2,s9,t1
     3d4:	00030a93          	mv	s5,t1
     3d8:	000c0b13          	mv	s6,s8
     3dc:	00912023          	sw	s1,0(sp)
     3e0:	00164793          	xori	a5,a2,1
     3e4:	013b5463          	bge	s6,s3,3ec <bar+0x128>
     3e8:	f40796e3          	bnez	a5,334 <bar+0x70>
     3ec:	000a8d13          	mv	s10,s5
     3f0:	05812403          	lw	s0,88(sp)
     3f4:	05412483          	lw	s1,84(sp)
     3f8:	05012903          	lw	s2,80(sp)
     3fc:	04c12983          	lw	s3,76(sp)
     400:	04812a03          	lw	s4,72(sp)
     404:	04412a83          	lw	s5,68(sp)
     408:	04012b03          	lw	s6,64(sp)
     40c:	03c12b83          	lw	s7,60(sp)
     410:	03812c03          	lw	s8,56(sp)
     414:	03412c83          	lw	s9,52(sp)
     418:	02c12d83          	lw	s11,44(sp)
     41c:	05c12083          	lw	ra,92(sp)
     420:	000d0513          	mv	a0,s10
     424:	03012d03          	lw	s10,48(sp)
     428:	06010113          	addi	sp,sp,96
     42c:	00008067          	ret
     430:	05b00793          	li	a5,91
     434:	44f88a63          	beq	a7,a5,888 <bar+0x5c4>
     438:	05c00793          	li	a5,92
     43c:	40f88e63          	beq	a7,a5,858 <bar+0x594>
     440:	fd688793          	addi	a5,a7,-42
     444:	0027b793          	sltiu	a5,a5,2
     448:	5e079063          	bnez	a5,a28 <bar+0x764>
     44c:	fc188793          	addi	a5,a7,-63
     450:	5c078c63          	beqz	a5,a28 <bar+0x764>
     454:	001b0613          	addi	a2,s6,1
     458:	00100a13          	li	s4,1
     45c:	03365863          	bge	a2,s3,48c <bar+0x1c8>
     460:	00100593          	li	a1,1
     464:	00058a13          	mv	s4,a1
     468:	00bb05b3          	add	a1,s6,a1
     46c:	00b905b3          	add	a1,s2,a1
     470:	0005c783          	lbu	a5,0(a1)
     474:	fd678693          	addi	a3,a5,-42
     478:	0026b693          	sltiu	a3,a3,2
     47c:	fc178793          	addi	a5,a5,-63
     480:	0017b793          	seqz	a5,a5
     484:	18069663          	bnez	a3,610 <bar+0x34c>
     488:	18079463          	bnez	a5,610 <bar+0x34c>
     48c:	05e00793          	li	a5,94
     490:	3ef88663          	beq	a7,a5,87c <bar+0x5b8>
     494:	02400793          	li	a5,36
     498:	2af88063          	beq	a7,a5,738 <bar+0x474>
     49c:	279adc63          	bge	s5,s9,714 <bar+0x450>
     4a0:	00412783          	lw	a5,4(sp)
     4a4:	000d8613          	mv	a2,s11
     4a8:	015785b3          	add	a1,a5,s5
     4ac:	cadff0ef          	jal	158 <match_op>
     4b0:	00100793          	li	a5,1
     4b4:	00050d13          	mv	s10,a0
     4b8:	f2f51ce3          	bne	a0,a5,3f0 <bar+0x12c>
     4bc:	00fa8ab3          	add	s5,s5,a5
     4c0:	015ca7b3          	slt	a5,s9,s5
     4c4:	014b0b33          	add	s6,s6,s4
     4c8:	00a7c7b3          	xor	a5,a5,a0
     4cc:	f19ff06f          	j	3e4 <bar+0x120>
     4d0:	52d34e63          	blt	t1,a3,a0c <bar+0x748>
     4d4:	00268a13          	addi	s4,a3,2
     4d8:	53405a63          	blez	s4,a0c <bar+0x748>
     4dc:	014b0633          	add	a2,s6,s4
     4e0:	00060c13          	mv	s8,a2
     4e4:	03365a63          	bge	a2,s3,518 <bar+0x254>
     4e8:	018905b3          	add	a1,s2,s8
     4ec:	0005c783          	lbu	a5,0(a1)
     4f0:	fd678693          	addi	a3,a5,-42
     4f4:	0026b693          	sltiu	a3,a3,2
     4f8:	fc178793          	addi	a5,a5,-63
     4fc:	0017b793          	seqz	a5,a5
     500:	10069863          	bnez	a3,610 <bar+0x34c>
     504:	10079663          	bnez	a5,610 <bar+0x34c>
     508:	00012703          	lw	a4,0(sp)
     50c:	05b00793          	li	a5,91
     510:	00170493          	addi	s1,a4,1
     514:	e4f89ce3          	bne	a7,a5,36c <bar+0xa8>
     518:	002b0e93          	addi	t4,s6,2
     51c:	001b0b13          	addi	s6,s6,1
     520:	016904b3          	add	s1,s2,s6
     524:	0004c583          	lbu	a1,0(s1)
     528:	05e00793          	li	a5,94
     52c:	41d98433          	sub	s0,s3,t4
     530:	42f58e63          	beq	a1,a5,96c <bar+0x6a8>
     534:	1e044063          	bltz	s0,714 <bar+0x450>
     538:	00058b13          	mv	s6,a1
     53c:	00412783          	lw	a5,4(sp)
     540:	01512423          	sw	s5,8(sp)
     544:	01312a23          	sw	s3,20(sp)
     548:	015787b3          	add	a5,a5,s5
     54c:	01212c23          	sw	s2,24(sp)
     550:	05d00c13          	li	s8,93
     554:	00b12823          	sw	a1,16(sp)
     558:	000b0a93          	mv	s5,s6
     55c:	00048913          	mv	s2,s1
     560:	fff00513          	li	a0,-1
     564:	00100d13          	li	s10,1
     568:	02d00a13          	li	s4,45
     56c:	00000993          	li	s3,0
     570:	00060b93          	mv	s7,a2
     574:	00078493          	mv	s1,a5
     578:	058a8e63          	beq	s5,s8,5d4 <bar+0x310>
     57c:	41a50263          	beq	a0,s10,980 <bar+0x6bc>
     580:	01390b33          	add	s6,s2,s3
     584:	254a8e63          	beq	s5,s4,7e0 <bar+0x51c>
     588:	001b4783          	lbu	a5,1(s6)
     58c:	27478863          	beq	a5,s4,7fc <bar+0x538>
     590:	000d8613          	mv	a2,s11
     594:	00048593          	mv	a1,s1
     598:	000b0513          	mv	a0,s6
     59c:	bbdff0ef          	jal	158 <match_op>
     5a0:	05c00793          	li	a5,92
     5a4:	00100693          	li	a3,1
     5a8:	00fa9c63          	bne	s5,a5,5c0 <bar+0x2fc>
     5ac:	001b4783          	lbu	a5,1(s6)
     5b0:	07800713          	li	a4,120
     5b4:	00400693          	li	a3,4
     5b8:	00e78463          	beq	a5,a4,5c0 <bar+0x2fc>
     5bc:	00200693          	li	a3,2
     5c0:	00d989b3          	add	s3,s3,a3
     5c4:	01344863          	blt	s0,s3,5d4 <bar+0x310>
     5c8:	01390b33          	add	s6,s2,s3
     5cc:	000b4a83          	lbu	s5,0(s6)
     5d0:	fb8a96e3          	bne	s5,s8,57c <bar+0x2b8>
     5d4:	00812a83          	lw	s5,8(sp)
     5d8:	01012583          	lw	a1,16(sp)
     5dc:	01412983          	lw	s3,20(sp)
     5e0:	01812903          	lw	s2,24(sp)
     5e4:	fff50513          	addi	a0,a0,-1
     5e8:	000b8613          	mv	a2,s7
     5ec:	00a03533          	snez	a0,a0
     5f0:	fa258793          	addi	a5,a1,-94
     5f4:	00f037b3          	snez	a5,a5
     5f8:	10a78e63          	beq	a5,a0,714 <bar+0x450>
     5fc:	001a8a93          	addi	s5,s5,1
     600:	015ca7b3          	slt	a5,s9,s5
     604:	00060b13          	mv	s6,a2
     608:	0017c793          	xori	a5,a5,1
     60c:	dd9ff06f          	j	3e4 <bar+0x120>
     610:	00412703          	lw	a4,4(sp)
     614:	415c86b3          	sub	a3,s9,s5
     618:	015708b3          	add	a7,a4,s5
     61c:	38079c63          	bnez	a5,9b4 <bar+0x6f0>
     620:	00090493          	mv	s1,s2
     624:	01112c23          	sw	a7,24(sp)
     628:	000c8913          	mv	s2,s9
     62c:	00d12e23          	sw	a3,28(sp)
     630:	00160c93          	addi	s9,a2,1
     634:	00050e93          	mv	t4,a0
     638:	00058c13          	mv	s8,a1
     63c:	000d8413          	mv	s0,s11
     640:	00000b13          	li	s6,0
     644:	0d3ccc63          	blt	s9,s3,71c <bar+0x458>
     648:	01612623          	sw	s6,12(sp)
     64c:	000a8b93          	mv	s7,s5
     650:	000a8d13          	mv	s10,s5
     654:	fff00d93          	li	s11,-1
     658:	00412783          	lw	a5,4(sp)
     65c:	41a906b3          	sub	a3,s2,s10
     660:	00040713          	mv	a4,s0
     664:	01a78633          	add	a2,a5,s10
     668:	00012783          	lw	a5,0(sp)
     66c:	000a0593          	mv	a1,s4
     670:	000e8513          	mv	a0,t4
     674:	00c12a23          	sw	a2,20(sp)
     678:	00d12823          	sw	a3,16(sp)
     67c:	01d12423          	sw	t4,8(sp)
     680:	c45ff0ef          	jal	2c4 <bar>
     684:	01012683          	lw	a3,16(sp)
     688:	01412603          	lw	a2,20(sp)
     68c:	00050b13          	mv	s6,a0
     690:	02a05263          	blez	a0,6b4 <bar+0x3f0>
     694:	00812e83          	lw	t4,8(sp)
     698:	00ad0d33          	add	s10,s10,a0
     69c:	253cc063          	blt	s9,s3,8dc <bar+0x618>
     6a0:	000d0b93          	mv	s7,s10
     6a4:	fb7adae3          	bge	s5,s7,658 <bar+0x394>
     6a8:	00c12783          	lw	a5,12(sp)
     6ac:	fa0786e3          	beqz	a5,658 <bar+0x394>
     6b0:	0380006f          	j	6e8 <bar+0x424>
     6b4:	000c4783          	lbu	a5,0(s8)
     6b8:	fd578713          	addi	a4,a5,-43
     6bc:	00071463          	bnez	a4,6c4 <bar+0x400>
     6c0:	10051863          	bnez	a0,7d0 <bar+0x50c>
     6c4:	033cd663          	bge	s9,s3,6f0 <bar+0x42c>
     6c8:	00012783          	lw	a5,0(sp)
     6cc:	00040713          	mv	a4,s0
     6d0:	419985b3          	sub	a1,s3,s9
     6d4:	01948533          	add	a0,s1,s9
     6d8:	bedff0ef          	jal	2c4 <bar>
     6dc:	00050d93          	mv	s11,a0
     6e0:	00054463          	bltz	a0,6e8 <bar+0x424>
     6e4:	00ad0bb3          	add	s7,s10,a0
     6e8:	000c4783          	lbu	a5,0(s8)
     6ec:	000b8d13          	mv	s10,s7
     6f0:	220b4263          	bltz	s6,914 <bar+0x650>
     6f4:	02b00713          	li	a4,43
     6f8:	0ce78e63          	beq	a5,a4,7d4 <bar+0x510>
     6fc:	415d0833          	sub	a6,s10,s5
     700:	00183813          	seqz	a6,a6
     704:	013cacb3          	slt	s9,s9,s3
     708:	01987833          	and	a6,a6,s9
     70c:	ce0802e3          	beqz	a6,3f0 <bar+0x12c>
     710:	ce0dd0e3          	bgez	s11,3f0 <bar+0x12c>
     714:	fff00d13          	li	s10,-1
     718:	cd9ff06f          	j	3f0 <bar+0x12c>
     71c:	019487b3          	add	a5,s1,s9
     720:	0007c703          	lbu	a4,0(a5)
     724:	03f00793          	li	a5,63
     728:	f2f710e3          	bne	a4,a5,648 <bar+0x384>
     72c:	00260c93          	addi	s9,a2,2
     730:	00100b13          	li	s6,1
     734:	f15ff06f          	j	648 <bar+0x384>
     738:	fd5c9ee3          	bne	s9,s5,714 <bar+0x450>
     73c:	00c12783          	lw	a5,12(sp)
     740:	014b0b33          	add	s6,s6,s4
     744:	ca1ff06f          	j	3e4 <bar+0x120>
     748:	01890bb3          	add	s7,s2,s8
     74c:	01212823          	sw	s2,16(sp)
     750:	00000a13          	li	s4,0
     754:	00040913          	mv	s2,s0
     758:	00048693          	mv	a3,s1
     75c:	000d8613          	mv	a2,s11
     760:	414905b3          	sub	a1,s2,s4
     764:	000b0513          	mv	a0,s6
     768:	2f0000ef          	jal	a58 <doh>
     76c:	00050d13          	mv	s10,a0
     770:	02055463          	bgez	a0,798 <bar+0x4d4>
     774:	001a0a13          	addi	s4,s4,1
     778:	c7494ce3          	blt	s2,s4,3f0 <bar+0x12c>
     77c:	00048693          	mv	a3,s1
     780:	000d8613          	mv	a2,s11
     784:	414905b3          	sub	a1,s2,s4
     788:	000b0513          	mv	a0,s6
     78c:	2cc000ef          	jal	a58 <doh>
     790:	00050d13          	mv	s10,a0
     794:	fe0540e3          	bltz	a0,774 <bar+0x4b0>
     798:	00412783          	lw	a5,4(sp)
     79c:	00812583          	lw	a1,8(sp)
     7a0:	01550433          	add	s0,a0,s5
     7a4:	00878633          	add	a2,a5,s0
     7a8:	408c86b3          	sub	a3,s9,s0
     7ac:	00048793          	mv	a5,s1
     7b0:	000d8713          	mv	a4,s11
     7b4:	000b8513          	mv	a0,s7
     7b8:	b0dff0ef          	jal	2c4 <bar>
     7bc:	001a0a13          	addi	s4,s4,1
     7c0:	24055a63          	bgez	a0,a14 <bar+0x750>
     7c4:	f9495ae3          	bge	s2,s4,758 <bar+0x494>
     7c8:	01012903          	lw	s2,16(sp)
     7cc:	bddff06f          	j	3a8 <bar+0xe4>
     7d0:	000b8d13          	mv	s10,s7
     7d4:	c15d1ee3          	bne	s10,s5,3f0 <bar+0x12c>
     7d8:	fff00d13          	li	s10,-1
     7dc:	c15ff06f          	j	3f0 <bar+0x12c>
     7e0:	000b0513          	mv	a0,s6
     7e4:	000d8613          	mv	a2,s11
     7e8:	00048593          	mv	a1,s1
     7ec:	96dff0ef          	jal	158 <match_op>
     7f0:	00100693          	li	a3,1
     7f4:	00d989b3          	add	s3,s3,a3
     7f8:	dcdff06f          	j	5c4 <bar+0x300>
     7fc:	002b4683          	lbu	a3,2(s6)
     800:	fa368793          	addi	a5,a3,-93
     804:	d80786e3          	beqz	a5,590 <bar+0x2cc>
     808:	d80684e3          	beqz	a3,590 <bar+0x2cc>
     80c:	7ffd8793          	addi	a5,s11,2047
     810:	1717a503          	lw	a0,369(a5)
     814:	0004c783          	lbu	a5,0(s1)
     818:	12051863          	bnez	a0,948 <bar+0x684>
     81c:	fbf78613          	addi	a2,a5,-65
     820:	01900713          	li	a4,25
     824:	00c76463          	bltu	a4,a2,82c <bar+0x568>
     828:	02078793          	addi	a5,a5,32
     82c:	fbfa8613          	addi	a2,s5,-65
     830:	01900713          	li	a4,25
     834:	12c77863          	bgeu	a4,a2,964 <bar+0x6a0>
     838:	1b57da63          	bge	a5,s5,9ec <bar+0x728>
     83c:	00398993          	addi	s3,s3,3
     840:	d9344ae3          	blt	s0,s3,5d4 <bar+0x310>
     844:	01390b33          	add	s6,s2,s3
     848:	000b4a83          	lbu	s5,0(s6)
     84c:	05d00793          	li	a5,93
     850:	d2fa9ae3          	bne	s5,a5,584 <bar+0x2c0>
     854:	d81ff06f          	j	5d4 <bar+0x310>
     858:	00154683          	lbu	a3,1(a0)
     85c:	07800793          	li	a5,120
     860:	12f68e63          	beq	a3,a5,99c <bar+0x6d8>
     864:	002b0613          	addi	a2,s6,2
     868:	00200a13          	li	s4,2
     86c:	c33658e3          	bge	a2,s3,49c <bar+0x1d8>
     870:	00200593          	li	a1,2
     874:	00058a13          	mv	s4,a1
     878:	bf1ff06f          	j	468 <bar+0x1a4>
     87c:	ec0a80e3          	beqz	s5,73c <bar+0x478>
     880:	fff00d13          	li	s10,-1
     884:	b6dff06f          	j	3f0 <bar+0x12c>
     888:	41698333          	sub	t1,s3,s6
     88c:	fff30313          	addi	t1,t1,-1
     890:	00000693          	li	a3,0
     894:	05d00e13          	li	t3,93
     898:	05c00e93          	li	t4,92
     89c:	07800f13          	li	t5,120
     8a0:	00031863          	bnez	t1,8b0 <bar+0x5ec>
     8a4:	1940006f          	j	a38 <bar+0x774>
     8a8:	00c686b3          	add	a3,a3,a2
     8ac:	c266d2e3          	bge	a3,t1,4d0 <bar+0x20c>
     8b0:	00168793          	addi	a5,a3,1
     8b4:	00f507b3          	add	a5,a0,a5
     8b8:	0007c703          	lbu	a4,0(a5)
     8bc:	00100613          	li	a2,1
     8c0:	c1c708e3          	beq	a4,t3,4d0 <bar+0x20c>
     8c4:	ffd712e3          	bne	a4,t4,8a8 <bar+0x5e4>
     8c8:	0017c783          	lbu	a5,1(a5)
     8cc:	00400613          	li	a2,4
     8d0:	fde78ce3          	beq	a5,t5,8a8 <bar+0x5e4>
     8d4:	00200613          	li	a2,2
     8d8:	fd1ff06f          	j	8a8 <bar+0x5e4>
     8dc:	00412603          	lw	a2,4(sp)
     8e0:	00012783          	lw	a5,0(sp)
     8e4:	00040713          	mv	a4,s0
     8e8:	41a906b3          	sub	a3,s2,s10
     8ec:	01a60633          	add	a2,a2,s10
     8f0:	419985b3          	sub	a1,s3,s9
     8f4:	01948533          	add	a0,s1,s9
     8f8:	01d12423          	sw	t4,8(sp)
     8fc:	9c9ff0ef          	jal	2c4 <bar>
     900:	00812e83          	lw	t4,8(sp)
     904:	00050d93          	mv	s11,a0
     908:	d8054ee3          	bltz	a0,6a4 <bar+0x3e0>
     90c:	00ad0bb3          	add	s7,s10,a0
     910:	d95ff06f          	j	6a4 <bar+0x3e0>
     914:	02a00713          	li	a4,42
     918:	dce79ee3          	bne	a5,a4,6f4 <bar+0x430>
     91c:	00012783          	lw	a5,0(sp)
     920:	01c12683          	lw	a3,28(sp)
     924:	01812603          	lw	a2,24(sp)
     928:	00040713          	mv	a4,s0
     92c:	01948533          	add	a0,s1,s9
     930:	419985b3          	sub	a1,s3,s9
     934:	991ff0ef          	jal	2c4 <bar>
     938:	00050d93          	mv	s11,a0
     93c:	0ea05263          	blez	a0,a20 <bar+0x75c>
     940:	01550d33          	add	s10,a0,s5
     944:	aadff06f          	j	3f0 <bar+0x12c>
     948:	00f6b533          	sltu	a0,a3,a5
     94c:	0157b7b3          	sltu	a5,a5,s5
     950:	00153513          	seqz	a0,a0
     954:	0017b793          	seqz	a5,a5
     958:	00f57533          	and	a0,a0,a5
     95c:	00398993          	addi	s3,s3,3
     960:	c65ff06f          	j	5c4 <bar+0x300>
     964:	020a8a93          	addi	s5,s5,32
     968:	ed1ff06f          	j	838 <bar+0x574>
     96c:	fff40413          	addi	s0,s0,-1
     970:	c80446e3          	bltz	s0,5fc <bar+0x338>
     974:	0014cb03          	lbu	s6,1(s1)
     978:	00148493          	addi	s1,s1,1
     97c:	bc1ff06f          	j	53c <bar+0x278>
     980:	00812a83          	lw	s5,8(sp)
     984:	01012583          	lw	a1,16(sp)
     988:	01412983          	lw	s3,20(sp)
     98c:	01812903          	lw	s2,24(sp)
     990:	000b8613          	mv	a2,s7
     994:	00000513          	li	a0,0
     998:	c59ff06f          	j	5f0 <bar+0x32c>
     99c:	004b0613          	addi	a2,s6,4
     9a0:	00400a13          	li	s4,4
     9a4:	af365ce3          	bge	a2,s3,49c <bar+0x1d8>
     9a8:	00400593          	li	a1,4
     9ac:	00058a13          	mv	s4,a1
     9b0:	ab9ff06f          	j	468 <bar+0x1a4>
     9b4:	00012783          	lw	a5,0(sp)
     9b8:	00088613          	mv	a2,a7
     9bc:	000d8713          	mv	a4,s11
     9c0:	000a0593          	mv	a1,s4
     9c4:	901ff0ef          	jal	2c4 <bar>
     9c8:	fff54793          	not	a5,a0
     9cc:	41f7d793          	srai	a5,a5,0x1f
     9d0:	00f57533          	and	a0,a0,a5
     9d4:	00aa8ab3          	add	s5,s5,a0
     9d8:	001b0b13          	addi	s6,s6,1
     9dc:	015ca7b3          	slt	a5,s9,s5
     9e0:	014b0b33          	add	s6,s6,s4
     9e4:	0017c793          	xori	a5,a5,1
     9e8:	9fdff06f          	j	3e4 <bar+0x120>
     9ec:	fbf68593          	addi	a1,a3,-65
     9f0:	01900613          	li	a2,25
     9f4:	00b66463          	bltu	a2,a1,9fc <bar+0x738>
     9f8:	02068693          	addi	a3,a3,32
     9fc:	00f6a7b3          	slt	a5,a3,a5
     a00:	0017b513          	seqz	a0,a5
     a04:	00398993          	addi	s3,s3,3
     a08:	bbdff06f          	j	5c4 <bar+0x300>
     a0c:	ffb00d13          	li	s10,-5
     a10:	9e1ff06f          	j	3f0 <bar+0x12c>
     a14:	01012903          	lw	s2,16(sp)
     a18:	00040313          	mv	t1,s0
     a1c:	995ff06f          	j	3b0 <bar+0xec>
     a20:	000c4783          	lbu	a5,0(s8)
     a24:	cd1ff06f          	j	6f4 <bar+0x430>
     a28:	ffe00d13          	li	s10,-2
     a2c:	9c5ff06f          	j	3f0 <bar+0x12c>
     a30:	00000d13          	li	s10,0
     a34:	9e9ff06f          	j	41c <bar+0x158>
     a38:	002b0613          	addi	a2,s6,2
     a3c:	00060e93          	mv	t4,a2
     a40:	ad365ee3          	bge	a2,s3,51c <bar+0x258>
     a44:	00200a13          	li	s4,2
     a48:	00060c13          	mv	s8,a2
     a4c:	a9dff06f          	j	4e8 <bar+0x224>
     a50:	ffc00d13          	li	s10,-4
     a54:	99dff06f          	j	3f0 <bar+0x12c>

00000a58 <doh>:
     a58:	fe010113          	addi	sp,sp,-32
     a5c:	01512223          	sw	s5,4(sp)
     a60:	00469a93          	slli	s5,a3,0x4
     a64:	01560ab3          	add	s5,a2,s5
     a68:	00812c23          	sw	s0,24(sp)
     a6c:	00caa403          	lw	s0,12(s5)
     a70:	00912a23          	sw	s1,20(sp)
     a74:	01212823          	sw	s2,16(sp)
     a78:	01312623          	sw	s3,12(sp)
     a7c:	01412423          	sw	s4,8(sp)
     a80:	00112e23          	sw	ra,28(sp)
     a84:	00050913          	mv	s2,a0
     a88:	00068493          	mv	s1,a3
     a8c:	000aa503          	lw	a0,0(s5)
     a90:	00060a13          	mv	s4,a2
     a94:	00058993          	mv	s3,a1
     a98:	0a040663          	beqz	s0,b44 <doh+0xec>
     a9c:	008aa683          	lw	a3,8(s5)
     aa0:	00000413          	li	s0,0
     aa4:	00d406b3          	add	a3,s0,a3
     aa8:	00369693          	slli	a3,a3,0x3
     aac:	00da06b3          	add	a3,s4,a3
     ab0:	6486a583          	lw	a1,1608(a3)
     ab4:	40a585b3          	sub	a1,a1,a0
     ab8:	00048793          	mv	a5,s1
     abc:	000a0713          	mv	a4,s4
     ac0:	00098693          	mv	a3,s3
     ac4:	00090613          	mv	a2,s2
     ac8:	ffcff0ef          	jal	2c4 <bar>
     acc:	04a04a63          	bgtz	a0,b20 <doh+0xc8>
     ad0:	00caa703          	lw	a4,12(s5)
     ad4:	04e45663          	bge	s0,a4,b20 <doh+0xc8>
     ad8:	008aa683          	lw	a3,8(s5)
     adc:	00140413          	addi	s0,s0,1
     ae0:	00d407b3          	add	a5,s0,a3
     ae4:	00379793          	slli	a5,a5,0x3
     ae8:	00fa07b3          	add	a5,s4,a5
     aec:	6407a503          	lw	a0,1600(a5)
     af0:	00150513          	addi	a0,a0,1
     af4:	fa8718e3          	bne	a4,s0,aa4 <doh+0x4c>
     af8:	004aa783          	lw	a5,4(s5)
     afc:	000aa583          	lw	a1,0(s5)
     b00:	000a0713          	mv	a4,s4
     b04:	00098693          	mv	a3,s3
     b08:	00f585b3          	add	a1,a1,a5
     b0c:	40a585b3          	sub	a1,a1,a0
     b10:	00048793          	mv	a5,s1
     b14:	00090613          	mv	a2,s2
     b18:	facff0ef          	jal	2c4 <bar>
     b1c:	faa05ae3          	blez	a0,ad0 <doh+0x78>
     b20:	01c12083          	lw	ra,28(sp)
     b24:	01812403          	lw	s0,24(sp)
     b28:	01412483          	lw	s1,20(sp)
     b2c:	01012903          	lw	s2,16(sp)
     b30:	00c12983          	lw	s3,12(sp)
     b34:	00812a03          	lw	s4,8(sp)
     b38:	00412a83          	lw	s5,4(sp)
     b3c:	02010113          	addi	sp,sp,32
     b40:	00008067          	ret
     b44:	004aa583          	lw	a1,4(s5)
     b48:	f71ff06f          	j	ab8 <doh+0x60>

00000b4c <slre_match>:
     b4c:	81010113          	addi	sp,sp,-2032
     b50:	7e912223          	sw	s1,2020(sp)
     b54:	7f212023          	sw	s2,2016(sp)
     b58:	7d712623          	sw	s7,1996(sp)
     b5c:	7e112623          	sw	ra,2028(sp)
     b60:	7e812423          	sw	s0,2024(sp)
     b64:	7d312e23          	sw	s3,2012(sp)
     b68:	7d412c23          	sw	s4,2008(sp)
     b6c:	7d512a23          	sw	s5,2004(sp)
     b70:	7d612823          	sw	s6,2000(sp)
     b74:	7d812423          	sw	s8,1992(sp)
     b78:	7d912223          	sw	s9,1988(sp)
     b7c:	7da12023          	sw	s10,1984(sp)
     b80:	000017b7          	lui	a5,0x1
     b84:	e4010113          	addi	sp,sp,-448
     b88:	00058913          	mv	s2,a1
     b8c:	00078593          	mv	a1,a5
     b90:	7ff10793          	addi	a5,sp,2047
     b94:	17578793          	addi	a5,a5,373 # 1175 <verify_benchmark+0x8d>
     b98:	00d7a023          	sw	a3,0(a5)
     b9c:	7ff10793          	addi	a5,sp,2047
     ba0:	17978793          	addi	a5,a5,377
     ba4:	00e7a023          	sw	a4,0(a5)
     ba8:	7ff10793          	addi	a5,sp,2047
     bac:	17178793          	addi	a5,a5,369
     bb0:	0007a023          	sw	zero,0(a5)
     bb4:	7ff10793          	addi	a5,sp,2047
     bb8:	00060493          	mv	s1,a2
     bbc:	17d78793          	addi	a5,a5,381
     bc0:	00400613          	li	a2,4
     bc4:	64012623          	sw	zero,1612(sp)
     bc8:	00050b93          	mv	s7,a0
     bcc:	0007a023          	sw	zero,0(a5)
     bd0:	d00ff0ef          	jal	d0 <memcmp>
     bd4:	02051263          	bnez	a0,bf8 <slre_match+0xac>
     bd8:	7ff10793          	addi	a5,sp,2047
     bdc:	17d78793          	addi	a5,a5,381
     be0:	0007a783          	lw	a5,0(a5)
     be4:	7ff10713          	addi	a4,sp,2047
     be8:	17d70713          	addi	a4,a4,381
     bec:	0017e793          	ori	a5,a5,1
     bf0:	004b8b93          	addi	s7,s7,4
     bf4:	00f72023          	sw	a5,0(a4)
     bf8:	000b8513          	mv	a0,s7
     bfc:	d08ff0ef          	jal	104 <strlen>
     c00:	00100813          	li	a6,1
     c04:	65012623          	sw	a6,1612(sp)
     c08:	01712623          	sw	s7,12(sp)
     c0c:	00a12823          	sw	a0,16(sp)
     c10:	98010a13          	addi	s4,sp,-1664
     c14:	00050b13          	mv	s6,a0
     c18:	00000c93          	li	s9,0
     c1c:	00000413          	li	s0,0
     c20:	3ca05063          	blez	a0,fe0 <slre_match+0x494>
     c24:	000019b7          	lui	s3,0x1
     c28:	00898993          	addi	s3,s3,8 # 1008 <benchmark_body+0x14>
     c2c:	05b00c13          	li	s8,91
     c30:	05c00a93          	li	s5,92
     c34:	008b8633          	add	a2,s7,s0
     c38:	00064783          	lbu	a5,0(a2)
     c3c:	2b878263          	beq	a5,s8,ee0 <slre_match+0x394>
     c40:	1d578a63          	beq	a5,s5,e14 <slre_match+0x2c8>
     c44:	07c00713          	li	a4,124
     c48:	16e78463          	beq	a5,a4,db0 <slre_match+0x264>
     c4c:	02800713          	li	a4,40
     c50:	2ee79c63          	bne	a5,a4,f48 <slre_match+0x3fc>
     c54:	64c12703          	lw	a4,1612(sp)
     c58:	06300793          	li	a5,99
     c5c:	36e7ca63          	blt	a5,a4,fd0 <slre_match+0x484>
     c60:	7ff10693          	addi	a3,sp,2047
     c64:	17968693          	addi	a3,a3,377
     c68:	00140413          	addi	s0,s0,1
     c6c:	00471793          	slli	a5,a4,0x4
     c70:	0006a683          	lw	a3,0(a3)
     c74:	00fa07b3          	add	a5,s4,a5
     c78:	008b8533          	add	a0,s7,s0
     c7c:	fff00593          	li	a1,-1
     c80:	00170613          	addi	a2,a4,1
     c84:	68a7a623          	sw	a0,1676(a5)
     c88:	68b7a823          	sw	a1,1680(a5)
     c8c:	64c12623          	sw	a2,1612(sp)
     c90:	00d05463          	blez	a3,c98 <slre_match+0x14c>
     c94:	32e6c663          	blt	a3,a4,fc0 <slre_match+0x474>
     c98:	001c8c93          	addi	s9,s9,1
     c9c:	f9644ce3          	blt	s0,s6,c34 <slre_match+0xe8>
     ca0:	320c9c63          	bnez	s9,fd8 <slre_match+0x48c>
     ca4:	7ff10793          	addi	a5,sp,2047
     ca8:	1717a603          	lw	a2,369(a5)
     cac:	17178793          	addi	a5,a5,369
     cb0:	06c05063          	blez	a2,d10 <slre_match+0x1c4>
     cb4:	65810693          	addi	a3,sp,1624
     cb8:	00000813          	li	a6,0
     cbc:	00180813          	addi	a6,a6,1
     cc0:	04c85863          	bge	a6,a2,d10 <slre_match+0x1c4>
     cc4:	00068793          	mv	a5,a3
     cc8:	00080713          	mv	a4,a6
     ccc:	ff86a583          	lw	a1,-8(a3)
     cd0:	0007a503          	lw	a0,0(a5)
     cd4:	00170713          	addi	a4,a4,1
     cd8:	02b55463          	bge	a0,a1,d00 <slre_match+0x1b4>
     cdc:	fea6ac23          	sw	a0,-8(a3)
     ce0:	0047a503          	lw	a0,4(a5)
     ce4:	ffc6a603          	lw	a2,-4(a3)
     ce8:	fea6ae23          	sw	a0,-4(a3)
     cec:	00c7a223          	sw	a2,4(a5)
     cf0:	7ff10613          	addi	a2,sp,2047
     cf4:	00b7a023          	sw	a1,0(a5)
     cf8:	17160613          	addi	a2,a2,369
     cfc:	00062603          	lw	a2,0(a2)
     d00:	00878793          	addi	a5,a5,8
     d04:	fcc744e3          	blt	a4,a2,ccc <slre_match+0x180>
     d08:	00868693          	addi	a3,a3,8
     d0c:	fac848e3          	blt	a6,a2,cbc <slre_match+0x170>
     d10:	64c12803          	lw	a6,1612(sp)
     d14:	05005c63          	blez	a6,d6c <slre_match+0x220>
     d18:	01810593          	addi	a1,sp,24
     d1c:	00000693          	li	a3,0
     d20:	00000513          	li	a0,0
     d24:	65010893          	addi	a7,sp,1616
     d28:	0005a023          	sw	zero,0(a1)
     d2c:	fed5ae23          	sw	a3,-4(a1)
     d30:	02c6d863          	bge	a3,a2,d60 <slre_match+0x214>
     d34:	00369713          	slli	a4,a3,0x3
     d38:	00e88733          	add	a4,a7,a4
     d3c:	0180006f          	j	d54 <slre_match+0x208>
     d40:	0005a783          	lw	a5,0(a1)
     d44:	00168693          	addi	a3,a3,1
     d48:	00178793          	addi	a5,a5,1
     d4c:	00f5a023          	sw	a5,0(a1)
     d50:	00c68863          	beq	a3,a2,d60 <slre_match+0x214>
     d54:	00072783          	lw	a5,0(a4)
     d58:	00870713          	addi	a4,a4,8
     d5c:	fea782e3          	beq	a5,a0,d40 <slre_match+0x1f4>
     d60:	00150513          	addi	a0,a0,1
     d64:	01058593          	addi	a1,a1,16
     d68:	fd0510e3          	bne	a0,a6,d28 <slre_match+0x1dc>
     d6c:	2404ce63          	bltz	s1,fc8 <slre_match+0x47c>
     d70:	68ca2783          	lw	a5,1676(s4)
     d74:	00000413          	li	s0,0
     d78:	05e00a13          	li	s4,94
     d7c:	0007ca83          	lbu	s5,0(a5)
     d80:	0100006f          	j	d90 <slre_match+0x244>
     d84:	00140413          	addi	s0,s0,1
     d88:	114a8263          	beq	s5,s4,e8c <slre_match+0x340>
     d8c:	1084c063          	blt	s1,s0,e8c <slre_match+0x340>
     d90:	00000693          	li	a3,0
     d94:	00c10613          	addi	a2,sp,12
     d98:	408485b3          	sub	a1,s1,s0
     d9c:	00890533          	add	a0,s2,s0
     da0:	cb9ff0ef          	jal	a58 <doh>
     da4:	fe0540e3          	bltz	a0,d84 <slre_match+0x238>
     da8:	00850533          	add	a0,a0,s0
     dac:	0e00006f          	j	e8c <slre_match+0x340>
     db0:	7ff10793          	addi	a5,sp,2047
     db4:	1717a703          	lw	a4,369(a5)
     db8:	17178793          	addi	a5,a5,369
     dbc:	06300793          	li	a5,99
     dc0:	1ee7cc63          	blt	a5,a4,fb8 <slre_match+0x46c>
     dc4:	64c12683          	lw	a3,1612(sp)
     dc8:	fff00593          	li	a1,-1
     dcc:	00b686b3          	add	a3,a3,a1
     dd0:	00469793          	slli	a5,a3,0x4
     dd4:	00fa07b3          	add	a5,s4,a5
     dd8:	6907a783          	lw	a5,1680(a5)
     ddc:	00b78463          	beq	a5,a1,de4 <slre_match+0x298>
     de0:	000c8693          	mv	a3,s9
     de4:	0c870793          	addi	a5,a4,200
     de8:	00379793          	slli	a5,a5,0x3
     dec:	00fa07b3          	add	a5,s4,a5
     df0:	68d7a823          	sw	a3,1680(a5)
     df4:	68c7aa23          	sw	a2,1684(a5)
     df8:	7ff10793          	addi	a5,sp,2047
     dfc:	00170713          	addi	a4,a4,1
     e00:	00140413          	addi	s0,s0,1
     e04:	16e7a8a3          	sw	a4,369(a5)
     e08:	17178793          	addi	a5,a5,369
     e0c:	e36444e3          	blt	s0,s6,c34 <slre_match+0xe8>
     e10:	e91ff06f          	j	ca0 <slre_match+0x154>
     e14:	00164703          	lbu	a4,1(a2)
     e18:	07800793          	li	a5,120
     e1c:	00200d13          	li	s10,2
     e20:	18f70263          	beq	a4,a5,fa4 <slre_match+0x458>
     e24:	fffb0793          	addi	a5,s6,-1
     e28:	06f45063          	bge	s0,a5,e88 <slre_match+0x33c>
     e2c:	00164583          	lbu	a1,1(a2)
     e30:	07800793          	li	a5,120
     e34:	08f59a63          	bne	a1,a5,ec8 <slre_match+0x37c>
     e38:	ffdb0793          	addi	a5,s6,-3
     e3c:	04f45663          	bge	s0,a5,e88 <slre_match+0x33c>
     e40:	00264783          	lbu	a5,2(a2)
     e44:	00900713          	li	a4,9
     e48:	fd078693          	addi	a3,a5,-48
     e4c:	00d77c63          	bgeu	a4,a3,e64 <slre_match+0x318>
     e50:	fdf7f793          	andi	a5,a5,-33
     e54:	fbf78793          	addi	a5,a5,-65
     e58:	0ff7f793          	zext.b	a5,a5
     e5c:	00500713          	li	a4,5
     e60:	02f76463          	bltu	a4,a5,e88 <slre_match+0x33c>
     e64:	00364783          	lbu	a5,3(a2)
     e68:	00900713          	li	a4,9
     e6c:	fd078693          	addi	a3,a5,-48
     e70:	06d77263          	bgeu	a4,a3,ed4 <slre_match+0x388>
     e74:	fdf7f793          	andi	a5,a5,-33
     e78:	fbf78793          	addi	a5,a5,-65
     e7c:	0ff7f793          	zext.b	a5,a5
     e80:	00500713          	li	a4,5
     e84:	04f77863          	bgeu	a4,a5,ed4 <slre_match+0x388>
     e88:	ffa00513          	li	a0,-6
     e8c:	1c010113          	addi	sp,sp,448
     e90:	7ec12083          	lw	ra,2028(sp)
     e94:	7e812403          	lw	s0,2024(sp)
     e98:	7e412483          	lw	s1,2020(sp)
     e9c:	7e012903          	lw	s2,2016(sp)
     ea0:	7dc12983          	lw	s3,2012(sp)
     ea4:	7d812a03          	lw	s4,2008(sp)
     ea8:	7d412a83          	lw	s5,2004(sp)
     eac:	7d012b03          	lw	s6,2000(sp)
     eb0:	7cc12b83          	lw	s7,1996(sp)
     eb4:	7c812c03          	lw	s8,1992(sp)
     eb8:	7c412c83          	lw	s9,1988(sp)
     ebc:	7c012d03          	lw	s10,1984(sp)
     ec0:	7f010113          	addi	sp,sp,2032
     ec4:	00008067          	ret
     ec8:	00098513          	mv	a0,s3
     ecc:	a60ff0ef          	jal	12c <strchr>
     ed0:	fa050ce3          	beqz	a0,e88 <slre_match+0x33c>
     ed4:	01a40433          	add	s0,s0,s10
     ed8:	d5644ee3          	blt	s0,s6,c34 <slre_match+0xe8>
     edc:	dc5ff06f          	j	ca0 <slre_match+0x154>
     ee0:	408b0833          	sub	a6,s6,s0
     ee4:	fff80813          	addi	a6,a6,-1
     ee8:	00000793          	li	a5,0
     eec:	05d00513          	li	a0,93
     ef0:	07800893          	li	a7,120
     ef4:	00081863          	bnez	a6,f04 <slre_match+0x3b8>
     ef8:	0b40006f          	j	fac <slre_match+0x460>
     efc:	00b787b3          	add	a5,a5,a1
     f00:	0307da63          	bge	a5,a6,f34 <slre_match+0x3e8>
     f04:	00178713          	addi	a4,a5,1
     f08:	00e60733          	add	a4,a2,a4
     f0c:	00074683          	lbu	a3,0(a4)
     f10:	00100593          	li	a1,1
     f14:	02a68063          	beq	a3,a0,f34 <slre_match+0x3e8>
     f18:	ff5692e3          	bne	a3,s5,efc <slre_match+0x3b0>
     f1c:	00174703          	lbu	a4,1(a4)
     f20:	00200593          	li	a1,2
     f24:	fd171ce3          	bne	a4,a7,efc <slre_match+0x3b0>
     f28:	00400593          	li	a1,4
     f2c:	00b787b3          	add	a5,a5,a1
     f30:	fd07cae3          	blt	a5,a6,f04 <slre_match+0x3b8>
     f34:	d6f844e3          	blt	a6,a5,c9c <slre_match+0x150>
     f38:	00278793          	addi	a5,a5,2
     f3c:	00f40433          	add	s0,s0,a5
     f40:	cf644ae3          	blt	s0,s6,c34 <slre_match+0xe8>
     f44:	d5dff06f          	j	ca0 <slre_match+0x154>
     f48:	02900713          	li	a4,41
     f4c:	04e79663          	bne	a5,a4,f98 <slre_match+0x44c>
     f50:	64c12783          	lw	a5,1612(sp)
     f54:	fff00713          	li	a4,-1
     f58:	00e787b3          	add	a5,a5,a4
     f5c:	00479793          	slli	a5,a5,0x4
     f60:	00fa06b3          	add	a3,s4,a5
     f64:	6906a683          	lw	a3,1680(a3)
     f68:	00e68463          	beq	a3,a4,f70 <slre_match+0x424>
     f6c:	004c9793          	slli	a5,s9,0x4
     f70:	00fa07b3          	add	a5,s4,a5
     f74:	68c7a703          	lw	a4,1676(a5)
     f78:	fffc8c93          	addi	s9,s9,-1
     f7c:	40e60733          	sub	a4,a2,a4
     f80:	68e7a823          	sw	a4,1680(a5)
     f84:	040cca63          	bltz	s9,fd8 <slre_match+0x48c>
     f88:	00805863          	blez	s0,f98 <slre_match+0x44c>
     f8c:	fff64703          	lbu	a4,-1(a2)
     f90:	02800793          	li	a5,40
     f94:	02f70a63          	beq	a4,a5,fc8 <slre_match+0x47c>
     f98:	00140413          	addi	s0,s0,1
     f9c:	c9644ce3          	blt	s0,s6,c34 <slre_match+0xe8>
     fa0:	d01ff06f          	j	ca0 <slre_match+0x154>
     fa4:	00400d13          	li	s10,4
     fa8:	e7dff06f          	j	e24 <slre_match+0x2d8>
     fac:	00200793          	li	a5,2
     fb0:	00f40433          	add	s0,s0,a5
     fb4:	f8dff06f          	j	f40 <slre_match+0x3f4>
     fb8:	ff800513          	li	a0,-8
     fbc:	ed1ff06f          	j	e8c <slre_match+0x340>
     fc0:	ff900513          	li	a0,-7
     fc4:	ec9ff06f          	j	e8c <slre_match+0x340>
     fc8:	fff00513          	li	a0,-1
     fcc:	ec1ff06f          	j	e8c <slre_match+0x340>
     fd0:	ff700513          	li	a0,-9
     fd4:	eb9ff06f          	j	e8c <slre_match+0x340>
     fd8:	ffd00513          	li	a0,-3
     fdc:	eb1ff06f          	j	e8c <slre_match+0x340>
     fe0:	7ff10793          	addi	a5,sp,2047
     fe4:	1717a603          	lw	a2,369(a5)
     fe8:	17178793          	addi	a5,a5,369
     fec:	ccc044e3          	bgtz	a2,cb4 <slre_match+0x168>
     ff0:	d29ff06f          	j	d18 <slre_match+0x1cc>

00000ff4 <benchmark_body>:
     ff4:	fc010113          	addi	sp,sp,-64
     ff8:	02112e23          	sw	ra,60(sp)
     ffc:	0c058063          	beqz	a1,10bc <__bss_end+0x3c>
    1000:	02912a23          	sw	s1,52(sp)
    1004:	03312623          	sw	s3,44(sp)
    1008:	000014b7          	lui	s1,0x1
    100c:	000019b7          	lui	s3,0x1
    1010:	03512223          	sw	s5,36(sp)
    1014:	03612023          	sw	s6,32(sp)
    1018:	01712e23          	sw	s7,28(sp)
    101c:	01812c23          	sw	s8,24(sp)
    1020:	02812c23          	sw	s0,56(sp)
    1024:	03212823          	sw	s2,48(sp)
    1028:	03412423          	sw	s4,40(sp)
    102c:	00050b93          	mv	s7,a0
    1030:	00058a93          	mv	s5,a1
    1034:	05048493          	addi	s1,s1,80 # 1050 <text>
    1038:	05098993          	addi	s3,s3,80 # 1050 <text>
    103c:	00000c13          	li	s8,0
    1040:	00001b37          	lui	s6,0x1
    1044:	00000a13          	li	s4,0
    1048:	00048513          	mv	a0,s1
    104c:	8b8ff0ef          	jal	104 <strlen>
    1050:	00050913          	mv	s2,a0
    1054:	00012223          	sw	zero,4(sp)
    1058:	040b0413          	addi	s0,s6,64 # 1040 <regexes>
    105c:	00042503          	lw	a0,0(s0)
    1060:	00100713          	li	a4,1
    1064:	00810693          	addi	a3,sp,8
    1068:	00090613          	mv	a2,s2
    106c:	00048593          	mv	a1,s1
    1070:	addff0ef          	jal	b4c <slre_match>
    1074:	00412783          	lw	a5,4(sp)
    1078:	00440413          	addi	s0,s0,4
    107c:	00a787b3          	add	a5,a5,a0
    1080:	00f12223          	sw	a5,4(sp)
    1084:	fd341ce3          	bne	s0,s3,105c <text+0xc>
    1088:	001a0a13          	addi	s4,s4,1
    108c:	fb4a9ee3          	bne	s5,s4,1048 <regexes+0x8>
    1090:	001c0c13          	addi	s8,s8,1
    1094:	fb8b98e3          	bne	s7,s8,1044 <regexes+0x4>
    1098:	03812403          	lw	s0,56(sp)
    109c:	03412483          	lw	s1,52(sp)
    10a0:	03012903          	lw	s2,48(sp)
    10a4:	02c12983          	lw	s3,44(sp)
    10a8:	02812a03          	lw	s4,40(sp)
    10ac:	02412a83          	lw	s5,36(sp)
    10b0:	02012b03          	lw	s6,32(sp)
    10b4:	01c12b83          	lw	s7,28(sp)
    10b8:	01812c03          	lw	s8,24(sp)
    10bc:	03c12083          	lw	ra,60(sp)
    10c0:	00412503          	lw	a0,4(sp)
    10c4:	04010113          	addi	sp,sp,64
    10c8:	00008067          	ret

000010cc <initialise_benchmark>:
    10cc:	00008067          	ret

000010d0 <warm_caches>:
    10d0:	00050593          	mv	a1,a0
    10d4:	00100513          	li	a0,1
    10d8:	f1dff06f          	j	ff4 <benchmark_body>

000010dc <benchmark>:
    10dc:	00100593          	li	a1,1
    10e0:	00200513          	li	a0,2
    10e4:	f11ff06f          	j	ff4 <benchmark_body>

000010e8 <verify_benchmark>:
    10e8:	f9a50513          	addi	a0,a0,-102
    10ec:	00153513          	seqz	a0,a0
    10f0:	00008067          	ret
