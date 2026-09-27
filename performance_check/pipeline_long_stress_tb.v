`timescale 1ns/1ps

module pipeline_long_stress_tb;
    localparam integer ROM_WORDS = 8192;
    localparam integer CASES = 128;
    localparam integer SIG_INDEX = 32'h1000 >> 2;
    localparam integer GUARD_INDEX = 32'h3000 >> 2;
    localparam integer MAX_CYCLES = 12000;

    reg clk = 0;
    reg rst_n = 0;
    reg [31:0] instruction_rom [0:ROM_WORDS-1];
    reg [31:0] inst;
    wire [31:0] pc, inst_addr;
    wire prom_ce;
    reg [31:0] expected [0:CASES*5-1];
    integer i, p, v, cycles, failures, terminal_pc, reset_done;

    cpu_core dut(.clk(clk), .rst_n(rst_n), .pc(pc), .inst(inst),
                 .inst_addr(inst_addr), .prom_ce(prom_ce));
    always #5 clk = ~clk;
    always @(posedge clk) begin
        if (!rst_n) inst <= 32'b0;
        else if (prom_ce) inst <= instruction_rom[inst_addr[14:2]];
    end

    function [31:0] addi;
        input [4:0] rd, rs1;
        input [11:0] imm;
        begin addi = {imm, rs1, 3'b000, rd, 7'b0010011}; end
    endfunction
    function [31:0] add;
        input [4:0] rd, rs1, rs2;
        begin add = {7'b0, rs2, rs1, 3'b000, rd, 7'b0110011}; end
    endfunction
    function [31:0] lui;
        input [4:0] rd;
        input [19:0] imm;
        begin lui = {imm, rd, 7'b0110111}; end
    endfunction
    function [31:0] sw;
        input [4:0] rs2, rs1;
        input [11:0] imm;
        begin sw = {imm[11:5], rs2, rs1, 3'b010, imm[4:0], 7'b0100011}; end
    endfunction
    function [31:0] lw;
        input [4:0] rd, rs1;
        input [11:0] imm;
        begin lw = {imm, rs1, 3'b010, rd, 7'b0000011}; end
    endfunction
    function [31:0] csrrw;
        input [4:0] rd, rs1;
        begin csrrw = {12'h300, rs1, 3'b001, rd, 7'b1110011}; end
    endfunction
    function [31:0] csrrs;
        input [4:0] rd;
        begin csrrs = {12'h300, 5'd0, 3'b010, rd, 7'b1110011}; end
    endfunction
    function [31:0] beq;
        input [4:0] rs1, rs2;
        begin beq = {1'b0, 6'b0, rs2, rs1, 3'b000, 4'd4, 1'b0, 7'b1100011}; end
    endfunction
    function [31:0] jal8;
        begin jal8 = {1'b0, 10'd4, 1'b0, 8'd0, 5'd0, 7'b1101111}; end
    endfunction

    task emit;
        input [31:0] word;
        begin
            if (p >= ROM_WORDS-1) $fatal(1, "stress program exceeds ROM");
            instruction_rom[p] = word;
            p = p + 1;
        end
    endtask

    always @(posedge clk) begin
        #1;
        if (rst_n) begin
            if (!dut.ex_mem_valid && dut.mem_ram_s_we !== 4'b0)
                $fatal(1, "invalid EX/MEM wrote RAM");
            if (!dut.mem_wb_valid && dut.wb_wr_en !== 1'b0)
                $fatal(1, "invalid MEM/WB wrote register file");
            if (!dut.if_id_valid && dut.csr_we !== 1'b0)
                $fatal(1, "invalid IF/ID wrote CSR");
            if (!dut.id_ex_valid && dut.ex_redirect_valid !== 1'b0)
                $fatal(1, "invalid ID/EX redirected PC");
        end
    end

    initial begin
        for (i = 0; i < ROM_WORDS; i = i + 1) instruction_rom[i] = addi(0, 0, 0);
        for (i = 0; i < 8192; i = i + 1) dut.u_ram.ram[i] = 32'b0;
        p = 0;
        emit(addi(0, 0, 0));
        emit(lui(1, 20'h1));  // signature pointer: 0x1000
        emit(lui(2, 20'h2));  // data: 0x2000
        emit(lui(20, 20'h3)); // wrong-path guard: 0x3000

        for (i = 0; i < CASES; i = i + 1) begin
            v = i - 64;
            if (i == 0) v = 32'h7fffffff;
            if (i == 1) v = 32'h80000000;
            if (i == 2) v = -1;
            if (i == 3) v = 0;
            expected[i*5+0] = 7*v;
            expected[i*5+1] = 8*v;
            expected[i*5+2] = 8*v;
            expected[i*5+3] = v+1;
            expected[i*5+4] = 8*v;

            if (i == 0) begin
                emit(lui(3, 20'h80000));
                emit(addi(3, 3, 12'hfff));
            end else if (i == 1) begin
                emit(lui(3, 20'h80000));
            end else begin
                emit(addi(3, 0, v));
            end
            emit(add(4, 3, 3));
            emit(add(5, 4, 3));
            emit(add(6, 5, 4));
            emit(add(6, 6, 4));
            emit(sw(6, 1, 0));
            emit(sw(6, 2, 0));
            emit(lw(7, 2, 0));
            emit(add(8, 7, 3));
            emit(sw(8, 1, 4));
            emit(sw(8, 2, 4));
            emit(lw(9, 2, 4));
            emit(sw(9, 1, 8));
            emit(addi(13, 3, 1));
            emit(csrrw(10, 13));
            emit(csrrs(11));
            emit(sw(11, 1, 12));
            emit(lw(14, 2, 4));
            emit(csrrw(15, 14));
            emit(csrrs(16));
            emit(sw(16, 1, 16));
            emit(beq(3, 3));
            emit(sw(3, 20, 0));
            emit(jal8());
            emit(sw(3, 20, 4));
            emit(addi(1, 1, 20));
        end
        terminal_pc = p*4;
        emit({12'd0, 5'd0, 3'b000, 5'd0, 7'b1101111}); // jal x0,0

        cycles = 0;
        failures = 0;
        reset_done = 0;
        repeat (4) @(posedge clk);
        @(negedge clk) rst_n = 1;
        while (cycles < MAX_CYCLES && (pc !== terminal_pc || cycles < 800)) begin
            @(posedge clk);
            #2;
            cycles = cycles + 1;
            if ((cycles == 800 || cycles == 1603 ||
                 cycles == 2408 || cycles == 3215) && reset_done < 4) begin
                @(negedge clk) rst_n = 0;
                repeat (4) @(posedge clk);
                @(negedge clk);
                for (i = 0; i < CASES*5; i = i + 1)
                    dut.u_ram.ram[SIG_INDEX+i] = 32'b0;
                rst_n = 1;
                reset_done = reset_done + 1;
            end
        end
        repeat (8) @(posedge clk);
        #2;
        if (cycles >= MAX_CYCLES) $fatal(1, "stress timeout: pc=%08x", pc);
        for (i = 0; i < CASES*5; i = i + 1) begin
            if (dut.u_ram.ram[SIG_INDEX+i] !== expected[i]) begin
                if (failures < 12)
                    $display("FAIL signature[%0d]=%08x expected=%08x", i,
                             dut.u_ram.ram[SIG_INDEX+i], expected[i]);
                failures = failures + 1;
            end
        end
        if (dut.u_ram.ram[GUARD_INDEX] !== 0 ||
            dut.u_ram.ram[GUARD_INDEX+1] !== 0) begin
            $display("FAIL wrong-path store guard: %08x %08x",
                     dut.u_ram.ram[GUARD_INDEX], dut.u_ram.ram[GUARD_INDEX+1]);
            failures = failures + 1;
        end
        if (failures != 0) $fatal(1, "%0d long stress checks failed", failures);
        $display("PASS: %0d signatures, wrong-path guards, %0d mid-run resets, %0d cycles",
                 CASES*5, reset_done, cycles);
        $finish;
    end
endmodule
