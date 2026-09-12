
D:\aaa1verilog_project\rv32i_cpu\benchmark\embench\build\statemate\statemate.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
       0:	00008117          	auipc	sp,0x8
       4:	f0010113          	addi	sp,sp,-256 # 7f00 <__stack_top>
       8:	00001297          	auipc	t0,0x1
       c:	ff828293          	addi	t0,t0,-8 # 1000 <__data_end>
      10:	00001317          	auipc	t1,0x1
      14:	0d830313          	addi	t1,t1,216 # 10e8 <__bss_end>
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
      78:	7c4010ef          	jal	183c <initialise_benchmark>
      7c:	00000513          	li	a0,0
      80:	78c010ef          	jal	180c <warm_caches>
      84:	fadff0ef          	jal	30 <start_trigger>
      88:	790010ef          	jal	1818 <benchmark>
      8c:	00a12623          	sw	a0,12(sp)
      90:	fb5ff0ef          	jal	44 <stop_trigger>
      94:	00c12503          	lw	a0,12(sp)
      98:	7a8010ef          	jal	1840 <verify_benchmark>
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

000000ec <generic_KINDERSICHERUNG_CTRL.part.0>:
      ec:	00001737          	lui	a4,0x1
      f0:	00c74783          	lbu	a5,12(a4) # 100c <KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state>
      f4:	00200693          	li	a3,2
      f8:	08d78a63          	beq	a5,a3,18c <generic_KINDERSICHERUNG_CTRL.part.0+0xa0>
      fc:	00300613          	li	a2,3
     100:	04c78663          	beq	a5,a2,14c <generic_KINDERSICHERUNG_CTRL.part.0+0x60>
     104:	00100693          	li	a3,1
     108:	0cd79463          	bne	a5,a3,1d0 <generic_KINDERSICHERUNG_CTRL.part.0+0xe4>
     10c:	000016b7          	lui	a3,0x1
     110:	0486c683          	lbu	a3,72(a3) # 1048 <FH_TUERMODUL__SFHA_ZENTRAL>
     114:	0e069463          	bnez	a3,1fc <generic_KINDERSICHERUNG_CTRL.part.0+0x110>
     118:	000016b7          	lui	a3,0x1
     11c:	04c6c683          	lbu	a3,76(a3) # 104c <FH_TUERMODUL__SFHZ_ZENTRAL>
     120:	18069c63          	bnez	a3,2b8 <generic_KINDERSICHERUNG_CTRL.part.0+0x1cc>
     124:	00001537          	lui	a0,0x1
     128:	000015b7          	lui	a1,0x1
     12c:	000016b7          	lui	a3,0x1
     130:	000017b7          	lui	a5,0x1
     134:	00c70623          	sb	a2,12(a4)
     138:	000508a3          	sb	zero,17(a0) # 1011 <stable>
     13c:	02058f23          	sb	zero,62(a1) # 103e <FH_TUERMODUL__SFHZ_copy>
     140:	02068da3          	sb	zero,59(a3) # 103b <FH_TUERMODUL__SFHA_copy>
     144:	00078723          	sb	zero,14(a5) # 100e <ZENTRAL_KINDERSICHERUNG_CTRL_next_state>
     148:	00008067          	ret
     14c:	000017b7          	lui	a5,0x1
     150:	0447c783          	lbu	a5,68(a5) # 1044 <FH_TUERMODUL__KL_50>
     154:	0c079c63          	bnez	a5,22c <generic_KINDERSICHERUNG_CTRL.part.0+0x140>
     158:	000017b7          	lui	a5,0x1
     15c:	04a7c783          	lbu	a5,74(a5) # 104a <FH_TUERMODUL__SFHZ_MEC>
     160:	00001637          	lui	a2,0x1
     164:	04664603          	lbu	a2,70(a2) # 1046 <FH_TUERMODUL__SFHA_MEC>
     168:	0e079863          	bnez	a5,258 <generic_KINDERSICHERUNG_CTRL.part.0+0x16c>
     16c:	18061e63          	bnez	a2,308 <generic_KINDERSICHERUNG_CTRL.part.0+0x21c>
     170:	000017b7          	lui	a5,0x1
     174:	04c7c783          	lbu	a5,76(a5) # 104c <FH_TUERMODUL__SFHZ_ZENTRAL>
     178:	1e079a63          	bnez	a5,36c <generic_KINDERSICHERUNG_CTRL.part.0+0x280>
     17c:	000017b7          	lui	a5,0x1
     180:	0487c783          	lbu	a5,72(a5) # 1048 <FH_TUERMODUL__SFHA_ZENTRAL>
     184:	20079863          	bnez	a5,394 <generic_KINDERSICHERUNG_CTRL.part.0+0x2a8>
     188:	00008067          	ret
     18c:	000017b7          	lui	a5,0x1
     190:	0467c783          	lbu	a5,70(a5) # 1046 <FH_TUERMODUL__SFHA_MEC>
     194:	04079663          	bnez	a5,1e0 <generic_KINDERSICHERUNG_CTRL.part.0+0xf4>
     198:	000017b7          	lui	a5,0x1
     19c:	04a7c783          	lbu	a5,74(a5) # 104a <FH_TUERMODUL__SFHZ_MEC>
     1a0:	0e079063          	bnez	a5,280 <generic_KINDERSICHERUNG_CTRL.part.0+0x194>
     1a4:	00001537          	lui	a0,0x1
     1a8:	000015b7          	lui	a1,0x1
     1ac:	00001637          	lui	a2,0x1
     1b0:	00300693          	li	a3,3
     1b4:	000017b7          	lui	a5,0x1
     1b8:	000508a3          	sb	zero,17(a0) # 1011 <stable>
     1bc:	02058f23          	sb	zero,62(a1) # 103e <FH_TUERMODUL__SFHZ_copy>
     1c0:	02060da3          	sb	zero,59(a2) # 103b <FH_TUERMODUL__SFHA_copy>
     1c4:	00d70623          	sb	a3,12(a4)
     1c8:	000786a3          	sb	zero,13(a5) # 100d <MEC_KINDERSICHERUNG_CTRL_next_state>
     1cc:	00008067          	ret
     1d0:	000017b7          	lui	a5,0x1
     1d4:	00c70623          	sb	a2,12(a4)
     1d8:	000788a3          	sb	zero,17(a5) # 1011 <stable>
     1dc:	00008067          	ret
     1e0:	000017b7          	lui	a5,0x1
     1e4:	00d7c703          	lbu	a4,13(a5) # 100d <MEC_KINDERSICHERUNG_CTRL_next_state>
     1e8:	00100693          	li	a3,1
     1ec:	14d70e63          	beq	a4,a3,348 <generic_KINDERSICHERUNG_CTRL.part.0+0x25c>
     1f0:	000017b7          	lui	a5,0x1
     1f4:	000788a3          	sb	zero,17(a5) # 1011 <stable>
     1f8:	00008067          	ret
     1fc:	00001737          	lui	a4,0x1
     200:	00e74683          	lbu	a3,14(a4) # 100e <ZENTRAL_KINDERSICHERUNG_CTRL_next_state>
     204:	fef696e3          	bne	a3,a5,1f0 <generic_KINDERSICHERUNG_CTRL.part.0+0x104>
     208:	000017b7          	lui	a5,0x1
     20c:	0477c783          	lbu	a5,71(a5) # 1047 <FH_TUERMODUL__SFHA_ZENTRAL_old>
     210:	1a079063          	bnez	a5,3b0 <generic_KINDERSICHERUNG_CTRL.part.0+0x2c4>
     214:	00001637          	lui	a2,0x1
     218:	000017b7          	lui	a5,0x1
     21c:	00d70723          	sb	a3,14(a4)
     220:	000608a3          	sb	zero,17(a2) # 1011 <stable>
     224:	02d78da3          	sb	a3,59(a5) # 103b <FH_TUERMODUL__SFHA_copy>
     228:	00008067          	ret
     22c:	000017b7          	lui	a5,0x1
     230:	04c7c783          	lbu	a5,76(a5) # 104c <FH_TUERMODUL__SFHZ_ZENTRAL>
     234:	02078063          	beqz	a5,254 <generic_KINDERSICHERUNG_CTRL.part.0+0x168>
     238:	000017b7          	lui	a5,0x1
     23c:	0487c783          	lbu	a5,72(a5) # 1048 <FH_TUERMODUL__SFHA_ZENTRAL>
     240:	0e079263          	bnez	a5,324 <generic_KINDERSICHERUNG_CTRL.part.0+0x238>
     244:	00008067          	ret
     248:	00001737          	lui	a4,0x1
     24c:	04974703          	lbu	a4,73(a4) # 1049 <FH_TUERMODUL__SFHZ_MEC_old>
     250:	04070663          	beqz	a4,29c <generic_KINDERSICHERUNG_CTRL.part.0+0x1b0>
     254:	00008067          	ret
     258:	08060a63          	beqz	a2,2ec <generic_KINDERSICHERUNG_CTRL.part.0+0x200>
     25c:	00100793          	li	a5,1
     260:	00001537          	lui	a0,0x1
     264:	000015b7          	lui	a1,0x1
     268:	00001637          	lui	a2,0x1
     26c:	00d70623          	sb	a3,12(a4)
     270:	000508a3          	sb	zero,17(a0) # 1011 <stable>
     274:	02f58f23          	sb	a5,62(a1) # 103e <FH_TUERMODUL__SFHZ_copy>
     278:	02f60da3          	sb	a5,59(a2) # 103b <FH_TUERMODUL__SFHA_copy>
     27c:	00008067          	ret
     280:	000017b7          	lui	a5,0x1
     284:	00d7c703          	lbu	a4,13(a5) # 100d <MEC_KINDERSICHERUNG_CTRL_next_state>
     288:	00100693          	li	a3,1
     28c:	f6d712e3          	bne	a4,a3,1f0 <generic_KINDERSICHERUNG_CTRL.part.0+0x104>
     290:	000016b7          	lui	a3,0x1
     294:	0496c683          	lbu	a3,73(a3) # 1049 <FH_TUERMODUL__SFHZ_MEC_old>
     298:	18069e63          	bnez	a3,434 <generic_KINDERSICHERUNG_CTRL.part.0+0x348>
     29c:	00001737          	lui	a4,0x1
     2a0:	000708a3          	sb	zero,17(a4) # 1011 <stable>
     2a4:	000016b7          	lui	a3,0x1
     2a8:	00100713          	li	a4,1
     2ac:	02e68f23          	sb	a4,62(a3) # 103e <FH_TUERMODUL__SFHZ_copy>
     2b0:	00e786a3          	sb	a4,13(a5)
     2b4:	00008067          	ret
     2b8:	00001737          	lui	a4,0x1
     2bc:	00e74683          	lbu	a3,14(a4) # 100e <ZENTRAL_KINDERSICHERUNG_CTRL_next_state>
     2c0:	f2f698e3          	bne	a3,a5,1f0 <generic_KINDERSICHERUNG_CTRL.part.0+0x104>
     2c4:	000017b7          	lui	a5,0x1
     2c8:	04b7c783          	lbu	a5,75(a5) # 104b <FH_TUERMODUL__SFHZ_ZENTRAL_old>
     2cc:	14079263          	bnez	a5,410 <generic_KINDERSICHERUNG_CTRL.part.0+0x324>
     2d0:	000017b7          	lui	a5,0x1
     2d4:	000788a3          	sb	zero,17(a5) # 1011 <stable>
     2d8:	000016b7          	lui	a3,0x1
     2dc:	00100793          	li	a5,1
     2e0:	02f68f23          	sb	a5,62(a3) # 103e <FH_TUERMODUL__SFHZ_copy>
     2e4:	00f70723          	sb	a5,14(a4)
     2e8:	00008067          	ret
     2ec:	000015b7          	lui	a1,0x1
     2f0:	000017b7          	lui	a5,0x1
     2f4:	00100613          	li	a2,1
     2f8:	00d70623          	sb	a3,12(a4)
     2fc:	000588a3          	sb	zero,17(a1) # 1011 <stable>
     300:	02c78f23          	sb	a2,62(a5) # 103e <FH_TUERMODUL__SFHZ_copy>
     304:	00008067          	ret
     308:	000015b7          	lui	a1,0x1
     30c:	000017b7          	lui	a5,0x1
     310:	00100613          	li	a2,1
     314:	00d70623          	sb	a3,12(a4)
     318:	000588a3          	sb	zero,17(a1) # 1011 <stable>
     31c:	02c78da3          	sb	a2,59(a5) # 103b <FH_TUERMODUL__SFHA_copy>
     320:	00008067          	ret
     324:	000017b7          	lui	a5,0x1
     328:	000788a3          	sb	zero,17(a5) # 1011 <stable>
     32c:	00001637          	lui	a2,0x1
     330:	00100793          	li	a5,1
     334:	000016b7          	lui	a3,0x1
     338:	02f60da3          	sb	a5,59(a2) # 103b <FH_TUERMODUL__SFHA_copy>
     33c:	00f70623          	sb	a5,12(a4)
     340:	02f68f23          	sb	a5,62(a3) # 103e <FH_TUERMODUL__SFHZ_copy>
     344:	00008067          	ret
     348:	000016b7          	lui	a3,0x1
     34c:	0456c683          	lbu	a3,69(a3) # 1045 <FH_TUERMODUL__SFHA_MEC_old>
     350:	08069863          	bnez	a3,3e0 <generic_KINDERSICHERUNG_CTRL.part.0+0x2f4>
     354:	00001637          	lui	a2,0x1
     358:	000016b7          	lui	a3,0x1
     35c:	00e786a3          	sb	a4,13(a5)
     360:	000608a3          	sb	zero,17(a2) # 1011 <stable>
     364:	02e68da3          	sb	a4,59(a3) # 103b <FH_TUERMODUL__SFHA_copy>
     368:	00008067          	ret
     36c:	000017b7          	lui	a5,0x1
     370:	0487c783          	lbu	a5,72(a5) # 1048 <FH_TUERMODUL__SFHA_ZENTRAL>
     374:	fa0798e3          	bnez	a5,324 <generic_KINDERSICHERUNG_CTRL.part.0+0x238>
     378:	000017b7          	lui	a5,0x1
     37c:	000788a3          	sb	zero,17(a5) # 1011 <stable>
     380:	000016b7          	lui	a3,0x1
     384:	00100793          	li	a5,1
     388:	02f68f23          	sb	a5,62(a3) # 103e <FH_TUERMODUL__SFHZ_copy>
     38c:	00f70623          	sb	a5,12(a4)
     390:	00008067          	ret
     394:	000017b7          	lui	a5,0x1
     398:	000788a3          	sb	zero,17(a5) # 1011 <stable>
     39c:	000016b7          	lui	a3,0x1
     3a0:	00100793          	li	a5,1
     3a4:	02f68da3          	sb	a5,59(a3) # 103b <FH_TUERMODUL__SFHA_copy>
     3a8:	00f70623          	sb	a5,12(a4)
     3ac:	00008067          	ret
     3b0:	000017b7          	lui	a5,0x1
     3b4:	04c7c783          	lbu	a5,76(a5) # 104c <FH_TUERMODUL__SFHZ_ZENTRAL>
     3b8:	0a079063          	bnez	a5,458 <generic_KINDERSICHERUNG_CTRL.part.0+0x36c>
     3bc:	000017b7          	lui	a5,0x1
     3c0:	04b7c783          	lbu	a5,75(a5) # 104b <FH_TUERMODUL__SFHZ_ZENTRAL_old>
     3c4:	e80788e3          	beqz	a5,254 <generic_KINDERSICHERUNG_CTRL.part.0+0x168>
     3c8:	00001637          	lui	a2,0x1
     3cc:	000017b7          	lui	a5,0x1
     3d0:	00d70723          	sb	a3,14(a4)
     3d4:	000608a3          	sb	zero,17(a2) # 1011 <stable>
     3d8:	02078f23          	sb	zero,62(a5) # 103e <FH_TUERMODUL__SFHZ_copy>
     3dc:	00008067          	ret
     3e0:	000016b7          	lui	a3,0x1
     3e4:	04a6c683          	lbu	a3,74(a3) # 104a <FH_TUERMODUL__SFHZ_MEC>
     3e8:	e60690e3          	bnez	a3,248 <generic_KINDERSICHERUNG_CTRL.part.0+0x15c>
     3ec:	000016b7          	lui	a3,0x1
     3f0:	0496c683          	lbu	a3,73(a3) # 1049 <FH_TUERMODUL__SFHZ_MEC_old>
     3f4:	e60680e3          	beqz	a3,254 <generic_KINDERSICHERUNG_CTRL.part.0+0x168>
     3f8:	00001637          	lui	a2,0x1
     3fc:	000016b7          	lui	a3,0x1
     400:	00e786a3          	sb	a4,13(a5)
     404:	000608a3          	sb	zero,17(a2) # 1011 <stable>
     408:	02068f23          	sb	zero,62(a3) # 103e <FH_TUERMODUL__SFHZ_copy>
     40c:	00008067          	ret
     410:	000017b7          	lui	a5,0x1
     414:	0477c783          	lbu	a5,71(a5) # 1047 <FH_TUERMODUL__SFHA_ZENTRAL_old>
     418:	e2078ee3          	beqz	a5,254 <generic_KINDERSICHERUNG_CTRL.part.0+0x168>
     41c:	00001637          	lui	a2,0x1
     420:	000017b7          	lui	a5,0x1
     424:	00d70723          	sb	a3,14(a4)
     428:	000608a3          	sb	zero,17(a2) # 1011 <stable>
     42c:	02078da3          	sb	zero,59(a5) # 103b <FH_TUERMODUL__SFHA_copy>
     430:	00008067          	ret
     434:	000016b7          	lui	a3,0x1
     438:	0456c683          	lbu	a3,69(a3) # 1045 <FH_TUERMODUL__SFHA_MEC_old>
     43c:	e0068ce3          	beqz	a3,254 <generic_KINDERSICHERUNG_CTRL.part.0+0x168>
     440:	00001637          	lui	a2,0x1
     444:	000016b7          	lui	a3,0x1
     448:	00e786a3          	sb	a4,13(a5)
     44c:	000608a3          	sb	zero,17(a2) # 1011 <stable>
     450:	02068da3          	sb	zero,59(a3) # 103b <FH_TUERMODUL__SFHA_copy>
     454:	00008067          	ret
     458:	000017b7          	lui	a5,0x1
     45c:	04b7c783          	lbu	a5,75(a5) # 104b <FH_TUERMODUL__SFHZ_ZENTRAL_old>
     460:	e60788e3          	beqz	a5,2d0 <generic_KINDERSICHERUNG_CTRL.part.0+0x1e4>
     464:	00008067          	ret

