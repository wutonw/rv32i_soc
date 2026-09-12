`timescale 1ns/1ps

module coremark_tb;
    localparam integer ROM_WORDS = 8192;
    localparam integer DATA_FIRST = 32'h00005000 >> 2;
    localparam integer DATA_LAST  = 8191;
    localparam integer ITER_INDEX = 32'h00007ff0 >> 2;
    localparam integer TIME_INDEX = 32'h00007ff4 >> 2;
    localparam integer SIG_INDEX  = 32'h00007ff8 >> 2;
    localparam [31:0] START_MARKER = 32'h434d0001;
    localparam [31:0] STOP_MARKER  = 32'h434d0002;
    localparam [31:0] PASS_SIGNATURE = 32'h600dcafe;
    localparam [31:0] FAIL_SIGNATURE = 32'hdead0001;

    reg clk, rst_n;
    reg [31:0] instruction_rom [0:ROM_WORDS-1];
    reg [31:0] inst;
    wire [31:0] pc, inst_addr;
    wire prom_ce;
    integer i;
    integer cycle_count;
    integer timed_cycles;
    integer timed_retired;
    integer max_cycles;
    integer clock_mhz;
    integer progress_cycles;
    integer next_progress;
    reg timing_active;
    reg timing_done;
    reg finished;

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
        for (i = 0; i < 8192; i = i + 1)
            dut.u_ram.ram[i] = 32'b0;
        $readmemh("benchmark/coremark/build/coremark_text.hex", instruction_rom);
        $readmemh("benchmark/coremark/build/coremark_data.hex",
                  dut.u_ram.ram, DATA_FIRST, DATA_LAST);

        rst_n = 1'b0;
        cycle_count = 0;
        timed_cycles = 0;
        timed_retired = 0;
        timing_active = 1'b0;
        timing_done = 1'b0;
        finished = 1'b0;
        max_cycles = 20000000;
        clock_mhz = 100;
        progress_cycles = 50000000;
        if (!$value$plusargs("MAX_CYCLES=%d", max_cycles)) begin end
        if (!$value$plusargs("CLOCK_MHZ=%d", clock_mhz)) begin end
        if (!$value$plusargs("PROGRESS_CYCLES=%d", progress_cycles)) begin end
        next_progress = progress_cycles;

        repeat (4) @(posedge clk);
        @(negedge clk);
        rst_n = 1'b1;

        while (cycle_count < max_cycles && !finished) begin
            @(posedge clk);
            #1;
            cycle_count = cycle_count + 1;

            if (cycle_count >= next_progress) begin
                $display("PROGRESS: %0d / %0d cycles (%0.1f%%), pc=%08x",
                         cycle_count, max_cycles,
                         cycle_count * 100.0 / max_cycles, pc);
                next_progress = next_progress + progress_cycles;
            end

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

        $display("--- Official EEMBC CoreMark smoke run ---");
        $display("iterations       : %0d", dut.u_ram.ram[ITER_INDEX]);
        $display("total cycles     : %0d", cycle_count);
        $display("timed cycles     : %0d", timed_cycles);
        $display("timed retired    : %0d", timed_retired);
        if (timed_retired != 0)
            $display("timed CPI approx : %0f", timed_cycles * 1.0 / timed_retired);
        if (timed_cycles != 0) begin
            $display("est. @%0d MHz     : %0f CoreMark/s", clock_mhz,
                     dut.u_ram.ram[ITER_INDEX] *
                     (clock_mhz * 1000000.0) / timed_cycles);
            $display("est. CoreMark/MHz: %0f",
                     dut.u_ram.ram[ITER_INDEX] * 1000000.0 / timed_cycles);
        end

        if (!finished)
            $display("FAIL: timeout, pc=%08x signature=%08x", pc,
                     dut.u_ram.ram[SIG_INDEX]);
        else if (dut.u_ram.ram[SIG_INDEX] === PASS_SIGNATURE)
            $display("PASS: official CoreMark CRC validation succeeded");
        else
            $display("FAIL: CoreMark CRC validation failed");
        $finish;
    end
endmodule
