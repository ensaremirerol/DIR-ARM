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

module ConditionalLogic(
    input reg clk, PCS, MEMW, REGW, dNOW, dPOP, dPUSH,
    input reg [1:0] FlagW,
    input reg [3:0] flags, cond,
    output reg PCSrc, MemWrite, RegWrite, Pop, Push
    );
    
    // Source: https://community.arm.com/developer/ip-products/processors/b/processors-ip-blog/posts/condition-codes-1-condition-flags-and-codes
    
    // Merhaba
    // Flags
    // 0: Z
    // 1: N
    // 2: C
    // 3: V
    parameter Z = 0;
    parameter N = 1;
    parameter C = 2;
    parameter V = 3;
    parameter EQ = 4'b0000; // EQUAL
    parameter NE = 4'b0001; // NOT EQUAL
    parameter CS = 4'b0010; // CARRY SET
    parameter CC = 4'b0011; // CARRY CLEAR
    parameter MI = 4'b0100; // NEGATIVE
    parameter PL = 4'b0101; // POSITIVE (OR ZERO)
    parameter VS = 4'b0110; // V SET
    parameter VC = 4'b0111; // V CLEAR
    parameter HI = 4'b1000; // UNSIGNED HIGHER
    parameter LS = 4'b1001; // UNSIGNED LOWER OR SAME
    parameter GE = 4'b1010; // SIGNED GREATER THAN OR EQUAL
    parameter LT = 4'b1011; // SIGNED LESS THAN
    parameter GT = 4'b1100; // SIGNED GREATER THAN
    parameter LE = 4'b1101; // SIGNED LESS THAN OR EQUAL
    parameter AL = 4'b1110; // NOP
    reg [3:0] s_flags;
    reg condEx;
    Flop2BitwEnable flag_flop_cv(clk, FlagW[0] && condEx, flags[3:2], s_flags[3:2]);
    Flop2BitwEnable flag_flop_nz(clk, FlagW[1] && condEx , flags[1:0], s_flags[1:0]);
    always @ (*)
    begin
        case(cond)
            EQ: begin if(s_flags[Z]==1) condEx <= 1; else condEx <= 0; end
            NE: begin if(s_flags[Z]==0) condEx <= 1; else condEx <= 0; end
            CS: begin if(s_flags[C]==1) condEx <= 1; else condEx <= 0; end
            CC: begin if(s_flags[C]==0) condEx <= 1; else condEx <= 0; end
            MI: begin if(s_flags[N]==1) condEx <= 1; else condEx <= 0; end
            PL: begin if(s_flags[N]==0) condEx <= 1; else condEx <= 0; end
            VS: begin if(s_flags[V]==1) condEx <= 1; else condEx <= 0; end
            VC: begin if(s_flags[V]==0) condEx <= 1; else condEx <= 0; end
            HI: begin if(s_flags[C]==1 && s_flags[Z]==0) condEx <= 1; else condEx <= 0; end
            LS: begin if(s_flags[C]==0 || s_flags[Z]==1) condEx <= 1; else condEx <= 0; end
            GE: begin if(s_flags[N]==s_flags[V]) condEx <= 1; else condEx <= 0; end
            LT: begin if(s_flags[N]!=s_flags[V]) condEx <= 1; else condEx <= 0; end
            GT: begin if(s_flags[Z]==0 && s_flags[N]==s_flags[V]) condEx <= 1; else condEx <= 0; end
            LE: begin if(s_flags[Z]==1 || s_flags[N]!=s_flags[V]) condEx <= 1; else condEx <= 0; end
            AL: condEx <= 1;
            default: condEx<= 1; 
        endcase
        PCSrc <= PCS && condEx;
        MemWrite <= MEMW && condEx && ~dNOW;
        RegWrite <= REGW && condEx && ~dNOW;
        Pop <= dPOP && condEx;
        Push <= dPUSH && condEx;
    end
    initial begin
        s_flags = 0;
        condEx = 0;
    end
endmodule
