`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/26/2021 03:37:27 PM
// Design Name: 
// Module Name: ProcessorTest
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


module ProcessorTest(
    
    );
    reg clk;
    initial begin
        clk = 0;
        forever #1 clk=~clk;
    end
    Processor dut(clk);
    
endmodule
