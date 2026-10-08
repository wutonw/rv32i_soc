# 乘法压力测试

在仓库根目录运行，或直接双击 CMD：

```powershell
cmd /c performance_check\run_mul_stress.cmd
```

需要 Python、Icarus Verilog (`iverilog` / `vvp`)。不需要重新编译固件，
不会修改 RTL、顶层 ROM 或 Git。默认生成固定随机种子的测试，便于复现。

覆盖 `MUL`、`MULH`、`MULHSU`、`MULHU`：

- 单元级：18 种边界值两两组合，以及 10000 对随机操作数，共 41296 个向量。
- 整核级：同步指令 ROM、实际数据 RAM；连续乘法与 ALU 依赖、同一 rd 连写、
  rd/rs 重合、x0、load-use、store 数据/地址旁路、字节/半字 load、分支/JAL/JALR
  的错误路径清除、反向循环、CSR 操作数旁路，以及乘法执行期间复位后重跑。
- 每条寄存器写回和 store 都与 Python 架构模型比较，最终再检查全部 RAM。
  各测试将结果写入 `0x1000` 起的签名区域，完成标记位于 `0x7ffc`。

参考结果用 Python 任意精度整数计算，不依赖 RTL 的乘法表达式。每个程序装入
实际的 8192 字指令 ROM；不执行尚未实现的除法，不是完整 RV32M compliance 测试。

生成的 HEX、汇编列表、编译日志与仿真日志位于 `performance_check/build/mul_stress/`。
失败时返回非零退出码，且继续运行其他批次以区分问题范围。改变种子或增加随机向量：

```powershell
cmd /c performance_check\run_mul_stress.cmd --seed 0x12345678 --unit-pairs 20000 --random-pairs 512
```

首次运行（2026-10-08）发现：乘法单元及其他测试通过，紧邻的乘法结果写 CSR
失败；中间隔 1、2、3 条 NOP 的 CSR 测试通过。最小复现：

```asm
li     x1, 3
li     x2, 7
mul    x3, x1, x2
csrrw  x0, mie, x3
csrrs  x5, mie, x0
# x5 应为 21；当前得到 10，即普通 ALU 的 3 + 7。
```

问题位于 `cpu_core.v` 的 CSR rs1 EX 旁路：`wb_sel == 00` 时选取普通
`ex_alu_result`，未选择当前乘法指令的结果。测试未修改 RTL；修复后重跑即可。