00000468 <generic_FH_TUERMODUL_CTRL.part.0>:
     468:	000017b7          	lui	a5,0x1
     46c:	0a878793          	addi	a5,a5,168 # 10a8 <Bitlist>
     470:	00a7c703          	lbu	a4,10(a5)
     474:	00071863          	bnez	a4,484 <generic_FH_TUERMODUL_CTRL.part.0+0x1c>
     478:	00001737          	lui	a4,0x1
     47c:	00300693          	li	a3,3
     480:	00d70623          	sb	a3,12(a4) # 100c <KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state>
     484:	0137c703          	lbu	a4,19(a5)
     488:	00071a63          	bnez	a4,49c <generic_FH_TUERMODUL_CTRL.part.0+0x34>
     48c:	00001737          	lui	a4,0x1
     490:	00100693          	li	a3,1
     494:	00078023          	sb	zero,0(a5)
     498:	00d70023          	sb	a3,0(a4) # 1000 <__data_end>
     49c:	00001637          	lui	a2,0x1
     4a0:	00b64683          	lbu	a3,11(a2) # 100b <B_FH_TUERMODUL_CTRL_next_state>
     4a4:	00100713          	li	a4,1
     4a8:	00e785a3          	sb	a4,11(a5)
     4ac:	00e78a23          	sb	a4,20(a5)
     4b0:	00200593          	li	a1,2
     4b4:	14b68263          	beq	a3,a1,5f8 <generic_FH_TUERMODUL_CTRL.part.0+0x190>
     4b8:	00300513          	li	a0,3
     4bc:	04a68c63          	beq	a3,a0,514 <generic_FH_TUERMODUL_CTRL.part.0+0xac>
     4c0:	1ce69a63          	bne	a3,a4,694 <generic_FH_TUERMODUL_CTRL.part.0+0x22c>
     4c4:	00001737          	lui	a4,0x1
     4c8:	08c72703          	lw	a4,140(a4) # 108c <FH_TUERMODUL_CTRL__N>
     4cc:	03b00693          	li	a3,59
     4d0:	22d70263          	beq	a4,a3,6f4 <generic_FH_TUERMODUL_CTRL.part.0+0x28c>
     4d4:	000016b7          	lui	a3,0x1
     4d8:	00a6c603          	lbu	a2,10(a3) # 100a <A_FH_TUERMODUL_CTRL_next_state>
     4dc:	00100713          	li	a4,1
     4e0:	0ce60e63          	beq	a2,a4,5bc <generic_FH_TUERMODUL_CTRL.part.0+0x154>
     4e4:	00001537          	lui	a0,0x1
     4e8:	000015b7          	lui	a1,0x1
     4ec:	00001637          	lui	a2,0x1
     4f0:	00e68523          	sb	a4,10(a3)
     4f4:	000508a3          	sb	zero,17(a0) # 1011 <stable>
     4f8:	0805a623          	sw	zero,140(a1) # 108c <FH_TUERMODUL_CTRL__N>
     4fc:	00e604a3          	sb	a4,9(a2) # 1009 <WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state>
     500:	0047c683          	lbu	a3,4(a5)
     504:	0067c703          	lbu	a4,6(a5)
     508:	00d782a3          	sb	a3,5(a5)
     50c:	00e783a3          	sb	a4,7(a5)
     510:	00008067          	ret
     514:	000016b7          	lui	a3,0x1
     518:	08c6a583          	lw	a1,140(a3) # 108c <FH_TUERMODUL_CTRL__N>
     51c:	03c00693          	li	a3,60
     520:	04b6d463          	bge	a3,a1,568 <generic_FH_TUERMODUL_CTRL.part.0+0x100>
     524:	000015b7          	lui	a1,0x1
     528:	0885a583          	lw	a1,136(a1) # 1088 <FH_TUERMODUL_CTRL__N_old>
     52c:	02b6ce63          	blt	a3,a1,568 <generic_FH_TUERMODUL_CTRL.part.0+0x100>
     530:	000016b7          	lui	a3,0x1
     534:	000015b7          	lui	a1,0x1
     538:	04e6c683          	lbu	a3,78(a3) # 104e <FH_TUERMODUL_CTRL__INREVERS1>
     53c:	0505c583          	lbu	a1,80(a1) # 1050 <FH_TUERMODUL_CTRL__INREVERS2>
     540:	00b6e6b3          	or	a3,a3,a1
     544:	02069263          	bnez	a3,568 <generic_FH_TUERMODUL_CTRL.part.0+0x100>
     548:	00001537          	lui	a0,0x1
     54c:	000015b7          	lui	a1,0x1
     550:	000016b7          	lui	a3,0x1
     554:	00e605a3          	sb	a4,11(a2)
     558:	000508a3          	sb	zero,17(a0) # 1011 <stable>
     55c:	02058c23          	sb	zero,56(a1) # 1038 <FH_DU>
     560:	02068aa3          	sb	zero,53(a3) # 1035 <FH_TUERMODUL__MFHA_copy>
     564:	f71ff06f          	j	4d4 <generic_FH_TUERMODUL_CTRL.part.0+0x6c>
     568:	00001737          	lui	a4,0x1
     56c:	04374703          	lbu	a4,67(a4) # 1043 <FH_TUERMODUL__BLOCK>
     570:	12071a63          	bnez	a4,6a4 <generic_FH_TUERMODUL_CTRL.part.0+0x23c>
     574:	000016b7          	lui	a3,0x1
     578:	0086c703          	lbu	a4,8(a3) # 1008 <INITIALISIERT_FH_TUERMODUL_CTRL_next_state>
     57c:	00200613          	li	a2,2
     580:	38c70663          	beq	a4,a2,90c <generic_FH_TUERMODUL_CTRL.part.0+0x4a4>
     584:	00300593          	li	a1,3
     588:	32b70863          	beq	a4,a1,8b8 <generic_FH_TUERMODUL_CTRL.part.0+0x450>
     58c:	00100513          	li	a0,1
     590:	2aa71e63          	bne	a4,a0,84c <generic_FH_TUERMODUL_CTRL.part.0+0x3e4>
     594:	00001537          	lui	a0,0x1
     598:	07c52803          	lw	a6,124(a0) # 107c <FH_TUERMODUL__POSITION>
     59c:	19400513          	li	a0,404
     5a0:	41055e63          	bge	a0,a6,9bc <generic_FH_TUERMODUL_CTRL.part.0+0x554>
     5a4:	00001637          	lui	a2,0x1
     5a8:	00001737          	lui	a4,0x1
     5ac:	00b68423          	sb	a1,8(a3)
     5b0:	000608a3          	sb	zero,17(a2) # 1011 <stable>
     5b4:	02070aa3          	sb	zero,53(a4) # 1035 <FH_TUERMODUL__MFHA_copy>
     5b8:	f1dff06f          	j	4d4 <generic_FH_TUERMODUL_CTRL.part.0+0x6c>
     5bc:	00001737          	lui	a4,0x1
     5c0:	01074703          	lbu	a4,16(a4) # 1010 <step>
     5c4:	1cc70063          	beq	a4,a2,784 <generic_FH_TUERMODUL_CTRL.part.0+0x31c>
     5c8:	00001737          	lui	a4,0x1
     5cc:	00974683          	lbu	a3,9(a4) # 1009 <WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state>
     5d0:	f2c688e3          	beq	a3,a2,500 <generic_FH_TUERMODUL_CTRL.part.0+0x98>
     5d4:	00100693          	li	a3,1
     5d8:	00d704a3          	sb	a3,9(a4)
     5dc:	0047c683          	lbu	a3,4(a5)
     5e0:	0067c703          	lbu	a4,6(a5)
     5e4:	00001637          	lui	a2,0x1
     5e8:	000608a3          	sb	zero,17(a2) # 1011 <stable>
     5ec:	00d782a3          	sb	a3,5(a5)
     5f0:	00e783a3          	sb	a4,7(a5)
     5f4:	00008067          	ret
     5f8:	00001737          	lui	a4,0x1
     5fc:	04374703          	lbu	a4,67(a4) # 1043 <FH_TUERMODUL__BLOCK>
     600:	04070863          	beqz	a4,650 <generic_FH_TUERMODUL_CTRL.part.0+0x1e8>
     604:	00001737          	lui	a4,0x1
     608:	04174703          	lbu	a4,65(a4) # 1041 <FH_TUERMODUL__BLOCK_old>
     60c:	04071263          	bnez	a4,650 <generic_FH_TUERMODUL_CTRL.part.0+0x1e8>
     610:	00001737          	lui	a4,0x1
     614:	03974703          	lbu	a4,57(a4) # 1039 <FH_TUERMODUL__MFHZ>
     618:	02070c63          	beqz	a4,650 <generic_FH_TUERMODUL_CTRL.part.0+0x1e8>
     61c:	00001737          	lui	a4,0x1
     620:	01472883          	lw	a7,20(a4) # 1014 <time>
     624:	00001837          	lui	a6,0x1
     628:	00300713          	li	a4,3
     62c:	00001537          	lui	a0,0x1
     630:	000015b7          	lui	a1,0x1
     634:	000016b7          	lui	a3,0x1
     638:	09182823          	sw	a7,144(a6) # 1090 <sc_FH_TUERMODUL_CTRL_2329_1>
     63c:	000508a3          	sb	zero,17(a0) # 1011 <stable>
     640:	02058c23          	sb	zero,56(a1) # 1038 <FH_DU>
     644:	00e605a3          	sb	a4,11(a2)
     648:	00e68423          	sb	a4,8(a3) # 1008 <INITIALISIERT_FH_TUERMODUL_CTRL_next_state>
     64c:	e89ff06f          	j	4d4 <generic_FH_TUERMODUL_CTRL.part.0+0x6c>
     650:	000016b7          	lui	a3,0x1
     654:	00f6c703          	lbu	a4,15(a3) # 100f <NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state>
     658:	00200613          	li	a2,2
     65c:	0ac70e63          	beq	a4,a2,718 <generic_FH_TUERMODUL_CTRL.part.0+0x2b0>
     660:	00300593          	li	a1,3
     664:	1ab70a63          	beq	a4,a1,818 <generic_FH_TUERMODUL_CTRL.part.0+0x3b0>
     668:	00100613          	li	a2,1
     66c:	18c71e63          	bne	a4,a2,808 <generic_FH_TUERMODUL_CTRL.part.0+0x3a0>
     670:	00001737          	lui	a4,0x1
     674:	03f74703          	lbu	a4,63(a4) # 103f <FH_TUERMODUL__SFHZ>
     678:	e4071ee3          	bnez	a4,4d4 <generic_FH_TUERMODUL_CTRL.part.0+0x6c>
     67c:	00001637          	lui	a2,0x1
     680:	00001737          	lui	a4,0x1
     684:	00b687a3          	sb	a1,15(a3)
     688:	000608a3          	sb	zero,17(a2) # 1011 <stable>
     68c:	02070c23          	sb	zero,56(a4) # 1038 <FH_DU>
     690:	e45ff06f          	j	4d4 <generic_FH_TUERMODUL_CTRL.part.0+0x6c>
     694:	00001737          	lui	a4,0x1
     698:	00b605a3          	sb	a1,11(a2)
     69c:	000708a3          	sb	zero,17(a4) # 1011 <stable>
     6a0:	e35ff06f          	j	4d4 <generic_FH_TUERMODUL_CTRL.part.0+0x6c>
     6a4:	00001737          	lui	a4,0x1
     6a8:	04174703          	lbu	a4,65(a4) # 1041 <FH_TUERMODUL__BLOCK_old>
     6ac:	ec0714e3          	bnez	a4,574 <generic_FH_TUERMODUL_CTRL.part.0+0x10c>
     6b0:	00001737          	lui	a4,0x1
     6b4:	03674703          	lbu	a4,54(a4) # 1036 <FH_TUERMODUL__MFHA>
     6b8:	08070463          	beqz	a4,740 <generic_FH_TUERMODUL_CTRL.part.0+0x2d8>
     6bc:	00001737          	lui	a4,0x1
     6c0:	01472303          	lw	t1,20(a4) # 1014 <time>
     6c4:	000018b7          	lui	a7,0x1
     6c8:	00001837          	lui	a6,0x1
     6cc:	00001537          	lui	a0,0x1
     6d0:	00200593          	li	a1,2
     6d4:	00001737          	lui	a4,0x1
     6d8:	00300693          	li	a3,3
     6dc:	0868ac23          	sw	t1,152(a7) # 1098 <sc_FH_TUERMODUL_CTRL_2375_2>
     6e0:	000808a3          	sb	zero,17(a6) # 1011 <stable>
     6e4:	02050aa3          	sb	zero,53(a0) # 1035 <FH_TUERMODUL__MFHA_copy>
     6e8:	00b605a3          	sb	a1,11(a2)
     6ec:	00d707a3          	sb	a3,15(a4) # 100f <NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state>
     6f0:	de5ff06f          	j	4d4 <generic_FH_TUERMODUL_CTRL.part.0+0x6c>
     6f4:	000016b7          	lui	a3,0x1
     6f8:	0886a683          	lw	a3,136(a3) # 1088 <FH_TUERMODUL_CTRL__N_old>
     6fc:	dce68ce3          	beq	a3,a4,4d4 <generic_FH_TUERMODUL_CTRL.part.0+0x6c>
     700:	000016b7          	lui	a3,0x1
     704:	00001737          	lui	a4,0x1
     708:	00a605a3          	sb	a0,11(a2)
     70c:	000688a3          	sb	zero,17(a3) # 1011 <stable>
     710:	00a70423          	sb	a0,8(a4) # 1008 <INITIALISIERT_FH_TUERMODUL_CTRL_next_state>
     714:	dc1ff06f          	j	4d4 <generic_FH_TUERMODUL_CTRL.part.0+0x6c>
     718:	00001737          	lui	a4,0x1
     71c:	03c74703          	lbu	a4,60(a4) # 103c <FH_TUERMODUL__SFHA>
     720:	da071ae3          	bnez	a4,4d4 <generic_FH_TUERMODUL_CTRL.part.0+0x6c>
     724:	000015b7          	lui	a1,0x1
     728:	00001637          	lui	a2,0x1
     72c:	00300713          	li	a4,3
     730:	000588a3          	sb	zero,17(a1) # 1011 <stable>
     734:	02060aa3          	sb	zero,53(a2) # 1035 <FH_TUERMODUL__MFHA_copy>
     738:	00e687a3          	sb	a4,15(a3)
     73c:	d99ff06f          	j	4d4 <generic_FH_TUERMODUL_CTRL.part.0+0x6c>
     740:	00001737          	lui	a4,0x1
     744:	03974703          	lbu	a4,57(a4) # 1039 <FH_TUERMODUL__MFHZ>
     748:	e20706e3          	beqz	a4,574 <generic_FH_TUERMODUL_CTRL.part.0+0x10c>
     74c:	00001737          	lui	a4,0x1
     750:	01472303          	lw	t1,20(a4) # 1014 <time>
     754:	000018b7          	lui	a7,0x1
     758:	00001837          	lui	a6,0x1
     75c:	00001537          	lui	a0,0x1
     760:	00200593          	li	a1,2
     764:	00001737          	lui	a4,0x1
     768:	00300693          	li	a3,3
     76c:	0868aa23          	sw	t1,148(a7) # 1094 <sc_FH_TUERMODUL_CTRL_2352_1>
     770:	000808a3          	sb	zero,17(a6) # 1011 <stable>
     774:	02050c23          	sb	zero,56(a0) # 1038 <FH_DU>
     778:	00b605a3          	sb	a1,11(a2)
     77c:	00d707a3          	sb	a3,15(a4) # 100f <NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state>
     780:	d55ff06f          	j	4d4 <generic_FH_TUERMODUL_CTRL.part.0+0x6c>
     784:	00001637          	lui	a2,0x1
     788:	0a062603          	lw	a2,160(a2) # 10a0 <tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL>
     78c:	00060a63          	beqz	a2,7a0 <generic_FH_TUERMODUL_CTRL.part.0+0x338>
     790:	000015b7          	lui	a1,0x1
     794:	0145a583          	lw	a1,20(a1) # 1014 <time>
     798:	40c58633          	sub	a2,a1,a2
     79c:	0ce60e63          	beq	a2,a4,878 <generic_FH_TUERMODUL_CTRL.part.0+0x410>
     7a0:	00001737          	lui	a4,0x1
     7a4:	00974683          	lbu	a3,9(a4) # 1009 <WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state>
     7a8:	00100613          	li	a2,1
     7ac:	e2c694e3          	bne	a3,a2,5d4 <generic_FH_TUERMODUL_CTRL.part.0+0x16c>
     7b0:	00001637          	lui	a2,0x1
     7b4:	09c62603          	lw	a2,156(a2) # 109c <tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL>
     7b8:	d40604e3          	beqz	a2,500 <generic_FH_TUERMODUL_CTRL.part.0+0x98>
     7bc:	000015b7          	lui	a1,0x1
     7c0:	0145a583          	lw	a1,20(a1) # 1014 <time>
     7c4:	ffd58593          	addi	a1,a1,-3
     7c8:	d2c59ce3          	bne	a1,a2,500 <generic_FH_TUERMODUL_CTRL.part.0+0x98>
     7cc:	00001637          	lui	a2,0x1
     7d0:	000015b7          	lui	a1,0x1
     7d4:	03964603          	lbu	a2,57(a2) # 1039 <FH_TUERMODUL__MFHZ>
     7d8:	0365c583          	lbu	a1,54(a1) # 1036 <FH_TUERMODUL__MFHA>
     7dc:	00b66633          	or	a2,a2,a1
     7e0:	d20610e3          	bnez	a2,500 <generic_FH_TUERMODUL_CTRL.part.0+0x98>
     7e4:	000015b7          	lui	a1,0x1
     7e8:	08c5a603          	lw	a2,140(a1) # 108c <FH_TUERMODUL_CTRL__N>
     7ec:	d0c05ae3          	blez	a2,500 <generic_FH_TUERMODUL_CTRL.part.0+0x98>
     7f0:	fff60613          	addi	a2,a2,-1
     7f4:	00001537          	lui	a0,0x1
     7f8:	08c5a623          	sw	a2,140(a1)
     7fc:	00d704a3          	sb	a3,9(a4)
     800:	000508a3          	sb	zero,17(a0) # 1011 <stable>
     804:	cfdff06f          	j	500 <generic_FH_TUERMODUL_CTRL.part.0+0x98>
     808:	00001737          	lui	a4,0x1
     80c:	00b687a3          	sb	a1,15(a3)
     810:	000708a3          	sb	zero,17(a4) # 1011 <stable>
     814:	cc1ff06f          	j	4d4 <generic_FH_TUERMODUL_CTRL.part.0+0x6c>
     818:	00001737          	lui	a4,0x1
     81c:	03c74703          	lbu	a4,60(a4) # 103c <FH_TUERMODUL__SFHA>
     820:	02071e63          	bnez	a4,85c <generic_FH_TUERMODUL_CTRL.part.0+0x3f4>
     824:	00001737          	lui	a4,0x1
     828:	03f74703          	lbu	a4,63(a4) # 103f <FH_TUERMODUL__SFHZ>
     82c:	ca0704e3          	beqz	a4,4d4 <generic_FH_TUERMODUL_CTRL.part.0+0x6c>
     830:	00001737          	lui	a4,0x1
     834:	000708a3          	sb	zero,17(a4) # 1011 <stable>
     838:	00001637          	lui	a2,0x1
     83c:	00100713          	li	a4,1
     840:	02e60c23          	sb	a4,56(a2) # 1038 <FH_DU>
     844:	00e687a3          	sb	a4,15(a3)
     848:	c8dff06f          	j	4d4 <generic_FH_TUERMODUL_CTRL.part.0+0x6c>
     84c:	00001737          	lui	a4,0x1
     850:	00b68423          	sb	a1,8(a3)
     854:	000708a3          	sb	zero,17(a4) # 1011 <stable>
     858:	c7dff06f          	j	4d4 <generic_FH_TUERMODUL_CTRL.part.0+0x6c>
     85c:	00001537          	lui	a0,0x1
     860:	00001737          	lui	a4,0x1
     864:	00100593          	li	a1,1
     868:	00c687a3          	sb	a2,15(a3)
     86c:	000508a3          	sb	zero,17(a0) # 1011 <stable>
     870:	02b70aa3          	sb	a1,53(a4) # 1035 <FH_TUERMODUL__MFHA_copy>
     874:	c61ff06f          	j	4d4 <generic_FH_TUERMODUL_CTRL.part.0+0x6c>
     878:	00001737          	lui	a4,0x1
     87c:	000015b7          	lui	a1,0x1
     880:	03974703          	lbu	a4,57(a4) # 1039 <FH_TUERMODUL__MFHZ>
     884:	0365c583          	lbu	a1,54(a1) # 1036 <FH_TUERMODUL__MFHA>
     888:	00b76733          	or	a4,a4,a1
     88c:	f0070ae3          	beqz	a4,7a0 <generic_FH_TUERMODUL_CTRL.part.0+0x338>
     890:	00c68523          	sb	a2,10(a3)
     894:	000016b7          	lui	a3,0x1
     898:	08c6a703          	lw	a4,140(a3) # 108c <FH_TUERMODUL_CTRL__N>
     89c:	00001537          	lui	a0,0x1
     8a0:	000015b7          	lui	a1,0x1
     8a4:	00c70733          	add	a4,a4,a2
     8a8:	08e6a623          	sw	a4,140(a3)
     8ac:	000508a3          	sb	zero,17(a0) # 1011 <stable>
     8b0:	00c584a3          	sb	a2,9(a1) # 1009 <WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state>
     8b4:	c4dff06f          	j	500 <generic_FH_TUERMODUL_CTRL.part.0+0x98>
     8b8:	00001737          	lui	a4,0x1
     8bc:	03f74703          	lbu	a4,63(a4) # 103f <FH_TUERMODUL__SFHZ>
     8c0:	08070863          	beqz	a4,950 <generic_FH_TUERMODUL_CTRL.part.0+0x4e8>
     8c4:	00001737          	lui	a4,0x1
     8c8:	03d74703          	lbu	a4,61(a4) # 103d <FH_TUERMODUL__SFHZ_old>
     8cc:	08071263          	bnez	a4,950 <generic_FH_TUERMODUL_CTRL.part.0+0x4e8>
     8d0:	00001737          	lui	a4,0x1
     8d4:	07c72703          	lw	a4,124(a4) # 107c <FH_TUERMODUL__POSITION>
     8d8:	06e05c63          	blez	a4,950 <generic_FH_TUERMODUL_CTRL.part.0+0x4e8>
     8dc:	00100713          	li	a4,1
     8e0:	000018b7          	lui	a7,0x1
     8e4:	00001837          	lui	a6,0x1
     8e8:	00001537          	lui	a0,0x1
     8ec:	000015b7          	lui	a1,0x1
     8f0:	00c68423          	sb	a2,8(a3)
     8f4:	000888a3          	sb	zero,17(a7) # 1011 <stable>
     8f8:	00c80223          	sb	a2,4(a6) # 1004 <SCHLIESSEN_FH_TUERMODUL_CTRL_next_state>
     8fc:	00c50323          	sb	a2,6(a0) # 1006 <MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state>
     900:	00e788a3          	sb	a4,17(a5)
     904:	02e58c23          	sb	a4,56(a1) # 1038 <FH_DU>
     908:	bcdff06f          	j	4d4 <generic_FH_TUERMODUL_CTRL.part.0+0x6c>
     90c:	00001637          	lui	a2,0x1
     910:	07c62603          	lw	a2,124(a2) # 107c <FH_TUERMODUL__POSITION>
     914:	08c05663          	blez	a2,9a0 <generic_FH_TUERMODUL_CTRL.part.0+0x538>
     918:	00001537          	lui	a0,0x1
     91c:	00454603          	lbu	a2,4(a0) # 1004 <SCHLIESSEN_FH_TUERMODUL_CTRL_next_state>
     920:	00100593          	li	a1,1
     924:	0ab60c63          	beq	a2,a1,9dc <generic_FH_TUERMODUL_CTRL.part.0+0x574>
     928:	10e60863          	beq	a2,a4,a38 <generic_FH_TUERMODUL_CTRL.part.0+0x5d0>
     92c:	00001837          	lui	a6,0x1
     930:	00001637          	lui	a2,0x1
     934:	000016b7          	lui	a3,0x1
     938:	00e50223          	sb	a4,4(a0)
     93c:	00b788a3          	sb	a1,17(a5)
     940:	000808a3          	sb	zero,17(a6) # 1011 <stable>
     944:	00e60323          	sb	a4,6(a2) # 1006 <MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state>
     948:	02b68c23          	sb	a1,56(a3) # 1038 <FH_DU>
     94c:	b89ff06f          	j	4d4 <generic_FH_TUERMODUL_CTRL.part.0+0x6c>
     950:	00001737          	lui	a4,0x1
     954:	03c74703          	lbu	a4,60(a4) # 103c <FH_TUERMODUL__SFHA>
     958:	b6070ee3          	beqz	a4,4d4 <generic_FH_TUERMODUL_CTRL.part.0+0x6c>
     95c:	00001737          	lui	a4,0x1
     960:	03a74703          	lbu	a4,58(a4) # 103a <FH_TUERMODUL__SFHA_old>
     964:	b60718e3          	bnez	a4,4d4 <generic_FH_TUERMODUL_CTRL.part.0+0x6c>
     968:	00001737          	lui	a4,0x1
     96c:	07c72603          	lw	a2,124(a4) # 107c <FH_TUERMODUL__POSITION>
     970:	19400713          	li	a4,404
     974:	b6c740e3          	blt	a4,a2,4d4 <generic_FH_TUERMODUL_CTRL.part.0+0x6c>
     978:	00001737          	lui	a4,0x1
     97c:	000708a3          	sb	zero,17(a4) # 1011 <stable>
     980:	00001537          	lui	a0,0x1
     984:	00100713          	li	a4,1
     988:	00001637          	lui	a2,0x1
     98c:	00200593          	li	a1,2
     990:	02e50aa3          	sb	a4,53(a0) # 1035 <FH_TUERMODUL__MFHA_copy>
     994:	00e68423          	sb	a4,8(a3)
     998:	00b602a3          	sb	a1,5(a2) # 1005 <OEFFNEN_FH_TUERMODUL_CTRL_next_state>
     99c:	b39ff06f          	j	4d4 <generic_FH_TUERMODUL_CTRL.part.0+0x6c>
     9a0:	000015b7          	lui	a1,0x1
     9a4:	00001637          	lui	a2,0x1
     9a8:	00300713          	li	a4,3
     9ac:	000588a3          	sb	zero,17(a1) # 1011 <stable>
     9b0:	02060c23          	sb	zero,56(a2) # 1038 <FH_DU>
     9b4:	00e68423          	sb	a4,8(a3)
     9b8:	b1dff06f          	j	4d4 <generic_FH_TUERMODUL_CTRL.part.0+0x6c>
     9bc:	00001537          	lui	a0,0x1
     9c0:	00554583          	lbu	a1,5(a0) # 1005 <OEFFNEN_FH_TUERMODUL_CTRL_next_state>
     9c4:	0ee58463          	beq	a1,a4,aac <generic_FH_TUERMODUL_CTRL.part.0+0x644>
     9c8:	0ac58e63          	beq	a1,a2,a84 <generic_FH_TUERMODUL_CTRL.part.0+0x61c>
     9cc:	00001737          	lui	a4,0x1
     9d0:	00c502a3          	sb	a2,5(a0)
     9d4:	000708a3          	sb	zero,17(a4) # 1011 <stable>
     9d8:	afdff06f          	j	4d4 <generic_FH_TUERMODUL_CTRL.part.0+0x6c>
     9dc:	00001737          	lui	a4,0x1
     9e0:	03c74703          	lbu	a4,60(a4) # 103c <FH_TUERMODUL__SFHA>
     9e4:	00070863          	beqz	a4,9f4 <generic_FH_TUERMODUL_CTRL.part.0+0x58c>
     9e8:	00001737          	lui	a4,0x1
     9ec:	03a74703          	lbu	a4,58(a4) # 103a <FH_TUERMODUL__SFHA_old>
     9f0:	fa0708e3          	beqz	a4,9a0 <generic_FH_TUERMODUL_CTRL.part.0+0x538>
     9f4:	00001737          	lui	a4,0x1
     9f8:	03f74703          	lbu	a4,63(a4) # 103f <FH_TUERMODUL__SFHZ>
     9fc:	00070863          	beqz	a4,a0c <generic_FH_TUERMODUL_CTRL.part.0+0x5a4>
     a00:	00001737          	lui	a4,0x1
     a04:	03d74703          	lbu	a4,61(a4) # 103d <FH_TUERMODUL__SFHZ_old>
     a08:	f8070ce3          	beqz	a4,9a0 <generic_FH_TUERMODUL_CTRL.part.0+0x538>
     a0c:	00001637          	lui	a2,0x1
     a10:	00764683          	lbu	a3,7(a2) # 1007 <TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state>
     a14:	00100713          	li	a4,1
     a18:	1ce68863          	beq	a3,a4,be8 <generic_FH_TUERMODUL_CTRL.part.0+0x780>
     a1c:	00200593          	li	a1,2
     a20:	18b68063          	beq	a3,a1,ba0 <generic_FH_TUERMODUL_CTRL.part.0+0x738>
     a24:	000016b7          	lui	a3,0x1
     a28:	00b603a3          	sb	a1,7(a2)
     a2c:	00e788a3          	sb	a4,17(a5)
     a30:	000688a3          	sb	zero,17(a3) # 1011 <stable>
     a34:	aa1ff06f          	j	4d4 <generic_FH_TUERMODUL_CTRL.part.0+0x6c>
     a38:	00001737          	lui	a4,0x1
     a3c:	03f74703          	lbu	a4,63(a4) # 103f <FH_TUERMODUL__SFHZ>
     a40:	00071863          	bnez	a4,a50 <generic_FH_TUERMODUL_CTRL.part.0+0x5e8>
     a44:	00001737          	lui	a4,0x1
     a48:	03d74703          	lbu	a4,61(a4) # 103d <FH_TUERMODUL__SFHZ_old>
     a4c:	f4071ae3          	bnez	a4,9a0 <generic_FH_TUERMODUL_CTRL.part.0+0x538>
     a50:	00001637          	lui	a2,0x1
     a54:	00664683          	lbu	a3,6(a2) # 1006 <MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state>
     a58:	00100713          	li	a4,1
     a5c:	10e68463          	beq	a3,a4,b64 <generic_FH_TUERMODUL_CTRL.part.0+0x6fc>
     a60:	00200593          	li	a1,2
     a64:	0ab68c63          	beq	a3,a1,b1c <generic_FH_TUERMODUL_CTRL.part.0+0x6b4>
     a68:	00001537          	lui	a0,0x1
     a6c:	000016b7          	lui	a3,0x1
     a70:	00b60323          	sb	a1,6(a2)
     a74:	00e788a3          	sb	a4,17(a5)
     a78:	000508a3          	sb	zero,17(a0) # 1011 <stable>
     a7c:	02e68c23          	sb	a4,56(a3) # 1038 <FH_DU>
     a80:	a55ff06f          	j	4d4 <generic_FH_TUERMODUL_CTRL.part.0+0x6c>
     a84:	00001637          	lui	a2,0x1
     a88:	03f64603          	lbu	a2,63(a2) # 103f <FH_TUERMODUL__SFHZ>
     a8c:	04060c63          	beqz	a2,ae4 <generic_FH_TUERMODUL_CTRL.part.0+0x67c>
     a90:	00001637          	lui	a2,0x1
     a94:	03d64603          	lbu	a2,61(a2) # 103d <FH_TUERMODUL__SFHZ_old>
     a98:	04061663          	bnez	a2,ae4 <generic_FH_TUERMODUL_CTRL.part.0+0x67c>
     a9c:	000016b7          	lui	a3,0x1
     aa0:	00e502a3          	sb	a4,5(a0)
     aa4:	000688a3          	sb	zero,17(a3) # 1011 <stable>
     aa8:	a2dff06f          	j	4d4 <generic_FH_TUERMODUL_CTRL.part.0+0x6c>
     aac:	00001737          	lui	a4,0x1
     ab0:	03f74703          	lbu	a4,63(a4) # 103f <FH_TUERMODUL__SFHZ>
     ab4:	04070663          	beqz	a4,b00 <generic_FH_TUERMODUL_CTRL.part.0+0x698>
     ab8:	00001737          	lui	a4,0x1
     abc:	03d74703          	lbu	a4,61(a4) # 103d <FH_TUERMODUL__SFHZ_old>
     ac0:	04071063          	bnez	a4,b00 <generic_FH_TUERMODUL_CTRL.part.0+0x698>
     ac4:	000015b7          	lui	a1,0x1
     ac8:	00001637          	lui	a2,0x1
     acc:	00300713          	li	a4,3
     ad0:	000502a3          	sb	zero,5(a0)
     ad4:	000588a3          	sb	zero,17(a1) # 1011 <stable>
     ad8:	02060aa3          	sb	zero,53(a2) # 1035 <FH_TUERMODUL__MFHA_copy>
     adc:	00e68423          	sb	a4,8(a3)
     ae0:	9f5ff06f          	j	4d4 <generic_FH_TUERMODUL_CTRL.part.0+0x6c>
     ae4:	00001737          	lui	a4,0x1
     ae8:	03c74703          	lbu	a4,60(a4) # 103c <FH_TUERMODUL__SFHA>
     aec:	9e0714e3          	bnez	a4,4d4 <generic_FH_TUERMODUL_CTRL.part.0+0x6c>
     af0:	00001737          	lui	a4,0x1
     af4:	03a74703          	lbu	a4,58(a4) # 103a <FH_TUERMODUL__SFHA_old>
     af8:	fc0716e3          	bnez	a4,ac4 <generic_FH_TUERMODUL_CTRL.part.0+0x65c>
     afc:	9d9ff06f          	j	4d4 <generic_FH_TUERMODUL_CTRL.part.0+0x6c>
     b00:	00001737          	lui	a4,0x1
     b04:	03c74703          	lbu	a4,60(a4) # 103c <FH_TUERMODUL__SFHA>
     b08:	9c0706e3          	beqz	a4,4d4 <generic_FH_TUERMODUL_CTRL.part.0+0x6c>
     b0c:	00001737          	lui	a4,0x1
     b10:	03a74703          	lbu	a4,58(a4) # 103a <FH_TUERMODUL__SFHA_old>
     b14:	9c0710e3          	bnez	a4,4d4 <generic_FH_TUERMODUL_CTRL.part.0+0x6c>
     b18:	fadff06f          	j	ac4 <generic_FH_TUERMODUL_CTRL.part.0+0x65c>
     b1c:	0187c683          	lbu	a3,24(a5)
     b20:	10068263          	beqz	a3,c24 <generic_FH_TUERMODUL_CTRL.part.0+0x7bc>
     b24:	000016b7          	lui	a3,0x1
     b28:	0146a883          	lw	a7,20(a3) # 1014 <time>
     b2c:	00e60323          	sb	a4,6(a2)
     b30:	00001837          	lui	a6,0x1
     b34:	00001537          	lui	a0,0x1
     b38:	000015b7          	lui	a1,0x1
     b3c:	00001637          	lui	a2,0x1
     b40:	000016b7          	lui	a3,0x1
     b44:	00e78ba3          	sb	a4,23(a5)
     b48:	000788a3          	sb	zero,17(a5)
     b4c:	09182023          	sw	a7,128(a6) # 1080 <sc_FH_TUERMODUL_CTRL_1739_10>
     b50:	000508a3          	sb	zero,17(a0) # 1011 <stable>
     b54:	02058c23          	sb	zero,56(a1) # 1038 <FH_DU>
     b58:	04e606a3          	sb	a4,77(a2) # 104d <FH_TUERMODUL_CTRL__INREVERS1_copy>
     b5c:	02e68aa3          	sb	a4,53(a3) # 1035 <FH_TUERMODUL__MFHA_copy>
     b60:	975ff06f          	j	4d4 <generic_FH_TUERMODUL_CTRL.part.0+0x6c>
     b64:	0167c703          	lbu	a4,22(a5)
     b68:	00078ba3          	sb	zero,23(a5)
     b6c:	960704e3          	beqz	a4,4d4 <generic_FH_TUERMODUL_CTRL.part.0+0x6c>
     b70:	000018b7          	lui	a7,0x1
     b74:	00001837          	lui	a6,0x1
     b78:	00200513          	li	a0,2
     b7c:	000015b7          	lui	a1,0x1
     b80:	00001737          	lui	a4,0x1
     b84:	00d788a3          	sb	a3,17(a5)
     b88:	000888a3          	sb	zero,17(a7) # 1011 <stable>
     b8c:	040806a3          	sb	zero,77(a6) # 104d <FH_TUERMODUL_CTRL__INREVERS1_copy>
     b90:	00a60323          	sb	a0,6(a2)
     b94:	02058aa3          	sb	zero,53(a1) # 1035 <FH_TUERMODUL__MFHA_copy>
     b98:	02d70c23          	sb	a3,56(a4) # 1038 <FH_DU>
     b9c:	939ff06f          	j	4d4 <generic_FH_TUERMODUL_CTRL.part.0+0x6c>
     ba0:	0187c683          	lbu	a3,24(a5)
     ba4:	920688e3          	beqz	a3,4d4 <generic_FH_TUERMODUL_CTRL.part.0+0x6c>
     ba8:	000016b7          	lui	a3,0x1
     bac:	0146a883          	lw	a7,20(a3) # 1014 <time>
     bb0:	00e603a3          	sb	a4,7(a2)
     bb4:	00001837          	lui	a6,0x1
     bb8:	00001537          	lui	a0,0x1
     bbc:	000015b7          	lui	a1,0x1
     bc0:	00001637          	lui	a2,0x1
     bc4:	000016b7          	lui	a3,0x1
     bc8:	00e78ba3          	sb	a4,23(a5)
     bcc:	000788a3          	sb	zero,17(a5)
     bd0:	09182223          	sw	a7,132(a6) # 1084 <sc_FH_TUERMODUL_CTRL_1781_10>
     bd4:	000508a3          	sb	zero,17(a0) # 1011 <stable>
     bd8:	04e587a3          	sb	a4,79(a1) # 104f <FH_TUERMODUL_CTRL__INREVERS2_copy>
     bdc:	02060c23          	sb	zero,56(a2) # 1038 <FH_DU>
     be0:	02e68aa3          	sb	a4,53(a3) # 1035 <FH_TUERMODUL__MFHA_copy>
     be4:	8f1ff06f          	j	4d4 <generic_FH_TUERMODUL_CTRL.part.0+0x6c>
     be8:	0167c703          	lbu	a4,22(a5)
     bec:	00078ba3          	sb	zero,23(a5)
     bf0:	8e0702e3          	beqz	a4,4d4 <generic_FH_TUERMODUL_CTRL.part.0+0x6c>
     bf4:	000018b7          	lui	a7,0x1
     bf8:	00001837          	lui	a6,0x1
     bfc:	00001537          	lui	a0,0x1
     c00:	00200593          	li	a1,2
     c04:	00001737          	lui	a4,0x1
     c08:	00d788a3          	sb	a3,17(a5)
     c0c:	000888a3          	sb	zero,17(a7) # 1011 <stable>
     c10:	02d80c23          	sb	a3,56(a6) # 1038 <FH_DU>
     c14:	040507a3          	sb	zero,79(a0) # 104f <FH_TUERMODUL_CTRL__INREVERS2_copy>
     c18:	00b603a3          	sb	a1,7(a2)
     c1c:	02070aa3          	sb	zero,53(a4) # 1035 <FH_TUERMODUL__MFHA_copy>
     c20:	8b5ff06f          	j	4d4 <generic_FH_TUERMODUL_CTRL.part.0+0x6c>
     c24:	000016b7          	lui	a3,0x1
     c28:	03c6c683          	lbu	a3,60(a3) # 103c <FH_TUERMODUL__SFHA>
     c2c:	8a0684e3          	beqz	a3,4d4 <generic_FH_TUERMODUL_CTRL.part.0+0x6c>
     c30:	000016b7          	lui	a3,0x1
     c34:	03a6c683          	lbu	a3,58(a3) # 103a <FH_TUERMODUL__SFHA_old>
     c38:	88069ee3          	bnez	a3,4d4 <generic_FH_TUERMODUL_CTRL.part.0+0x6c>
     c3c:	000016b7          	lui	a3,0x1
     c40:	00e50223          	sb	a4,4(a0)
     c44:	00060323          	sb	zero,6(a2)
     c48:	000688a3          	sb	zero,17(a3) # 1011 <stable>
     c4c:	889ff06f          	j	4d4 <generic_FH_TUERMODUL_CTRL.part.0+0x6c>

