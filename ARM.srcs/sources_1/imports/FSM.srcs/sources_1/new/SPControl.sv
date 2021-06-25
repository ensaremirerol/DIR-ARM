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


module SPControl(
    input reg pop, push,
    output reg [7:0] sp
    );
    always @(posedge pop)
        sp<=sp+1;
    always @(negedge push) 
        sp<=sp-1;
endmodule
