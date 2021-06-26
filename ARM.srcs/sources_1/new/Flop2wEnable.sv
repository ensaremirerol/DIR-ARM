`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/25/2021 10:54:31 PM
// Design Name: 
// Module Name: Flop4wEnable
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


module Flop2wEnable(
    input reg clk, e,
    input reg [1:0] d,
    output reg [1:0] q
    );
    always @ (posedge clk)
        if(e) q<=d;
endmodule