00000c50 <interface>:
     c50:	000017b7          	lui	a5,0x1
     c54:	0a878793          	addi	a5,a5,168 # 10a8 <Bitlist>
     c58:	0047c703          	lbu	a4,4(a5)
     c5c:	0e071063          	bnez	a4,d3c <interface+0xec>
     c60:	0067c703          	lbu	a4,6(a5)
     c64:	0e071a63          	bnez	a4,d58 <interface+0x108>
     c68:	000016b7          	lui	a3,0x1
     c6c:	0986a703          	lw	a4,152(a3) # 1098 <sc_FH_TUERMODUL_CTRL_2375_2>
     c70:	00070e63          	beqz	a4,c8c <interface+0x3c>
     c74:	00001637          	lui	a2,0x1
     c78:	01462603          	lw	a2,20(a2) # 1014 <time>
     c7c:	00c70863          	beq	a4,a2,c8c <interface+0x3c>
     c80:	00001737          	lui	a4,0x1
     c84:	0806ac23          	sw	zero,152(a3)
     c88:	02070aa3          	sb	zero,53(a4) # 1035 <FH_TUERMODUL__MFHA_copy>
     c8c:	000016b7          	lui	a3,0x1
     c90:	0946a703          	lw	a4,148(a3) # 1094 <sc_FH_TUERMODUL_CTRL_2352_1>
     c94:	00070e63          	beqz	a4,cb0 <interface+0x60>
     c98:	00001637          	lui	a2,0x1
     c9c:	01462603          	lw	a2,20(a2) # 1014 <time>
     ca0:	00c70863          	beq	a4,a2,cb0 <interface+0x60>
     ca4:	00001737          	lui	a4,0x1
     ca8:	0806aa23          	sw	zero,148(a3)
     cac:	02070c23          	sb	zero,56(a4) # 1038 <FH_DU>
     cb0:	000016b7          	lui	a3,0x1
     cb4:	0906a703          	lw	a4,144(a3) # 1090 <sc_FH_TUERMODUL_CTRL_2329_1>
     cb8:	00070e63          	beqz	a4,cd4 <interface+0x84>
     cbc:	00001637          	lui	a2,0x1
     cc0:	01462603          	lw	a2,20(a2) # 1014 <time>
     cc4:	00c70863          	beq	a4,a2,cd4 <interface+0x84>
     cc8:	00001737          	lui	a4,0x1
     ccc:	0806a823          	sw	zero,144(a3)
     cd0:	02070c23          	sb	zero,56(a4) # 1038 <FH_DU>
     cd4:	000016b7          	lui	a3,0x1
     cd8:	0846a703          	lw	a4,132(a3) # 1084 <sc_FH_TUERMODUL_CTRL_1781_10>
     cdc:	00070a63          	beqz	a4,cf0 <interface+0xa0>
     ce0:	00001637          	lui	a2,0x1
     ce4:	01462603          	lw	a2,20(a2) # 1014 <time>
     ce8:	00c70463          	beq	a4,a2,cf0 <interface+0xa0>
     cec:	0806a223          	sw	zero,132(a3)
     cf0:	000016b7          	lui	a3,0x1
     cf4:	0806a703          	lw	a4,128(a3) # 1080 <sc_FH_TUERMODUL_CTRL_1739_10>
     cf8:	00070a63          	beqz	a4,d0c <interface+0xbc>
     cfc:	00001637          	lui	a2,0x1
     d00:	01462603          	lw	a2,20(a2) # 1014 <time>
     d04:	00c70463          	beq	a4,a2,d0c <interface+0xbc>
     d08:	0806a023          	sw	zero,128(a3)
     d0c:	0007c783          	lbu	a5,0(a5)
     d10:	00079c63          	bnez	a5,d28 <interface+0xd8>
     d14:	00001737          	lui	a4,0x1
     d18:	000017b7          	lui	a5,0x1
     d1c:	05872703          	lw	a4,88(a4) # 1058 <BLOCK_ERKENNUNG_CTRL__N>
     d20:	0547a783          	lw	a5,84(a5) # 1054 <BLOCK_ERKENNUNG_CTRL__N_old>
     d24:	00f70a63          	beq	a4,a5,d38 <interface+0xe8>
     d28:	000017b7          	lui	a5,0x1
     d2c:	0147a703          	lw	a4,20(a5) # 1014 <time>
     d30:	000017b7          	lui	a5,0x1
     d34:	0ae7a223          	sw	a4,164(a5) # 10a4 <tm_entered_EINSCHALTSTROM_MESSEN_BLOCK_ERKENNUNG_CTRLch_BLOCK_ERKENNUNG_CTRL__N_copy>
     d38:	00008067          	ret
     d3c:	00001737          	lui	a4,0x1
     d40:	01472703          	lw	a4,20(a4) # 1014 <time>
     d44:	000016b7          	lui	a3,0x1
     d48:	08e6ae23          	sw	a4,156(a3) # 109c <tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL>
     d4c:	000016b7          	lui	a3,0x1
     d50:	0ae6a023          	sw	a4,160(a3) # 10a0 <tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL>
     d54:	f15ff06f          	j	c68 <interface+0x18>
     d58:	00001737          	lui	a4,0x1
     d5c:	01472703          	lw	a4,20(a4) # 1014 <time>
     d60:	fedff06f          	j	d4c <interface+0xfc>

