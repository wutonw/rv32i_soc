# RV32I CPU

一个使用 Verilog 编写的 RV32I FPGA 软核学习项目，目标器件为 Gowin GW2A 系列 FPGA。

## 当前状态

- RV32I 整数指令、基础机器态 CSR：`mstatus`、`mie`、`mtvec`、`mepc`、`mcause`
- 五级顺序流水线：IF/ID/EX/MEM/WB，单发射、无分支预测
- EX/MEM、MEM/WB forwarding；load-use 与 store-load hazard stall
- 分支、`JAL`、`JALR` 及错误路径 flush
- `LB/LH/LW`、无符号 load，以及 `SB/SH/SW`
- 基础同步 Trap 入口、异常分类和 `mret` 返回
- 32 KiB × 32-bit Gowin 同步 pROM + 32 KiB 数据 RAM
- Harvard 结构：指令 pROM 与数据 RAM 地址空间分离
- 裸机 C、CoreMark、Dhrystone 和 Embench-IoT 测试环境

当前仍未完成：外部中断完整链路、`mtval` 等未实现 CSR、RV32M、Cache 和标准
RISC-V compliance 测试。

## 工程结构

```text
src/core/       CPU 核心 RTL
src/periph/     RAM、Gowin pROM、按键去抖
src/top.v       FPGA 顶层
firmware/       裸机 C、启动代码、Trap 入口和链接脚本
tb/             定向及压力 testbench
benchmark/      自定义测试、CoreMark、Dhrystone、Embench
rv32i_cpu.gprj  Gowin IDE 工程
```

## 构建固件

需要 RISC-V GCC 工具链、Python 和 Icarus Verilog：

```powershell
powershell -ExecutionPolicy Bypass -File firmware/build.ps1
```

输出位于 `firmware/build/`，其中 `firmware.hex` 是 8192×32-bit 指令镜像。

## 定向仿真

```powershell
# forwarding、load/store hazard
powershell -ExecutionPolicy Bypass -File tb/forwarding_tb.ps1
powershell -ExecutionPolicy Bypass -File tb/memory_hazard_tb.ps1

# 分支、跳转、flush、顶层 pROM 模型
powershell -ExecutionPolicy Bypass -File tb/top_prom_tb.ps1

# 基础 CSR 压测
powershell -ExecutionPolicy Bypass -File tb/csr_stress_tb.ps1

# 固件驱动的 Trap/mret 压测
powershell -ExecutionPolicy Bypass -File tb/firmware_trap_tb.ps1
```

Trap 压测覆盖 `ecall`、`ebreak`、非法指令、非对齐 load/store、非对齐跳转，
共 12 次异常；同时检查 cause 顺序、精确 `mepc`、MIE/MPIE、`mret` 次数、
故障指令的寄存器/内存副作用。通过标志为：

```text
PASS: all 12 firmware Trap tests passed
```

## 性能基线

以下数据均为 Icarus Verilog 裸机仿真结果，目标频率按 100 MHz 估算，主要用于
比较本项目不同微架构版本，不是经过独立认证的正式成绩。

| 测试 | 编译/运行条件 | 结果 |
|---|---|---:|
| CoreMark | 官方源码，`-O2 -march=rv32i`，10 次迭代 | 0.854813 CoreMark/MHz |
| Dhrystone 2.1 | `-O2 -march=rv32i`，10000 次 | 0.757856 DMIPS/MHz |
| Embench-IoT | 官方 19 项，`-O2 -march=rv32i`，18/19 可装入 | 约 0.4901/MHz（18 项子集） |

CoreMark 的详细结果：

```text
timed cycles     : 11,698,464
timed CPI        : 1.621732
CoreMark @100MHz : 85.481 CoreMark/s
CoreMark/MHz     : 0.854813
```

运行 CoreMark：

```powershell
powershell -ExecutionPolicy Bypass -File benchmark/coremark/run.ps1 `
  -Iterations 10 -MaxCycles 15000000 -ClockMHz 100
```

运行 Dhrystone：

```powershell
powershell -ExecutionPolicy Bypass -File benchmark/dhrystone/run.ps1
```

运行 Embench smoke 测试：

```powershell
powershell -ExecutionPolicy Bypass -File benchmark/embench/run_all.ps1 `
  -LocalScaleOverride 1 -MaxCycles 10000000
```

完整的逐项周期、CPI 和估算方法记录在本地基线文档中；正式 benchmark 结果应
注明编译选项、迭代次数、时钟频率和仿真/板级运行环境。

## Gowin FPGA 工程

使用 Gowin IDE 打开 `rv32i_cpu.gprj`，顶层模块为 `top`，引脚约束文件为
`src/rv32i_cpu.cst`。工程中的 Gowin pROM 需要先把 `firmware/build/firmware.hex`
导入 IP，再进行综合、布局布线和上板验证。
