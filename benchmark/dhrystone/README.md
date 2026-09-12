# Dhrystone 2.1 裸机移植

`source/` 保存 Dhrystone 2.1 核心源码。本目录增加了当前 RV32I 哈佛结构需要的
启动代码、最小 C 库函数、结果校验钩子和同步 ROM testbench，不修改 CPU RTL。

运行默认 10000 次：

```powershell
powershell -ExecutionPolicy Bypass -File benchmark/dhrystone/run.ps1
```

输出包括近似 CPI、Dhrystones/s、DMIPS 和 DMIPS/MHz。这里的分数来自 RTL
仿真，适合比较本项目版本，不属于经过独立认证的正式发布成绩。
