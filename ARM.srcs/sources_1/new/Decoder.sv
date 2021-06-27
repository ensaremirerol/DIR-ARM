`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/25/2021 10:31:18 PM
// Design Name: 
// Module Name: Decoder
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


module Decoder(
    input reg [3:0] op,
    input reg [2:0] Func,
    output reg PCS, MEMW, REGW, dNOW, dPOP, dPUSH,
    output reg ImmSrc, ZeroSrc, AluSrc,
    output reg [2:0] RegSrc,
    output reg [1:0] ResultSel, MemWDSel,
    output reg [1:0] AluControl, FlagW
    );
    wire ALUOP, ALUSRC;
    MainDecoder m_decoder(op, PCS, MEMW, REGW, dNOW, dPOP, dPUSH, ALUOP, ImmSrc, ZeroSrc, ALUSRC, RegSrc, ResultSel, MemWDSel);
    ALUDecoder alu_decoder(ALUOP, ALUSRC, dNOW, Func, AluControl, FlagW);
    always @ (*) AluSrc<=ALUSRC;
endmodule