00000d64 <init>:
     d64:	000015b7          	lui	a1,0x1
     d68:	00001637          	lui	a2,0x1
     d6c:	000016b7          	lui	a3,0x1
     d70:	00001737          	lui	a4,0x1
     d74:	000017b7          	lui	a5,0x1
     d78:	000012b7          	lui	t0,0x1
     d7c:	00001fb7          	lui	t6,0x1
     d80:	00001f37          	lui	t5,0x1
     d84:	00001eb7          	lui	t4,0x1
     d88:	00001e37          	lui	t3,0x1
     d8c:	00001337          	lui	t1,0x1
     d90:	000018b7          	lui	a7,0x1
     d94:	00001837          	lui	a6,0x1
     d98:	00001537          	lui	a0,0x1
     d9c:	0a05a223          	sw	zero,164(a1) # 10a4 <tm_entered_EINSCHALTSTROM_MESSEN_BLOCK_ERKENNUNG_CTRLch_BLOCK_ERKENNUNG_CTRL__N_copy>
     da0:	0a062023          	sw	zero,160(a2) # 10a0 <tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL>
     da4:	000015b7          	lui	a1,0x1
     da8:	00001637          	lui	a2,0x1
     dac:	0806ae23          	sw	zero,156(a3) # 109c <tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL>
     db0:	000707a3          	sb	zero,15(a4) # 100f <NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state>
     db4:	000016b7          	lui	a3,0x1
     db8:	00001737          	lui	a4,0x1
     dbc:	00078723          	sb	zero,14(a5) # 100e <ZENTRAL_KINDERSICHERUNG_CTRL_next_state>
     dc0:	000017b7          	lui	a5,0x1
     dc4:	000286a3          	sb	zero,13(t0) # 100d <MEC_KINDERSICHERUNG_CTRL_next_state>
     dc8:	000f8623          	sb	zero,12(t6) # 100c <KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state>
     dcc:	000f05a3          	sb	zero,11(t5) # 100b <B_FH_TUERMODUL_CTRL_next_state>
     dd0:	000e8523          	sb	zero,10(t4) # 100a <A_FH_TUERMODUL_CTRL_next_state>
     dd4:	000e04a3          	sb	zero,9(t3) # 1009 <WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state>
     dd8:	00030423          	sb	zero,8(t1) # 1008 <INITIALISIERT_FH_TUERMODUL_CTRL_next_state>
     ddc:	000883a3          	sb	zero,7(a7) # 1007 <TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state>
     de0:	00080323          	sb	zero,6(a6) # 1006 <MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state>
     de4:	000502a3          	sb	zero,5(a0) # 1005 <OEFFNEN_FH_TUERMODUL_CTRL_next_state>
     de8:	00058223          	sb	zero,4(a1) # 1004 <SCHLIESSEN_FH_TUERMODUL_CTRL_next_state>
     dec:	000601a3          	sb	zero,3(a2) # 1003 <FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state>
     df0:	00068123          	sb	zero,2(a3) # 1002 <EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state>
     df4:	000700a3          	sb	zero,1(a4) # 1001 <BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state>
     df8:	00078023          	sb	zero,0(a5) # 1000 <__data_end>
     dfc:	00008067          	ret

