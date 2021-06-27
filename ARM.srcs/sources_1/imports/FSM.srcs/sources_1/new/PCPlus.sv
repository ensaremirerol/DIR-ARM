`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/23/2021 11:38:31 PM
// Design Name: 
// Module Name: PCPlus
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

// Adds one to old_pc (Writed to tidy up the code!)
// TR: old_pc ye 1 ekler (Kodu temizlemek içi yaz?ld?!)

module PCPlus(
    input reg [7:0] old_pc,
    output reg [7:0] pc
    );
    assign pc = old_pc + 1;
endmodule
