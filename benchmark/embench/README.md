# Embench-IoT 裸机移植

`official/` 保存 Embench-IoT 官方 19 项 benchmark 和 GPL-3.0 许可证。本目录的
`port/` 提供当前 RV32I 哈佛结构所需的启动代码、最小 C 库和 RAM marker。

编译并运行全部可装入 32 KiB pROM/32 KiB RAM 的测试：

```powershell
powershell -ExecutionPolicy Bypass -File benchmark/embench/run_all.ps1
```

默认使用官方各项目的 local scale factor 和 `GLOBAL_SCALE_FACTOR=1`。每项都会
执行官方 `verify_benchmark()`，结果写入 `benchmark/embench/build/results.csv`。
周期数与 CPI 是 RTL 仿真基线，不是官方归一化 Embench 分数。

快速功能 smoke run（不修改 `official/` 中的源码，只在构建目录把每项
`LOCAL_SCALE_FACTOR` 临时降为 1）：

```powershell
powershell -ExecutionPolicy Bypass -File benchmark/embench/run_all.ps1 `
  -LocalScaleOverride 1 -MaxCycles 10000000
```

smoke run 适合 RTL 仿真验证移植和指令执行正确性，不可作为官方 Embench 分数。

根据 `LOCAL_SCALE_FACTOR=1` 和 `2` 两轮周期做线性外推，并加入仅仿真扩容
RAM 后测得的 xgboost 周期：

```powershell
powershell -ExecutionPolicy Bypass -File benchmark/embench/estimate_score.ps1
```

输出是便于架构对比的估算分数；xgboost 在实际 32 KiB 数据 RAM 上仍然装不下。