00000e00 <generic_EINKLEMMSCHUTZ_CTRL>:
     e00:	000017b7          	lui	a5,0x1
     e04:	0a878793          	addi	a5,a5,168 # 10a8 <Bitlist>
     e08:	0107c703          	lbu	a4,16(a5)
     e0c:	04070263          	beqz	a4,e50 <generic_EINKLEMMSCHUTZ_CTRL+0x50>
     e10:	000016b7          	lui	a3,0x1
     e14:	0026c703          	lbu	a4,2(a3) # 1002 <EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state>
     e18:	00100613          	li	a2,1
     e1c:	02c70c63          	beq	a4,a2,e54 <generic_EINKLEMMSCHUTZ_CTRL+0x54>
     e20:	00200593          	li	a1,2
     e24:	02b71063          	bne	a4,a1,e44 <generic_EINKLEMMSCHUTZ_CTRL+0x44>
     e28:	00001737          	lui	a4,0x1
     e2c:	03374703          	lbu	a4,51(a4) # 1033 <FH_TUERMODUL__EKS_LEISTE_AKTIV>
     e30:	00078c23          	sb	zero,24(a5)
     e34:	00071e63          	bnez	a4,e50 <generic_EINKLEMMSCHUTZ_CTRL+0x50>
     e38:	000017b7          	lui	a5,0x1
     e3c:	0327c783          	lbu	a5,50(a5) # 1032 <FH_TUERMODUL__EKS_LEISTE_AKTIV_old>
     e40:	00078863          	beqz	a5,e50 <generic_EINKLEMMSCHUTZ_CTRL+0x50>
     e44:	000017b7          	lui	a5,0x1
     e48:	00c68123          	sb	a2,2(a3)
     e4c:	000788a3          	sb	zero,17(a5) # 1011 <stable>
     e50:	00008067          	ret
     e54:	00001737          	lui	a4,0x1
     e58:	03374703          	lbu	a4,51(a4) # 1033 <FH_TUERMODUL__EKS_LEISTE_AKTIV>
     e5c:	fe070ae3          	beqz	a4,e50 <generic_EINKLEMMSCHUTZ_CTRL+0x50>
     e60:	00001737          	lui	a4,0x1
     e64:	03274703          	lbu	a4,50(a4) # 1032 <FH_TUERMODUL__EKS_LEISTE_AKTIV_old>
     e68:	fe0714e3          	bnez	a4,e50 <generic_EINKLEMMSCHUTZ_CTRL+0x50>
     e6c:	00001737          	lui	a4,0x1
     e70:	03f74703          	lbu	a4,63(a4) # 103f <FH_TUERMODUL__SFHZ>
     e74:	00070863          	beqz	a4,e84 <generic_EINKLEMMSCHUTZ_CTRL+0x84>
     e78:	00001737          	lui	a4,0x1
     e7c:	03c74703          	lbu	a4,60(a4) # 103c <FH_TUERMODUL__SFHA>
     e80:	fc0718e3          	bnez	a4,e50 <generic_EINKLEMMSCHUTZ_CTRL+0x50>
     e84:	000015b7          	lui	a1,0x1
     e88:	00100613          	li	a2,1
     e8c:	00200713          	li	a4,2
     e90:	000588a3          	sb	zero,17(a1) # 1011 <stable>
     e94:	00c78c23          	sb	a2,24(a5)
     e98:	00e68123          	sb	a4,2(a3)
     e9c:	00008067          	ret

00000ea0 <generic_BLOCK_ERKENNUNG_CTRL>:
     ea0:	000017b7          	lui	a5,0x1
     ea4:	0a878793          	addi	a5,a5,168 # 10a8 <Bitlist>
     ea8:	0137c703          	lbu	a4,19(a5)
     eac:	08070863          	beqz	a4,f3c <generic_BLOCK_ERKENNUNG_CTRL+0x9c>
     eb0:	000016b7          	lui	a3,0x1
     eb4:	0006c703          	lbu	a4,0(a3) # 1000 <__data_end>
     eb8:	00100613          	li	a2,1
     ebc:	0ac70463          	beq	a4,a2,f64 <generic_BLOCK_ERKENNUNG_CTRL+0xc4>
     ec0:	00200593          	li	a1,2
     ec4:	08b71863          	bne	a4,a1,f54 <generic_BLOCK_ERKENNUNG_CTRL+0xb4>
     ec8:	00001737          	lui	a4,0x1
     ecc:	03674703          	lbu	a4,54(a4) # 1036 <FH_TUERMODUL__MFHA>
     ed0:	00071863          	bnez	a4,ee0 <generic_BLOCK_ERKENNUNG_CTRL+0x40>
     ed4:	00001737          	lui	a4,0x1
     ed8:	03474703          	lbu	a4,52(a4) # 1034 <FH_TUERMODUL__MFHA_old>
     edc:	0c071e63          	bnez	a4,fb8 <generic_BLOCK_ERKENNUNG_CTRL+0x118>
     ee0:	00001737          	lui	a4,0x1
     ee4:	03974703          	lbu	a4,57(a4) # 1039 <FH_TUERMODUL__MFHZ>
     ee8:	00071863          	bnez	a4,ef8 <generic_BLOCK_ERKENNUNG_CTRL+0x58>
     eec:	00001737          	lui	a4,0x1
     ef0:	03774703          	lbu	a4,55(a4) # 1037 <FH_TUERMODUL__MFHZ_old>
     ef4:	0c071263          	bnez	a4,fb8 <generic_BLOCK_ERKENNUNG_CTRL+0x118>
     ef8:	000016b7          	lui	a3,0x1
     efc:	0016c703          	lbu	a4,1(a3) # 1001 <BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state>
     f00:	00200613          	li	a2,2
     f04:	10c70063          	beq	a4,a2,1004 <SCHLIESSEN_FH_TUERMODUL_CTRL_next_state>
     f08:	00300593          	li	a1,3
     f0c:	0cb70463          	beq	a4,a1,fd4 <generic_BLOCK_ERKENNUNG_CTRL+0x134>
     f10:	00100513          	li	a0,1
     f14:	04a70663          	beq	a4,a0,f60 <generic_BLOCK_ERKENNUNG_CTRL+0xc0>
     f18:	000018b7          	lui	a7,0x1
     f1c:	00001837          	lui	a6,0x1
     f20:	00001737          	lui	a4,0x1
     f24:	00b680a3          	sb	a1,1(a3)
     f28:	00a78023          	sb	a0,0(a5)
     f2c:	000888a3          	sb	zero,17(a7) # 1011 <stable>
     f30:	04082c23          	sw	zero,88(a6) # 1058 <BLOCK_ERKENNUNG_CTRL__N>
     f34:	04c72e23          	sw	a2,92(a4) # 105c <BLOCK_ERKENNUNG_CTRL__I_EIN_MAX>
     f38:	00008067          	ret
     f3c:	0157c703          	lbu	a4,21(a5)
     f40:	02070063          	beqz	a4,f60 <generic_BLOCK_ERKENNUNG_CTRL+0xc0>
     f44:	0147c703          	lbu	a4,20(a5)
     f48:	00071c63          	bnez	a4,f60 <generic_BLOCK_ERKENNUNG_CTRL+0xc0>
     f4c:	00078023          	sb	zero,0(a5)
     f50:	00008067          	ret
     f54:	000017b7          	lui	a5,0x1
     f58:	00c68023          	sb	a2,0(a3)
     f5c:	000788a3          	sb	zero,17(a5) # 1011 <stable>
     f60:	00008067          	ret
     f64:	00001637          	lui	a2,0x1
     f68:	000015b7          	lui	a1,0x1
     f6c:	07862603          	lw	a2,120(a2) # 1078 <FH_TUERMODUL__I_EIN>
     f70:	0745a583          	lw	a1,116(a1) # 1074 <FH_TUERMODUL__I_EIN_old>
     f74:	fec586e3          	beq	a1,a2,f60 <generic_BLOCK_ERKENNUNG_CTRL+0xc0>
     f78:	fec054e3          	blez	a2,f60 <generic_BLOCK_ERKENNUNG_CTRL+0xc0>
     f7c:	00200613          	li	a2,2
     f80:	00001e37          	lui	t3,0x1
     f84:	00001337          	lui	t1,0x1
     f88:	000018b7          	lui	a7,0x1
     f8c:	00001837          	lui	a6,0x1
     f90:	000015b7          	lui	a1,0x1
     f94:	00300513          	li	a0,3
     f98:	00e78023          	sb	a4,0(a5)
     f9c:	000e08a3          	sb	zero,17(t3) # 1011 <stable>
     fa0:	04030123          	sb	zero,66(t1) # 1042 <FH_TUERMODUL__BLOCK_copy>
     fa4:	00c68023          	sb	a2,0(a3)
     fa8:	04c8ae23          	sw	a2,92(a7) # 105c <BLOCK_ERKENNUNG_CTRL__I_EIN_MAX>
     fac:	04082c23          	sw	zero,88(a6) # 1058 <BLOCK_ERKENNUNG_CTRL__N>
     fb0:	00a580a3          	sb	a0,1(a1) # 1001 <BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state>
     fb4:	00008067          	ret
     fb8:	00001637          	lui	a2,0x1
     fbc:	00100713          	li	a4,1
     fc0:	000017b7          	lui	a5,0x1
     fc4:	000608a3          	sb	zero,17(a2) # 1011 <stable>
     fc8:	00e68023          	sb	a4,0(a3)
     fcc:	000780a3          	sb	zero,1(a5) # 1001 <BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state>
     fd0:	00008067          	ret
     fd4:	00078023          	sb	zero,0(a5)
     fd8:	000017b7          	lui	a5,0x1
     fdc:	0587a783          	lw	a5,88(a5) # 1058 <BLOCK_ERKENNUNG_CTRL__N>
     fe0:	00b00713          	li	a4,11
     fe4:	f6e79ee3          	bne	a5,a4,f60 <generic_BLOCK_ERKENNUNG_CTRL+0xc0>
     fe8:	00001737          	lui	a4,0x1
     fec:	05472703          	lw	a4,84(a4) # 1054 <BLOCK_ERKENNUNG_CTRL__N_old>
     ff0:	f6f708e3          	beq	a4,a5,f60 <generic_BLOCK_ERKENNUNG_CTRL+0xc0>
     ff4:	000017b7          	lui	a5,0x1
     ff8:	00c680a3          	sb	a2,1(a3)
     ffc:	000788a3          	sb	zero,17(a5) # 1011 <stable>

