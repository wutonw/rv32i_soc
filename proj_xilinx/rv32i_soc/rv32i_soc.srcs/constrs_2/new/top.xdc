create_clock -period 10.000 -name sys_clk -waveform {0.000 5.000} -add [get_ports clk]

set_property PACKAGE_PIN U18 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports led]
set_property IOSTANDARD LVCMOS33 [get_ports raw_rst_n]
set_property PACKAGE_PIN T10 [get_ports led]
set_property PACKAGE_PIN T19 [get_ports raw_rst_n]
