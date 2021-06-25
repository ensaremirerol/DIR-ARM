`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/23/2021 11:17:10 PM
// Design Name: 
// Module Name: spsim
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


module spsim(

    );
    reg[7:0] sp;
    reg pop, push;
    SPControl spctrl(pop, push, sp);
    initial begin
        sp = 8'b11111111;
        pop = 0;
        push = 0;
        push = 1;
        #10;
        push=0;
        #10;
        pop =1;
        #10;
        pop=0;
    end
endmodule