00001000 <__data_end>:
    1000:	00008067          	ret
    1004:	000017b7          	lui	a5,0x1
    1008:	05c7a783          	lw	a5,92(a5) # 105c <BLOCK_ERKENNUNG_CTRL__I_EIN_MAX>
    100c:	00001737          	lui	a4,0x1
    1010:	07872703          	lw	a4,120(a4) # 1078 <FH_TUERMODUL__I_EIN>
    1014:	fff78793          	addi	a5,a5,-1
    1018:	f4f744e3          	blt	a4,a5,f60 <generic_BLOCK_ERKENNUNG_CTRL+0xc0>
    101c:	000017b7          	lui	a5,0x1
    1020:	000788a3          	sb	zero,17(a5) # 1011 <stable>
    1024:	00001737          	lui	a4,0x1
    1028:	00100793          	li	a5,1
    102c:	04f70123          	sb	a5,66(a4) # 1042 <FH_TUERMODUL__BLOCK_copy>
    1030:	00f680a3          	sb	a5,1(a3)
    1034:	00008067          	ret

00001038 <FH_DU>:
    1038:	00001737          	lui	a4,0x1
    103c:	02974683          	lbu	a3,41(a4) # 1029 <FH_DU__S_FH_TMBFZUCAN>
    1040:	00001737          	lui	a4,0x1
    1044:	02874f03          	lbu	t5,40(a4) # 1028 <FH_DU__S_FH_TMBFZUCAN_old>
    1048:	00001737          	lui	a4,0x1
    104c:	fc010113          	addi	sp,sp,-64
    1050:	00001637          	lui	a2,0x1
    1054:	02574803          	lbu	a6,37(a4) # 1025 <FH_DU__S_FH_TMBFAUFDISC>
    1058:	000017b7          	lui	a5,0x1
    105c:	00001737          	lui	a4,0x1
    1060:	02812c23          	sw	s0,56(sp)
    1064:	02912a23          	sw	s1,52(sp)
    1068:	03212823          	sw	s2,48(sp)
    106c:	03312623          	sw	s3,44(sp)
    1070:	03412423          	sw	s4,40(sp)
    1074:	03512223          	sw	s5,36(sp)
    1078:	03612023          	sw	s6,32(sp)
    107c:	01712e23          	sw	s7,28(sp)
    1080:	01812c23          	sw	s8,24(sp)
    1084:	01912a23          	sw	s9,20(sp)
    1088:	01b12623          	sw	s11,12(sp)
    108c:	02112e23          	sw	ra,60(sp)
    1090:	01a12823          	sw	s10,16(sp)
    1094:	0a878793          	addi	a5,a5,168 # 10a8 <Bitlist>
    1098:	02474383          	lbu	t2,36(a4) # 1024 <FH_DU__S_FH_TMBFAUFDISC_old>
    109c:	02a64283          	lbu	t0,42(a2) # 102a <FH_DU__S_FH_TMBFAUFCAN_old>
    10a0:	00001737          	lui	a4,0x1
    10a4:	00001637          	lui	a2,0x1
    10a8:	02764583          	lbu	a1,39(a2) # 1027 <FH_DU__S_FH_TMBFZUDISC>
    10ac:	00a7ce83          	lbu	t4,10(a5)
    10b0:	00001637          	lui	a2,0x1
    10b4:	0107ce03          	lbu	t3,16(a5)
    10b8:	0137c303          	lbu	t1,19(a5)
    10bc:	00d7c883          	lbu	a7,13(a5)
    10c0:	02b74703          	lbu	a4,43(a4) # 102b <FH_DU__S_FH_TMBFAUFCAN>
    10c4:	00001537          	lui	a0,0x1
    10c8:	02664f83          	lbu	t6,38(a2) # 1026 <FH_DU__S_FH_TMBFZUDISC_old>
    10cc:	00100613          	li	a2,1
    10d0:	00c52a23          	sw	a2,20(a0) # 1014 <time>
    10d4:	00001a37          	lui	s4,0x1
    10d8:	00000513          	li	a0,0
    10dc:	00001ab7          	lui	s5,0x1
    10e0:	000019b7          	lui	s3,0x1
    10e4:	00001437          	lui	s0,0x1
    10e8:	00001937          	lui	s2,0x1
    10ec:	000014b7          	lui	s1,0x1
    10f0:	00001db7          	lui	s11,0x1
    10f4:	00001cb7          	lui	s9,0x1
    10f8:	00001c37          	lui	s8,0x1
    10fc:	00001bb7          	lui	s7,0x1
    1100:	00001b37          	lui	s6,0x1
    1104:	00150513          	addi	a0,a0,1
    1108:	00001d37          	lui	s10,0x1
    110c:	00ad0823          	sb	a0,16(s10) # 1010 <step>
    1110:	00001537          	lui	a0,0x1
    1114:	00354503          	lbu	a0,3(a0) # 1003 <FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state>
    1118:	00001d37          	lui	s10,0x1
    111c:	00cd08a3          	sb	a2,17(s10) # 1011 <stable>
    1120:	00200d13          	li	s10,2
    1124:	5ba50c63          	beq	a0,s10,16dc <__bss_end+0x5f4>
    1128:	00300d13          	li	s10,3
    112c:	59a50c63          	beq	a0,s10,16c4 <__bss_end+0x5dc>
    1130:	00c51c63          	bne	a0,a2,1148 <__bss_end+0x60>
    1134:	01da4503          	lbu	a0,29(s4) # 101d <FH_DU__MFHZ>
    1138:	02051663          	bnez	a0,1164 <__bss_end+0x7c>
    113c:	00001537          	lui	a0,0x1
    1140:	01b54503          	lbu	a0,27(a0) # 101b <FH_DU__MFHZ_old>
    1144:	02050063          	beqz	a0,1164 <__bss_end+0x7c>
    1148:	00001537          	lui	a0,0x1
    114c:	000508a3          	sb	zero,17(a0) # 1011 <stable>
    1150:	00001537          	lui	a0,0x1
    1154:	06052823          	sw	zero,112(a0) # 1070 <FH_DU__MFH>
    1158:	00200d13          	li	s10,2
    115c:	00001537          	lui	a0,0x1
    1160:	01a501a3          	sb	s10,3(a0) # 1003 <FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state>
    1164:	000e9863          	bnez	t4,1174 <__bss_end+0x8c>
    1168:	00001537          	lui	a0,0x1
    116c:	00300e93          	li	t4,3
    1170:	01d50623          	sb	t4,12(a0) # 100c <KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state>
    1174:	000e1663          	bnez	t3,1180 <__bss_end+0x98>
    1178:	00001537          	lui	a0,0x1
    117c:	00c50123          	sb	a2,2(a0) # 1002 <EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state>
    1180:	00031863          	bnez	t1,1190 <__bss_end+0xa8>
    1184:	00001537          	lui	a0,0x1
    1188:	00078023          	sb	zero,0(a5)
    118c:	00c50023          	sb	a2,0(a0) # 1000 <__data_end>
    1190:	02089a63          	bnez	a7,11c4 <__bss_end+0xdc>
    1194:	000018b7          	lui	a7,0x1
    1198:	00001537          	lui	a0,0x1
    119c:	0808a623          	sw	zero,140(a7) # 108c <FH_TUERMODUL_CTRL__N>
    11a0:	00200893          	li	a7,2
    11a4:	011505a3          	sb	a7,11(a0) # 100b <B_FH_TUERMODUL_CTRL_next_state>
    11a8:	00001537          	lui	a0,0x1
    11ac:	00c50523          	sb	a2,10(a0) # 100a <A_FH_TUERMODUL_CTRL_next_state>
    11b0:	10000513          	li	a0,256
    11b4:	00a79223          	sh	a0,4(a5)
    11b8:	00001537          	lui	a0,0x1
    11bc:	00078323          	sb	zero,6(a5)
    11c0:	00c504a3          	sb	a2,9(a0) # 1009 <WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state>
    11c4:	00c785a3          	sb	a2,11(a5)
    11c8:	00c788a3          	sb	a2,17(a5)
    11cc:	00c78a23          	sb	a2,20(a5)
    11d0:	00c78723          	sb	a2,14(a5)
    11d4:	47e68863          	beq	a3,t5,1644 <__bss_end+0x55c>
    11d8:	00001537          	lui	a0,0x1
    11dc:	02154503          	lbu	a0,33(a0) # 1021 <FH_DU__DOOR_ID>
    11e0:	4c051063          	bnez	a0,16a0 <__bss_end+0x5b8>
    11e4:	02d98823          	sb	a3,48(s3) # 1030 <FH_DU__S_FH_FTZU>
    11e8:	47f58c63          	beq	a1,t6,1660 <__bss_end+0x578>
    11ec:	48570863          	beq	a4,t0,167c <__bss_end+0x594>
    11f0:	02e407a3          	sb	a4,47(s0) # 102f <FH_DU__S_FH_FTAUF>
    11f4:	0127c503          	lbu	a0,18(a5)
    11f8:	0157c583          	lbu	a1,21(a5)
    11fc:	00c7c803          	lbu	a6,12(a5)
    1200:	00f7c383          	lbu	t2,15(a5)
    1204:	00a78823          	sb	a0,16(a5)
    1208:	00b789a3          	sb	a1,19(a5)
    120c:	02294503          	lbu	a0,34(s2) # 1022 <FH_DU__S_FH_AUFDISC>
    1210:	0234c583          	lbu	a1,35(s1) # 1023 <FH_DU__S_FH_ZUDISC>
    1214:	00001eb7          	lui	t4,0x1
    1218:	000018b7          	lui	a7,0x1
    121c:	00001337          	lui	t1,0x1
    1220:	00001e37          	lui	t3,0x1
    1224:	04e88423          	sb	a4,72(a7) # 1048 <FH_TUERMODUL__SFHA_ZENTRAL>
    1228:	04d30623          	sb	a3,76(t1) # 104c <FH_TUERMODUL__SFHZ_ZENTRAL>
    122c:	01078523          	sb	a6,10(a5)
    1230:	007786a3          	sb	t2,13(a5)
    1234:	04ae0323          	sb	a0,70(t3) # 1046 <FH_TUERMODUL__SFHA_MEC>
    1238:	04be8523          	sb	a1,74(t4) # 104a <FH_TUERMODUL__SFHZ_MEC>
    123c:	000e8d13          	mv	s10,t4
    1240:	02080863          	beqz	a6,1270 <__bss_end+0x188>
    1244:	ea9fe0ef          	jal	ec <generic_KINDERSICHERUNG_CTRL.part.0>
    1248:	000017b7          	lui	a5,0x1
    124c:	00001e37          	lui	t3,0x1
    1250:	000018b7          	lui	a7,0x1
    1254:	00001337          	lui	t1,0x1
    1258:	0a878793          	addi	a5,a5,168 # 10a8 <Bitlist>
    125c:	046e4503          	lbu	a0,70(t3) # 1046 <FH_TUERMODUL__SFHA_MEC>
    1260:	0488c703          	lbu	a4,72(a7) # 1048 <FH_TUERMODUL__SFHA_ZENTRAL>
    1264:	04ad4583          	lbu	a1,74(s10)
    1268:	04c34683          	lbu	a3,76(t1) # 104c <FH_TUERMODUL__SFHZ_ZENTRAL>
    126c:	00d7c383          	lbu	t2,13(a5)
    1270:	00001837          	lui	a6,0x1
    1274:	03684283          	lbu	t0,54(a6) # 1036 <FH_TUERMODUL__MFHA>
    1278:	000018b7          	lui	a7,0x1
    127c:	00001337          	lui	t1,0x1
    1280:	00001837          	lui	a6,0x1
    1284:	0398cf83          	lbu	t6,57(a7) # 1039 <FH_TUERMODUL__MFHZ>
    1288:	03334e83          	lbu	t4,51(t1) # 1033 <FH_TUERMODUL__EKS_LEISTE_AKTIV>
    128c:	078daf03          	lw	t5,120(s11) # 1078 <FH_TUERMODUL__I_EIN>
    1290:	04084303          	lbu	t1,64(a6) # 1040 <FH_TUERMODUL__FT>
    1294:	00001637          	lui	a2,0x1
    1298:	000018b7          	lui	a7,0x1
    129c:	00001837          	lui	a6,0x1
    12a0:	07c62e03          	lw	t3,124(a2) # 107c <FH_TUERMODUL__POSITION>
    12a4:	0448c883          	lbu	a7,68(a7) # 1044 <FH_TUERMODUL__KL_50>
    12a8:	04384803          	lbu	a6,67(a6) # 1043 <FH_TUERMODUL__BLOCK>
    12ac:	00001d37          	lui	s10,0x1
    12b0:	07ed2223          	sw	t5,100(s10) # 1064 <FH_DU__I_EIN>
    12b4:	00001d37          	lui	s10,0x1
    12b8:	02a90123          	sb	a0,34(s2)
    12bc:	02e407a3          	sb	a4,47(s0)
    12c0:	02b481a3          	sb	a1,35(s1)
    12c4:	02d98823          	sb	a3,48(s3)
    12c8:	005a8d23          	sb	t0,26(s5) # 101a <FH_DU__MFHA>
    12cc:	01fa0ea3          	sb	t6,29(s4)
    12d0:	03dd06a3          	sb	t4,45(s10) # 102d <FH_DU__EKS_LEISTE_AKTIV>
    12d4:	07cca423          	sw	t3,104(s9) # 1068 <FH_DU__POSITION>
    12d8:	026c0723          	sb	t1,46(s8) # 102e <FH_DU__FT>
    12dc:	031b88a3          	sb	a7,49(s7) # 1031 <FH_DU__KL_50>
    12e0:	030b0023          	sb	a6,32(s6) # 1020 <FH_DU__BLOCK>
    12e4:	3a038063          	beqz	t2,1684 <__bss_end+0x59c>
    12e8:	980ff0ef          	jal	468 <generic_FH_TUERMODUL_CTRL.part.0>
    12ec:	000017b7          	lui	a5,0x1
    12f0:	07c7ae03          	lw	t3,124(a5) # 107c <FH_TUERMODUL__POSITION>
    12f4:	000017b7          	lui	a5,0x1
    12f8:	00001837          	lui	a6,0x1
    12fc:	0467c503          	lbu	a0,70(a5) # 1046 <FH_TUERMODUL__SFHA_MEC>
    1300:	000017b7          	lui	a5,0x1
    1304:	000018b7          	lui	a7,0x1
    1308:	00001337          	lui	t1,0x1
    130c:	03684283          	lbu	t0,54(a6) # 1036 <FH_TUERMODUL__MFHA>
    1310:	0487c703          	lbu	a4,72(a5) # 1048 <FH_TUERMODUL__SFHA_ZENTRAL>
    1314:	00001837          	lui	a6,0x1
    1318:	000017b7          	lui	a5,0x1
    131c:	0398cf83          	lbu	t6,57(a7) # 1039 <FH_TUERMODUL__MFHZ>
    1320:	03334e83          	lbu	t4,51(t1) # 1033 <FH_TUERMODUL__EKS_LEISTE_AKTIV>
    1324:	04a7c583          	lbu	a1,74(a5) # 104a <FH_TUERMODUL__SFHZ_MEC>
    1328:	04084303          	lbu	t1,64(a6) # 1040 <FH_TUERMODUL__FT>
    132c:	000017b7          	lui	a5,0x1
    1330:	000018b7          	lui	a7,0x1
    1334:	00001837          	lui	a6,0x1
    1338:	078daf03          	lw	t5,120(s11)
    133c:	04c7c683          	lbu	a3,76(a5) # 104c <FH_TUERMODUL__SFHZ_ZENTRAL>
    1340:	0448c883          	lbu	a7,68(a7) # 1044 <FH_TUERMODUL__KL_50>
    1344:	04384803          	lbu	a6,67(a6) # 1043 <FH_TUERMODUL__BLOCK>
    1348:	00001637          	lui	a2,0x1
    134c:	000017b7          	lui	a5,0x1
    1350:	00060d13          	mv	s10,a2
    1354:	03d606a3          	sb	t4,45(a2) # 102d <FH_DU__EKS_LEISTE_AKTIV>
    1358:	005a8d23          	sb	t0,26(s5)
    135c:	07e7a223          	sw	t5,100(a5) # 1064 <FH_DU__I_EIN>
    1360:	02a90123          	sb	a0,34(s2)
    1364:	01fa0ea3          	sb	t6,29(s4)
    1368:	07cca423          	sw	t3,104(s9)
    136c:	026c0723          	sb	t1,46(s8)
    1370:	02e407a3          	sb	a4,47(s0)
    1374:	02b481a3          	sb	a1,35(s1)
    1378:	02d98823          	sb	a3,48(s3)
    137c:	031b88a3          	sb	a7,49(s7)
    1380:	030b0023          	sb	a6,32(s6)
    1384:	a7dff0ef          	jal	e00 <generic_EINKLEMMSCHUTZ_CTRL>
    1388:	00001737          	lui	a4,0x1
    138c:	03674583          	lbu	a1,54(a4) # 1036 <FH_TUERMODUL__MFHA>
    1390:	000016b7          	lui	a3,0x1
    1394:	078da703          	lw	a4,120(s11)
    1398:	0396c683          	lbu	a3,57(a3) # 1039 <FH_TUERMODUL__MFHZ>
    139c:	000017b7          	lui	a5,0x1
    13a0:	06e7a223          	sw	a4,100(a5) # 1064 <FH_DU__I_EIN>
    13a4:	00001837          	lui	a6,0x1
    13a8:	000017b7          	lui	a5,0x1
    13ac:	00ba8d23          	sb	a1,26(s5)
    13b0:	000015b7          	lui	a1,0x1
    13b4:	04084703          	lbu	a4,64(a6) # 1040 <FH_TUERMODUL__FT>
    13b8:	0335c583          	lbu	a1,51(a1) # 1033 <FH_TUERMODUL__EKS_LEISTE_AKTIV>
    13bc:	00da0ea3          	sb	a3,29(s4)
    13c0:	07c7a683          	lw	a3,124(a5) # 107c <FH_TUERMODUL__POSITION>
    13c4:	000018b7          	lui	a7,0x1
    13c8:	00001337          	lui	t1,0x1
    13cc:	00001e37          	lui	t3,0x1
    13d0:	02bd06a3          	sb	a1,45(s10)
    13d4:	06dca423          	sw	a3,104(s9)
    13d8:	0468c583          	lbu	a1,70(a7) # 1046 <FH_TUERMODUL__SFHA_MEC>
    13dc:	04834683          	lbu	a3,72(t1) # 1048 <FH_TUERMODUL__SFHA_ZENTRAL>
    13e0:	02ec0723          	sb	a4,46(s8)
    13e4:	04ae4703          	lbu	a4,74(t3) # 104a <FH_TUERMODUL__SFHZ_MEC>
    13e8:	00001f37          	lui	t5,0x1
    13ec:	00001eb7          	lui	t4,0x1
    13f0:	00001fb7          	lui	t6,0x1
    13f4:	02b90123          	sb	a1,34(s2)
    13f8:	02d407a3          	sb	a3,47(s0)
    13fc:	04cec583          	lbu	a1,76(t4) # 104c <FH_TUERMODUL__SFHZ_ZENTRAL>
    1400:	044f4683          	lbu	a3,68(t5) # 1044 <FH_TUERMODUL__KL_50>
    1404:	02e481a3          	sb	a4,35(s1)
    1408:	043fc703          	lbu	a4,67(t6) # 1043 <FH_TUERMODUL__BLOCK>
    140c:	000f0d13          	mv	s10,t5
    1410:	02b98823          	sb	a1,48(s3)
    1414:	02db88a3          	sb	a3,49(s7)
    1418:	02eb0023          	sb	a4,32(s6)
    141c:	a85ff0ef          	jal	ea0 <generic_BLOCK_ERKENNUNG_CTRL>
    1420:	000017b7          	lui	a5,0x1
    1424:	07c7a583          	lw	a1,124(a5) # 107c <FH_TUERMODUL__POSITION>
    1428:	00001837          	lui	a6,0x1
    142c:	04084683          	lbu	a3,64(a6) # 1040 <FH_TUERMODUL__FT>
    1430:	044d4703          	lbu	a4,68(s10)
    1434:	00001837          	lui	a6,0x1
    1438:	06bca423          	sw	a1,104(s9)
    143c:	08c82583          	lw	a1,140(a6) # 108c <FH_TUERMODUL_CTRL__N>
    1440:	00001837          	lui	a6,0x1
    1444:	02dc0723          	sb	a3,46(s8)
    1448:	06c82683          	lw	a3,108(a6) # 106c <FH_DU__MFH_copy>
    144c:	02eb88a3          	sb	a4,49(s7)
    1450:	00001837          	lui	a6,0x1
    1454:	078da703          	lw	a4,120(s11)
    1458:	000017b7          	lui	a5,0x1
    145c:	0a878793          	addi	a5,a5,168 # 10a8 <Bitlist>
    1460:	08b82423          	sw	a1,136(a6) # 1088 <FH_TUERMODUL_CTRL__N_old>
    1464:	000018b7          	lui	a7,0x1
    1468:	00001837          	lui	a6,0x1
    146c:	00001337          	lui	t1,0x1
    1470:	00001e37          	lui	t3,0x1
    1474:	00001eb7          	lui	t4,0x1
    1478:	000015b7          	lui	a1,0x1
    147c:	0335c583          	lbu	a1,51(a1) # 1033 <FH_TUERMODUL__EKS_LEISTE_AKTIV>
    1480:	04834383          	lbu	t2,72(t1) # 1048 <FH_TUERMODUL__SFHA_ZENTRAL>
    1484:	04ae4503          	lbu	a0,74(t3) # 104a <FH_TUERMODUL__SFHZ_MEC>
    1488:	04cecf03          	lbu	t5,76(t4) # 104c <FH_TUERMODUL__SFHZ_ZENTRAL>
    148c:	06d82823          	sw	a3,112(a6) # 1070 <FH_DU__MFH>
    1490:	00a7ce83          	lbu	t4,10(a5)
    1494:	0468c683          	lbu	a3,70(a7) # 1046 <FH_TUERMODUL__SFHA_MEC>
    1498:	0107ce03          	lbu	t3,16(a5)
    149c:	00d7c883          	lbu	a7,13(a5)
    14a0:	0137c303          	lbu	t1,19(a5)
    14a4:	00001837          	lui	a6,0x1
    14a8:	00001637          	lui	a2,0x1
    14ac:	06e82a23          	sw	a4,116(a6) # 1074 <FH_TUERMODUL__I_EIN_old>
    14b0:	00001837          	lui	a6,0x1
    14b4:	06e62223          	sw	a4,100(a2) # 1064 <FH_DU__I_EIN>
    14b8:	06e82023          	sw	a4,96(a6) # 1060 <FH_DU__I_EIN_old>
    14bc:	00001637          	lui	a2,0x1
    14c0:	00001837          	lui	a6,0x1
    14c4:	02b606a3          	sb	a1,45(a2) # 102d <FH_DU__EKS_LEISTE_AKTIV>
    14c8:	02d90123          	sb	a3,34(s2)
    14cc:	027407a3          	sb	t2,47(s0)
    14d0:	02a481a3          	sb	a0,35(s1)
    14d4:	03e98823          	sb	t5,48(s3)
    14d8:	01d785a3          	sb	t4,11(a5)
    14dc:	01178723          	sb	a7,14(a5)
    14e0:	01c788a3          	sb	t3,17(a5)
    14e4:	00678a23          	sb	t1,20(a5)
    14e8:	05882703          	lw	a4,88(a6) # 1058 <BLOCK_ERKENNUNG_CTRL__N>
    14ec:	00001d37          	lui	s10,0x1
    14f0:	03ed4f83          	lbu	t6,62(s10) # 103e <FH_TUERMODUL__SFHZ_copy>
    14f4:	00001d37          	lui	s10,0x1
    14f8:	04ed2a23          	sw	a4,84(s10) # 1054 <BLOCK_ERKENNUNG_CTRL__N_old>
    14fc:	00001d37          	lui	s10,0x1
    1500:	03bd4283          	lbu	t0,59(s10) # 103b <FH_TUERMODUL__SFHA_copy>
    1504:	00001d37          	lui	s10,0x1
    1508:	05ed05a3          	sb	t5,75(s10) # 104b <FH_TUERMODUL__SFHZ_ZENTRAL_old>
    150c:	00001d37          	lui	s10,0x1
    1510:	04ad04a3          	sb	a0,73(s10) # 1049 <FH_TUERMODUL__SFHZ_MEC_old>
    1514:	00001837          	lui	a6,0x1
    1518:	00001d37          	lui	s10,0x1
    151c:	04284803          	lbu	a6,66(a6) # 1042 <FH_TUERMODUL__BLOCK_copy>
    1520:	047d03a3          	sb	t2,71(s10) # 1047 <FH_TUERMODUL__SFHA_ZENTRAL_old>
    1524:	00001d37          	lui	s10,0x1
    1528:	02bd4703          	lbu	a4,43(s10) # 102b <FH_DU__S_FH_TMBFAUFCAN>
    152c:	00001537          	lui	a0,0x1
    1530:	00001d37          	lui	s10,0x1
    1534:	03554503          	lbu	a0,53(a0) # 1035 <FH_TUERMODUL__MFHA_copy>
    1538:	04dd02a3          	sb	a3,69(s10) # 1045 <FH_TUERMODUL__SFHA_MEC_old>
    153c:	000013b7          	lui	t2,0x1
    1540:	00001d37          	lui	s10,0x1
    1544:	029d4683          	lbu	a3,41(s10) # 1029 <FH_DU__S_FH_TMBFZUCAN>
    1548:	050381a3          	sb	a6,67(t2) # 1043 <FH_TUERMODUL__BLOCK>
    154c:	00001d37          	lui	s10,0x1
    1550:	000013b7          	lui	t2,0x1
    1554:	02bd0923          	sb	a1,50(s10) # 1032 <FH_TUERMODUL__EKS_LEISTE_AKTIV_old>
    1558:	050380a3          	sb	a6,65(t2) # 1041 <FH_TUERMODUL__BLOCK_old>
    155c:	00001637          	lui	a2,0x1
    1560:	000013b7          	lui	t2,0x1
    1564:	00001d37          	lui	s10,0x1
    1568:	03f38fa3          	sb	t6,63(t2) # 103f <FH_TUERMODUL__SFHZ>
    156c:	02a60b23          	sb	a0,54(a2) # 1036 <FH_TUERMODUL__MFHA>
    1570:	02bd0623          	sb	a1,44(s10) # 102c <FH_DU__EKS_LEISTE_AKTIV_old>
    1574:	000013b7          	lui	t2,0x1
    1578:	00001637          	lui	a2,0x1
    157c:	00001f37          	lui	t5,0x1
    1580:	000015b7          	lui	a1,0x1
    1584:	038f4f03          	lbu	t5,56(t5) # 1038 <FH_DU>
    1588:	03f38ea3          	sb	t6,61(t2) # 103d <FH_TUERMODUL__SFHZ_old>
    158c:	02a60a23          	sb	a0,52(a2) # 1034 <FH_TUERMODUL__MFHA_old>
    1590:	0275c583          	lbu	a1,39(a1) # 1027 <FH_DU__S_FH_TMBFZUDISC>
    1594:	000013b7          	lui	t2,0x1
    1598:	00001637          	lui	a2,0x1
    159c:	00001837          	lui	a6,0x1
    15a0:	02538e23          	sb	t0,60(t2) # 103c <FH_TUERMODUL__SFHA>
    15a4:	02584803          	lbu	a6,37(a6) # 1025 <FH_DU__S_FH_TMBFAUFDISC>
    15a8:	02e60523          	sb	a4,42(a2) # 102a <FH_DU__S_FH_TMBFAUFCAN_old>
    15ac:	00001fb7          	lui	t6,0x1
    15b0:	00001637          	lui	a2,0x1
    15b4:	000013b7          	lui	t2,0x1
    15b8:	01ffcf83          	lbu	t6,31(t6) # 101f <FH_DU__BLOCK_copy>
    15bc:	02538d23          	sb	t0,58(t2) # 103a <FH_TUERMODUL__SFHA_old>
    15c0:	02d60423          	sb	a3,40(a2) # 1028 <FH_DU__S_FH_TMBFZUCAN_old>
    15c4:	000012b7          	lui	t0,0x1
    15c8:	00001637          	lui	a2,0x1
    15cc:	03e28ca3          	sb	t5,57(t0) # 1039 <FH_TUERMODUL__MFHZ>
    15d0:	02b60323          	sb	a1,38(a2) # 1026 <FH_DU__S_FH_TMBFZUDISC_old>
    15d4:	000012b7          	lui	t0,0x1
    15d8:	00001637          	lui	a2,0x1
    15dc:	03e28ba3          	sb	t5,55(t0) # 1037 <FH_TUERMODUL__MFHZ_old>
    15e0:	03060223          	sb	a6,36(a2) # 1024 <FH_DU__S_FH_TMBFAUFDISC_old>
    15e4:	00001637          	lui	a2,0x1
    15e8:	03fb0023          	sb	t6,32(s6)
    15ec:	01c64f03          	lbu	t5,28(a2) # 101c <FH_DU__MFHZ_copy>
    15f0:	00001637          	lui	a2,0x1
    15f4:	01964503          	lbu	a0,25(a2) # 1019 <FH_DU__MFHA_copy>
    15f8:	00001637          	lui	a2,0x1
    15fc:	01164283          	lbu	t0,17(a2) # 1011 <stable>
    1600:	00001637          	lui	a2,0x1
    1604:	01f60f23          	sb	t6,30(a2) # 101e <FH_DU__BLOCK_old>
    1608:	00001637          	lui	a2,0x1
    160c:	01e60da3          	sb	t5,27(a2) # 101b <FH_DU__MFHZ_old>
    1610:	00001637          	lui	a2,0x1
    1614:	01ea0ea3          	sb	t5,29(s4)
    1618:	00aa8d23          	sb	a0,26(s5)
    161c:	00a60c23          	sb	a0,24(a2) # 1018 <FH_DU__MFHA_old>
    1620:	12029463          	bnez	t0,1748 <__bss_end+0x660>
    1624:	00001637          	lui	a2,0x1
    1628:	01064503          	lbu	a0,16(a2) # 1010 <step>
    162c:	00058f93          	mv	t6,a1
    1630:	00070293          	mv	t0,a4
    1634:	00080393          	mv	t2,a6
    1638:	00068f13          	mv	t5,a3
    163c:	00100613          	li	a2,1
    1640:	ac5ff06f          	j	1104 <__bss_end+0x1c>
    1644:	0309c683          	lbu	a3,48(s3)
    1648:	01f58c63          	beq	a1,t6,1660 <__bss_end+0x578>
    164c:	00001537          	lui	a0,0x1
    1650:	02154503          	lbu	a0,33(a0) # 1021 <FH_DU__DOOR_ID>
    1654:	b8050ce3          	beqz	a0,11ec <__bss_end+0x104>
    1658:	00001537          	lui	a0,0x1
    165c:	02b504a3          	sb	a1,41(a0) # 1029 <FH_DU__S_FH_TMBFZUCAN>
    1660:	04570663          	beq	a4,t0,16ac <__bss_end+0x5c4>
    1664:	000015b7          	lui	a1,0x1
    1668:	0215c583          	lbu	a1,33(a1) # 1021 <FH_DU__DOOR_ID>
    166c:	b80582e3          	beqz	a1,11f0 <__bss_end+0x108>
    1670:	00780663          	beq	a6,t2,167c <__bss_end+0x594>
    1674:	00001737          	lui	a4,0x1
    1678:	030705a3          	sb	a6,43(a4) # 102b <FH_DU__S_FH_TMBFAUFCAN>
    167c:	02f44703          	lbu	a4,47(s0)
    1680:	b75ff06f          	j	11f4 <__bss_end+0x10c>
    1684:	00f7c383          	lbu	t2,15(a5)
    1688:	cc0380e3          	beqz	t2,1348 <__bss_end+0x260>
    168c:	00e7c383          	lbu	t2,14(a5)
    1690:	ca039ce3          	bnez	t2,1348 <__bss_end+0x260>
    1694:	00078223          	sb	zero,4(a5)
    1698:	00078323          	sb	zero,6(a5)
    169c:	cadff06f          	j	1348 <__bss_end+0x260>
    16a0:	0309c683          	lbu	a3,48(s3)
    16a4:	fbf59ae3          	bne	a1,t6,1658 <__bss_end+0x570>
    16a8:	fc5714e3          	bne	a4,t0,1670 <__bss_end+0x588>
    16ac:	02f44703          	lbu	a4,47(s0)
    16b0:	b47802e3          	beq	a6,t2,11f4 <__bss_end+0x10c>
    16b4:	000015b7          	lui	a1,0x1
    16b8:	0215c583          	lbu	a1,33(a1) # 1021 <FH_DU__DOOR_ID>
    16bc:	fa059ce3          	bnez	a1,1674 <__bss_end+0x58c>
    16c0:	b35ff06f          	j	11f4 <__bss_end+0x10c>
    16c4:	01aac503          	lbu	a0,26(s5)
    16c8:	a8051ee3          	bnez	a0,1164 <__bss_end+0x7c>
    16cc:	00001537          	lui	a0,0x1
    16d0:	01854503          	lbu	a0,24(a0) # 1018 <FH_DU__MFHA_old>
    16d4:	a6051ae3          	bnez	a0,1148 <__bss_end+0x60>
    16d8:	a8dff06f          	j	1164 <__bss_end+0x7c>
    16dc:	01da4503          	lbu	a0,29(s4)
    16e0:	02050863          	beqz	a0,1710 <__bss_end+0x628>
    16e4:	00001537          	lui	a0,0x1
    16e8:	01b54503          	lbu	a0,27(a0) # 101b <FH_DU__MFHZ_old>
    16ec:	02051263          	bnez	a0,1710 <__bss_end+0x628>
    16f0:	00001d37          	lui	s10,0x1
    16f4:	000d08a3          	sb	zero,17(s10) # 1011 <stable>
    16f8:	00001d37          	lui	s10,0x1
    16fc:	f9c00513          	li	a0,-100
    1700:	00cd01a3          	sb	a2,3(s10) # 1003 <FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state>
    1704:	00001d37          	lui	s10,0x1
    1708:	06ad2823          	sw	a0,112(s10) # 1070 <FH_DU__MFH>
    170c:	a59ff06f          	j	1164 <__bss_end+0x7c>
    1710:	01aac503          	lbu	a0,26(s5)
    1714:	a40508e3          	beqz	a0,1164 <__bss_end+0x7c>
    1718:	00001537          	lui	a0,0x1
    171c:	01854503          	lbu	a0,24(a0) # 1018 <FH_DU__MFHA_old>
    1720:	a40512e3          	bnez	a0,1164 <__bss_end+0x7c>
    1724:	00001d37          	lui	s10,0x1
    1728:	06400513          	li	a0,100
    172c:	000d08a3          	sb	zero,17(s10) # 1011 <stable>
    1730:	00001d37          	lui	s10,0x1
    1734:	06ad2823          	sw	a0,112(s10) # 1070 <FH_DU__MFH>
    1738:	00300513          	li	a0,3
    173c:	00001d37          	lui	s10,0x1
    1740:	00ad01a3          	sb	a0,3(s10) # 1003 <FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state>
    1744:	a21ff06f          	j	1164 <__bss_end+0x7c>
    1748:	03c12083          	lw	ra,60(sp)
    174c:	03812403          	lw	s0,56(sp)
    1750:	03412483          	lw	s1,52(sp)
    1754:	03012903          	lw	s2,48(sp)
    1758:	02c12983          	lw	s3,44(sp)
    175c:	02812a03          	lw	s4,40(sp)
    1760:	02412a83          	lw	s5,36(sp)
    1764:	02012b03          	lw	s6,32(sp)
    1768:	01c12b83          	lw	s7,28(sp)
    176c:	01812c03          	lw	s8,24(sp)
    1770:	01412c83          	lw	s9,20(sp)
    1774:	01012d03          	lw	s10,16(sp)
    1778:	00c12d83          	lw	s11,12(sp)
    177c:	04010113          	addi	sp,sp,64
    1780:	00008067          	ret

