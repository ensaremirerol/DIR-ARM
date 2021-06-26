`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/26/2021 01:50:07 PM
// Design Name: 
// Module Name: Flop1Bit
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


module Flop1Bit(
    input reg clk,
    input reg d,
    output reg q
    );
    always @ (posedge clk)
        q<=d;
endmodule
