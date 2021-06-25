`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/22/2021 03:29:58 PM
// Design Name: 
// Module Name: ALU
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


module ALU(input reg [7:0] a, b,
            input reg [1:0] control,
            output reg [7:0] y,
            output reg [3:0] flags);
    reg cout;
    reg [8:0] sum;
    reg [7:0] d0, d2, d3, sB;
    reg oVFlogic1, oVFlogic2;
    mux_2 aritmethic(b, ~b, control[0], sB);
    assign sum = a + sB + control[0]; 
    assign cout = sum[8];
    assign d0 = sum[7:0];
    assign d2 = a & b;
    assign d3 = a | b;
         
    mux_4 mx4(d0,d0,d2,d3,control,y);   
    
    assign flags[0] = d0==0?1:0;
    assign flags[1] = y[7];
    assign flags[2] = cout & ~control[1]; 
    xnor oVF_xnor1(oVFlogic1, a[7], b[7], control[0]);
    assign oVFlogic2 = a[7] ^ y[7];
    and oVF_and(flags[3], oVFlogic1, oVFlogic2, ~control[1]);
endmodule
