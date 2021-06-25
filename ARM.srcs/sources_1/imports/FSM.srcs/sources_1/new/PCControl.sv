`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/23/2021 11:33:32 PM
// Design Name: 
// Module Name: PCControl
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


module PCControl(
    input reg clk, pcsrc,
    input reg [7:0] result, pcp,
    output reg[7:0] pc
    );
    reg [7:0] _pc;
    mux_2 pcSelector(pcp, result, pcsrc, _pc);
    always @(posedge clk)
        pc <= _pc;
endmodule
