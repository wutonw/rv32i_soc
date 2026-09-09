# RV32I FPGA 软核实验

这是一个面向学习和 FPGA 实验的 RV32I 软核 CPU 工程。工程使用 Verilog 编写，目标器件是 Gowin GW2A 系列 FPGA，当前重点是把基本指令、流水线、存储器和板级启动流程跑通。

这不是一个已经完成所有特权功能、异常场景和总线接口的生产级处理器；RTL 仍会继续迭代，README 也会随着工程状态更新。

## 当前状态

- 基础 RV32I 指令解码和 ALU：R-type、I-type、LUI、AUIPC、load/store、branch、JAL、JALR 等。
- 当前 CPU 采用 IF/ID、ID/EX、EX/MEM、MEM/WB 流水线寄存器。
- 已加入基础 forwarding 路径，并有核心级和板级定向仿真脚本。
- 数据 RAM 为 32 KiB（8192 个 32-bit word），按字节写使能工作。
- 指令存储使用 Gowin 生成的同步 pROM，两个 16-bit pROM 拼成 32-bit 指令字。
- 板级顶层包含按键去抖、CPU、pROM、RAM 和 `led_pass`/`led_fail` 输出。
- CSR、trap、hazard/stall 等部分仍属于实验性功能，使用前应以当前 RTL 和测试结果为准。

## 工程结构

```text
src/
  core/                 CPU 核心、解码器、ALU、寄存器堆和流水线寄存器
  periph/               RAM、按键去抖、Gowin pROM 封装
  top.v                 FPGA 板级顶层
  rv32i_cpu.cst         引脚和时钟约束
firmware/               裸机 C/汇编程序、链接脚本和 hex 生成脚本
tb/                     定向仿真 testbench 和 PowerShell 启动脚本
rv32i_cpu.gprj         Gowin IDE 工程文件
参考文件/              参考资料（默认不纳入 Git）
```

## 用 Gowin IDE 打开和综合

1. 在 Gowin IDE 中打开根目录下的 `rv32i_cpu.gprj`。
2. 顶层模块选择 `top`。
3. 确认 `src/rv32i_cpu.cst` 已加入工程，并按自己的板卡检查引脚约束。
4. 生成/替换 pROM 初始化文件后执行综合、布局布线和下载。

`src/periph/gowin_prom/gowin_prom.v` 是 Gowin IP 生成的封装，通常需要在本机 Gowin IDE 中重新生成或更新 IP；不要手工改动其中的 primitive 参数，除非你明确知道目标器件的配置要求。

板级复位链路是低有效输入 `raw_rst_n` → `debounce` → CPU 的 `rst_n`。Gowin pROM 的 `RESET` 端为高有效，因此顶层使用 `.reset(~rst_n)`。

## 固件构建

需要把 `riscv-none-elf-gcc`、`riscv-none-elf-objcopy` 和 `riscv-none-elf-objdump` 放进 `PATH`，并安装 Python。然后在工程根目录执行：

```powershell
powershell -ExecutionPolicy Bypass -File firmware/build.ps1
```

脚本会调用 `firmware/link.ld`、`start.S`、`trap_entry.S` 和 `main.c`，在 `firmware/build/` 下生成 ELF、BIN、反汇编、MAP 以及供 pROM 使用的 hex 文件。当前链接脚本按“指令 ROM 与数据 RAM 分离、两者都从地址 0 开始”的教学实验内存模型配置；请根据实际 pROM 初始化工具检查最终输出格式和容量。

## 仿真

在工程根目录运行：

```powershell
powershell -ExecutionPolicy Bypass -File tb/forwarding_tb.ps1
powershell -ExecutionPolicy Bypass -File tb/top_prom_tb.ps1
```

前者直接实例化 `cpu_core`，用于检查连续算术、load-use、store-data forwarding 等场景。后者实例化真实的 `top` 和 Gowin `Gowin_pROM`，用于检查 pROM 接口、同步读延迟、跳转/flush 和 forwarding 的组合效果。

`top_prom_tb.ps1` 默认使用 Gowin 官方仿真库：

```text
D:\Gowin\Gowin_V1.9.11.03_Education_x64\IDE\simlib\gw2a\prim_sim.v
```

如果 Gowin 安装在其他目录，请修改脚本中的 `$gowinSim` 路径。pROM 压力测试会直接向仿真模型的 `ram_MEM` 写入指令，因此这是仿真辅助方法，不等同于板上实际初始化流程。

仿真生成的 `.vvp`、`.vcd` 等文件属于构建产物；查看波形可用 GTKWave 或其他 VCD 查看器，重点观察 `pc`、`inst_addr`、`if_id_pc`、`if_id_valid`、各级 `*_valid`、`ex_alu_result`、RAM 地址/写使能以及写回数据。

## 已知限制和后续计划

- hazard/stall 和 forwarding 还需要更多边界场景验证，尤其是 load-use、连续 store 和分支附近的数据相关。
- CSR/trap 目前是实验性实现，不能把当前测试通过理解为完整的 RISC-V 特权架构实现。
- 指令 ROM、数据 RAM 和地址空间是为当前教学板卡搭建的简化结构，尚未接入 AXI 等标准总线。
- 需要继续增加更系统的 C 固件测试、非法指令/异常测试、外设映射和板级 LED/ILA 观测。
- Fmax 会受到器件、综合/布局布线结果、时序约束和当前 RTL 结构共同影响；README 不固定承诺某个频率。

## 上传到 GitHub 前的提醒

当前 `.gitignore` 中有一行单独的 `tb`，这会把整个测试目录忽略掉。如果希望把 testbench 和脚本一并上传，需要在本地上传前删除或改写这一行；否则 GitHub 上只会看到 RTL/固件等未被忽略的文件。`firmware/build/`、`impl/`、仿真输出和用户工程状态文件通常不建议上传。

