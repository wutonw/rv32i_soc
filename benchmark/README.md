# RV32I 裸机 benchmark

这是一个适配当前软核的自校验整数 workload，重点覆盖循环、分支、函数调用、
变量移位、连续整数依赖和栈上 load/store。它不是官方 CoreMark 分数，但可以作为
后续修改流水线前后的固定性能基线。

运行：

```powershell
powershell -ExecutionPolicy Bypass -File benchmark/run.ps1
```

脚本会编译 RV32I 裸机程序、生成 1024×32 位 pROM 镜像、运行同步 ROM 仿真，
并输出校验值、周期数、近似退休指令数和近似 CPI。
