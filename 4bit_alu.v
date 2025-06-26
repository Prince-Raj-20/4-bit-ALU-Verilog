// ======================
// 4bit_alu.v – ALU with Flags
// ======================

module ALU (
    input [3:0] A,
    input [3:0] B,
    input [3:0] ALU_Sel,
    output reg [3:0] ALU_Out,
    output reg CarryOut,
    output reg Zero,
    output reg Negative
);

    always @(*) begin
        case (ALU_Sel)
            4'b0000: ALU_Out = A & B;          // AND
            4'b0001: ALU_Out = A | B;          // OR
            4'b0010: {CarryOut, ALU_Out} = A + B;  // ADD
            4'b0110: {CarryOut, ALU_Out} = A - B;  // SUB
            4'b0111: ALU_Out = (A < B) ? 4'b0001 : 4'b0000; // SLT
            4'b1100: ALU_Out = ~(A | B);       // NOR
            default: ALU_Out = 4'b0000;
        endcase

        Zero = (ALU_Out == 4'b0000) ? 1'b1 : 1'b0;
        Negative = ALU_Out[3];
    end

endmodule
