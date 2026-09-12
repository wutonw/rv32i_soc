`include "define.vh"
`define NOP 32'b0
module cpu_core(
    input wire clk,
    input wire rst_n,

    output wire [31:0] pc,

    input wire [31:0] inst,
    output wire [31:0] inst_addr,
    output wire prom_ce
);

    wire stall;
    assign inst_addr = pc;
    assign prom_ce = !stall;
    assign stall = csr_load_use_hazard || store_load_use_hazard;
    // ==================================================
    // IF Stage
    reg [31:0] next_pc;
    wire id_ex_flush = branch_id_ex_flush || csr_load_use_hazard;
    wire if_id_flush = branch_if_id_flush;
    wire ex_mem_flush = store_load_use_hazard;
    //flush and next_pc logic
    reg branch_if_id_flush;
    reg branch_id_ex_flush;

    wire [31:0] branch_target = id_ex_pc + id_ex_imm;
    always @(*) begin
        next_pc = pc + 32'd4;
        branch_if_id_flush = 0;
        branch_id_ex_flush = 0;
        if (id_ex_valid) begin
            if (id_ex_branch && branch_taken) begin
                next_pc = branch_target;
                branch_if_id_flush = 1;
                branch_id_ex_flush = 1;
            end else if (id_ex_jump) begin
                next_pc = branch_target;
                branch_if_id_flush = 1;
                branch_id_ex_flush = 1;
            end else if (id_ex_jump_reg) begin
                next_pc = {ex_alu_result[31:1], 1'b0};
                branch_if_id_flush = 1;
                branch_id_ex_flush = 1;
            end
        end
    end
    
    pc_reg u_pc_reg(
        .clk(clk),
        .rst_n(rst_n),
        .stall(stall),
        .next_pc(next_pc),
        .pc(pc)
    );

    // trap u_trap(
    //     .id_illegal_inst(id_illegal_inst),
    //     .id_decode_trap_enter(id_decode_trap_enter),
    //     .mem_load_misaligned(mem_load_misaligned),
    //     .mem_load_misaligned(mem_load_misaligned),
    // );
    //trap_cause
    // always @(*)begin
    //     trap_cause = 0;
    //     if(illegal_inst)begin
    //         trap_cause = 2;
    //     end else if (load_misaligned)begin
    //         trap_cause = 4;
    //     end else if (store_misaligned)begin
    //         trap_cause = 6;
    //     end else if (decode_trap_enter)begin
    //         if(inst[31:20] == 12'h000)begin
    //             //ecall
    //             trap_cause = 11;
    //         end else if(inst[31:20] == 12'h001)begin
    //             //ebreak
    //             trap_cause = 3;
    //         end
    //     end else if (inst_address_misaligned)begin
    //         trap_cause = 0;
    //     end
    // end
    // ==================================================

    // ==================================================
    // IF/ID Pipeline Register
    wire [31:0] if_id_inst;
    wire [31:0] if_id_pc;
    wire if_id_valid;
    pipe_if_id u_pipe_if_id(
        .clk(clk),
        .rst_n(rst_n),
        .if_id_flush(if_id_flush),
        .stall(stall),
        .pc(pc),
        .inst(inst),
        .if_id_inst(if_id_inst),
        .if_id_pc(if_id_pc),
        .if_id_valid(if_id_valid)
    );
    // ==================================================

    // ==================================================
    // ID Stage
    wire id_wr_en;
    wire id_illegal_inst;
    wire [1:0] id_alu_src_op1;
    wire id_alu_src_op2;
    wire id_ext_u;
    wire [1:0] id_ram_size;
    wire id_ram_we;
    wire [1:0] id_wb_sel;
    wire id_branch;
    wire id_jump;
    wire id_jump_reg;
    wire id_is_load;
    wire id_is_store;
    wire id_decode_trap_enter;
    wire id_trap_exit;
    wire id_is_csr;
    wire id_csr_we;
    wire [4:0] id_rs1_addr;
    wire [4:0] id_rs2_addr;
    wire [4:0] id_rd_addr;
    wire [11:0] id_csr_addr;
    wire [3:0] id_alu_op;
    wire id_use_rs1;
    wire id_use_rs2;
    wire [4:0] ex_mem_rs2_addr;
    decoder u_decoder(
        .inst(if_id_inst),
        .wr_en(id_wr_en),
        .illegal_inst(id_illegal_inst),
        .alu_src_op1(id_alu_src_op1),
        .alu_src_op2(id_alu_src_op2),
        .ext_u(id_ext_u),
        .ram_size(id_ram_size),
        .ram_we(id_ram_we),
        .wb_sel(id_wb_sel),
        .branch(id_branch),
        .jump(id_jump),
        .jump_reg(id_jump_reg),
        .is_load(id_is_load),
        .is_store(id_is_store),
        .decode_trap_enter(id_decode_trap_enter),
        .trap_exit(id_trap_exit),
        .is_csr(id_is_csr),
        .csr_we(id_csr_we),
        .rs1_addr(id_rs1_addr),
        .rs2_addr(id_rs2_addr),
        .rd_addr(id_rd_addr),
        .csr_addr(id_csr_addr),
        .alu_op(id_alu_op),
        .use_rs1(id_use_rs1),
        .use_rs2(id_use_rs2)
    );

    wire [31:0] id_imm;
    imm_gen u_imm_gen(
        .inst(if_id_inst),
        .imm(id_imm)
    );

    wire [31:0] id_rs1_data;
    wire [31:0] id_rs2_data;

    wire [31:0] wb_wr_data;
    wire [4:0] wb_wr_addr;
    wire wb_wr_en;
    wire [31:0] mem_rs2_data;
    regfile u_regfile(
        .clk(clk),
        .rst_n(rst_n),
        .wr_en(wb_wr_en),
        .wr_addr(wb_wr_addr),
        .wr_data(wb_wr_data),
        .rs1_addr(id_rs1_addr),
        .rs1_data(id_rs1_data),
        .rs2_addr(id_rs2_addr),
        .rs2_data(id_rs2_data),
        .mem_rs2_addr(ex_mem_rs2_addr),
        .mem_rs2_data(mem_rs2_data)
    );

    reg [31:0] id_csr_w_data;
    wire [31:0] id_csr_r_data;
    wire id_trap_enter;
    wire [31:0] id_trap_pc;
    wire [31:0] id_trap_cause;
    wire [31:0] id_trap_vector;
    wire [31:0] id_mepc_out;
    wire id_global_intr_en;
    wire csr_we = id_csr_we && if_id_valid && !stall && !if_id_flush;
    csr_file u_csr_file(
        .clk(clk),
        .rst_n(rst_n),
        .csr_addr(id_csr_addr),//选择
        .csr_w_data(id_csr_w_data),
        .csr_we(csr_we),
        .csr_r_data(id_csr_r_data),
        .trap_enter(id_trap_enter),
        .trap_pc(id_trap_pc),
        .trap_cause(id_trap_cause),
        .trap_vector(id_trap_vector),
        .trap_exit(id_trap_exit),
        .mepc_out(id_mepc_out),
        .global_intr_en(id_global_intr_en)
    );
    //csr
    wire [31:0] id_zimm_32 = {27'b0 , if_id_inst[19:15]};
    reg [31:0] csr_rs1_data;
    wire id_csr_use_rs1 = id_is_csr && (if_id_inst[14:12] < 3'b100);
    always @(*)begin
        case(if_id_inst[14:12])
            3'b001: id_csr_w_data = csr_rs1_data;
            3'b010: id_csr_w_data = id_csr_r_data | csr_rs1_data;
            3'b011: id_csr_w_data = id_csr_r_data & ~csr_rs1_data;
            3'b101: id_csr_w_data = id_zimm_32;
            3'b110: id_csr_w_data = id_csr_r_data | id_zimm_32;
            3'b111: id_csr_w_data = id_csr_r_data & ~id_zimm_32;
            default : id_csr_w_data = id_csr_r_data;
        endcase
    end
    //csr fwd rs1
    wire csr_load_use_hazard = id_csr_use_rs1 && if_id_valid && id_ex_valid &&
                                id_ex_is_load && (id_ex_rd_addr != 5'b0) &&
                                (id_ex_rd_addr == id_rs1_addr);
    always @(*) begin
        //可以不加valid，会有csr_we兜底
        csr_rs1_data = id_rs1_data;
        if(id_csr_use_rs1)begin
            if (mem_wb_valid && mem_wb_wr_en &&
                (mem_wb_rd_addr != 0) &&
                (mem_wb_rd_addr == id_rs1_addr))begin
                //WB
                csr_rs1_data = wb_wr_data;
            end
            if (ex_mem_valid && ex_mem_wr_en &&
                ex_mem_rd_addr != 0 &&
                ex_mem_rd_addr == id_rs1_addr) begin
                //MEM
                case (ex_mem_wb_sel)
                    2'b00: csr_rs1_data = ex_mem_alu_result;
                    2'b01: csr_rs1_data = mem_ram_r_data;
                    2'b10: csr_rs1_data = ex_mem_pc + 32'd4;
                    2'b11: csr_rs1_data = ex_mem_csr_r_data;
                endcase
            end
            if (!id_ex_is_load && id_ex_valid && id_ex_wr_en &&
                id_ex_rd_addr != 5'b0 &&
                id_ex_rd_addr == id_rs1_addr)begin
                //EX
                case (id_ex_wb_sel)
                    2'b00: csr_rs1_data = ex_alu_result;
                    2'b10: csr_rs1_data = id_ex_pc + 32'd4;
                    2'b11: csr_rs1_data = id_ex_csr_r_data;
                    default: csr_rs1_data = id_ex_rs1_data;
                endcase
            end
        end
    end

    // ==================================================

    // ==================================================
    // ID/EX Pipeline Register
    wire id_ex_valid;
    wire [31:0] id_ex_pc;
    wire [31:0] id_ex_inst;
    wire [4:0] id_ex_rs1_addr;
    wire [4:0] id_ex_rs2_addr;
    wire [4:0] id_ex_rd_addr;
    wire [31:0] id_ex_rs1_data;
    wire [31:0] id_ex_rs2_data;
    wire [31:0] id_ex_imm;
    wire id_ex_wr_en;
    wire id_ex_illegal_inst;
    wire [1:0] id_ex_alu_src_op1;
    wire id_ex_alu_src_op2;
    wire id_ex_ext_u;
    wire [1:0] id_ex_ram_size;
    wire id_ex_ram_we;
    wire [1:0] id_ex_wb_sel;
    wire id_ex_branch;
    wire id_ex_jump;
    wire id_ex_jump_reg;
    wire id_ex_decode_trap_enter;
    wire id_ex_trap_exit;
    wire id_ex_is_csr;
    wire id_ex_csr_we;
    wire [3:0] id_ex_alu_op;
    wire id_ex_is_load;
    wire id_ex_is_store;
    wire id_ex_use_rs1;
    wire id_ex_use_rs2;
    wire [31:0] id_ex_csr_r_data;
    pipe_id_ex u_pipe_id_ex(
        .clk(clk),
        .rst_n(rst_n),
        .stall(stall),
        .id_ex_flush(id_ex_flush),
        .if_id_valid(if_id_valid),
        .if_id_pc(if_id_pc),
        .if_id_inst(if_id_inst),
        .id_ex_valid(id_ex_valid),
        .id_ex_pc(id_ex_pc),
        .id_ex_inst(id_ex_inst),
        .id_rs1_addr(id_rs1_addr),
        .id_rs2_addr(id_rs2_addr),
        .id_rd_addr(id_rd_addr),
        .id_rs1_data(id_rs1_data),
        .id_rs2_data(id_rs2_data),
        .id_imm(id_imm),
        .id_ex_rs1_addr(id_ex_rs1_addr),
        .id_ex_rs2_addr(id_ex_rs2_addr),
        .id_ex_rd_addr(id_ex_rd_addr),
        .id_ex_rs1_data(id_ex_rs1_data),
        .id_ex_rs2_data(id_ex_rs2_data),
        .id_ex_imm(id_ex_imm),
        .id_wr_en(id_wr_en),
        .id_illegal_inst(id_illegal_inst),
        .id_alu_src_op1(id_alu_src_op1),
        .id_alu_src_op2(id_alu_src_op2),
        .id_ext_u(id_ext_u),
        .id_ram_size(id_ram_size),
        .id_ram_we(id_ram_we),
        .id_wb_sel(id_wb_sel),
        .id_branch(id_branch),
        .id_jump(id_jump),
        .id_jump_reg(id_jump_reg),
        .id_is_load(id_is_load),
        .id_is_store(id_is_store),
        .id_decode_trap_enter(id_decode_trap_enter),
        .id_trap_exit(id_trap_exit),
        .id_is_csr(id_is_csr),
        .id_csr_we(id_csr_we),
        .id_ex_wr_en(id_ex_wr_en),
        .id_ex_illegal_inst(id_ex_illegal_inst),
        .id_ex_alu_src_op1(id_ex_alu_src_op1),
        .id_ex_alu_src_op2(id_ex_alu_src_op2),
        .id_ex_ext_u(id_ex_ext_u),
        .id_ex_ram_size(id_ex_ram_size),
        .id_ex_ram_we(id_ex_ram_we),
        .id_ex_wb_sel(id_ex_wb_sel),
        .id_ex_branch(id_ex_branch),
        .id_ex_jump(id_ex_jump),
        .id_ex_jump_reg(id_ex_jump_reg),
        .id_ex_is_load(id_ex_is_load),
        .id_ex_is_store(id_ex_is_store),
        .id_ex_decode_trap_enter(id_ex_decode_trap_enter),
        .id_ex_trap_exit(id_ex_trap_exit),
        .id_ex_is_csr(id_ex_is_csr),
        .id_ex_csr_we(id_ex_csr_we),
        .id_alu_op(id_alu_op),
        .id_ex_alu_op(id_ex_alu_op),
        .id_use_rs1(id_use_rs1),
        .id_use_rs2(id_use_rs2),
        .id_ex_use_rs1(id_ex_use_rs1),
        .id_ex_use_rs2(id_ex_use_rs2),
        .id_csr_r_data(id_csr_r_data),
        .id_ex_csr_r_data(id_ex_csr_r_data)
    );
    // ==================================================

    // ==================================================
    // EX Stage
    reg [31:0] op1;
    reg [31:0] op2;
    wire [31:0] ex_alu_result;
    alu u_alu(
        .alu_op(id_ex_alu_op),
        .op1(op1),
        .op2(op2),
        .alu_result(ex_alu_result)
    );

    reg branch_taken;
    always @(*) begin
        case (id_ex_alu_op)
            `ALU_BEQ: branch_taken = (op1 == op2);
            `ALU_BNE: branch_taken = (op1 != op2);
            `ALU_BLT: branch_taken = ($signed(op1) < $signed(op2));
            `ALU_BGE: branch_taken = ($signed(op1) >= $signed(op2));
            `ALU_BLTU: branch_taken = (op1 < op2);
            `ALU_BGEU: branch_taken = (op1 >= op2);
            default: branch_taken = 1'b0;
        endcase
    end

    //forward
    // rd_addr->use_rs1/2, rd_addr->add->use_rs1/2, lw->add->use_rs1/2, lw -> use_rs1/2
    // EX/MEM ALU  -> EX
    // MEM/WB      -> EX
    // EX/MEM LOAD -> EX
    wire ex_forward_valid = id_ex_valid && ex_mem_valid && (ex_mem_rd_addr != 5'b0) && ex_mem_wr_en;
    wire ex_fwd_rs1 = ex_forward_valid && id_ex_use_rs1 && (ex_mem_rd_addr == id_ex_rs1_addr);
    wire ex_fwd_rs2 = !id_ex_is_store && ex_forward_valid && id_ex_use_rs2 && (ex_mem_rd_addr == id_ex_rs2_addr);
    wire wb_forward_valid = id_ex_valid && mem_wb_valid && (mem_wb_rd_addr != 5'b0) && mem_wb_wr_en;
    wire wb_fwd_rs1 = wb_forward_valid && id_ex_use_rs1 && (mem_wb_rd_addr == id_ex_rs1_addr); 
    wire wb_fwd_rs2 = !id_ex_is_store && wb_forward_valid && id_ex_use_rs2 && (mem_wb_rd_addr == id_ex_rs2_addr);
    wire fwd_jump_or_reg = ex_mem_jump || ex_mem_jump_reg;
    always @(*)begin
        case({ex_mem_is_load,ex_fwd_rs1,wb_fwd_rs1})
            3'b101,3'b001 : op1 = wb_wr_data;
            3'b011,3'b010 : op1 = (ex_mem_is_csr)? ex_mem_csr_r_data :
                                    (fwd_jump_or_reg) ? ex_mem_pc + 32'd4 :
                                    ex_mem_alu_result;
            3'b111,3'b110 : op1 = mem_ram_r_data;
            default : op1 = (id_ex_alu_src_op1 == 2'b00) ? id_ex_rs1_data :
                        (id_ex_alu_src_op1== 2'b01) ? 32'b0 :
                        id_ex_pc;
        endcase
    end
    always @(*)begin
        case({ex_mem_is_load,ex_fwd_rs2,wb_fwd_rs2})
            3'b101,3'b001 : op2 = wb_wr_data;
            3'b011,3'b010 : op2 = (ex_mem_is_csr)? ex_mem_csr_r_data :
                                    (fwd_jump_or_reg) ? ex_mem_pc + 32'd4 :
                                    ex_mem_alu_result;
            3'b111,3'b110 : op2 = mem_ram_r_data;
            default : op2 = (id_ex_alu_src_op2)? id_ex_imm : id_ex_rs2_data;
        endcase
    end
    wire store_load_use_hazard = ex_mem_is_store && id_ex_is_load && id_ex_valid && ex_mem_valid &&
                                    (ex_mem_alu_result[14:2] == ex_alu_result[14:2]) ;
    // ==================================================

    // ==================================================
    // EX/MEM Pipeline Register
    wire [31:0] ex_mem_alu_result;
    wire ex_mem_valid;
    wire [31:0] ex_mem_pc;
    wire [31:0] ex_mem_inst;
    wire [4:0] ex_mem_rd_addr;
    wire [31:0] ex_mem_rs2_data;
    wire ex_mem_wr_en;
    wire ex_mem_ext_u;
    wire [1:0] ex_mem_ram_size;
    wire ex_mem_ram_we;
    wire [1:0] ex_mem_wb_sel;
    wire ex_mem_is_load;
    wire ex_mem_is_store;
    wire [31:0] ex_mem_csr_r_data;
    wire ex_mem_csr_we;
    wire ex_mem_is_csr;
    wire ex_mem_jump;
    wire ex_mem_jump_reg;
    pipe_ex_mem u_pipe_ex_mem(
        .clk(clk),
        .rst_n(rst_n),
        .ex_mem_flush(ex_mem_flush),
        .ex_alu_result(ex_alu_result),
        .ex_mem_alu_result(ex_mem_alu_result),
        .id_ex_valid(id_ex_valid),
        .id_ex_pc(id_ex_pc),
        .id_ex_inst(id_ex_inst),
        .ex_mem_valid(ex_mem_valid),
        .ex_mem_pc(ex_mem_pc),
        .ex_mem_inst(ex_mem_inst),
        .id_ex_rd_addr(id_ex_rd_addr),
        .id_ex_rs2_data(id_ex_rs2_data),
        .ex_mem_rd_addr(ex_mem_rd_addr),
        .ex_mem_rs2_data(ex_mem_rs2_data),
        .id_ex_wr_en(id_ex_wr_en),
        .id_ex_ext_u(id_ex_ext_u),
        .id_ex_ram_size(id_ex_ram_size),
        .id_ex_ram_we(id_ex_ram_we),
        .id_ex_wb_sel(id_ex_wb_sel),
        .id_ex_is_store(id_ex_is_store),
        .ex_mem_wr_en(ex_mem_wr_en),
        .ex_mem_ext_u(ex_mem_ext_u),
        .ex_mem_ram_size(ex_mem_ram_size),
        .ex_mem_ram_we(ex_mem_ram_we),
        .ex_mem_wb_sel(ex_mem_wb_sel),
        .ex_mem_is_store(ex_mem_is_store),
        .id_ex_rs2_addr(id_ex_rs2_addr),
        .ex_mem_rs2_addr(ex_mem_rs2_addr),
        .id_ex_is_load(id_ex_is_load),
        .ex_mem_is_load(ex_mem_is_load),
        .id_ex_csr_r_data(id_ex_csr_r_data),
        .ex_mem_csr_r_data(ex_mem_csr_r_data),
        .id_ex_is_csr(id_ex_is_csr),
        .ex_mem_is_csr(ex_mem_is_csr),
        .id_ex_csr_we(id_ex_csr_we),
        .ex_mem_csr_we(ex_mem_csr_we),
        .id_ex_jump(id_ex_jump),
        .id_ex_jump_reg(id_ex_jump_reg),
        .ex_mem_jump(ex_mem_jump),
        .ex_mem_jump_reg(ex_mem_jump_reg)
    );
    // ==================================================

    // ==================================================
    // MEM Stage
    reg mem_store_misaligned;
    reg [31:0] mem_ram_w_data;
    wire [3:0] mem_ram_s_we = ex_mem_valid ? tmp_ram_s_we : 4'b0000;
    wire [31:0] mem_raw_ram_r_data;
    reg mem_load_misaligned;
    reg [31:0] mem_ram_r_data;
    ram u_ram(
        .clk(clk),
        .we(mem_ram_s_we),
        .rd_addr(ex_alu_result),//提前吃地址
        .wr_addr(ex_mem_alu_result),
        .ram_w_data(mem_ram_w_data),
        .ram_r_data(mem_raw_ram_r_data)
    );
    wire store_forward = ex_mem_valid && mem_wb_valid && ex_mem_is_store && (ex_mem_rs2_addr == mem_wb_rd_addr) && (mem_wb_rd_addr != 0) && wb_wr_en;
    wire [31:0] mem_store_data = (store_forward)? wb_wr_data : mem_rs2_data;
    // ==================================================

    // ==================================================
    // MEM/WB Pipeline Register
    wire [31:0] mem_wb_pc;
    wire [1:0] mem_wb_wb_sel;
    wire [31:0] mem_wb_alu_result;
    wire [31:0] mem_wb_ram_r_data;
    wire mem_wb_wr_en;
    wire [4:0] mem_wb_rd_addr;
    wire mem_wb_valid;
    wire mem_wb_is_load;
    wire [31:0] mem_wb_csr_r_data;
    pipe_mem_wb u_pipe_mem_wb(
        .clk(clk),
        .rst_n(rst_n),
        .ex_mem_pc(ex_mem_pc),
        .ex_mem_wb_sel(ex_mem_wb_sel),
        .ex_mem_alu_result(ex_mem_alu_result),
        .mem_ram_r_data(mem_ram_r_data),
        .ex_mem_wr_en(ex_mem_wr_en),
        .ex_mem_is_load(ex_mem_is_load),
        .mem_wb_pc(mem_wb_pc),
        .mem_wb_wb_sel(mem_wb_wb_sel),
        .mem_wb_alu_result(mem_wb_alu_result),
        .mem_wb_ram_r_data(mem_wb_ram_r_data),
        .mem_wb_wr_en(mem_wb_wr_en),
        .mem_wb_is_load(mem_wb_is_load),
        .ex_mem_rd_addr(ex_mem_rd_addr),
        .mem_wb_rd_addr(mem_wb_rd_addr),
        .ex_mem_valid(ex_mem_valid),
        .mem_wb_valid(mem_wb_valid),
        .ex_mem_csr_r_data(ex_mem_csr_r_data),
        .mem_wb_csr_r_data(mem_wb_csr_r_data)
    );
    // ==================================================

    // ==================================================
    // WB Stage
    wire [31:0] wb_pc_plus_4 = mem_wb_pc + 32'd4;
    assign wb_wr_data = (mem_wb_wb_sel == 2'b00)? mem_wb_alu_result :
                    (mem_wb_wb_sel == 2'b01)? mem_wb_ram_r_data :
                    (mem_wb_wb_sel == 2'b10)? wb_pc_plus_4 :
                    mem_wb_csr_r_data;
    assign wb_wr_en = mem_wb_wr_en && mem_wb_valid;
    assign wb_wr_addr = mem_wb_rd_addr;
    // ==================================================
    //load
    wire [31:0] shift_data = mem_raw_ram_r_data >> {ex_mem_alu_result[1:0], 3'b000};
    wire mem_ram_req = (ex_mem_wb_sel == 2'b01);
    always @(*)begin
        mem_load_misaligned = 0;
        mem_ram_r_data = mem_raw_ram_r_data;
        if(ex_mem_inst[6:0] == `OP_LOAD)begin
            case(ex_mem_ram_size)
                2'b00:begin
                    if(ex_mem_ext_u)begin
                        mem_ram_r_data={24'b0,shift_data[7:0]};
                    end else begin
                        mem_ram_r_data={{24{shift_data[7]}},shift_data[7:0]};
                    end
                end
                2'b01:begin
                    if (ex_mem_alu_result[0] == 0)begin
                        if(ex_mem_ext_u)begin
                            mem_ram_r_data={16'b0,shift_data[15:0]};
                        end else begin
                            mem_ram_r_data={{16{shift_data[15]}},shift_data[15:0]};
                        end
                    end else begin
                        mem_load_misaligned = 1;
                    end
                end
                2'b10:begin
                    if (ex_mem_alu_result[1:0] == 2'b0)begin
                        mem_ram_r_data = mem_raw_ram_r_data;
                    end else begin
                        mem_load_misaligned = 1;
                    end
                end
                default: ;
            endcase
        end
    end
    //store
    reg [3:0] tmp_ram_s_we;
    wire [2:0] tmp = {ex_mem_ext_u,ex_mem_ram_size};
    always @(*)begin
        tmp_ram_s_we = 4'b0;
        mem_ram_w_data = mem_store_data;
        mem_store_misaligned = 0;
        if(ex_mem_ram_we)begin
            case(tmp)
                3'b000:begin
                    mem_ram_w_data = {4{mem_store_data[7:0]}};
                    tmp_ram_s_we = 4'b0001 << ex_mem_alu_result[1:0];
                end
                3'b001:begin
                    if(ex_mem_alu_result[0] == 0)begin
                        mem_ram_w_data = {2{mem_store_data[15:0]}};
                        tmp_ram_s_we = (ex_mem_alu_result[1]) ? 4'b1100 : 4'b0011;
                    end else begin
                        mem_store_misaligned = 1;
                    end
                end
                3'b010:begin
                    if(ex_mem_alu_result[1:0] == 2'b0)begin
                        tmp_ram_s_we = 4'b1111;
                    end else begin
                        mem_store_misaligned = 1;
                    end
                end
                default: ;
            endcase
        end
    end
endmodule
