`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/02/2021 10:14:38 AM
// Design Name: 
// Module Name: register_testbench
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


module register_testbench(

    );
    reg clk;
    reg [31:0] RD1, RD2, WD3;
    reg [15:0] A1, A2, A3;
    reg WE3;
    register dut(clk, A1, A2, A3, WD3, WE3, RD1, RD2);
    initial begin
        clk =0;
        forever #10 clk=~clk;
    end
    initial begin
        WD3 = 0;
        A1 = 0; A2 = 0; A3 = 0;
        WE3 = 1;
        A3 = 0; #20;
        A3 = 1; #20;
        A3 = 2; #20;
        A3 = 3; #20;
        A3 = 4; #20;
        A3 = 5; #20;
        A3 = 6; #20;
        A3 = 7; #20;
        A3 = 8; #20;
        A3 = 9; #20;
        A3 = 10; #20;
        A3 = 11; #20;
        A3 = 12; #20;
        A3 = 13; #20;
        A3 = 14; #20;
        A3 = 15; #20;
        WE3 = 0; #20;
        WD3 = 41020; A3 = 3; #20;
        WE3 = 1; #20;
        WE3 = 0; #20;
        WD3 = 859; A3 = 4; #20;
        WE3 = 1; #20;
        WE3 = 0; A1 = 3; A2 = 4; WD3 = 869; A3 = 5; #5;
        WE3 = 1; #20;
        WE3 = 0; A1 = 3; A2 = 5; #20;
    end
endmodule
