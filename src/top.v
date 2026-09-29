// FPGA 厂商选择：运行 switch_fpga.cmd，输入 1 选 Gowin、2 选 Xilinx
//`define FPGA_GOWIN
`define FPGA_XILINX

module top(
    input wire raw_rst_n,
    input wire clk,
    output wire led

);
    wire rst_n;
    wire [31:0] inst_addr;
    wire [31:0] inst;
    wire [12:0] prom_addr;
    wire prom_ce;

    // Mechanical reset input is active-low; debounce produces a stable
    // active-low reset for the CPU.
    debounce u_debounce(
        .clk    (clk),
        .key_in (raw_rst_n),
        .key_out(rst_n)
    );

    // The CPU uses byte addresses.  The pROM stores 32-bit instruction words,
    // so discard the two always-zero byte-offset bits.
    assign prom_addr = inst_addr[14:2];

    `ifdef FPGA_GOWIN
        Gowin_pROM u_instruction_rom(
            .dout  (inst),
            .clk   (clk),
            .oce   (1'b1),
            .ce    (prom_ce),
            .reset (~rst_n),
            .ad    (prom_addr)
        );
    `elsif FPGA_XILINX
        board_stress_rom u_instruction_rom (
            .clk (clk),
            .ce  (prom_ce),
            .addr(prom_addr),
            .inst(inst)
        );
    `else
        `error "FPGA vendor not selected!"
    `endif

    wire [31:0] pc;
    cpu_core u_cpu_core(
        .clk      (clk),
        .rst_n    (rst_n),
        .pc (pc),
        .inst     (inst),
        .inst_addr(inst_addr),
        .prom_ce  (prom_ce)
    );

    localparam [31:0] LOOP_PC = 32'h0000_0028;
    localparam [31:0] FAIL_PC = 32'h0000_023c;
    reg failure_latched;
    reg [2:0] fail_visits;
    reg [19:0] heartbeat_count;
    reg [25:0] blink_count;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            failure_latched <= 1'b0;
            fail_visits <= 3'b0;
            heartbeat_count <= 20'b0;
            blink_count <= 26'b0;
        end else begin
            if (blink_count == 26'd49_999_999) blink_count <= 26'b0;
            else blink_count <= blink_count + 1'b1;

            if (pc == LOOP_PC) begin
                heartbeat_count <= 20'b0;
                fail_visits <= 3'b0;
            end else begin
                if (!(&heartbeat_count)) heartbeat_count <= heartbeat_count + 1'b1;
                if (pc == FAIL_PC && !(&fail_visits)) fail_visits <= fail_visits + 1'b1;
            end

            if (fail_visits >= 3'd3 || (&heartbeat_count)) failure_latched <= 1'b1;
        end
    end

    assign led = rst_n && !failure_latched && (blink_count < 26'd2_000_000);

endmodule

`ifdef FPGA_XILINX
module board_stress_rom(
    input wire clk,
    input wire ce,
    input wire [12:0] addr,
    output reg [31:0] inst
);
    (* rom_style = "block" *) reg [31:0] words [0:8191];

    initial $readmemh("D:/aaa1verilog_project/rv32i_soc/firmware/board_stress.hex", words);
    always @(posedge clk) begin
        if (ce) inst <= words[addr];
    end
endmodule
`endif
