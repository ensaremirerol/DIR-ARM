`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/11/2021 09:55:35 PM
// Design Name: 
// Module Name: instruction
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

// Splits given instruction for next modules
// TR: Sonraki modüller için komutlar? parçalar

module instruction(
    input reg [24:0] instruction,
    output reg [3:0] cond, op, output reg [2:0] FUNC, REGD, REGA, REGB, output reg [7:0] Imm 
    );
    always @ (*)
    begin
        cond <= instruction[24:21];
        op <= instruction[20:17];
        FUNC <= instruction[16:14];
        REGD <= instruction[13:11];
        REGA <= instruction[10:8];
        REGB <= instruction[7:5];
        Imm <= instruction[7:0];
    end
endmodule
