module pipe_if_id(
    input wire clk,
    input wire rst_n,
    input wire if_id_flush,
    input wire stall,

    input wire [31:0] pc,
    input wire [31:0] inst,
    output reg [31:0] if_id_inst,
    output reg [31:0] if_id_pc,
    output reg if_id_valid
);
    reg [31:0] pc1;
    reg valid;
    always @(posedge clk or negedge rst_n)begin
        if(!rst_n)begin
            pc1<= 32'b0;
            if_id_pc <= 32'b0;
            if_id_valid <= 0;
            if_id_inst <= 32'b0;
            valid <= 1'b0;
        end else if (if_id_flush)begin
            valid <= 1'b0;
            if_id_valid <= 0;
        end else if(!stall)begin
            pc1 <= pc;
            if_id_pc <= pc1;
            valid <= 1'b1;
            if_id_valid <= valid;

            if_id_inst <= inst;
        end
    end

endmodule
