`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/25/2021 07:03:35 PM
// Design Name: 
// Module Name: DataMemSim
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


module DataMemSim(

    );
    reg clk, WE;
    reg [7:0] A, RD, WD;
    DataMemory mem(clk, WE, A, WD, RD);
    initial begin
        clk =1;
        forever #10 clk=~clk;
    end
    initial begin
    A = 0;
    WE = 1;
    WD = 4102000;
    #10;
    WE = 0;
    end
endmodule
