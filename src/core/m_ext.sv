module m_ext(
    input logic [2:0] m_op,
    input logic [31:0] op1,
    input logic [31:0] op2,
    output logic [31:0] m_ext_result
);
    logic signed [65:0] full_product;
    logic signed [32:0] signed_op1;
    logic signed [32:0] signed_op2;

    always_comb begin
        if (m_op == 3'b001 || m_op == 3'b010) begin
            signed_op1 = {op1[31], op1};
        end else begin
            signed_op1 = {1'b0, op1}; 
        end

        if (m_op == 3'b001) begin
            signed_op2 = {op2[31], op2}; 
        end else begin
            signed_op2 = {1'b0, op2}; 
        end

        full_product = signed_op1 * signed_op2;
        case (m_op)
            3'b000: m_ext_result = full_product[31:0]; // MUL
            3'b001,3'b010,3'b011: m_ext_result = full_product[63:32]; // MULH,MULHSU,MULHU
            default: m_ext_result = 32'b0;
        endcase
    end
endmodule

    //大坑
    //当表达式中同时出现 signed 和 unsigned 操作数时，整个表达式会被强制按 unsigned（无符号）计算。
    // always_comb begin
    //     product = 64'b0;
    //     m_ext_result  = 32'b0;

    //     case (m_op)
    //         3'b000: begin // MUL
    //             product = op1 * op2;
    //             m_ext_result  = product[31:0];
    //         end

    //         3'b001: begin // MULH
    //             product = $signed(op1) * $signed(op2);
    //             m_ext_result  = product[63:32];
    //         end

    //         3'b010: begin // MULHSU
    //             product = $signed(op1) * $unsigned(op2);
    //             m_ext_result  = product[63:32];
    //         end

    //         3'b011: begin // MULHU
    //             product = $unsigned(op1) * $unsigned(op2);
    //             m_ext_result = product[63:32];
    //         end

    //         default: begin
    //             m_ext_result = 32'b0;
    //         end
    //     endcase
    // end