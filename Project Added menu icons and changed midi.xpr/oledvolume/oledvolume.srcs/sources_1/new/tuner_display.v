`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2021 10:08:40 AM
// Design Name: 
// Module Name: tuner_display
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


module tuner_display(input clk, input [7:0]x, [6:0]y, [3:0]NOTEIN, [6:0]SHIFT, isInRange, output reg [15:0]pixel_data

    );
    //SHIFT shld only take values from 0 to 85
    wire SHARP = (NOTEIN == 4'd1 || NOTEIN == 4'd4 || NOTEIN == 4'd6 || NOTEIN == 4'd9 || NOTEIN == 4'd11) ? 1 : 0; //NOTE IS A# C# D# F# or G#
    wire [2:0]NOTE = (NOTEIN == 4'd0 || NOTEIN == 4'd1) ? 3'd1 : // NOTE IS A or A#
                     ((NOTEIN == 4'd2) ? 3'd2 : //NOTE IS B
                     ((NOTEIN == 4'd3 || NOTEIN == 4'd4) ? 3'd3 : //NOTE IS C OR C#
                     ((NOTEIN == 4'd5 || NOTEIN == 4'd6) ? 3'd4 : //NOTE IS D OR D#
                     ((NOTEIN == 4'd7) ? 3'd5 : //NOTE IS E
                     ((NOTEIN == 4'd8 || NOTEIN == 4'd9) ? 3'd6 : //NOTE IS F OR F#
                     ((NOTEIN == 4'd10 || NOTEIN == 4'd11) ? 3'd7 : 0)))))); //NOTE IS G OR G#
    
    parameter [15:0]RED = 16'hF800;
    parameter [15:0]YELLOW = 16'hFFE0;
    parameter [15:0]GREEN = 16'h07E0;
    parameter [15:0] ORANGE = 16'hFBE0;
    parameter [15:0] AQUAMARINE   = 16'h87FC;
    parameter [15:0] BLUE   = 16'h039C;
    parameter [15:0]GREY = 16'hBDF7;
    parameter [15:0]WHITE = 16'hFFFF;
    parameter [15:0]PINK = 16'hFB18;
    parameter [15:0]BLACK = 16'h0000;
    parameter [15:0]SILVER = 16'hC618;
    parameter [15:0]BEIGE = 16'hCE31;

    wire [15:0]COLOR = (isInRange == 1)?GREEN:RED;
    wire [15:0]BACKGROUND = BLACK;
    always @ (*) begin 
        //Freq line
        if (y == 38 && (x == 8 || x == 11 || x == 14 || x == 22 || x == 25 || x == 28 || x == 36 || x == 39 || x == 42 || x == 50 || x == 53 || x == 56 || x == 64 || x == 67 || x == 70 || x == 78 || x == 81 || x == 84)) pixel_data = COLOR;
        else if ((y == 37 || y == 38 || y == 39) && (x == 4 || x == 18 || x == 32 || x == 46 || x == 60 || x == 74 || x == 88)) pixel_data = COLOR;
        else if (y == 32 && (x >= 44 && x <= 48)) pixel_data = COLOR;
        else if (y == 33 && (x >= 43 && x <= 49)) pixel_data = COLOR;
        else if (y == 34 && (x == 31 || x == 32 || x == 33 || x == 44 || x == 45 || x == 46 || x == 47 || x == 48 || x == 59 || x == 60 || x == 61)) pixel_data = COLOR;
        else if (y == 35 && (x == 32 || x == 46 || x == 60)) pixel_data = COLOR;
        //Freq Arrow
        else if (x == 43 + SHIFT - 43 && (y >= 51 && y <= 54)) pixel_data = COLOR;
        else if (x == 44 + SHIFT - 43 && (y >= 49 && y <= 55)) pixel_data = COLOR;
        else if (x == 45 + SHIFT - 43 && (y >= 46 && y <= 55)) pixel_data = COLOR;
        else if (x == 46 + SHIFT - 43 && (y >= 42 && y <= 55)) pixel_data = COLOR;
        else if (x == 47 + SHIFT - 43 && (y >= 46 && y <= 55)) pixel_data = COLOR;
        else if (x == 48 + SHIFT - 43 && (y >= 49 && y <= 55)) pixel_data = COLOR;
        else if (x == 49 + SHIFT - 43 && (y >= 51 && y <= 54)) pixel_data = COLOR;
        
        // A
        else if (NOTE == 3'd1 && (y == 4  && (x >= 42 && x <= 45))) pixel_data = COLOR;
        else if (NOTE == 3'd1 && (y == 5  && (x >= 42 && x <= 45))) pixel_data = COLOR;
        else if (NOTE == 3'd1 && (y == 6  && (x >= 41 && x <= 46))) pixel_data = COLOR;
        else if (NOTE == 3'd1 && (y == 7  && (x >= 41 && x <= 46))) pixel_data = COLOR;
        else if (NOTE == 3'd1 && (y == 8  && ((x >= 40 && x <= 42) || (x >= 45 && x <= 47)))) pixel_data = COLOR;
        else if (NOTE == 3'd1 && (y == 9  && ((x >= 40 && x <= 42) || (x >= 45 && x <= 47)))) pixel_data = COLOR;
        else if (NOTE == 3'd1 && (y == 10 && ((x >= 40 && x <= 41) || (x >= 46 && x <= 47)))) pixel_data = COLOR;
        else if (NOTE == 3'd1 && (y == 11 && ((x >= 39 && x <= 41) || (x >= 46 && x <= 48)))) pixel_data = COLOR;
        else if (NOTE == 3'd1 && (y == 12 && (x >= 39 && x <= 48))) pixel_data = COLOR;
        else if (NOTE == 3'd1 && (y == 13 && (x >= 38 && x <= 49))) pixel_data = COLOR;
        else if (NOTE == 3'd1 && (y == 14 && (x >= 38 && x <= 49))) pixel_data = COLOR;
        else if (NOTE == 3'd1 && (y == 15 && ((x >= 37 && x <= 39) || (x >= 48 && x <= 50)))) pixel_data = COLOR;
        else if (NOTE == 3'd1 && (y == 16 && ((x >= 37 && x <= 39) || (x >= 48 && x <= 50)))) pixel_data = COLOR;
        else if (NOTE == 3'd1 && (y == 17 && ((x >= 36 && x <= 38) || (x >= 49 && x <= 51)))) pixel_data = COLOR;
        else if (NOTE == 3'd1 && (y == 18 && ((x >= 36 && x <= 38) || (x >= 49 && x <= 51)))) pixel_data = COLOR;
        else if (NOTE == 3'd1 && (y == 19 && ((x >= 35 && x <= 37) || (x >= 50 && x <= 52)))) pixel_data = COLOR;
        else if (NOTE == 3'd1 && (y == 20 && ((x >= 35 && x <= 37) || (x >= 50 && x <= 52)))) pixel_data = COLOR;
        // B
        else if (NOTE == 3'd2 && (y == 4  && (x >= 39 && x <= 47))) pixel_data = COLOR;
        else if (NOTE == 3'd2 && (y == 5  && (x >= 39 && x <= 48))) pixel_data = COLOR;
        else if (NOTE == 3'd2 && (y == 6  && (x >= 39 && x <= 49))) pixel_data = COLOR;
        else if (NOTE == 3'd2 && (y == 7  && ((x >= 39 && x <= 41) || (x >= 46 && x <= 49)))) pixel_data = COLOR;
        else if (NOTE == 3'd2 && (y == 8  && ((x >= 39 && x <= 41) || (x >= 47 && x <= 49)))) pixel_data = COLOR;
        else if (NOTE == 3'd2 && (y == 9  && ((x >= 39 && x <= 41) || (x >= 47 && x <= 49)))) pixel_data = COLOR;
        else if (NOTE == 3'd2 && (y == 10 && ((x >= 39 && x <= 41) || (x >= 46 && x <= 48)))) pixel_data = COLOR;
        else if (NOTE == 3'd2 && (y == 11 && (x >= 39 && x <= 47))) pixel_data = COLOR;
        else if (NOTE == 3'd2 && (y == 12 && (x >= 39 && x <= 48))) pixel_data = COLOR;
        else if (NOTE == 3'd2 && (y == 13 && (x >= 39 && x <= 49))) pixel_data = COLOR;
        else if (NOTE == 3'd2 && (y == 14 && ((x >= 39 && x <= 41) || (x >= 46 && x <= 50)))) pixel_data = COLOR;
        else if (NOTE == 3'd2 && (y == 15 && ((x >= 39 && x <= 41) || (x >= 47 && x <= 50)))) pixel_data = COLOR;
        else if (NOTE == 3'd2 && (y == 16 && ((x >= 39 && x <= 41) || (x >= 47 && x <= 50)))) pixel_data = COLOR;
        else if (NOTE == 3'd2 && (y == 17 && ((x >= 39 && x <= 41) || (x >= 46 && x <= 50)))) pixel_data = COLOR;
        else if (NOTE == 3'd2 && (y == 18 && (x >= 39 && x <= 49))) pixel_data = COLOR;
        else if (NOTE == 3'd2 && (y == 19 && (x >= 39 && x <= 48))) pixel_data = COLOR;
        else if (NOTE == 3'd2 && (y == 20 && (x >= 39 && x <= 47))) pixel_data = COLOR;
        // C
        else if (NOTE == 3'd3 && (y == 4  && (x >= 41 && x <= 48))) pixel_data = COLOR;
        else if (NOTE == 3'd3 && (y == 5  && (x >= 40 && x <= 49))) pixel_data = COLOR;
        else if (NOTE == 3'd3 && (y == 6  && (x >= 39 && x <= 50))) pixel_data = COLOR;
        else if (NOTE == 3'd3 && (y == 7  && ((x >= 39 && x <= 44) || x == 49 || x == 50))) pixel_data = COLOR;
        else if (NOTE == 3'd3 && (y == 8  && (x >= 38 && x <= 43))) pixel_data = COLOR;
        else if (NOTE == 3'd3 && (y == 9  && (x >= 38 && x <= 42))) pixel_data = COLOR;
        else if (NOTE == 3'd3 && (y == 10 && (x >= 38 && x <= 41))) pixel_data = COLOR;
        else if (NOTE == 3'd3 && (y == 11 && (x >= 37 && x <= 41))) pixel_data = COLOR;
        else if (NOTE == 3'd3 && (y == 12 && (x >= 37 && x <= 41))) pixel_data = COLOR;
        else if (NOTE == 3'd3 && (y == 13 && (x >= 37 && x <= 41))) pixel_data = COLOR;
        else if (NOTE == 3'd3 && (y == 14 && (x >= 38 && x <= 41))) pixel_data = COLOR;
        else if (NOTE == 3'd3 && (y == 15 && (x >= 38 && x <= 42))) pixel_data = COLOR;
        else if (NOTE == 3'd3 && (y == 16 && (x >= 38 && x <= 43))) pixel_data = COLOR;
        else if (NOTE == 3'd3 && (y == 17 && ((x >= 39 && x <= 44) || x == 49 || x == 50))) pixel_data = COLOR;
        else if (NOTE == 3'd3 && (y == 18 && (x >= 39 && x <= 50))) pixel_data = COLOR;
        else if (NOTE == 3'd3 && (y == 19 && (x >= 40 && x <= 49))) pixel_data = COLOR;
        else if (NOTE == 3'd3 && (y == 20 && (x >= 41 && x <= 48))) pixel_data = COLOR;
        // D
        else if (NOTE == 3'd4 && (y == 4  && (x >= 39 && x <= 47))) pixel_data = COLOR;
        else if (NOTE == 3'd4 && (y == 5  && (x >= 39 && x <= 48))) pixel_data = COLOR;
        else if (NOTE == 3'd4 && (y == 6  && (x >= 39 && x <= 49))) pixel_data = COLOR;
        else if (NOTE == 3'd4 && (y == 7  && ((x >= 39 && x <= 41) || (x >= 46 && x <= 50)))) pixel_data = COLOR;
        else if (NOTE == 3'd4 && (y == 8  && ((x >= 39 && x <= 41) || (x >= 47 && x <= 51)))) pixel_data = COLOR;
        else if (NOTE == 3'd4 && (y == 9  && ((x >= 39 && x <= 41) || (x >= 48 && x <= 51)))) pixel_data = COLOR;
        else if (NOTE == 3'd4 && (y == 10 && ((x >= 39 && x <= 41) || (x >= 48 && x <= 52)))) pixel_data = COLOR;
        else if (NOTE == 3'd4 && (y == 11 && ((x >= 39 && x <= 41) || (x >= 49 && x <= 52)))) pixel_data = COLOR;
        else if (NOTE == 3'd4 && (y == 12 && ((x >= 39 && x <= 41) || (x >= 49 && x <= 52)))) pixel_data = COLOR;
        else if (NOTE == 3'd4 && (y == 13 && ((x >= 39 && x <= 41) || (x >= 49 && x <= 52)))) pixel_data = COLOR;
        else if (NOTE == 3'd4 && (y == 14 && ((x >= 39 && x <= 41) || (x >= 48 && x <= 52)))) pixel_data = COLOR;
        else if (NOTE == 3'd4 && (y == 15 && ((x >= 39 && x <= 41) || (x >= 48 && x <= 51)))) pixel_data = COLOR;
        else if (NOTE == 3'd4 && (y == 16 && ((x >= 39 && x <= 41) || (x >= 47 && x <= 51)))) pixel_data = COLOR;
        else if (NOTE == 3'd4 && (y == 17 && ((x >= 39 && x <= 41) || (x >= 46 && x <= 50)))) pixel_data = COLOR;
        else if (NOTE == 3'd4 && (y == 18 && (x >= 39 && x <= 49))) pixel_data = COLOR;
        else if (NOTE == 3'd4 && (y == 19 && (x >= 39 && x <= 48))) pixel_data = COLOR;
        else if (NOTE == 3'd4 && (y == 20 && (x >= 39 && x <= 47))) pixel_data = COLOR;
        // E
        else if (NOTE == 3'd5 && (y == 4  && (x >= 39 && x <= 50))) pixel_data = COLOR;
        else if (NOTE == 3'd5 && (y == 5  && (x >= 39 && x <= 50))) pixel_data = COLOR;
        else if (NOTE == 3'd5 && (y == 6  && (x >= 39 && x <= 50))) pixel_data = COLOR;
        else if (NOTE == 3'd5 && (y == 7 && (x >= 39 && x <= 41))) pixel_data = COLOR;
        else if (NOTE == 3'd5 && (y == 8  && (x >= 39 && x <= 41))) pixel_data = COLOR;
        else if (NOTE == 3'd5 && (y == 9  && (x >= 39 && x <= 41))) pixel_data = COLOR;
        else if (NOTE == 3'd5 && (y == 10 && (x >= 39 && x <= 48))) pixel_data = COLOR;
        else if (NOTE == 3'd5 && (y == 11 && (x >= 39 && x <= 48))) pixel_data = COLOR;
        else if (NOTE == 3'd5 && (y == 12 && (x >= 39 && x <= 48))) pixel_data = COLOR;
        else if (NOTE == 3'd5 && (y == 13 && (x >= 39 && x <= 41))) pixel_data = COLOR;
        else if (NOTE == 3'd5 && (y == 14 && (x >= 39 && x <= 41))) pixel_data = COLOR;
        else if (NOTE == 3'd5 && (y == 15 && (x >= 39 && x <= 41))) pixel_data = COLOR;
        else if (NOTE == 3'd5 && (y == 16 && (x >= 39 && x <= 41))) pixel_data = COLOR;
        else if (NOTE == 3'd5 && (y == 17 && (x >= 39 && x <= 41))) pixel_data = COLOR;
        else if (NOTE == 3'd5 && (y == 18 && (x >= 39 && x <= 50))) pixel_data = COLOR;
        else if (NOTE == 3'd5 && (y == 19 && (x >= 39 && x <= 50))) pixel_data = COLOR;
        else if (NOTE == 3'd5 && (y == 20 && (x >= 39 && x <= 50))) pixel_data = COLOR;
        // F
        else if (NOTE == 3'd6 && (y == 4  && (x >= 39 && x <= 50))) pixel_data = COLOR;
        else if (NOTE == 3'd6 && (y == 5  && (x >= 39 && x <= 50))) pixel_data = COLOR;
        else if (NOTE == 3'd6 && (y == 6  && (x >= 39 && x <= 50))) pixel_data = COLOR;
        else if (NOTE == 3'd6 && (y == 7  && (x >= 39 && x <= 41))) pixel_data = COLOR;
        else if (NOTE == 3'd6 && (y == 8  && (x >= 39 && x <= 41))) pixel_data = COLOR;
        else if (NOTE == 3'd6 && (y == 9  && (x >= 39 && x <= 41))) pixel_data = COLOR;
        else if (NOTE == 3'd6 && (y == 10 && (x >= 39 && x <= 41))) pixel_data = COLOR;
        else if (NOTE == 3'd6 && (y == 11 && (x >= 39 && x <= 48))) pixel_data = COLOR;
        else if (NOTE == 3'd6 && (y == 12 && (x >= 39 && x <= 48))) pixel_data = COLOR;
        else if (NOTE == 3'd6 && (y == 13 && (x >= 39 && x <= 48))) pixel_data = COLOR;
        else if (NOTE == 3'd6 && (y == 14 && (x >= 39 && x <= 41))) pixel_data = COLOR;
        else if (NOTE == 3'd6 && (y == 15 && (x >= 39 && x <= 41))) pixel_data = COLOR;
        else if (NOTE == 3'd6 && (y == 16 && (x >= 39 && x <= 41))) pixel_data = COLOR;
        else if (NOTE == 3'd6 && (y == 17 && (x >= 39 && x <= 41))) pixel_data = COLOR;
        else if (NOTE == 3'd6 && (y == 18 && (x >= 39 && x <= 41))) pixel_data = COLOR;
        else if (NOTE == 3'd6 && (y == 19 && (x >= 39 && x <= 41))) pixel_data = COLOR;
        else if (NOTE == 3'd6 && (y == 20 && (x >= 39 && x <= 41))) pixel_data = COLOR;
        // G
        else if (NOTE == 3'd7 && (y == 4  && (x >= 44 && x <= 50))) pixel_data = COLOR;
        else if (NOTE == 3'd7 && (y == 5  && (x >= 42 && x <= 51))) pixel_data = COLOR;
        else if (NOTE == 3'd7 && (y == 6  && (x >= 41 && x <= 52))) pixel_data = COLOR;
        else if (NOTE == 3'd7 && (y == 7  && (x >= 41 && x <= 44))) pixel_data = COLOR;
        else if (NOTE == 3'd7 && (y == 8  && (x >= 40 && x <= 43))) pixel_data = COLOR;
        else if (NOTE == 3'd7 && (y == 9  && (x >= 40 && x <= 42))) pixel_data = COLOR;
        else if (NOTE == 3'd7 && (y == 10 && (x >= 39 && x <= 42))) pixel_data = COLOR;
        else if (NOTE == 3'd7 && (y == 11 && (x >= 39 && x <= 41))) pixel_data = COLOR;
        else if (NOTE == 3'd7 && (y == 12 && ((x >= 39 && x <= 41) || (x >= 47 && x <= 51)))) pixel_data = COLOR;
        else if (NOTE == 3'd7 && (y == 13 && ((x >= 39 && x <= 41) || (x >= 47 && x <= 52)))) pixel_data = COLOR;
        else if (NOTE == 3'd7 && (y == 14 && ((x >= 39 && x <= 41) || (x >= 50 && x <= 52)))) pixel_data = COLOR;
        else if (NOTE == 3'd7 && (y == 15 && ((x >= 39 && x <= 42) || (x >= 50 && x <= 52)))) pixel_data = COLOR;
        else if (NOTE == 3'd7 && (y == 16 && ((x >= 40 && x <= 43) || (x >= 50 && x <= 52)))) pixel_data = COLOR;
        else if (NOTE == 3'd7 && (y == 17 && ((x >= 40 && x <= 44) || (x >= 50 && x <= 52)))) pixel_data = COLOR;
        else if (NOTE == 3'd7 && (y == 18 && (x >= 41 && x <= 52))) pixel_data = COLOR;
        else if (NOTE == 3'd7 && (y == 19 && (x >= 42 && x <= 51))) pixel_data = COLOR;
        else if (NOTE == 3'd7 && (y == 20 && (x >= 44 && x <= 50))) pixel_data = COLOR;
        //Sharp
        else if (SHARP == 1 && (x == 58 || x == 59 || x == 64 || x == 65) && (y >= 8 && y <= 23)) pixel_data = COLOR;
        else if (SHARP == 1 && (y == 12 || y == 13 || y == 18 || y == 19) && (x >= 55 && x <= 68)) pixel_data = COLOR;

        else pixel_data = BACKGROUND;
    end
endmodule

