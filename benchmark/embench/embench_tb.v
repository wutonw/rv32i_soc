`timescale 1ns/1ps

module embench_tb #(
    parameter integer ROM_WORDS = 8192,
    parameter integer RAM_WORDS = 8192,
    parameter integer DATA_FIRST = 32'h00001000 >> 2,
    parameter integer DATA_LAST  = 8191,
    parameter integer RESULT_INDEX = 32'h00007fec >> 2,
    parameter integer TIME_INDEX   = 32'h00007ff4 >> 2,
    parameter integer SIG_INDEX    = 32'h00007ff8 >> 2
);
    localparam [31:0] START_MARKER = 32'h454d0001;
    localparam [31:0] STOP_MARKER  = 32'h454d0002;
    localparam [31:0] PASS_SIGNATURE = 32'h600dcafe;
    localparam [31:0] FAIL_SIGNATURE = 32'hdead0001;

    reg clk, rst_n;
    reg [31:0] instruction_rom [0:ROM_WORDS-1];
    reg [31:0] inst;
    wire [31:0] pc, inst_addr;
    wire prom_ce;
    integer i, cycle_count, timed_cycles, timed_retired, max_cycles;
    reg timing_active, timing_done, finished;
    reg [8*512-1:0] text_file;
    reg [8*512-1:0] data_file;
    reg [8*128-1:0] benchmark_name;

    cpu_core dut(
        .clk(clk), .rst_n(rst_n), .pc(pc), .inst(inst),
        .inst_addr(inst_addr), .prom_ce(prom_ce)
    );

    initial clk = 1'b0;
    always #5 clk = ~clk;

    always @(posedge clk) begin
        if (!rst_n)
            inst <= 32'b0;
        else if (prom_ce)
            inst <= instruction_rom[inst_addr[14:2]];
    end

    initial begin
        if (!$value$plusargs("TEXT=%s", text_file)) text_file = "text.hex";
        if (!$value$plusargs("DATA=%s", data_file)) data_file = "data.hex";
        if (!$value$plusargs("NAME=%s", benchmark_name)) benchmark_name = "unknown";
        max_cycles = 200000000;
        if (!$value$plusargs("MAX_CYCLES=%d", max_cycles)) begin end

        for (i = 0; i < RAM_WORDS; i = i + 1)
            dut.u_ram.ram[i] = 32'b0;
        $readmemh(text_file, instruction_rom);
        $readmemh(data_file, dut.u_ram.ram, DATA_FIRST, DATA_LAST);

        rst_n = 1'b0;
        cycle_count = 0;
        timed_cycles = 0;
        timed_retired = 0;
        timing_active = 1'b0;
        timing_done = 1'b0;
        finished = 1'b0;

        repeat (4) @(posedge clk);
        @(negedge clk);
        rst_n = 1'b1;

        while (cycle_count < max_cycles && !finished) begin
            @(posedge clk);
            #1 cycle_count = cycle_count + 1;

            if (!timing_active && !timing_done &&
                dut.u_ram.ram[TIME_INDEX] === START_MARKER)
                timing_active = 1'b1;
            else if (timing_active &&
                     dut.u_ram.ram[TIME_INDEX] === STOP_MARKER) begin
                timing_active = 1'b0;
                timing_done = 1'b1;
            end

            if (timing_active) begin
                timed_cycles = timed_cycles + 1;
                if (dut.mem_wb_valid)
                    timed_retired = timed_retired + 1;
            end

            if (dut.u_ram.ram[SIG_INDEX] === PASS_SIGNATURE ||
                dut.u_ram.ram[SIG_INDEX] === FAIL_SIGNATURE)
                finished = 1'b1;
        end

        if (!finished)
            $display("EMBENCH_RESULT %0s TIMEOUT %0d %0d %0d %08x",
                     benchmark_name, timed_cycles, timed_retired,
                     cycle_count, pc);
        else if (dut.u_ram.ram[SIG_INDEX] === PASS_SIGNATURE)
            $display("EMBENCH_RESULT %0s PASS %0d %0d %0d %08x",
                     benchmark_name, timed_cycles, timed_retired,
                     cycle_count, dut.u_ram.ram[RESULT_INDEX]);
        else
            $display("EMBENCH_RESULT %0s FAIL %0d %0d %0d %08x",
                     benchmark_name, timed_cycles, timed_retired,
                     cycle_count, dut.u_ram.ram[RESULT_INDEX]);
        $finish;
    end
endmodule
