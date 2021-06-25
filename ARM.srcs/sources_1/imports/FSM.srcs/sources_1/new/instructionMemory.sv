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
    input clk,
    output reg [13:0] rd
    );
    reg [1:0] pc;
    reg [13:0] memory [3:0];
    flop pc_flop(clk, pc+1, pc);
    assign rd = memory[pc];
        
    initial begin
        memory[0] = 14'b00000000011111;
        memory[1] = 14'b01111100001110;
        memory[2] = 14'b10111111101101;
        memory[3] = 14'b11110111111011;
        pc = 0;
        rd = memory[pc];
    end
endmodule
