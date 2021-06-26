`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/26/2021 05:55:05 PM
// Design Name: 
// Module Name: mux_2_3bit
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


module mux_2_3bit(input logic [2:0] d0, d1,
    input logic s,
    output logic [2:0] y);
    
    assign y = s ? d1 : d0;
endmodule
