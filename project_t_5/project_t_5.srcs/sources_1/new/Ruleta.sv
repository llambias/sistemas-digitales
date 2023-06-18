`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.06.2023 00:25:38
// Design Name: 
// Module Name: Ruleta
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


module Ruleta(
    input logic botton,
    input reset,
    input clk_16,
    input clk_8,
    input clk_4,
    input clk_2,
    input clk_1,
    output [1:0] ruleta
    );
    logic f;
    logic valor;
    
    always_ff @(negedge clk_16) 
        if (reset == 1)
            valor <= 0;
        else if (botton) 
            valor <= valor +1;
        else if (valor > 3'b101)
            valor <= 0;
     always_ff @(negedge botton)
         f = 1;
     
        
endmodule