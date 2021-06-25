`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/16/2021 10:38:19 AM
// Design Name: 
// Module Name: flop4bits
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


module flop4bits(
    input logic clk, input logic [3:0] d,
output logic [3:0] q);
    always @(posedge clk)
       if(clk) q<=d;
endmodule
