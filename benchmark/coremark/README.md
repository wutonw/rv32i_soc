# CoreMark 裸机移植

`official/` 中是 EEMBC CoreMark 官方核心源码，保留其 Apache-2.0 许可证。
本目录只增加了当前 RV32I 哈佛结构需要的启动代码、链接脚本、端口和 testbench。

运行：

```powershell
powershell -ExecutionPolicy Bypass -File benchmark/coremark/run.ps1
```

当前默认运行 1 次迭代，用于 RTL 功能验证和性能估算。testbench 在 CoreMark 的
`start_time()`/`stop_time()` 标记之间统计真实周期，并由官方 CRC 校验决定 PASS。

按当前单次实测周期，在 100 MHz 下模拟至少 10 秒的长测：

```powershell
powershell -ExecutionPolicy Bypass -File benchmark/coremark/run_10s.ps1
```

这会执行 855 次迭代、模拟约 10 亿个 CPU 周期。Icarus 可能需要数小时，期间会
每 5000 万周期打印一次进度。可用 `-ClockMHz` 指定计划使用的板级时钟频率。

注意：这是短时仿真结果，不满足 CoreMark 官方“至少运行 10 秒”的正式上报规则；
输出的 CoreMark/s 和 CoreMark/MHz 只能用于本项目不同版本之间比较。
