# RV32I FPGA 软核

基于 Verilog 的 32 位 RISC-V 顺序流水线软核。当前主工程使用 Vivado，目标器件为
`xc7z020clg400-2`。这是持续迭代的学习项目；下一步计划加入 RV32M 整数乘除法扩展。

## 当前实现

- RV32I 基础整数指令，以及 `Zicsr` CSR 指令、`ecall`、`ebreak` 和 `mret`；**尚未实现 RV32M**。
- 单发射、顺序执行、五级 IF/ID/EX/MEM/WB 流水线，无分支预测。分支和跳转在 EX 阶段决策，并清除错误路径指令。
- EX/MEM、MEM/WB 数据旁路，load-use 与同步 RAM 的 store-load 冲突停顿；CSR 写入在 WB 阶段提交，并处理连续 CSR 访问的数据相关。
- 32 KiB 同步指令 ROM 和 32 KiB 同步数据 RAM，32 位宽。两者是独立地址空间，没有统一总线或 Cache；数据 RAM 支持字节、半字、字访问。
- 机器态同步异常：非法指令、`ecall`、`ebreak`、非对齐取指目标及非对齐 load/store；支持 `mret` 返回。已实现 `mstatus`、`mie`、`mtvec`、`mepc`、`mcause`。完整外部中断链路、`mtval` 和标准 RISC-V compliance 测试尚未完成。

`src/core/m_ext.sv` 目前是空文件，不代表 M 扩展已接入。

## 目录

```text
src/core/             CPU、流水线寄存器、译码、CSR、Trap 和 RAM 控制
src/periph/           数据 RAM、去抖及保留的厂商 ROM 文件
src/top.v             FPGA 顶层、板测故障监控及当前 Xilinx ROM
proj_xilinx/rv32i_soc/rv32i_soc.xpr   当前 Vivado 工程
proj_gowwin/          保留的 Gowin 工程，不是当前主工程
firmware/             裸机 C、启动/Trap 代码及板测汇编和 HEX
tb/                   定向 testbench
performance_check/    流水线压力测试与 CoreMark/Fmax 检查入口
benchmark/            CoreMark、Dhrystone、Embench-IoT 移植和仿真
参考文件/             历史基线与性能记录
```

## Vivado 上板

打开 `proj_xilinx/rv32i_soc/rv32i_soc.xpr`，顶层为 `top`，约束文件为
`proj_xilinx/rv32i_soc/rv32i_soc.srcs/constrs_2/new/top.xdc`。当前顶层选择了
`FPGA_XILINX`，实例化 `board_stress_rom`：通过 `$readmemh` 从
`firmware/board_stress.hex` 初始化推断的 Block RAM。工程中仍保留
`xilinx_inst_rom.v` 和 Block Memory Generator IP，但**当前顶层没有使用它们**，
因此更新这份 HEX 后不需要重新配置该 IP，需要重新综合并生成 bitstream。

ROM 的 `$readmemh` 路径目前是 `src/top.v` 中的本机绝对路径；换电脑或移动工程时，
要先改为新位置。顶层端口为 `clk`、低有效 `raw_rst_n`、高有效 `led`。
当前板测汇编无限循环执行整数/CSR/访存自检，并对数据 RAM 的 `0x200` 至
`0x7ffc` 区域反复写入、读回校验。按板上 50 MHz 晶振，正常时 LED 每秒短亮
约 40 ms；检测到错误后常灭，直至复位。**板测运行的不是 CoreMark**。

XDC 的 `create_clock -period 10.000` 是 100 MHz 的时序分析目标，
不会把 50 MHz 板载晶振变成 100 MHz。历史 Fmax 报告也不等于当前板测的运行频率。

## 仿真与固件

需要 RISC-V GCC、Python 和 Icarus Verilog。普通裸机固件与板测汇编是两套程序：

```powershell
powershell -ExecutionPolicy Bypass -File firmware/build.ps1
powershell -ExecutionPolicy Bypass -File firmware/build_board_stress.ps1
```

`firmware/build.ps1` 生成 `firmware/build/firmware.hex`，用于相应固件 testbench；
Vivado 当前顶层读取的是 `firmware/board_stress.hex`，不是前者。两个镜像均为
8192 个 32 位指令字。普通 C 固件的 `.data` 初始化尚未实现，链接脚本只允许
零初始化全局数据。

常用定向测试：

```powershell
powershell -ExecutionPolicy Bypass -File tb/forwarding_tb.ps1
powershell -ExecutionPolicy Bypass -File tb/memory_hazard_tb.ps1
powershell -ExecutionPolicy Bypass -File tb/csr_stress_tb.ps1
powershell -ExecutionPolicy Bypass -File tb/firmware_trap_tb.ps1
```

Trap testbench 包含 12 次异常及 `mret` 返回检查。更大范围的流水线、CSR 提交
顺序压力测试和 CoreMark/Fmax 入口见 `performance_check/README.md`。
`tb/top_prom_tb.ps1` 针对旧 Gowin pROM 仿真模型，不是当前 Vivado 板测入口。

## 历史性能基线

`参考文件/性能记录.xlsx` 保存了不同实现版本的 RTL 仿真性能和 Vivado Fmax；
下表是**历史记录**，不是当前工程重新跑过的报告，也不是 50 MHz 板测实测分数。

| 版本 | CoreMark/MHz | 实现 Fmax | 备注 |
| --- | ---: | ---: | --- |
| v1 | 0.854813 | 80.978 MHz | 初始流水线及 Trap/CSR |
| v2 | 0.839941 | 92.954 MHz | 增加 RAM 读数据旁路 |
| v2.1 | 0.839941 | 99.295 MHz | 调整 CSR/load hazard 与复位启动 |
| v2.2 | 0.839941 | 101.657 MHz | CSR 写入移至 WB |

另一次 10 次迭代的 CoreMark RTL 仿真记录为 `11,698,464` timed cycles、
约 `1.622` CPI、`0.854813 CoreMark/MHz`；它属于早期基线，和表中 v2.2 的
`0.839941 CoreMark/MHz` 不是同一版本。Dhrystone 历史基线为
`0.757856 DMIPS/MHz`。Embench-IoT 的 18/19 项 smoke 测试可装入当前
32 KiB 数据 RAM，`xgboost` 需要更大仿真 RAM；相关估算不属于正式成绩。
详细条件及复现方法见 `参考文件/RV32I软核基线记录_2026-09-12.md` 和
`benchmark/` 下各测试说明。

## 下一步

加入 RV32M 时，需同时处理译码、执行单元、流水线停顿/结果旁路和异常清除，
再补乘除法边界测试与 C benchmark 对比。当前主线仍以 Vivado 工程和 RV32I
现有功能为基线。
