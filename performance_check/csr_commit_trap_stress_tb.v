`timescale 1ns/1ps

// CSR commit/forwarding stress test.
// The younger mtvec write after the misaligned load must be flushed.
module csr_commit_trap_stress_tb;
    localparam integer ROM_WORDS = 256;
    localparam integer SIG_BASE = 32'h1000;
    localparam integer SIG_INDEX = SIG_BASE >> 2;
    localparam integer MAX_CYCLES = 1000;

    reg clk = 0;
    reg rst_n = 0;
    reg [31:0] instruction_rom [0:ROM_WORDS-1];
    reg [31:0] inst;
    wire [31:0] pc, inst_addr;
    wire prom_ce;
    integer i, p, cycles, failures;

    cpu_core dut(.clk(clk), .rst_n(rst_n), .pc(pc), .inst(inst),
                 .inst_addr(inst_addr), .prom_ce(prom_ce));
    always #5 clk = ~clk;
    always @(posedge clk) begin
        if (!rst_n) inst <= 32'b0;
        else if (prom_ce) inst <= instruction_rom[inst_addr[9:2]];
    end

    function [31:0] addi;
        input [4:0] rd, rs1;
        input [11:0] imm;
        begin addi = {imm, rs1, 3'b000, rd, 7'b0010011}; end
    endfunction
    function [31:0] lui;
        input [4:0] rd;
        input [19:0] imm;
        begin lui = {imm, rd, 7'b0110111}; end
    endfunction
    function [31:0] lw;
        input [4:0] rd, rs1;
        input [11:0] imm;
        begin lw = {imm, rs1, 3'b010, rd, 7'b0000011}; end
    endfunction
    function [31:0] sw;
        input [4:0] rs2, rs1;
        input [11:0] imm;
        begin sw = {imm[11:5], rs2, rs1, 3'b010, imm[4:0], 7'b0100011}; end
    endfunction
    function [31:0] csrrw;
        input [11:0] csr;
        input [4:0] rd, rs1;
        begin csrrw = {csr, rs1, 3'b001, rd, 7'b1110011}; end
    endfunction
    function [31:0] csrrs;
        input [11:0] csr;
        input [4:0] rd, rs1;
        begin csrrs = {csr, rs1, 3'b010, rd, 7'b1110011}; end
    endfunction
    function [31:0] csrrc;
        input [11:0] csr;
        input [4:0] rd, rs1;
        begin csrrc = {csr, rs1, 3'b011, rd, 7'b1110011}; end
    endfunction
    function [31:0] csrrwi;
        input [11:0] csr;
        input [4:0] rd, zimm;
        begin csrrwi = {csr, zimm, 3'b101, rd, 7'b1110011}; end
    endfunction
    function [31:0] csrrsi;
        input [11:0] csr;
        input [4:0] rd, zimm;
        begin csrrsi = {csr, zimm, 3'b110, rd, 7'b1110011}; end
    endfunction
    function [31:0] csrrci;
        input [11:0] csr;
        input [4:0] rd, zimm;
        begin csrrci = {csr, zimm, 3'b111, rd, 7'b1110011}; end
    endfunction
    function [31:0] jal0;
        begin jal0 = 32'h0000006f; end
    endfunction

    task emit;
        input [31:0] word;
        begin
            instruction_rom[p] = word;
            p = p + 1;
        end
    endtask

    task check_word;
        input integer index;
        input [31:0] expected;
        input [127:0] name;
        begin
            if (dut.u_ram.ram[index] === expected)
                $display("OK   %-24s RAM[%0d]=%08x", name, index,
                         dut.u_ram.ram[index]);
            else begin
                $display("FAIL %-24s RAM[%0d]=%08x expected=%08x", name,
                         index, dut.u_ram.ram[index], expected);
                failures = failures + 1;
            end
        end
    endtask

    initial begin
        for (i = 0; i < ROM_WORDS; i = i + 1)
            instruction_rom[i] = addi(0, 0, 0);
        for (i = 0; i < 8192; i = i + 1)
            dut.u_ram.ram[i] = 32'b0;

        p = 0;
        // x1=signature base, x2=misaligned-load base, x3=0x55,
        // x10=trap handler address 0x100.
        emit(lui(1, 20'h1));
        emit(lui(2, 20'h2));
        emit(addi(3, 0, 12'h055));
        emit(addi(10, 0, 12'h100));

        // Consecutive CSR writes/reads: each following read depends on the
        // immediately preceding WB commit.
        emit(csrrw(12'h300, 0, 3));       // mstatus=0x55, rd=x0
        emit(csrrs(12'h300, 11, 0));      // x11=0x55, rs1=x0: no write
        emit(sw(11, 1, 0));               // signature[0]
        emit(csrrc(12'h300, 12, 3));      // x12=0x55, mstatus=0
        emit(sw(12, 1, 4));               // signature[1]
        emit(csrrwi(12'h300, 13, 5));     // mstatus=5, old=0
        emit(sw(13, 1, 8));               // signature[2]
        emit(csrrsi(12'h300, 14, 2));     // mstatus=7, old=5
        emit(sw(14, 1, 12));              // signature[3]
        emit(csrrci(12'h300, 15, 1));     // mstatus=6, old=7
        emit(sw(15, 1, 16));              // signature[4]

        // Different CSR back-to-back operations and rd=x0/rs1=x0 edges.
        emit(csrrw(12'h304, 0, 3));       // mie=0x55
        emit(csrrs(12'h304, 16, 0));      // x16=0x55
        emit(sw(16, 1, 20));              // signature[5]
        emit(csrrw(12'h305, 0, 10));      // mtvec=0x100
        emit(csrrs(12'h305, 17, 0));      // x17=0x100
        emit(sw(17, 1, 24));              // signature[6]
        emit(csrrs(12'h300, 0, 0));       // rd=x0, rs1=x0: no state change
        emit(csrrc(12'h300, 0, 0));       // rd=x0, rs1=x0: no state change
        emit(csrrs(12'h300, 18, 0));      // x18=6
        emit(sw(18, 1, 28));              // signature[7]

        // The load traps in MEM. The following mtvec write is younger and
        // must be flushed, so the handler must still observe mtvec=0x100.
        emit(lw(4, 2, 12'd1));            // misaligned load, trap cause 4
        emit(csrrw(12'h305, 0, 3));       // wrong-path mtvec=0x55: must not commit
        emit(sw(3, 1, 32));               // wrong-path guard: must remain zero
        emit(jal0());

        // Trap handler at 0x100: capture the committed CSR state.
        while (p < 64) emit(addi(0, 0, 0));
        emit(csrrs(12'h305, 19, 0));      // mtvec
        emit(sw(19, 1, 36));
        emit(csrrs(12'h342, 20, 0));      // mcause
        emit(sw(20, 1, 40));
        emit(csrrs(12'h341, 21, 0));      // mepc (faulting lw PC = 0x70)
        emit(sw(21, 1, 44));
        emit(csrrs(12'h300, 22, 0));      // mstatus: MIE cleared by trap
        emit(sw(22, 1, 48));
        emit(jal0());

        failures = 0;
        repeat (4) @(posedge clk);
        @(negedge clk) rst_n = 1;
        cycles = 0;
        while (cycles < MAX_CYCLES) begin
            @(posedge clk);
            #2;
            cycles = cycles + 1;
        end

        check_word(SIG_INDEX + 0, 32'h00000055, "csrrs after csrrw");
        check_word(SIG_INDEX + 1, 32'h00000055, "csrrc old value");
        check_word(SIG_INDEX + 2, 32'h00000000, "csrrwi old value");
        check_word(SIG_INDEX + 3, 32'h00000005, "csrrsi old value");
        check_word(SIG_INDEX + 4, 32'h00000007, "csrrci old value");
        check_word(SIG_INDEX + 5, 32'h00000055, "mie consecutive read");
        check_word(SIG_INDEX + 6, 32'h00000100, "mtvec consecutive read");
        check_word(SIG_INDEX + 7, 32'h00000006, "rd0 rs10 read");
        check_word(SIG_INDEX + 8, 32'h00000000, "wrong-path store guard");
        check_word(SIG_INDEX + 9, 32'h00000100, "trap mtvec preserved");
        check_word(SIG_INDEX + 10, 32'h00000004, "trap mcause");
        check_word(SIG_INDEX + 11, 32'h00000064, "trap mepc");
        check_word(SIG_INDEX + 12, 32'h00000006, "trap mstatus");

        if (failures != 0)
            $fatal(1, "%0d CSR commit/trap checks failed", failures);
        $display("PASS: CSR WB commit, forwarding, and trap ordering checks passed (%0d cycles)", cycles);
        $finish;
    end
endmodule
