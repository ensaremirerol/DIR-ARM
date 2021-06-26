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


module register(input reg clk, input reg [2:0] A1, A2, A3, input reg [7:0] WD3, R7, R6, input reg WE3,
    output reg [7:0] RD1, RD2
    );  
    reg [7:0] register [7:0];
    always @ (posedge clk)
        if(WE3) register[A3]<=WD3;
    always @ (*)
    begin
        RD1 <= register[A1];
        RD2 <= register[A2];
        register[7] <= R7; // PC + 2
        register[6] <= R6; // Stack Pointer
    end
    initial begin
        for(int i = 0; i < $size(register); i++) register[i] = 0;
    end
endmodule
