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
    output [2:0] ruleta
    );
    logic [0:1] f;
    logic valor;
    
    always_ff @(negedge clk_16) 
        if (reset == 1) 
            begin
            valor <= 0;
            f <= 0;
            end
        else if (botton & f==0) 
            valor <= valor +1;
        else if (f==0 & valor > 3'b101)
            valor <= 0;
     
     always_ff @(negedge botton)
         f =1;
     
     always_ff @(negedge clk_1)
         if (f>=1) begin
            f = f+1;
         end
            
     always_ff @(negedge clk_16)
        if (f == 0)
            valor +=1;
        else if (f== 1 & valor >6)
            valor = 0;
     
     always_ff @(negedge clk_8)
        if (f == 1)
            valor +=1;
        else if (f== 1 & valor >6)
            valor = 0;
     
     always_ff @(negedge clk_4)
        if (f == 2)
            valor +=1;
        else if (f== 1 & valor >6)
            valor = 0;
     
     always_ff @(negedge clk_2)
        if (f == 3)
            valor +=1;
        else if (f== 1 & valor >6)
            valor = 0;
     assign ruleta = valor;
     
        
endmodule
