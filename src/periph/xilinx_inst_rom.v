`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2026/09/19 00:13:59
// Design Name: 
// Module Name: xilinx_inst_rom
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module xilinx_inst_rom (
    input  wire        clk,
    input  wire        ce,
    input  wire [12:0] addr,
    output wire [31:0] inst
);

    blk_mem_gen_0 u_rom (
        .clka  (clk),
        .ena   (ce),
        .addra (addr),
        .douta (inst)
    );

endmodule
