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

// Selects next PC using status of pcsrc signal
// TR: Bir sonraki PC yi pcsrc ye göre  belirler
module PCControl(
    input reg clk, pcsrc,
    input reg [7:0] result, pcp,
    output reg[7:0] pc
    );
    reg [7:0] _pc; // Next PC
    mux_2 pcSelector(pcp, result, pcsrc, _pc);
    always @(posedge clk) // Updates PC at posedge clk
        pc <= _pc;
    initial pc = 0;
    initial _pc = 0;
endmodule
