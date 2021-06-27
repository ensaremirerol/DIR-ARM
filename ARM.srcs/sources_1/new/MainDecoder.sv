`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/25/2021 07:31:57 PM
// Design Name: 
// Module Name: MainDecoder
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

// Decodes given operation code and sets signals according to that
// TR: Verilen operasyon koduna göre sinyalleri ayarlar.

module MainDecoder(
    input reg [3:0] op,
    output reg PCS, MEMW, REGW, dNOW, dPOP, dPUSH, ALUOP,
    output reg ImmSrc, ZeroSrc, AluSrc,
    output reg [2:0] RegSrc,
    output reg [1:0] ResultSel, MemWDSel
    );
    // All operations
    // Tüm komutlar
    parameter ALU = 4'b0000;
    parameter ALU_IMM = 4'b1000;
    parameter SHH = 4'b0001;
    parameter SHH_IMM = 4'b1001;
    parameter LDR = 4'b0010;
    parameter LDR_IMM = 4'b1010;
    parameter STR = 4'b0011;
    parameter STR_IMM = 4'b1011;
    parameter CMP = 4'b0100;
    parameter CMP_IMM = 4'b1100;
    parameter PUSH = 4'b0101;
    parameter PUSH_PC = 4'b1101;
    parameter POP = 4'b0110;
    parameter RET = 4'b1110;
    parameter JMP = 4'b0111;
    parameter SKP = 4'b1111;
    
    always @ (*)
        case(op)
            ALU: begin
                PCS = 0;
                ResultSel = 0;
                MEMW = 0;
                ImmSrc = 0;
                ZeroSrc = 0;
                REGW = 1;
                RegSrc = 0;
                dNOW = 0;
                dPOP = 0;
                dPUSH = 0;
                MemWDSel = 0;
                ALUOP = 1;
                AluSrc = 0;
                end
                
            ALU_IMM: begin
                PCS = 0;
                ResultSel = 0;
                MEMW = 0;
                ImmSrc = 1;
                ZeroSrc = 0;
                REGW = 1;
                RegSrc = 0;
                dNOW = 0;
                dPOP = 0;
                dPUSH = 0;
                MemWDSel = 0;
                ALUOP = 1;
                AluSrc = 0;
                end
                
            SHH: begin
                PCS = 0;
                ResultSel = 0;
                MEMW = 0;
                ImmSrc = 0;
                ZeroSrc = 0;
                REGW = 1;
                RegSrc = 0;
                dNOW = 0;
                dPOP = 0;
                dPUSH = 0;
                MemWDSel = 0;
                ALUOP = 1;
                AluSrc = 1;
                end
                
            SHH_IMM: begin
                PCS = 0;
                ResultSel = 0;
                MEMW = 0;
                ImmSrc = 1;
                ZeroSrc = 0;
                REGW = 1;
                RegSrc = 0;
                dNOW = 0;
                dPOP = 0;
                dPUSH = 0;
                MemWDSel = 0;
                ALUOP = 1;
                AluSrc = 1;
                end
                
            LDR: begin
                PCS = 0;
                ResultSel = 1;
                MEMW = 0;
                ImmSrc = 1;
                ZeroSrc = 0;
                REGW = 1;
                RegSrc = 0;
                dNOW = 0;
                dPOP = 0;
                dPUSH = 0;
                MemWDSel = 0;
                ALUOP = 0;
                AluSrc = 0;
                end
                
            LDR_IMM: begin
                PCS = 0;
                ResultSel = 2;
                MEMW = 0;
                ImmSrc = 0;
                ZeroSrc = 0;
                REGW = 1;
                RegSrc = 0;
                dNOW = 0;
                dPOP = 0;
                dPUSH = 0;
                MemWDSel = 0;
                ALUOP = 0;
                AluSrc = 0;
                end
                
            STR: begin
                PCS = 0;
                ResultSel = 0;
                MEMW = 1;
                ImmSrc = 1;
                ZeroSrc = 0;
                REGW = 0;
                RegSrc = 1;
                dNOW = 0;
                dPOP = 0;
                dPUSH = 0;
                MemWDSel = 0;
                ALUOP = 0;
                AluSrc = 0;
                end
                
            STR_IMM: begin
                PCS = 0;
                ResultSel = 0;
                MEMW = 1;
                ImmSrc = 0;
                ZeroSrc = 1;
                REGW = 0;
                RegSrc = 1;
                dNOW = 0;
                dPOP = 0;
                dPUSH = 0;
                MemWDSel = 1;
                ALUOP = 0;
                AluSrc = 0;
                end
                
            CMP: begin
                PCS = 0;
                ResultSel = 0;
                MEMW = 0;
                ImmSrc = 0;
                ZeroSrc = 0;
                REGW = 0;
                RegSrc = 0;
                dNOW = 1;
                dPOP = 0;
                dPUSH = 0;
                MemWDSel = 0;
                ALUOP = 1;
                AluSrc = 0;
                end
                
            CMP_IMM: begin
                PCS = 0;
                ResultSel = 0;
                MEMW = 0;
                ImmSrc = 1;
                ZeroSrc = 0;
                REGW = 0;
                RegSrc = 0;
                dNOW = 1;
                dPOP = 0;
                dPUSH = 0;
                MemWDSel = 0;
                ALUOP = 1;
                AluSrc = 0;
                end
                
            PUSH: begin
                PCS = 0;
                ResultSel = 0;
                MEMW = 1;
                ImmSrc = 0;
                ZeroSrc = 1;
                REGW = 0;
                RegSrc = 3'b101;
                dNOW = 0;
                dPOP = 0;
                dPUSH = 1;
                MemWDSel = 0;
                ALUOP = 0;
                AluSrc = 0;
                end
                
            PUSH_PC: begin
                PCS = 0;
                ResultSel = 0;
                MEMW = 1;
                ImmSrc = 0;
                ZeroSrc = 1;
                REGW = 0;
                RegSrc = 3'b101;
                dNOW = 0;
                dPOP = 0;
                dPUSH = 1;
                MemWDSel = 2;
                ALUOP = 0;
                AluSrc = 0;
                end
                
            POP: begin
                PCS = 0;
                ResultSel = 1;
                MEMW = 0;
                ImmSrc = 0;
                ZeroSrc = 1;
                REGW = 1;
                RegSrc = 3'b100;
                dNOW = 0;
                dPOP = 1;
                dPUSH = 0;
                MemWDSel = 0;
                ALUOP = 0;
                AluSrc = 0;
                end
                
            RET: begin
                PCS = 1;
                ResultSel = 1;
                MEMW = 0;
                ImmSrc = 0;
                ZeroSrc = 1;
                REGW = 0;
                RegSrc = 3'b100;
                dNOW = 0;
                dPOP = 1;
                dPUSH = 0;
                MemWDSel = 0;
                ALUOP = 0;
                AluSrc = 0;
                end
                
            JMP: begin
                PCS = 1;
                ResultSel = 2;
                MEMW = 0;
                ImmSrc = 0;
                ZeroSrc = 1;
                REGW = 0;
                RegSrc = 0;
                dNOW = 0;
                dPOP = 0;
                dPUSH = 0;
                MemWDSel = 0;
                ALUOP = 0;
                AluSrc = 0;
                end
                
            SKP: begin
                PCS = 1;
                ResultSel = 0;
                MEMW = 0;
                ImmSrc = 1;
                ZeroSrc = 0;
                REGW = 0;
                RegSrc = 3'b010;
                dNOW = 0;
                dPOP = 0;
                dPUSH = 0;
                MemWDSel = 0;
                ALUOP = 0;
                AluSrc = 0;
                end
        endcase
endmodule
