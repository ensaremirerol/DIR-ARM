`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/25/2021 06:53:23 PM
// Design Name: 
// Module Name: DataMemory
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


module DataMemory(input reg clk, WE,
    input reg [7:0] A, WD,
    output reg [7:0] RD
    );
    reg [7:0] memory [8'b11111111:0];
    always @ (posedge clk)
    begin
        if(WE) memory[A]<=WD;
        RD<=memory[A];    
    end
    
    initial begin
        for(int i = 0; i < $size(memory); i++) memory[i] = 0;
    end
endmodule
