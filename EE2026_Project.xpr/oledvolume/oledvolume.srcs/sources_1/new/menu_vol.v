`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2021 07:11:08 PM
// Design Name: 
// Module Name: menu_vol
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


module menu_vol(input clk, [7:0]x, [6:0]y, input [1:0]frame, output reg [15:0]pixel_data

    );
    parameter [15:0]BLACK = 16'h0000;
    parameter [15:0]WHITE = 16'hFFFF;
    parameter [15:0] CYAN = 16'h07FD;
    parameter [15:0]RED = 16'hF800;
    parameter [15:0]YELLOW = 16'hFFE0;
    parameter [15:0]GREEN = 16'h07E0;
    
    wire [15:0]ARROW = WHITE;
    wire [15:0]BACKGROUND = BLACK;
    wire [15:0]SOUND = WHITE;
    wire [15:0]SOUND1 = (frame >= 2'd1) ? WHITE : BLACK;
    wire [15:0]SOUND2 = (frame >= 2'd2) ? WHITE : BLACK;
    wire [15:0]SOUND3 = (frame == 2'd3) ? WHITE : BLACK;
    
        always @ (*) begin
        if (y == 27 && ((x == 6) || (x == 89))) pixel_data = ARROW;
        else if (y == 28 && ((x >= 5 && x <= 6) || (x >= 89 && x <= 90))) pixel_data = ARROW;
        else if (y == 29 && ((x >= 4 && x <= 6) || (x >= 89 && x <= 91))) pixel_data = ARROW;
        else if (y == 30 && ((x >= 3 && x <= 6) || (x >= 89 && x <= 92))) pixel_data = ARROW;
        else if (y == 31 && ((x >= 2 && x <= 6) || (x >= 89 && x <= 93))) pixel_data = ARROW;
        else if (y == 32 && ((x >= 3 && x <= 6) || (x >= 89 && x <= 92))) pixel_data = ARROW;
        else if (y == 33 && ((x >= 4 && x <= 6) || (x >= 89 && x <= 91))) pixel_data = ARROW;
        else if (y == 34 && ((x >= 5 && x <= 6) || (x >= 89 && x <= 90))) pixel_data = ARROW;
        else if (y == 35 && ((x == 6) || (x == 89))) pixel_data = ARROW;
        //Sound icon
        else if (x == 29 && (y >= 26 && y <= 34)) pixel_data = SOUND; // left of box
        else if ((y == 26 || y == 34) && (x >= 29 && x <= 38)) pixel_data = SOUND; //top and bottom of box
        else if (x == 46 && (y >= 17 && y <= 43)) pixel_data = SOUND; // right of icon
        else if ((y == 25 || y == 34) && (x == 38 || x == 39)) pixel_data = SOUND;
        else if ((y == 24  || y == 35) && (x == 39 || x == 40)) pixel_data = SOUND;
        else if ((y == 23  || y == 36) && (x == 40 || x == 41)) pixel_data = SOUND;
        else if ((y == 22  || y == 37) && (x == 41 || x == 42)) pixel_data = SOUND;
        else if ((y == 21  || y == 38) && (x == 42 || x == 43)) pixel_data = SOUND;
        else if ((y == 20  || y == 39) && (x == 43 || x == 44)) pixel_data = SOUND;
        else if ((y == 19  || y == 40) && (x == 44 || x == 45)) pixel_data = SOUND;
        else if ((y == 18  || y == 41) && (x == 45 || x == 46)) pixel_data = SOUND;
        //Sound wave 1
        else if (x == 51 && (y == 22 || y == 35)) pixel_data = SOUND1;
        else if (x == 52 && (y == 23 || y == 34)) pixel_data = SOUND1;
        else if (x == 53 && (y == 24 || y == 33)) pixel_data = SOUND1;
        else if (x == 54 && (y == 25 || y == 26 || y == 32 || y == 31)) pixel_data = SOUND1;
        else if (x == 55 && (y == 27 || y == 28 || y == 29 || y == 30)) pixel_data = SOUND1;
        // Sound wave 2
        else if (x == 57 && (y == 18 || y == 40)) pixel_data = SOUND2;
        else if (x == 58 && (y == 19 || y == 39)) pixel_data = SOUND2;
        else if (x == 59 && (y == 20 || y == 38)) pixel_data = SOUND2;
        else if (x == 60 && (y == 21 || y == 37)) pixel_data = SOUND2;
        else if (x == 61 && (y == 22 || y == 23 || y == 35 || y == 36)) pixel_data = SOUND2;
        else if (x == 62 && (y == 24 || y == 25 || y == 33 || y == 34)) pixel_data = SOUND2;
        else if (x == 63 && (y == 26 || y == 27 || y == 28 || y == 29 || y == 30 || y == 31 || y == 32)) pixel_data = SOUND2;
        // Sound wave 3
        else if (x == 61 && (y == 11 || y == 46)) pixel_data = SOUND3;
        else if ((x == 62 || x == 63) && (y == 12 || y == 45)) pixel_data = SOUND3;
        else if (x == 64 && (y == 13 || y == 44)) pixel_data = SOUND3;
        else if (x == 65 && (y == 14 || y == 43)) pixel_data = SOUND3;
        else if (x == 66 && (y == 15 || y == 16 || y == 42 || y == 41)) pixel_data = SOUND3;
        else if (x == 67 && (y == 17 || y == 40)) pixel_data = SOUND3;
        else if (x == 68 && (y == 18 || y == 19 || y == 39 || y == 38)) pixel_data = SOUND3;
        else if (x == 69 && (y == 20 || y == 21 || y == 37 || y == 36)) pixel_data = SOUND3;
        else if (x == 70 && (y == 22 || y == 23 || y == 24 || y == 35 || y == 34 || y == 33)) pixel_data = SOUND3;
        else if (x == 71 && (y >= 25 && y <= 32)) pixel_data = SOUND3;
        else pixel_data = BACKGROUND;
    end
endmodule
