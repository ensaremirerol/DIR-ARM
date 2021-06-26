`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/26/2021 05:54:04 PM
// Design Name: 
// Module Name: mux_4_3bit
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


module mux_4_3bit(
    input logic [2:0] d0, d1, d2, d3,
    input logic [1:0] s,
    output logic [2:0] y);
    
    assign y = s[1] ?
    (s[0] ? d3 : d2):
    (s[0] ? d1 : d0);
endmodule
