`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/26/2021 12:01:07 PM
// Design Name: 
// Module Name: Flop2BitwEnable
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


// 2Bit Flop with Enable signal

module Flop2BitwEnable(
    input reg clk, e,
    input reg [1:0] d,
    output reg [1:0] q
    );
    always @ (posedge clk)
        if(e) q<=d;
endmodule
