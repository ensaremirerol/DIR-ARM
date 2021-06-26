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


module instructionMemory(
    input reg [7:0] PC,
    output reg [24:0] rd
    );
    reg [24:0] memory [8'b11111111:0];
    assign rd = memory[PC];   
    initial begin
        rd = 0;
        memory[0] = 25'b1110_1010_000_000_000_00000100;
        memory[1] = 25'b1110_0101_000_000_000_00000000;
        memory[2] = 25'b1110_0000_000_010_001_001_00000;
        memory[3] = 25'b1110_0110_000_001_000_00000000;
        memory[4] = 25'b1110_0000_000_010_001_000_00000;
    end
endmodule
