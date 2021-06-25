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
    output reg [27:0] rd
    );
    reg [27:0] memory [8'b11111111:0];
    assign rd = memory[PC];   
    initial begin
        rd = memory[PC];
    end
endmodule
