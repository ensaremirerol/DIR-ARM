`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/02/2021 09:57:04 AM
// Design Name: 
// Module Name: register
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


module register(input clk, input [2:0] A1, A2, A3, input reg [7:0] WD3, input logic WE3,
    output reg [7:0] RD1, RD2
    );  
    reg [7:0] register [7:0];
    reg [2:0] a1, a2, a3;
    flop4bits flopa1(clk, A1, a1);
    flop4bits flopa2(clk, A2, a2);
    flop4bits flopa3(clk, A3, a3);
    always @ (posedge clk)
        if(WE3 && clk) register[a3]<=WD3;
    assign RD1 = register[a1];
    assign RD2 = register[a2];
    initial begin
        for(int i = 0; i < $size(register); i++)begin
            register[i] = 0;
        end
        a1 = A1;
        a2 = A2;
        a3 = A3;
    end
endmodule
