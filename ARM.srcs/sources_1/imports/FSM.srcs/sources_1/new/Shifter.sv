`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/24/2021 02:25:36 PM
// Design Name: 
// Module Name: Shifter
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


module Shifter(
    input reg [7:0] num, count, input reg [1:0] func,
    output reg [7:0] out
    );
    reg [7:0] d0, d1, d2, d3;
    assign d0 = num << count;
    assign d1 = num >> count;
    always @(*) begin
        case(count % 8)
            0: d2 = num;
            1: d2 = {num[6:0], num[7]};
            2: d2 = {num[5:0], num[7:6]};
            3: d2 = {num[4:0], num[7:5]};
            4: d2 = {num[3:0], num[7:4]};
            5: d2 = {num[2:0], num[7:3]};
            6: d2 = {num[1:0], num[7:2]};
            7: d2 = {num[0], num[7:1]};
        endcase
        case(count % 8)
            0: d3 = num;
            1: d3 = {num[0],num[6:0]};
            2: d3 = {num[1:0],num[7:2]};
            3: d3 = {num[2:0], num[7:3]};
            4: d3 = {num[3:0], num[7:4]};
            5: d3 = {num[4:0], num[7:5]};
            6: d3 = {num[5:0], num[7:6]};
            7: d3 = {num[6:0], num[7]};
        endcase
    end
    mux_4 select(d0,d1,d2,d3,func,out);
endmodule
