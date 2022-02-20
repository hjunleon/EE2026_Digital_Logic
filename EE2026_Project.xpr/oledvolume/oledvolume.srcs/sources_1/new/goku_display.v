`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2021 12:11:17 AM
// Design Name: 
// Module Name: goku_display
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


module goku_display(input [7:0]x, [6:0]y, input [1:0]frame, [6:0]progress, output reg [15:0]pixel_data

    );
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
    wire SHIFT = (frame == 2'd0 || frame == 2'd1) ? 1 : 0;
    wire [15:0]FACE = BEIGE;
    wire [15:0]HAIR = (progress <= 7'd20) ? BLACK :
                      ((progress <= 7'd40) ? YELLOW :
                      ((progress <= 7'd65) ? RED :
                      ((progress <= 7'd99) ? BLUE : WHITE)));
    wire [15:0]ELEC = (progress <= 7'd20) ? GREY :
                      ((progress <= 7'd40) ? YELLOW :
                      ((progress <= 7'd65) ? RED :
                      ((progress <= 7'd99) ? BLUE : WHITE)));
    wire [15:0]AURA = (progress <= 7'd20) ? BLACK :
                      ((progress <= 7'd40) ? YELLOW :
                      ((progress <= 7'd65) ? RED :
                      ((progress <= 7'd99) ? BLUE : WHITE)));
    always @ (*) begin 
        //HEAD
        //Top Hair
        if (y == 12 + SHIFT && (x >= 46 && x <= 50)) pixel_data = HAIR;
        else if (y == 13 + SHIFT && (x >= 46 && x <= 48)) pixel_data = HAIR;
        else if (y == 14 + SHIFT && (x >= 45 && x <= 47)) pixel_data = HAIR;
        else if (y == 15 + SHIFT && ((x >= 42 && x <= 46) || x == 50 || x == 51)) pixel_data = HAIR;
        else if (y == 16 + SHIFT && ((x >= 42 && x <= 46) || (x >= 48 && x <= 54))) pixel_data = HAIR;
        else if (y == 17 + SHIFT && (x >= 42 && x <= 55)) pixel_data = HAIR;
        else if (y == 18 + SHIFT && (x >= 42 && x <= 56)) pixel_data = HAIR;
        else if (y == 19 + SHIFT && (x >= 39 && x <= 57)) pixel_data = HAIR;
        else if (y == 20 + SHIFT && (x >= 38 && x <= 54)) pixel_data = HAIR;
        else if (y == 21 + SHIFT && (x >= 38 && x <= 51)) pixel_data = HAIR;
        else if (y == 22 + SHIFT && (x >= 38 && x <= 51)) pixel_data = HAIR;
        else if (y == 23 + SHIFT && (x >= 35 && x <= 54)) pixel_data = HAIR;
        //Face
        else if (y == 24 + SHIFT && (x == 46 || x == 47)) pixel_data = FACE;
        else if (y == 25 + SHIFT && (x == 38 || (x >= 46 && x <= 48))) pixel_data = FACE;
        else if (y == 26 + SHIFT && (x == 38 || x == 39 || (x >= 42 && x <= 44)|| (x >= 46 && x <= 49))) pixel_data = FACE;
        else if (y == 27 + SHIFT && ((x >= 38 && x <= 41) || (x >= 45 && x <= 49))) pixel_data = FACE;
        else if (y == 28 + SHIFT && (x >= 40 && x <= 48)) pixel_data = FACE;
        else if (y == 29 + SHIFT && (x >= 42 && x <= 47)) pixel_data = FACE;
        else if (y == 30 + SHIFT && (x >= 45 && x <= 46)) pixel_data = FACE;
        // Bottom Hair
        else if (y == 24 + SHIFT && (x >= 35 && x <= 56)) pixel_data = HAIR;
        else if (y == 25 + SHIFT && (x >= 31 && x <= 53)) pixel_data = HAIR;
        else if (y == 26 + SHIFT && (x >= 33 && x <= 51)) pixel_data = HAIR;
        else if (y == 27 + SHIFT && (x >= 35 && x <= 51)) pixel_data = HAIR;
        else if (y == 28 + SHIFT && (x >= 36 && x <= 49)) pixel_data = HAIR;
        else if (y == 29 + SHIFT && (x >= 38 && x <= 48)) pixel_data = HAIR;
        else if (y == 30 + SHIFT && (x >= 42 && x <= 48)) pixel_data = HAIR;
        else if (y == 31 + SHIFT && (x >= 45 && x <= 47)) pixel_data = HAIR;
        
        //OUTLINE
        else if (y == 30 && (x >= 35 && x <= 38)) pixel_data = BLACK;
        else if (y == 31 && (x == 34 || x == 39 || x == 49)) pixel_data = BLACK;
        else if (y == 32 && (x == 34 || x == 40 || x == 41 || x == 48 || x == 50 )) pixel_data = BLACK;
        else if (y == 33 && (x == 34 || x == 35 || (x >= 42 && x <= 46) || x == 50)) pixel_data = BLACK;
        else if (y == 34 && ((x >= 31 && x <= 35) || x == 45 || x == 50)) pixel_data = BLACK;
        else if (y == 35 && (x == 30 || x == 34 || x == 36 || x == 37 || x == 38 || x == 50)) pixel_data = BLACK;
        else if (y == 36 && (x == 30 || x == 31 || x == 32 || x == 47 || x == 49 || x == 51 || x == 54 || x == 55 || x == 56)) pixel_data = BLACK;
        else if (y == 37 && (x == 29 || x == 33 || x == 34 || x == 38 || x == 46 || x == 49 || x == 52 || x == 53 || x == 54 || x == 57)) pixel_data = BLACK;
        else if (y == 38 && (x == 29 || x == 34 || x == 36 || x == 37 || x == 39 || x == 45 || x == 48 || x == 54 || x == 57)) pixel_data = BLACK;
        else if (y == 39 && ((x >= 30 && x <= 35) || (x >= 39 && x <= 45) || (x >= 48 && x <= 56))) pixel_data = BLACK;
        else if (y == 40 && ((x >= 39 && x <= 45)  || x == 48)) pixel_data = BLACK;
        else if (y == 41 && (x == 39 || x == 42 || x == 43 || x == 44 || x == 47)) pixel_data = BLACK;
        else if (y == 42 && (x == 38 || x == 49)) pixel_data = BLACK;
        else if (y == 43 && (x == 38 || x == 50)) pixel_data = BLACK;
        else if (y == 44 && (x == 37 || x == 50)) pixel_data = BLACK;
        else if (y == 45 && (x == 37 || x == 50)) pixel_data = BLACK;
        else if (y == 46 && (x == 36 || x == 37 || x == 38 || x == 50)) pixel_data = BLACK;
        else if (y == 47 && (x == 36 || x == 39 || x == 40 || x == 41 || x == 50)) pixel_data = BLACK;
        else if (y == 48 && (x == 36 || x == 49 || x == 51)) pixel_data = BLACK;
        else if (y == 49 && (x == 35 || x == 38 || x == 39 || x == 45 || x == 47 || x == 48 || x == 51)) pixel_data = BLACK;
        else if (y == 50 && (x == 35 || x == 43 || x == 44 || x == 45 || x == 51)) pixel_data = BLACK;
        else if (y == 51 && (x == 36 || x == 37 || x == 38 || x == 43 || x == 44 || x == 45 || x == 50)) pixel_data = BLACK;
        else if (y == 52 && (x == 35 || x == 40 || x == 41 || x == 45 || x == 49)) pixel_data = BLACK;
        else if (y == 53 && (x == 34 || x == 40 || x == 41 || x == 45 || x == 49)) pixel_data = BLACK;
        else if (y == 54 && (x == 34 || x == 39 || x == 45 || x == 50)) pixel_data = BLACK;
        else if (y == 55 && (x == 34 || x == 39 || x == 45 || x == 51)) pixel_data = BLACK;
        else if (y == 56 && ((x >= 35 && x <= 38) || (x >= 46 && x <= 51))) pixel_data = BLACK;
        
        //NECK
        else if (y == 30 && (x >= 39 && x <= 41)) pixel_data = BEIGE;
        else if (y == 31 && (x >= 40 && x <= 44)) pixel_data = BEIGE;
        else if (y == 32 && (x >= 42 && x <= 47)) pixel_data = BEIGE;
        
        //SHIRT
        else if (y == 31 && (x >= 35 && x <= 48)) pixel_data = BLUE;
        else if (y == 32 && (x >= 35 && x <= 49)) pixel_data = BLUE;
        else if (y == 33 && (x >= 36 && x <= 49)) pixel_data = BLUE;
        else if (y == 34 && (x >= 36 && x <= 49)) pixel_data = BLUE;
        else if (y == 35 && (x >= 38 && x <= 49)) pixel_data = BLUE;
        else if (y == 36 && (x >= 38 && x <= 48)) pixel_data = BLUE;
        else if (y == 37 && (x >= 39 && x <= 48)) pixel_data = BLUE;
        else if (y == 38 && (x >= 40 && x <= 47)) pixel_data = BLUE;
        else if (y == 39 && (x >= 40 && x <= 47)) pixel_data = BLUE;
        else if (y == 40 && (x >= 40 && x <= 47)) pixel_data = BLUE;
        
        //HANDS
        else if (y == 35 && (x >= 31 && x <= 35)) pixel_data = BEIGE;
        else if (y == 36 && (x >= 33 && x <= 37)) pixel_data = BEIGE;
        else if (y == 37 && (x >= 30 && x <= 59)) pixel_data = BEIGE;
        else if (y == 38 && ((x >= 30 && x <= 35) || (x >= 49 && x <= 56))) pixel_data = BEIGE;
        
        //PANTS
        else if (y == 41 && (x >= 39 && x <= 48)) pixel_data = ORANGE;
        else if (y == 42 && (x >= 38 && x <= 48)) pixel_data = ORANGE;
        else if (y == 43 && (x >= 38 && x <= 49)) pixel_data = ORANGE;
        else if (y == 44 && (x >= 37 && x <= 49)) pixel_data = ORANGE;
        else if (y == 45 && (x >= 37 && x <= 49)) pixel_data = ORANGE;
        else if (y == 46 && (x >= 37 && x <= 49)) pixel_data = ORANGE;
        else if (y == 47 && (x >= 37 && x <= 48)) pixel_data = ORANGE;
        else if (y == 48 && (x >= 37 && x <= 50)) pixel_data = ORANGE;
        else if (y == 49 && (x >= 35 && x <= 50)) pixel_data = ORANGE;
        else if (y == 50 && (x >= 35 && x <= 50)) pixel_data = ORANGE;
        else if (y == 51 && (x >= 38 && x <= 49)) pixel_data = ORANGE;
        
        //SHOES
        else if ((y == 52 && x == 48) || (y == 53 && x == 48) || (y == 54 && x == 49) || (y == 55 && x == 50)) pixel_data = RED;
        else if ((y == 54 || y == 55) && (x == 36 || x == 37)) pixel_data = RED;
        else if (y == 53 && ((x >= 35 && x <= 39) || x == 46 || x == 47)) pixel_data = YELLOW;
        else if (y == 52 && ((x >= 36 && x <= 39) || (x >= 46 && x <= 48))) pixel_data = BLUE;
        else if (y == 53 && ((x >= 35 && x <= 38) || (x >= 46 && x <= 48))) pixel_data = BLUE;
        else if (y == 54 && ((x >= 35 && x <= 38) || (x >= 46 && x <= 49))) pixel_data = BLUE;
        else if (y == 55 && ((x >= 35 && x <= 38) || (x >= 46 && x <= 50))) pixel_data = BLUE;
        
        // Electricity
        else if (x == 27 + SHIFT && (y >= 10 - SHIFT && y <= 14 - SHIFT)) pixel_data = ELEC;
        else if (x == 28 + SHIFT && (y >= 14 - SHIFT && y <= 18 - SHIFT)) pixel_data = ELEC;
        
        else if (x == 25 - SHIFT && (y >= 28 + SHIFT && y <= 32 + SHIFT)) pixel_data = ELEC;
        else if (x == 26 - SHIFT && (y >= 25 + SHIFT && y <= 29 + SHIFT)) pixel_data = ELEC;
        
        else if (x == 28 - SHIFT && (y >= 44 - SHIFT && y <= 50 - SHIFT)) pixel_data = ELEC;
        else if (x == 29 - SHIFT && (y >= 46 - SHIFT && y <= 48 - SHIFT)) pixel_data = ELEC;
        
        else if (x == 41 + SHIFT && (y >= 8 + SHIFT && y <= 12 + SHIFT)) pixel_data = ELEC;
        else if (x == 42 + SHIFT && (y >= 12 + SHIFT && y <= 13 + SHIFT)) pixel_data = ELEC;
        
        else if (x == 60 - SHIFT && (y >= 25 + SHIFT && y <= 29 + SHIFT)) pixel_data = ELEC;
        else if (x == 59 - SHIFT && (y >= 30 + SHIFT && y <= 33 + SHIFT)) pixel_data = ELEC;
        
        else if (x == 65 + SHIFT && (y >= 40 - SHIFT && y <= 42 - SHIFT)) pixel_data = ELEC;
        else if (x == 64 + SHIFT && (y >= 42 - SHIFT && y <= 43 - SHIFT)) pixel_data = ELEC;
        
        else pixel_data = GREY;
    end
endmodule
