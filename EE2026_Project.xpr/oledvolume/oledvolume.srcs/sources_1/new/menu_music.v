`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2021 07:41:46 PM
// Design Name: 
// Module Name: menu_music
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


module menu_music(input clk, [7:0]x, [6:0]y, input [1:0]frame, output reg [15:0]pixel_data

    );
    
    parameter [15:0]BLACK = 16'h0000;
    parameter [15:0]WHITE = 16'hFFFF;
    parameter [15:0] CYAN = 16'h07FD;
    parameter [15:0]RED = 16'hF800;
    parameter [15:0]YELLOW = 16'hFFE0;
    parameter [15:0]GREEN = 16'h07E0;
    
    wire [15:0]ARROW = WHITE;
    wire [15:0]BACKGROUND = BLACK;
    wire [15:0]SHEET = WHITE; // Score Sheet and Treble Clef
    wire [15:0]NOTE1 = (frame >= 2'd1) ? WHITE : BLACK;
    wire [15:0]NOTE2 = (frame >= 2'd2) ? WHITE : BLACK;
    wire [15:0]NOTE3 = (frame == 2'd3) ? WHITE : BLACK;
    
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
        //Score Sheet
        else if ((x >= 14 && x <= 81) && (y == 15 || y == 23 || y == 31 || y == 39 || y == 47)) pixel_data = SHEET;
        //Treble Clef
        else if (x == 15 && (y >= 27 && y <= 32)) pixel_data = SHEET;
        else if (x == 16 && (y == 26 || y == 33)) pixel_data = SHEET;
        else if (x == 17 && (y == 24 || y == 25 || y == 34 || y == 42 || y == 43)) pixel_data = SHEET;
        else if (x == 18 && (y == 35 || y ==  42 || y ==  43 || y ==  44)) pixel_data = SHEET;
        else if (x == 19 && (y ==  36 || y ==  45)) pixel_data = SHEET;
        else if (x == 20 && (y == 22 || y ==  30 || y ==  37 || y ==  45)) pixel_data = SHEET;
        else if (x == 21 && (y ==  22 || y ==  29 || y == 37 || y ==  45)) pixel_data = SHEET;
        else if (x == 22 && (y == 22 || y == 28 || y == 37 || y == 44)) pixel_data = SHEET;
        else if (x == 23 && (y >= 12 && y<= 43)) pixel_data = SHEET;
        else if (x == 24 && (y == 12 || y == 22 || y == 27 || y == 37)) pixel_data = SHEET;
        else if (x == 25 && (y == 13 || y == 22 || y == 27 || y == 36)) pixel_data = SHEET;
        else if (x == 26 && (y == 14 || y == 21 || y == 27 || y == 36)) pixel_data = SHEET;
        else if (x == 27 && (y == 14 || y == 20 || y == 21 || y == 28 || y == 34 || y == 35)) pixel_data = SHEET;
        else if (x == 28 && ((y >= 15 && y <= 20) || y == 29 || y == 32 || y == 33 || y == 34)) pixel_data = SHEET;
        else if (x == 29 && (y >= 29 && y <= 33)) pixel_data = SHEET;
        //Note 1
        else if (x == 38 && (y >= 32 && y <= 49)) pixel_data = NOTE1;
        else if (y == 28 && (x == 42 || x == 43)) pixel_data = NOTE1;
        else if (y == 29 && (x >= 40 && x <= 44)) pixel_data = NOTE1;
        else if (y == 30 && (x >= 39 && x <= 45)) pixel_data = NOTE1;
        else if (y == 32 && (x >= 38 && x <= 44)) pixel_data = NOTE1;
        else if (y == 33 && (x >= 38 && x <= 43)) pixel_data = NOTE1;
        else if (y == 34 && (x == 40 || x == 41)) pixel_data = NOTE1;
        //Note 2
        else if (x == 60 && (y >= 9 && y <= 27)) pixel_data = NOTE2;
        else if (y == 24 && (x == 57 || x == 58)) pixel_data = NOTE2;
        else if (y == 25 && (x >= 55 && x <= 59)) pixel_data = NOTE2;
        else if (y == 26 && (x >= 54 && x <= 59)) pixel_data = NOTE2;
        else if (y == 27 && (x >= 53 && x <= 59)) pixel_data = NOTE2;
        else if (y == 28 && (x >= 53 && x <= 59)) pixel_data = NOTE2;
        else if (y == 29 && (x >= 54 && x <= 58)) pixel_data = NOTE2;
        else if (y == 30 && (x == 55 || x == 56)) pixel_data = NOTE2;
        //Note 3
        else if (x == 72 && (y >= 29 && y <= 46)) pixel_data = NOTE3;
        else if (y == 44 && (x == 69 || x == 70)) pixel_data = NOTE3;
        else if (y == 45 && (x >= 67 && x <= 71)) pixel_data = NOTE3;
        else if (y == 46 && (x >= 66 && x <= 71)) pixel_data = NOTE3;
        else if (y == 48 && (x >= 65 && x <= 71)) pixel_data = NOTE3;
        else if (y == 49 && (x >= 66 && x <= 70)) pixel_data = NOTE3;
        else if (y == 50 && (x == 67 || x == 68)) pixel_data = NOTE3;
        else pixel_data = BACKGROUND;
        end
        
endmodule