00001784 <benchmark_body.isra.0>:
    1784:	08058263          	beqz	a1,1808 <benchmark_body.isra.0+0x84>
    1788:	fe010113          	addi	sp,sp,-32
    178c:	01212823          	sw	s2,16(sp)
    1790:	00001937          	lui	s2,0x1
    1794:	00912a23          	sw	s1,20(sp)
    1798:	01312623          	sw	s3,12(sp)
    179c:	01412423          	sw	s4,8(sp)
    17a0:	00112e23          	sw	ra,28(sp)
    17a4:	00812c23          	sw	s0,24(sp)
    17a8:	00050a13          	mv	s4,a0
    17ac:	00058493          	mv	s1,a1
    17b0:	0a890913          	addi	s2,s2,168 # 10a8 <Bitlist>
    17b4:	00000993          	li	s3,0
    17b8:	00000413          	li	s0,0
    17bc:	04000613          	li	a2,64
    17c0:	00000593          	li	a1,0
    17c4:	00090513          	mv	a0,s2
    17c8:	909fe0ef          	jal	d0 <memset>
    17cc:	00140413          	addi	s0,s0,1
    17d0:	d94ff0ef          	jal	d64 <init>
    17d4:	c7cff0ef          	jal	c50 <interface>
    17d8:	861ff0ef          	jal	1038 <FH_DU>
    17dc:	fe9410e3          	bne	s0,s1,17bc <benchmark_body.isra.0+0x38>
    17e0:	00198993          	addi	s3,s3,1
    17e4:	fd3a1ae3          	bne	s4,s3,17b8 <benchmark_body.isra.0+0x34>
    17e8:	01c12083          	lw	ra,28(sp)
    17ec:	01812403          	lw	s0,24(sp)
    17f0:	01412483          	lw	s1,20(sp)
    17f4:	01012903          	lw	s2,16(sp)
    17f8:	00c12983          	lw	s3,12(sp)
    17fc:	00812a03          	lw	s4,8(sp)
    1800:	02010113          	addi	sp,sp,32
    1804:	00008067          	ret
    1808:	00008067          	ret

