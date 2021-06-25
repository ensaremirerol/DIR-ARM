`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/25/2021 10:47:56 PM
// Design Name: 
// Module Name: ConditionalLogic
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


// TODO: Change how conditions proccesed.
module ConditionalLogic(
    input reg clk, PCS, MEMW, REGW, dNOW, dPOP, dPUSH, FlagW,
    input reg [3:0] flags, cond,
    output reg PCSrc, MemWrite, RegWrite, Pop, Push
    );
    reg [3:0] s_flags;
    Flop4wEnable flag_flop(clk, FlagW & ((s_flags && cond) || cond == 0), flags, s_flags);
    always @ (*)
    begin
        if(s_flags == cond || cond == 0)
        begin
            PCSrc <= PCS;
            MemWrite <= MEMW && ~dNOW;
            RegWrite <= REGW && ~dNOW;
            Pop <= dPOP;
            Push <= dPUSH;
        end
    end
endmodule
