`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/25/2021 11:08:33 PM
// Design Name: 
// Module Name: ControlUnit
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


module ControlUnit(
    input reg clk,
    input reg [3:0] flags, cond, op,
    input reg [2:0] Func,
    output reg PCSrc, MemWrite, RegWrite, Pop, Push,
    output reg ImmSrc, ZeroSrc, AluSrc,
    output reg [2:0] RegSrc,
    output reg [1:0] ResultSel, MemWDSel,
    output reg [1:0] AluControl
    );
    wire PCS, MEMW, REGW, dNOW, dPOP, dPUSH;
    wire [1:0] FlagW;
    Decoder dec(op, Func, PCS, MEMW, REGW, dNOW, dPOP, dPUSH, ImmSrc, ZeroSrc, AluSrc, RegSrc, ResultSel, MemWDSel, AluControl, FlagW);
    ConditionalLogic condLogic(clk, PCS, MEMW, REGW, dNOW, dPOP, dPUSH, FlagW, flags, cond, PCSrc, MemWrite, RegWrite, Pop, Push);
endmodule
