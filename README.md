# RV32I CPU

一个使用 Verilog 编写的 RV32I FPGA 软核学习项目，当前运行于 Gowin GW2A 系列 FPGA。

## 当前实现

- RV32I 基础整数指令
- IF/ID、ID/EX、EX/MEM、MEM/WB 流水线寄存器
- 数据 forwarding
- Load/Store 与 32 KiB 数据 RAM
- Branch、JAL、JALR 跳转及流水线 flush
- Gowin 同步 pROM 指令存储器
- 裸机 C 程序和定向仿真

CSR、trap 和 hazard/stall 等功能仍在继续完善。

## 目录

```text
src/core/       CPU 核心 RTL
src/periph/     RAM、pROM 和按键去抖
src/top.v       FPGA 顶层
firmware/       裸机 C、启动代码和链接脚本
tb/             Verilog testbench
rv32i_cpu.gprj  Gowin IDE 工程
```

## 构建固件

需要安装 RISC-V GCC 工具链和 Python：

```powershell
powershell -ExecutionPolicy Bypass -File firmware/build.ps1
```

生成文件位于 `firmware/build/`。

## 仿真

需要安装 Icarus Verilog：

```powershell
# Forwarding 定向测试
powershell -ExecutionPolicy Bypass -File tb/forwarding_tb.ps1

# 顶层、Gowin pROM、跳转和 flush 压力测试
powershell -ExecutionPolicy Bypass -File tb/top_prom_tb.ps1
```

`top_prom_tb.ps1` 中的 Gowin 仿真库路径需要与本机安装位置一致。

## FPGA 工程

使用 Gowin IDE 打开 `rv32i_cpu.gprj`，顶层模块为 `top`，引脚约束文件为 `src/rv32i_cpu.cst`。
