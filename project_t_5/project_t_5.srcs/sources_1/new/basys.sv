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
    output logic [3:0] an,
    output logic [7:0] seg
    );
logic [3:0] conector;
logic c_1;
logic c_2;
logic c_4;
logic c_8;
logic c_16;
logic [3:0] a;

clock_divider clock_1(
    .main_clk(clk),
    .reset(sw[1]),
    .mini_clock(c_1),
    .out_16hz(c_16),
    .out_8hz(c_8),
    .out_4hz(c_4),
    .out_2hz(c_2)
);

dis_controller disp(
    .dis_a(conector),
    .dis_b(4'b0111),
    .dis_c(4'b0010),
    .dis_d(4'b0100),
    .an(an),
    .clk(out_16hz),
    .seg(seg)
    );
Ruleta r_1(
    .botton(sw[0]),
    .reset(sw[1]),
    .clk_16(c16),
    .clk_8(c8),
    .clk_4(c4),
    .clk_2(c2),
    .clk_1(c_1),
    .ruleta(conector));
    
    //always_ff @(c_8)
    //    a = a+1;
        
    assign led[0] = c_1;
    assign led[1] = c_16;
    assign led[2] = c_8;
    assign led[3] = c_4;
    assign led[4] = c_2;
    
    
    
endmodule
