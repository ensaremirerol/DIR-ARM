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

// Sets ALU signals according to given values
// TR: Verilen de?erlere göre ALU sinayallerini ayarlar

module ALUDecoder(
    input reg ALUOP, ALUSrc, dNOW,
    input reg [2:0] Func,
    output reg [1:0] AluControl, FlagW
    );
    
    always @ (*)
    begin
        // These signal values represents CMP command.
        // Bu kombinasyon CMP komutunu temsil etmektedir.
        if(ALUOP && !ALUSrc && dNOW)
        begin
            AluControl <= 1;
            FlagW <= 2'b11;
        end
        else
        begin
            if(ALUOP) AluControl <= Func[1:0];
            else AluControl <= 0;
            // Shifter i?lemleri FLAG atayamaz!
            // AND VE OR i?lemleri C ve V flagini atayamaz!
            if(ALUOP && !ALUSrc && Func[2]) begin
                if(Func[1:0] == 0 && Func[1:0] == 1) FlagW[1] <= 1;
                else FlagW[1] <= 0;
                FlagW[0] = 1;
            end
            else FlagW <= 0;
        end
    end
endmodule
