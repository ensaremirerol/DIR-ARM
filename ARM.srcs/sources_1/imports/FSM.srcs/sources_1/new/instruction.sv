`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/11/2021 09:55:35 PM
// Design Name: 
// Module Name: instruction
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


module instruction(
input reg [13:0] instruction,
output reg [1:0] alu_c, output reg [3:0] REGWRT, REG1, REG2 
    );
    assign alu_c = instruction[13:12];
    assign REGWRT = instruction[11:8];
    assign REG1 = instruction[7:4];
    assign REG2 = instruction[3:0];
endmodule
