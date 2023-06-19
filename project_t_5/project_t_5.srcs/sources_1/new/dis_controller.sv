`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.06.2023 22:58:58
// Design Name: 
// Module Name: dis_controller
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


module dis_controller(
    input [3:0] dis_a,
    input [3:0] dis_b,
    input [3:0] dis_c,
    input [3:0] dis_d,
    input clk,
    output logic [7:0] seg,
    output logic [3:0] an
    );

    logic [1:0] display;
    logic [3:0] number;
    
    always_ff @(posedge clk)    
         display <= display +1;
    
    
    always_comb 
        case(display)
            0: begin
                number = dis_a;
                an = 1110;
                end
            1: begin 
                number = dis_b;
                an = 1101;
                end
            2: begin
                number = dis_c;
                an = 1011;
                end
            3: begin 
                number = dis_d;
                an = 0111;
                end
         endcase   
         
     always_comb
        case(number)
            1: seg = 7'b1001111;
            2: seg = 7'b0010010;
            3: seg = 7'b0000110;
            4: seg = 7'b1001100;
            5: seg = 7'b0100100;
            6: seg = 7'b0100000;
            7: seg = 7'b0001111;
            8: seg = 7'b0000000;
            9: seg = 7'b0000100;
            default: seg = 7'b1000000;
         endcase
endmodule
