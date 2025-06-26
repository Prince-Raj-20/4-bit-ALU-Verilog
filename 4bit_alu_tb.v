`timescale 1ns/1ps

module ALU_tb;

    reg [3:0] A, B;
    reg [3:0] ALU_Sel;
    wire [3:0] ALU_Out;
    wire CarryOut, Zero, Negative;

    ALU uut (
        .A(A), .B(B), .ALU_Sel(ALU_Sel),
        .ALU_Out(ALU_Out),
        .CarryOut(CarryOut),
        .Zero(Zero),
        .Negative(Negative)
    );

    initial begin
        $dumpfile("alu_flags.vcd");
        $dumpvars(0, ALU_tb);

        A = 4'b0101; B = 4'b0011;

        ALU_Sel = 4'b0000; #10; // AND
        $display("AND: A=%b B=%b OUT=%b Zero=%b Neg=%b", A, B, ALU_Out, Zero, Negative);

        ALU_Sel = 4'b0001; #10; // OR
        $display("OR : A=%b B=%b OUT=%b Zero=%b Neg=%b", A, B, ALU_Out, Zero, Negative);

        ALU_Sel = 4'b0010; #10; // ADD
        $display("ADD: A=%b B=%b OUT=%b Carry=%b Zero=%b Neg=%b", A, B, ALU_Out, CarryOut, Zero, Negative);

        ALU_Sel = 4'b0110; #10; // SUB
        $display("SUB: A=%b B=%b OUT=%b Carry=%b Zero=%b Neg=%b", A, B, ALU_Out, CarryOut, Zero, Negative);

        ALU_Sel = 4'b0111; #10; // SLT
        $display("SLT: A=%b B=%b OUT=%b Zero=%b Neg=%b", A, B, ALU_Out, Zero, Negative);

        ALU_Sel = 4'b1100; #10; // NOR
        $display("NOR: A=%b B=%b OUT=%b Zero=%b Neg=%b", A, B, ALU_Out, Zero, Negative);

        $finish;
    end

endmodule