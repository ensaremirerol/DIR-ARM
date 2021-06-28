`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/16/2021 09:21:15 AM
// Design Name: 
// Module Name: instructionMemory
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

// Memory of Instructions
// TR: Komutlar? tutan Haf?za

module instructionMemory(
    input reg [7:0] PC,
    output reg [24:0] rd
    );
    reg [24:0] memory [8'b11111111:0];
    assign rd = memory[PC];   
    initial begin
        // 1110_1010_000_000_000_00000100
        // 1110_0000_000_010_001_001_00000
        rd = 0;
        /*
        memory[0] = 25'b1110_1010_000_000_000_00000100;
        memory[1] = 25'b1110_0101_000_000_000_00000000;
        memory[2] = 25'b1110_0000_000_010_001_001_00000;
        memory[3] = 25'b1110_0110_000_001_000_00000000;
        memory[4] = 25'b1110_0000_000_010_001_000_00000;
        */
        memory[0] = 25'b1110_1010_000_000_000_00000000; // LDR IMM R0 0
        memory[1] = 25'b1110_1010_000_001_000_00000001; // LDR IMM R1 1
        memory[2] = 25'b1110_1010_000_010_000_00000000; // LDR IMM R2 0
        memory[3] = 25'b1110_1010_000_011_000_00001101; // LDR IMM R3 13
        memory[4] = 25'b1110_1101_000_000_000_00000000; // PUSH PC
        memory[5] = 25'b1110_0111_000_000_000_00001010; // JMP 10(a)
        memory[6] = 25'b1110_0100_000_000_011_010_00000; // CMP R3 R2
        memory[7] = 25'b0000_1111_000_000_000_00000000; // EQ SKP 0
        memory[8] = 25'b1110_0111_000_000_000_00000100; // JMP 4
        memory[9] = 25'b1110_0111_000_000_000_00000000; // JMP 0
        memory[10] = 25'b1110_0000_000_100_000_001_00000; // ADD R4 R0 R1
        memory[11] = 25'b1110_0101_000_001_000_00000000; // PUSH R1
        memory[12] = 25'b1110_0101_000_100_000_00000000; // PUSH R4
        memory[13] = 25'b1110_0110_000_001_000_00000000; // POP R1
        memory[14] = 25'b1110_0110_000_000_000_00000000; // POP R0
        memory[15] = 25'b1110_1000_000_010_010_00000001; // ADD IMM R2 R2 1
        memory[16] = 25'b1110_1110_000_000_000_00000000; // RET
    end
endmodule
