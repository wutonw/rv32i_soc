# RV32I FPGA 软核

基于 Verilog 的 32 位 RISC-V 顺序流水线软核。当前主工程使用 Vivado，目标器件为
`xc7z020clg400-2`。这是持续迭代的学习项目，已加入硬件乘法，目前尚未实现整数除法。

## 当前实现

- RV32I 基础整数指令，以及 `Zicsr` CSR 指令、`ecall`、`ebreak` 和 `mret`。
- 已实现 `Zmmul` 硬件乘法：`MUL`、`MULH`、`MULHSU`、`MULHU`；尚未实现 `DIV/DIVU/REM/REMU`，不是完整 RV32M。
- 单发射、顺序执行、五级 IF/ID/EX/MEM/WB 流水线，无分支预测。分支和跳转在 EX 阶段决策，并清除错误路径指令。
- EX/MEM、MEM/WB 数据旁路，load-use 与同步 RAM 的 store-load 冲突停顿；CSR 写入在 WB 阶段提交，并处理连续 CSR 访问的数据相关。
- 32 KiB 同步指令 ROM 和 32 KiB 同步数据 RAM，32 位宽。两者是独立地址空间，没有统一总线或 Cache；数据 RAM 支持字节、半字、字访问。
- 机器态同步异常：非法指令、`ecall`、`ebreak`、非对齐取指目标及非对齐 load/store；支持 `mret` 返回。已实现 `mstatus`、`mie`、`mtvec`、`mepc`、`mcause`。完整外部中断链路、`mtval` 和标准 RISC-V compliance 测试尚未完成。

乘法单元 `src/core/m_ext.sv` 使用 Xilinx `mult_gen_0` IP，目前配置为两级流水，
执行乘法时暂停前端并向 EX/MEM 插入气泡。RTL 的 `PIPELINE_STAGE` 必须与 IP
的 Pipeline Stages 一致，修改后需重新生成 IP 输出文件。

**当前 Gowin（高云）工程不可用**：尚未适配高云乘法 IP 核，不能仅切换顶层
厂商宏就运行。保留的 Gowin 工程和 pROM 文件仅供后续移植参考。

## 目录

```text
src/core/             CPU、流水线寄存器、译码、乘法、CSR、Trap 和 RAM 控制
src/periph/           数据 RAM、去抖及保留的厂商 ROM 文件
src/top.v             FPGA 顶层、板测故障监控及当前 Xilinx ROM
proj_xilinx/rv32i_soc/rv32i_soc.xpr   当前 Vivado 工程
proj_gowwin/          保留的 Gowin 工程，当前不可用，尚未适配乘法 IP
firmware/             裸机 C、启动/Trap 代码及板测汇编和 HEX
tb/                   定向 testbench、流水线/CSR/Trap/乘法压力测试
performance_check/    压力测试门禁与 CoreMark/Fmax 检查入口
benchmark/coremark/   CoreMark 裸机移植和 RTL 仿真
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

需要 RISC-V GCC、Python 和 Vivado XSim；当前完整测试使用实际生成的乘法 IP
仿真模型，不能只用 Icarus Verilog 运行。普通裸机固件与板测汇编是两套程序：

```powershell
powershell -ExecutionPolicy Bypass -File firmware/build.ps1
powershell -ExecutionPolicy Bypass -File firmware/build_board_stress.ps1
```

`firmware/build.ps1` 生成 `firmware/build/firmware.hex`，用于相应固件 testbench；
Vivado 当前顶层读取的是 `firmware/board_stress.hex`，不是前者。两个镜像均为
8192 个 32 位指令字。普通 C 固件的 `.data` 初始化尚未实现，链接脚本只允许
零初始化全局数据。

从项目根目录运行完整压力测试及 CoreMark/Fmax 检查：

```cmd
performance_check\run_coremark_fmax.cmd
```

入口先运行流水线、访存、CSR 提交顺序、Trap 和乘法压力测试，全部通过后运行
10 次 CoreMark 迭代，再输入时钟约束周期和 WNS 来估算 Fmax。乘法测试可单独
运行 `tb\run_mul_dsp_stress.cmd`。脚本使用项目 `.venv` 和 Vivado XSim，配置说明
见 `performance_check/README.md`；旧 Icarus/Gowin 脚本不代表当前完整核测试入口。

## 性能测试

以下为已记录的版本结果。CoreMark/MHz 来自 RTL 仿真，Fmax 按 Vivado
实现后的时序报告估算，CoreMark/s 为两者相乘；它们不是当前 50 MHz 板测程序
的实测成绩。LUT、FF、BRAM、DSP 为器件资源占用比例。

| 版本 | CoreMark/s @ Fmax | CoreMark/MHz | Fmax | LUT | FF | BRAM | DSP | 主要变化 |
| --- | ---: | ---: | ---: | ---: | ---: | ---: | ---: | --- |
| v1 | 69.221 | 0.854813 | 80.978 MHz | 5% | 2% | 11% | 0% | 初始流水线及 Trap/CSR |
| v2 | 78.076 | 0.839941 | 92.954 MHz | 5% | 2% | 11% | 0% | 增加 RAM 读数据旁路 |
| v2.1 | 83.402 | 0.839941 | 99.295 MHz | 5% | 2% | 11% | 0% | 调整 CSR/load hazard 与复位扇出 |
| v2.2 | 85.386 | 0.839941 | 101.657 MHz | 5% | 2% | 11% | 0% | CSR 写入移至 WB |
| v3 | 210.713 | 2.326062 | 90.588 MHz | 5% | 2% | 11% | 2% | 加入硬件乘法，IP 一级流水 |
| v3.1 | 224.555 | 2.276311 | 98.649 MHz | 5% | 2% | 11% | 2% | 乘法 IP 改为两级流水 |

最新 v3.1（2026-10-09）使用 `-O2 -march=rv32i_zmmul -mabi=ilp32`，
10 次迭代通过官方 CRC 校验：`4,393,072` timed cycles、`2,882,000` timed
retired instructions，约 `1.524314` CPI。启用硬件乘法，除法仍由软件完成。
这是短时仿真测试，**不满足 CoreMark 官方至少运行 10 秒的正式上报要求**。

`benchmark/coremark/` 提供 CoreMark 的构建、RTL 仿真脚本与运行条件；
`performance_check/` 提供压力测试及 CoreMark/Fmax 检查入口。

## 下一步

继续完善除法/取余以补齐 RV32M，并补充边界测试与性能对比；高云 IP 适配和
完整外部中断链路尚待实现。当前主线以 Vivado 工程为准。
