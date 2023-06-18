`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.06.2023 15:21:55
// Design Name: 
// Module Name: basys
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


module basys(
    input clk,
    input [1:0] sw,
    output [4:0] led,
    output [3:0] an,
    output [7:0] seg
    );
    
clock_divider clock_1(
    .main_clk(clk),
    .reset(sw[1]),
    .mini_clock(led[0]),
    .out_16hz(led[1]),
    .out_8hz(led[2]),
    .out_4hz(led[3]),
    .out_2hz(led[4])
);

dis_controller disp(
    .dis_a(4'b0000),
    .dis_b(4'b0011),
    .dis_c(4'b0111),
    .dis_d(4'b0110),
    .an(an),
    .clk(out_16hz),
    .seg(seg)
    );
 
endmodule
