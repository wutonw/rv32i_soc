`timescale 1ns/1ps

module benchmark_tb;
    localparam integer ROM_WORDS = 1024;
    localparam integer SIG_INDEX = 32'h00007ff8 >> 2;
    localparam integer RES_INDEX = 32'h00007ffc >> 2;
    localparam integer MAX_CYCLES = 200000;
    localparam [31:0] PASS_SIGNATURE = 32'h600dcafe;
    localparam [31:0] FAIL_SIGNATURE = 32'hdead0001;
    localparam [31:0] EXPECTED_RESULT = 32'hdfbb2e2f;

    reg clk, rst_n;
    reg [31:0] instruction_rom [0:ROM_WORDS-1];
    reg [31:0] inst;
    wire [31:0] pc, inst_addr;
    wire prom_ce;
    integer i;
    integer cycle_count;
    integer retired_count;
    reg finished;

    cpu_core dut(
        .clk(clk), .rst_n(rst_n), .pc(pc), .inst(inst),
        .inst_addr(inst_addr), .prom_ce(prom_ce)
    );

    initial clk = 1'b0;
    always #5 clk = ~clk;

    // Same one-cycle synchronous behavior as the Gowin instruction pROM.
    always @(posedge clk) begin
        if (!rst_n)
            inst <= 32'b0;
        else if (prom_ce)
            inst <= instruction_rom[inst_addr[11:2]];
    end

    initial begin
        $readmemh("benchmark/build/benchmark.hex", instruction_rom);
        rst_n = 1'b0;
        cycle_count = 0;
        retired_count = 0;
        finished = 1'b0;

        for (i = 0; i < 8192; i = i + 1)
            dut.u_ram.ram[i] = 32'b0;

        repeat (4) @(posedge clk);
        @(negedge clk);
        rst_n = 1'b1;

        while (cycle_count < MAX_CYCLES && !finished) begin
            @(posedge clk);
            #1;
            cycle_count = cycle_count + 1;
            if (dut.mem_wb_valid)
                retired_count = retired_count + 1;

            if (dut.u_ram.ram[SIG_INDEX] === PASS_SIGNATURE ||
                dut.u_ram.ram[SIG_INDEX] === FAIL_SIGNATURE)
                finished = 1'b1;
        end

        $display("--- RV32I integer benchmark ---");
        $display("cycles           : %0d", cycle_count);
        $display("retired (approx) : %0d", retired_count);
        if (retired_count != 0)
            $display("CPI (approx)     : %0f", cycle_count * 1.0 / retired_count);
        $display("checksum         : %08x", dut.u_ram.ram[RES_INDEX]);

        if (!finished)
            $display("FAIL: timeout after %0d cycles, pc=%08x", cycle_count, pc);
        else if (dut.u_ram.ram[SIG_INDEX] !== PASS_SIGNATURE)
            $display("FAIL: firmware reported failure");
        else if (dut.u_ram.ram[RES_INDEX] !== EXPECTED_RESULT)
            $display("FAIL: checksum mismatch, expected %08x", EXPECTED_RESULT);
        else begin
            $display("PASS: benchmark completed with the expected checksum");
            $display("At 100 MHz this workload takes about %0f us", cycle_count / 100.0);
        end
        $finish;
    end

    initial begin
        $dumpfile("benchmark/build/benchmark.vcd");
        $dumpvars(0, benchmark_tb);
    end
endmodule
