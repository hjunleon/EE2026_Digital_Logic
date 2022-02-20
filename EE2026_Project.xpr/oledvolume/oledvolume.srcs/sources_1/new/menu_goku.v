`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2021 08:47:54 PM
// Design Name: 
// Module Name: menu_goku
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


module menu_goku(input clk, [7:0]x, [6:0]y, input [1:0]frame, output reg [15:0]pixel_data

    );
    parameter [15:0]BLACK = 16'h0000;
    parameter [15:0]WHITE = 16'hFFFF;
    parameter [15:0] CYAN = 16'h07FD;
    parameter [15:0]RED = 16'hF800;
    parameter [15:0]YELLOW = 16'hFFE0;
    parameter [15:0]GREEN = 16'h07E0;
    
    wire [15:0]ARROW = WHITE;
    wire [15:0]BACKGROUND = BLACK;
    wire [15:0]FACE = BLACK; // Block face first
    wire [15:0]HAIR = (frame == 2'd0) ? WHITE : 
                      ((frame == 2'd1) ? YELLOW : 
                      ((frame == 2'd2) ? RED :
                      ((frame == 2'd3) ? CYAN : BLACK)));
                     
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
        //FACE
        else if (x == 40 && (y >= 39 && y <= 41)) pixel_data = FACE;
        else if (x == 41 && (y >= 36 && y <= 43)) pixel_data = FACE;
        else if (x == 42 && (y >= 37 && y <= 45)) pixel_data = FACE;
        else if (x == 43 && (y >= 37 && y <= 45)) pixel_data = FACE;
        else if (x == 44 && (y >= 35 && y <= 46)) pixel_data = FACE;
        else if (x == 45 && (y >= 33 && y <= 46)) pixel_data = FACE;
        else if (x == 46 && (y >= 31 && y <= 47)) pixel_data = FACE;
        else if (x == 47 && (y >= 30 && y <= 48)) pixel_data = FACE;
        else if (x == 48 && (y >= 29 && y <= 48)) pixel_data = FACE;
        else if (x == 49 && (y >= 28 && y <= 49)) pixel_data = FACE;
        else if (x == 50 && (y == 27 || y == 28 || (y >= 31 && y <= 48))) pixel_data = FACE;
        else if (x == 51 && (y >= 31 && y <= 47)) pixel_data = FACE;
        else if (x == 52 && (y >= 30 && y <= 46)) pixel_data = FACE;
        else if (x == 53 && ((y >= 27 && y <= 31) || (y >= 34 && y <= 46))) pixel_data = FACE;
        else if (x == 54 && (y >= 35 && y <= 45)) pixel_data = FACE;
        else if (x == 55 && (y >= 36 && y <= 44)) pixel_data = FACE;
        else if (x == 56 && (y >= 38 && y <= 41)) pixel_data = FACE;
        //HAIR
        else if (y == 4 && (x >= 33 && x <= 40)) pixel_data = HAIR;
        else if (y == 5 && (x >= 33 && x <= 43)) pixel_data = HAIR;
        else if (y == 6 && (x >= 34 && x <= 46)) pixel_data = HAIR;
        else if (y == 7 && (x >= 35 && x <= 47)) pixel_data = HAIR;
        else if (y == 8 && (x >= 36 && x <= 49)) pixel_data = HAIR;
        else if (y == 9 && (x >= 36 && x <= 50)) pixel_data = HAIR;
        else if (y == 10 && (x >= 37 && x <= 51)) pixel_data = HAIR;
        else if (y == 11 && (x >= 37 && x <= 51)) pixel_data = HAIR;
        else if (y == 12 && (x >= 38 && x <= 52)) pixel_data = HAIR;
        else if (y == 13 && (x >= 38 && x <= 53)) pixel_data = HAIR;
        else if (y == 14 && (x >= 39 && x <= 53)) pixel_data = HAIR;
        else if (y == 15 && ((x >= 39 && x <= 53) || (x >= 23 && x <= 31))) pixel_data = HAIR;
        else if (y == 16 && ((x >= 39 && x <= 54) || (x >= 20 && x <= 35))) pixel_data = HAIR;
        else if (y == 17 && ((x >= 39 && x <= 54) || (x >= 19 && x <= 37))) pixel_data = HAIR;
        else if (y == 18 && (x >= 20 && x <= 56)) pixel_data = HAIR;
        else if (y == 19 && (x >= 22 && x <= 58)) pixel_data = HAIR;
        else if (y == 20 && (x >= 23 && x <= 60)) pixel_data = HAIR;
        else if (y == 21 && (x >= 24 && x <= 61)) pixel_data = HAIR;
        else if (y == 22 && (x >= 25 && x <= 61)) pixel_data = HAIR;
        else if (y == 23 && (x >= 26 && x <= 61)) pixel_data = HAIR;
        else if (y == 24 && (x >= 27 && x <= 62)) pixel_data = HAIR;
        else if (y == 25 && ((x >= 28 && x <= 62) || (x >= 66 && x <= 69))) pixel_data = HAIR;
        else if (y == 26 && (x >= 29 && x <= 74)) pixel_data = HAIR;
        else if (y == 27 && (x >= 30 && x <= 75)) pixel_data = HAIR;
        else if (y == 28 && (x >= 30 && x <= 74)) pixel_data = HAIR;
        else if (y == 29 && (x >= 31 && x <= 72)) pixel_data = HAIR;
        else if (y == 30 && (x >= 32 && x <= 70)) pixel_data = HAIR;
        else if (y == 31 && (x >= 28 && x <= 68)) pixel_data = HAIR;
        else if (y == 32 && (x >= 25 && x <= 67)) pixel_data = HAIR;
        else if (y == 33 && (x >= 24 && x <= 66)) pixel_data = HAIR;
        else if (y == 34 && (x >= 22 && x <= 73)) pixel_data = HAIR;
        else if (y == 35 && (x >= 21 && x <= 73)) pixel_data = HAIR;
        else if (y == 36 && (x >= 21 && x <= 72)) pixel_data = HAIR;
        else if (y == 37 && (x >= 25 && x <= 69)) pixel_data = HAIR;
        else if (y == 38 && (x >= 29 && x <= 67)) pixel_data = HAIR;
        else if (y == 39 && (x >= 32 && x <= 65)) pixel_data = HAIR;
        else if (y == 40 && (x >= 30 && x <= 64)) pixel_data = HAIR;
        else if (y == 41 && (x >= 29 && x <= 64)) pixel_data = HAIR;
        else if (y == 42 && (x >= 29 && x <= 62)) pixel_data = HAIR;
        else if (y == 43 && (x >= 30 && x <= 62)) pixel_data = HAIR;
        else if (y == 44 && (x >= 36 && x <= 60)) pixel_data = HAIR;
        else if (y == 45 && (x >= 39 && x <= 57)) pixel_data = HAIR;
        else if (y == 46 && (x >= 39 && x <= 57)) pixel_data = HAIR;
        else if (y == 47 && (x >= 40 && x <= 55)) pixel_data = HAIR;
        else if (y == 48 && (x >= 42 && x <= 54)) pixel_data = HAIR;
        else if (y == 49 && (x >= 43 && x <= 53)) pixel_data = HAIR;
        else if (y == 50 && (x >= 45 && x <= 52)) pixel_data = HAIR;
        else if (y == 51 && (x >= 47 && x <= 51)) pixel_data = HAIR;
        else pixel_data = BACKGROUND;
        end

endmodule
