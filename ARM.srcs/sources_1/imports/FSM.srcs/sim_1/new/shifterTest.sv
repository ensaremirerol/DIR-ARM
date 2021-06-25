`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2021 02:52:24 PM
// Design Name: 
// Module Name: shifterTest
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


module shifterTest(

    );
    reg [7:0] num, count ,out;
    reg [1:0] func;
    Shifter s(num, count, func, out);
    initial begin
        num = 8'b11110000;
        count = 2;
        func = 0;
        #10;
        num = 8'b11110000;
        count = 2;
        func = 1;
        #10;
        num = 8'b11110000;
        count = 2;
        func = 2;
        #10;
        num = 8'b11110000;
        count = 2;
        func = 3;
        #10;
    end
endmodule
