`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.06.2023 14:49:06
// Design Name: 
// Module Name: clock_divider
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


module clock_divider(
    input main_clk,
    output mini_clock,
    input reset,
    output logic out_16hz,
    output logic out_8hz,
    output logic out_4hz,
    output logic out_2hz
    
    );
    //bajar frecuencia en el clock
    logic [21:0]clk_16hz;
    logic clk_8hz;
    logic clk_4hz;
    logic clk_2hz;
    logic [24:0]clk_3hz;
    logic [1:0] clk_1hz;
    //para bajar a 16
    //100*10^6/ 16 = 6 250 000
    //log_2 6250000 = 22.575
    //6250 000 = 2^23 aprox
    always_ff @(posedge main_clk)
        if (reset==1)
            clk_16hz <= 0;
         else
            clk_16hz <= clk_16hz +1;
        
     //la mitad de 16hz
     always_ff @(negedge clk_16hz[21])
        if (reset==1)
            clk_8hz <= 0;
         else
            clk_8hz <= clk_8hz +1;
     //la mitad de 8hz
     always_ff @(negedge clk_8hz)
        if (reset==1)
            clk_4hz <= 0;
         else
            clk_4hz <= clk_4hz +1;
     //mitad de 4hz
     always_ff @(negedge clk_4hz)
        if (reset==1)
            clk_2hz <= 0;
         else
            clk_2hz <= clk_2hz +1;
    
    always_ff @(negedge main_clk)
        if (reset==1)
            clk_3hz <= 0;
         else
            clk_3hz <= clk_3hz +1;
 
     always_ff @(posedge clk_3hz[24])
        if (reset==1 | (clk_1hz == 2'b10))
            clk_1hz <= 0;
        else 
            clk_1hz <= clk_1hz +1;
      
     always_ff @(posedge clk_3hz[24])
        if (reset==1 | (clk_1hz == 2'b10))
            clk_1hz <= 0;
        else 
            clk_1hz <= clk_1hz +1;
      assign mini_clock = clk_1hz;
      always_comb 
        out_16hz = clk_16hz[21];
      assign out_8hz = clk_8hz;
      assign out_4hz = clk_4hz;
      assign out_2hz = clk_2hz;
endmodule
