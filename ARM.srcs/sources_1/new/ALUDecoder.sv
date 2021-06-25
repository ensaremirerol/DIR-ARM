`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/25/2021 10:17:39 PM
// Design Name: 
// Module Name: ALUDecoder
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


module ALUDecoder(
    input reg ALUOP, ALUSrc,
    input reg [2:0] Func,
    output reg [1:0] AluControl,
    output reg FlagW
    );
    
    always @ (*)
    begin
        if(ALUOP) AluControl <= Func[1:0];
        else AluControl <= 0;
        if(ALUOP && !ALUSrc && Func[2]) FlagW <= 1;
        else FlagW <= 0;
    end
endmodule