0000180c <warm_caches>:
    180c:	00050593          	mv	a1,a0
    1810:	00100513          	li	a0,1
    1814:	f71ff06f          	j	1784 <benchmark_body.isra.0>

00001818 <benchmark>:
    1818:	ff010113          	addi	sp,sp,-16
    181c:	00200513          	li	a0,2
    1820:	00100593          	li	a1,1
    1824:	00112623          	sw	ra,12(sp)
    1828:	f5dff0ef          	jal	1784 <benchmark_body.isra.0>
    182c:	00c12083          	lw	ra,12(sp)
    1830:	00000513          	li	a0,0
    1834:	01010113          	addi	sp,sp,16
    1838:	00008067          	ret

0000183c <initialise_benchmark>:
    183c:	00008067          	ret

00001840 <verify_benchmark>:
    1840:	000017b7          	lui	a5,0x1
    1844:	fc010113          	addi	sp,sp,-64
    1848:	10000713          	li	a4,256
    184c:	0a878793          	addi	a5,a5,168 # 10a8 <Bitlist>
    1850:	00e12223          	sw	a4,4(sp)
    1854:	00012023          	sw	zero,0(sp)
    1858:	00012423          	sw	zero,8(sp)
    185c:	00012623          	sw	zero,12(sp)
    1860:	00012823          	sw	zero,16(sp)
    1864:	00012a23          	sw	zero,20(sp)
    1868:	00012c23          	sw	zero,24(sp)
    186c:	00012e23          	sw	zero,28(sp)
    1870:	02012023          	sw	zero,32(sp)
    1874:	02012223          	sw	zero,36(sp)
    1878:	02012423          	sw	zero,40(sp)
    187c:	02012623          	sw	zero,44(sp)
    1880:	02012823          	sw	zero,48(sp)
    1884:	02012a23          	sw	zero,52(sp)
    1888:	02012c23          	sw	zero,56(sp)
    188c:	02012e23          	sw	zero,60(sp)
    1890:	04078593          	addi	a1,a5,64
    1894:	00010713          	mv	a4,sp
    1898:	0080006f          	j	18a0 <verify_benchmark+0x60>
    189c:	02b78263          	beq	a5,a1,18c0 <verify_benchmark+0x80>
    18a0:	0007c603          	lbu	a2,0(a5)
    18a4:	00074683          	lbu	a3,0(a4)
    18a8:	00178793          	addi	a5,a5,1
    18ac:	00170713          	addi	a4,a4,1
    18b0:	fed606e3          	beq	a2,a3,189c <verify_benchmark+0x5c>
    18b4:	00000513          	li	a0,0
    18b8:	04010113          	addi	sp,sp,64
    18bc:	00008067          	ret
    18c0:	00001737          	lui	a4,0x1
    18c4:	000017b7          	lui	a5,0x1
    18c8:	0a072683          	lw	a3,160(a4) # 10a0 <tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRLexited_BEREIT_FH_TUERMODUL_CTRL>
    18cc:	0a47a783          	lw	a5,164(a5) # 10a4 <tm_entered_EINSCHALTSTROM_MESSEN_BLOCK_ERKENNUNG_CTRLch_BLOCK_ERKENNUNG_CTRL__N_copy>
    18d0:	00001737          	lui	a4,0x1
    18d4:	09c72703          	lw	a4,156(a4) # 109c <tm_entered_WIEDERHOLSPERRE_FH_TUERMODUL_CTRL>
    18d8:	00d7e7b3          	or	a5,a5,a3
    18dc:	00000513          	li	a0,0
    18e0:	00e7e7b3          	or	a5,a5,a4
    18e4:	fc079ae3          	bnez	a5,18b8 <verify_benchmark+0x78>
    18e8:	000017b7          	lui	a5,0x1
    18ec:	00c7c703          	lbu	a4,12(a5) # 100c <KINDERSICHERUNG_CTRL_KINDERSICHERUNG_CTRL_next_state>
    18f0:	00300793          	li	a5,3
    18f4:	fcf712e3          	bne	a4,a5,18b8 <verify_benchmark+0x78>
    18f8:	000017b7          	lui	a5,0x1
    18fc:	00b7c703          	lbu	a4,11(a5) # 100b <B_FH_TUERMODUL_CTRL_next_state>
    1900:	00200793          	li	a5,2
    1904:	faf71ae3          	bne	a4,a5,18b8 <verify_benchmark+0x78>
    1908:	000017b7          	lui	a5,0x1
    190c:	00a7c683          	lbu	a3,10(a5) # 100a <A_FH_TUERMODUL_CTRL_next_state>
    1910:	00100793          	li	a5,1
    1914:	faf692e3          	bne	a3,a5,18b8 <verify_benchmark+0x78>
    1918:	000017b7          	lui	a5,0x1
    191c:	0097c783          	lbu	a5,9(a5) # 1009 <WIEDERHOLSPERRE_FH_TUERMODUL_CTRL_next_state>
    1920:	f8d79ce3          	bne	a5,a3,18b8 <verify_benchmark+0x78>
    1924:	000016b7          	lui	a3,0x1
    1928:	0036c683          	lbu	a3,3(a3) # 1003 <FH_STEUERUNG_DUMMY_FH_STEUERUNG_DUMMY_next_state>
    192c:	f8e696e3          	bne	a3,a4,18b8 <verify_benchmark+0x78>
    1930:	00001737          	lui	a4,0x1
    1934:	00274703          	lbu	a4,2(a4) # 1002 <EINKLEMMSCHUTZ_CTRL_EINKLEMMSCHUTZ_CTRL_next_state>
    1938:	f8f710e3          	bne	a4,a5,18b8 <verify_benchmark+0x78>
    193c:	00001737          	lui	a4,0x1
    1940:	000017b7          	lui	a5,0x1
    1944:	00e74683          	lbu	a3,14(a4) # 100e <ZENTRAL_KINDERSICHERUNG_CTRL_next_state>
    1948:	00f7c783          	lbu	a5,15(a5) # 100f <NICHT_INITIALISIERT_NICHT_INITIALISIERT_next_state>
    194c:	00001737          	lui	a4,0x1
    1950:	00d74583          	lbu	a1,13(a4) # 100d <MEC_KINDERSICHERUNG_CTRL_next_state>
    1954:	00001737          	lui	a4,0x1
    1958:	00874603          	lbu	a2,8(a4) # 1008 <INITIALISIERT_FH_TUERMODUL_CTRL_next_state>
    195c:	00001737          	lui	a4,0x1
    1960:	00d7e7b3          	or	a5,a5,a3
    1964:	00774683          	lbu	a3,7(a4) # 1007 <TIPP_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state>
    1968:	00001737          	lui	a4,0x1
    196c:	00b7e7b3          	or	a5,a5,a1
    1970:	00674583          	lbu	a1,6(a4) # 1006 <MANUELL_SCHLIESSEN_FH_TUERMODUL_CTRL_next_state>
    1974:	00001737          	lui	a4,0x1
    1978:	00c7e7b3          	or	a5,a5,a2
    197c:	00574603          	lbu	a2,5(a4) # 1005 <OEFFNEN_FH_TUERMODUL_CTRL_next_state>
    1980:	00001737          	lui	a4,0x1
    1984:	00d7e7b3          	or	a5,a5,a3
    1988:	00474683          	lbu	a3,4(a4) # 1004 <SCHLIESSEN_FH_TUERMODUL_CTRL_next_state>
    198c:	00001737          	lui	a4,0x1
    1990:	00174703          	lbu	a4,1(a4) # 1001 <BEWEGUNG_BLOCK_ERKENNUNG_CTRL_next_state>
    1994:	00b7e7b3          	or	a5,a5,a1
    1998:	00c7e7b3          	or	a5,a5,a2
    199c:	00d7e7b3          	or	a5,a5,a3
    19a0:	00e7e7b3          	or	a5,a5,a4
    19a4:	f00798e3          	bnez	a5,18b4 <verify_benchmark+0x74>
    19a8:	000017b7          	lui	a5,0x1
    19ac:	0007c503          	lbu	a0,0(a5) # 1000 <__data_end>
    19b0:	fff50513          	addi	a0,a0,-1
    19b4:	00153513          	seqz	a0,a0
    19b8:	f01ff06f          	j	18b8 <verify_benchmark+0x78>
