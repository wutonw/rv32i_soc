
D:\aaa1verilog_project\rv32i_cpu\benchmark\embench\build\crc32\crc32.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
   0:	00008117          	auipc	sp,0x8
   4:	f0010113          	addi	sp,sp,-256 # 7f00 <__stack_top>
   8:	00001297          	auipc	t0,0x1
   c:	3f828293          	addi	t0,t0,1016 # 1400 <seed>
  10:	00001317          	auipc	t1,0x1
  14:	3f430313          	addi	t1,t1,1012 # 1404 <__bss_end>
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
  78:	180000ef          	jal	1f8 <initialise_benchmark>
  7c:	00000513          	li	a0,0
  80:	17c000ef          	jal	1fc <warm_caches>
  84:	fadff0ef          	jal	30 <start_trigger>
  88:	180000ef          	jal	208 <benchmark>
  8c:	00a12623          	sw	a0,12(sp)
  90:	fb5ff0ef          	jal	44 <stop_trigger>
  94:	00c12503          	lw	a0,12(sp)
  98:	17c000ef          	jal	214 <verify_benchmark>
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

000000d0 <rand_beebs>:
  d0:	00001637          	lui	a2,0x1
  d4:	40062703          	lw	a4,1024(a2) # 1400 <seed>
  d8:	000036b7          	lui	a3,0x3
  dc:	03968693          	addi	a3,a3,57 # 3039 <__bss_end+0x1c35>
  e0:	00871793          	slli	a5,a4,0x8
  e4:	40e787b3          	sub	a5,a5,a4
  e8:	00379793          	slli	a5,a5,0x3
  ec:	00e787b3          	add	a5,a5,a4
  f0:	00779793          	slli	a5,a5,0x7
  f4:	00e787b3          	add	a5,a5,a4
  f8:	00379793          	slli	a5,a5,0x3
  fc:	40e787b3          	sub	a5,a5,a4
 100:	00579593          	slli	a1,a5,0x5
 104:	00b78533          	add	a0,a5,a1
 108:	00251513          	slli	a0,a0,0x2
 10c:	40e50533          	sub	a0,a0,a4
 110:	00251513          	slli	a0,a0,0x2
 114:	00e50533          	add	a0,a0,a4
 118:	00d50533          	add	a0,a0,a3
 11c:	00151513          	slli	a0,a0,0x1
 120:	00155513          	srli	a0,a0,0x1
 124:	40a62023          	sw	a0,1024(a2)
 128:	01055513          	srli	a0,a0,0x10
 12c:	00008067          	ret

00000130 <srand_beebs>:
 130:	000017b7          	lui	a5,0x1
 134:	40a7a023          	sw	a0,1024(a5) # 1400 <seed>
 138:	00008067          	ret

0000013c <benchmark_body>:
 13c:	fe010113          	addi	sp,sp,-32
 140:	00112e23          	sw	ra,28(sp)
 144:	00812c23          	sw	s0,24(sp)
 148:	08058c63          	beqz	a1,1e0 <benchmark_body+0xa4>
 14c:	00912a23          	sw	s1,20(sp)
 150:	000014b7          	lui	s1,0x1
 154:	01312623          	sw	s3,12(sp)
 158:	01412423          	sw	s4,8(sp)
 15c:	01512223          	sw	s5,4(sp)
 160:	01212823          	sw	s2,16(sp)
 164:	01612023          	sw	s6,0(sp)
 168:	00050a93          	mv	s5,a0
 16c:	00058993          	mv	s3,a1
 170:	00048493          	mv	s1,s1
 174:	00000a13          	li	s4,0
 178:	00000913          	li	s2,0
 17c:	00000513          	li	a0,0
 180:	fb1ff0ef          	jal	130 <srand_beebs>
 184:	40000b13          	li	s6,1024
 188:	fff00413          	li	s0,-1
 18c:	f45ff0ef          	jal	d0 <rand_beebs>
 190:	00a447b3          	xor	a5,s0,a0
 194:	0ff7f793          	zext.b	a5,a5
 198:	00279793          	slli	a5,a5,0x2
 19c:	00f487b3          	add	a5,s1,a5
 1a0:	0007a783          	lw	a5,0(a5)
 1a4:	00845413          	srli	s0,s0,0x8
 1a8:	fffb0b13          	addi	s6,s6,-1
 1ac:	0087c433          	xor	s0,a5,s0
 1b0:	fc0b1ee3          	bnez	s6,18c <benchmark_body+0x50>
 1b4:	00190913          	addi	s2,s2,1
 1b8:	fd2992e3          	bne	s3,s2,17c <benchmark_body+0x40>
 1bc:	001a0a13          	addi	s4,s4,1
 1c0:	fb4a9ce3          	bne	s5,s4,178 <benchmark_body+0x3c>
 1c4:	01412483          	lw	s1,20(sp)
 1c8:	01012903          	lw	s2,16(sp)
 1cc:	00c12983          	lw	s3,12(sp)
 1d0:	00812a03          	lw	s4,8(sp)
 1d4:	00412a83          	lw	s5,4(sp)
 1d8:	00012b03          	lw	s6,0(sp)
 1dc:	fff44413          	not	s0,s0
 1e0:	01141413          	slli	s0,s0,0x11
 1e4:	01c12083          	lw	ra,28(sp)
 1e8:	01145513          	srli	a0,s0,0x11
 1ec:	01812403          	lw	s0,24(sp)
 1f0:	02010113          	addi	sp,sp,32
 1f4:	00008067          	ret

000001f8 <initialise_benchmark>:
 1f8:	00008067          	ret

000001fc <warm_caches>:
 1fc:	00050593          	mv	a1,a0
 200:	00100513          	li	a0,1
 204:	f39ff06f          	j	13c <benchmark_body>

00000208 <benchmark>:
 208:	00100593          	li	a1,1
 20c:	00200513          	li	a0,2
 210:	f2dff06f          	j	13c <benchmark_body>

00000214 <verify_benchmark>:
 214:	ffffd7b7          	lui	a5,0xffffd
 218:	35778793          	addi	a5,a5,855 # ffffd357 <__stack_top+0xffff5457>
 21c:	00f50533          	add	a0,a0,a5
 220:	00153513          	seqz	a0,a0
 224:	00008067          	ret
