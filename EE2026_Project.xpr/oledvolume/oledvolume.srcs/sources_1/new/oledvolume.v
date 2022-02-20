`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2021 09:50:38 AM
// Design Name: 
// Module Name: oledvolume
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


module oledvolume(input clk, input [3:0]VOL, [7:0]x, [6:0]y, [3:0]sw,input btnL, btnR, output reg  [15:0]pixel_data

    );
    
    parameter [15:0]RED = 16'hF800;
    parameter [15:0]YELLOW = 16'hFFE0;
    parameter [15:0]GREEN = 16'h07E0;
    parameter [15:0] ORANGE = 16'hFBE0;
    parameter [15:0] AQUAMARINE   = 16'h87FC;
    parameter [15:0] BLUE   = 16'h039C;
    parameter [15:0]WHITE = 16'hFFFF;
    parameter [15:0]PINK = 16'hFB18;
    parameter [15:0]BLACK = 16'h0000;
    
    wire SR;
    wire SL;
    wire SCLK;
    
    reg [1:0] width = (sw[0] == 1) ? 2'd2 : 2'd0;
    reg [5:0] SHIFTL = 6'd0;
    reg [5:0] SHIFTR = 6'd0;
    reg [6:0] SHIFT = 7'd45; // 0 - 90 (left shift of 45)
    slow_blinky_module sclock(clk, SCLK);
    flipflop shiftleft (clk, btnL, SL);
    flipflop shiftright (clk, btnR, SR);
    
    always @ (posedge SCLK) begin
        //SHIFTL <= (SHIFTL == 6'd45) ? ((SR == 1) ? SHIFTL - 1 : SHIFTL) : ((SL == 1 && SHIFTR != 6'd45) ? SHIFTL + 1 : SHIFTL);
        //SHIFTR <= (SHIFTR == 6'd45) ? ((SL == 1) ? SHIFTR - 1 : SHIFTR) : ((SR == 1 && SHIFTL != 6'd45) ? SHIFTR + 1 : SHIFTR);
        SHIFT <= ((SR == 1 && SHIFT != 88) ? SHIFT + 1 : ((SL == 1 && SHIFT != 2) ? SHIFT - 1 : SHIFT));
     end
    
    wire [15:0]BACKGROUND = (sw[2] == 0) ? BLACK : PINK;
    wire [15:0]BORDER = (sw[1] == 0) ? ((sw[2] == 1) ? ~PINK : WHITE) : BACKGROUND;
    wire [15:0]LOW = (sw[3] == 0) ? ((sw[2] == 1) ? ORANGE : GREEN) : BACKGROUND;
    wire [15:0]MID = (sw[3] == 0) ? ((sw[2] == 1) ? AQUAMARINE : YELLOW) : BACKGROUND;
    wire [15:0]HIGH = (sw[3] == 0) ? ((sw[2] == 1) ? BLUE : RED) : BACKGROUND;
    
    always @ (*) begin 
            //Bottom
            //if ((x - 45)**2 + (y-32)**2 == 10**2) pixel_data = BORDER;
            if (x <= width || x >= 95 - width || y <= width || y >= 63 - width) pixel_data = BORDER;
            else if (VOL >= 0 && x <= 50 + SHIFT - 45 && x >= 45 + SHIFT - 45 && y <= 59 && y >= 58) pixel_data = LOW;
            else if (VOL >= 1 && x <= 50 + SHIFT - 45 && x >= 45 + SHIFT - 45 && y <= 56 && y >= 55) pixel_data = LOW;
            else if (VOL >= 2 && x <= 50 + SHIFT - 45 && x >= 45 + SHIFT - 45 && y <= 53 && y >= 52) pixel_data = LOW;
            else if (VOL >= 3 && x <= 50 + SHIFT - 45 && x >= 45 + SHIFT - 45 && y <= 50 && y >= 49) pixel_data = LOW;
            else if (VOL >= 4 && x <= 50 + SHIFT - 45 && x >= 45 + SHIFT - 45 && y <= 47 && y >= 46) pixel_data = LOW;
            else if (VOL >= 5 && x <= 50 + SHIFT - 45 && x >= 45 + SHIFT - 45 && y <= 44 && y >= 43) pixel_data = LOW;
            //Middle
            else if (VOL >= 6 && x <= 50 + SHIFT - 45 && x >= 45 + SHIFT - 45 && y <= 41 && y >= 39) pixel_data = MID;
            else if (VOL >= 7 && x <= 50 + SHIFT - 45 && x >= 45 + SHIFT - 45 && y <= 37 && y >= 35) pixel_data = MID;
            else if (VOL >= 8 && x <= 50 + SHIFT - 45 && x >= 45 + SHIFT - 45 && y <= 33 && y >= 31) pixel_data = MID;
            else if (VOL >= 9 && x <= 50 + SHIFT - 45 && x >= 45 + SHIFT - 45 && y <= 29 && y >= 27) pixel_data = MID;
            else if (VOL >= 10 && x <= 50 + SHIFT - 45 && x >= 45 + SHIFT - 45 && y <= 25 && y >= 23) pixel_data = MID;
            //Top
            else if (VOL >= 11 && x <= 50 + SHIFT - 45 && x >= 45 + SHIFT - 45 && y <= 21 && y >= 19) pixel_data = HIGH;
            else if (VOL >= 12 && x <= 50 + SHIFT - 45 && x >= 45 + SHIFT - 45 && y <= 17 && y >= 15) pixel_data = HIGH;
            else if (VOL >= 13 && x <= 50 + SHIFT - 45 && x >= 45 + SHIFT - 45 && y <= 13 && y >= 11) pixel_data = HIGH;
            else if (VOL >= 14 && x <= 50 + SHIFT - 45 && x >= 45 + SHIFT - 45 && y <= 9 && y >= 7) pixel_data = HIGH;
            else if (VOL >= 15 && x <= 50 + SHIFT - 45 && x >= 45 + SHIFT - 45 && y <= 5 && y >= 3) pixel_data = HIGH;
            else pixel_data = BACKGROUND;
    end
endmodule
