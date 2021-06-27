`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/23/2021 11:06:45 PM
// Design Name: 
// Module Name: SPControl
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

// Controls Stack' Pointers value
// Stack Pointer ?n de?erini kontrol eder

module SPControl(
    input reg clk, pop, push,
    output reg [7:0] sp
    );
    // pop sinayli saatin dü?en ucunda gerçekle?tirilir
    always @(negedge clk)
        if(pop)sp<=sp+1;
    // push sinayli saatin yükselen ucunda gerçekle?tirilir
    always @(posedge clk)
        if(push)sp<=sp-1;
    initial sp = 8'b11111111;
endmodule
