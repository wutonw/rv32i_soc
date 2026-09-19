module trap(
    input wire id_trap_enter,
    input wire mem_load_misaligned,
    input wire mem_store_misaligned,
    input wire inst_address_misaligned,
    input wire id_illegal_inst,
    input wire id_decode_trap_enter,
    input wire [31:0] if_id_inst,
    input wire [31:0] ex_mem_pc,
    input wire [31:0] id_ex_pc,
    input wire [31:0] if_id_pc,

    output reg [31:0] trap_cause,
    output reg [31:0] trap_pc,
    output reg trap_if_id_flush,
    output reg trap_id_ex_flush,
    output reg trap_ex_mem_flush,
    output reg trap_mem_wb_flush
);

    always @(*)begin
        trap_cause = 0;
        trap_pc = 0;
        trap_if_id_flush=0;
        trap_id_ex_flush=0;
        trap_ex_mem_flush=0;
        trap_mem_wb_flush=0;
        if (id_trap_enter)begin
            if (mem_load_misaligned)begin
                trap_cause = 4;
                trap_pc = ex_mem_pc;
                trap_if_id_flush=1;
                trap_id_ex_flush=1;
                trap_ex_mem_flush=1;
                trap_mem_wb_flush=1;
            end else if(mem_store_misaligned)begin
                trap_cause = 6;
                trap_pc = ex_mem_pc;
                trap_if_id_flush=1;
                trap_id_ex_flush=1;
                trap_ex_mem_flush=1;
                trap_mem_wb_flush=1;
            end else if(inst_address_misaligned)begin
                trap_cause = 0;
                trap_pc = id_ex_pc;
                trap_if_id_flush=1;
                trap_id_ex_flush=1;
                trap_ex_mem_flush=1;
            end else if(id_illegal_inst)begin
                trap_cause = 2;
                trap_pc = if_id_pc;
                trap_if_id_flush=1;
                trap_id_ex_flush=1;
            end else if (id_decode_trap_enter)begin
                if(if_id_inst[31:20] == 12'h000)begin
                    //ecall
                    trap_cause = 11;
                    trap_pc = if_id_pc;
                    trap_if_id_flush=1;
                    trap_id_ex_flush=1;
                end else if(if_id_inst[31:20] == 12'h001)begin
                    //ebreak
                    trap_cause = 3;
                    trap_pc = if_id_pc;
                    trap_if_id_flush=1;
                    trap_id_ex_flush=1;
                end
            end
        end
    end
endmodule