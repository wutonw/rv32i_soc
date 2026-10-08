`timescale 1ns/1ps

module mul_unit_stress_tb;
    logic [2:0] m_op;
    logic [31:0] op1, op2;
    wire [31:0] result;
    reg [98:0] vectors [0:99999];
    reg [1023:0] vector_file;
    integer count, i, failures;

    m_ext dut(.m_op(m_op), .op1(op1), .op2(op2), .m_ext_result(result));

    initial begin
        if (!$value$plusargs("VECTORS=%s", vector_file) ||
            !$value$plusargs("COUNT=%d", count)) $fatal(1, "missing vector arguments");
        if (count < 1 || count > 100000) $fatal(1, "invalid vector count");
        $readmemh(vector_file, vectors, 0, count-1);
        failures = 0;
        for (i = 0; i < count; i = i + 1) begin
            {m_op, op1, op2} = vectors[i][98:32];
            #1;
            if (result !== vectors[i][31:0]) begin
                if (failures < 12)
                    $display("FAIL unit op=%0d a=%08x b=%08x got=%08x expected=%08x",
                        m_op, op1, op2, result, vectors[i][31:0]);
                failures = failures + 1;
            end
        end
        if (failures != 0) $fatal(1, "%0d multiplication vectors failed", failures);
        $display("PASS: multiplication unit, %0d independent Python vectors", count);
        $finish;
    end
endmodule
