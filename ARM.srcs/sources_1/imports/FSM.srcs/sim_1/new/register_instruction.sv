`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/12/2021 02:30:17 PM
// Design Name: 
// Module Name: register_instruction
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


module register_instruction(

    );
    
    reg clk;
    reg [13:0] inst;
    reg [1:0] alu_c;
    reg [3:0] REG1, REG2, REGWRT, flags;
    reg [31:0] result;
    instructionMemory instructionMem(clk, inst);
    instruction ins(inst, alu_c, REGWRT, REG1, REG2);
    ALUwRegister dut(clk, alu_c, REGWRT, REG1, REG2, result, flags);
    initial begin
        clk =0;
        forever #10 clk=~clk;
    end
    
endmodule
