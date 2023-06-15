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
            0: number = dis_a;
            1: number = dis_b;
            2: number = dis_c;
            3: number = dis_d;
         endcase   

    always_comb
           case(display)
              3: an = 0111; //izquierda
              2: an = 1011;
              1: an = 1101;
              0: an = 1110; //derecha
           endcase
           
     always_comb
        case(number)
            1: seg = 8'b11111001;
            2: seg = 8'b10100100;
            3: seg = 8'b10110000;
            4: seg = 8'b10011001;
            5: seg = 8'b10010010;
            6: seg = 8'b10000010;
            7: seg = 8'b11111000;
            8: seg = 8'b10000000;
            9: seg = 8'b10010000;
            default: seg = 8'b00000011;
         endcase
endmodule
