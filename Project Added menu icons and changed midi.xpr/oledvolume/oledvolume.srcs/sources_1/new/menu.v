`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2021 03:21:52 PM
// Design Name: 
// Module Name: menu
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


module menu(input clk, [7:0]x, [6:0]y, input btnU, btnD, btnL, btnR, output [15:0]pixel_data, output reg [2:0] mode = 3'b0

    );
    parameter [15:0]BLACK = 16'h0000;
    parameter [15:0]WHITE = 16'hFFFF;
    parameter [15:0] CYAN = 16'h07FD;
    parameter [15:0]RED = 16'hF800;
    parameter [15:0]YELLOW = 16'hFFE0;
    parameter [15:0]GREEN = 16'h07E0;
    wire SCLK;
    wire L;
    wire R;
    wire U;
    wire D;
    reg [1:0]screen_number = 2'b0;
    wire clkframes;
    reg [1:0]frame = 2'b0;
    wire [15:0]volume_data;
    wire [15:0]music_data;
    wire [15:0]goku_data;
    wire [15:0]midi_data;
    assign pixel_data = (screen_number == 2'd0) ? volume_data : 
                        ((screen_number == 2'd1) ? goku_data : 
                        ((screen_number == 2'd2) ? music_data :
                        ((screen_number == 2'd3) ? midi_data : 0)));
    //assign pixel_data = (screen_number == 2'd0) ? music_data : 0;
    
    slow_blinky_module sclock(clk, SCLK);
    flipflop left (clk, btnL, L);
    flipflop right (clk, btnR, R);
    flipflop menuselect (clk, btnU, U);
    flipflop select (clk, btnD, D);
    clk4hz frames (clk, clkframes);
    
    always @ (posedge SCLK) begin
        screen_number <= (U == 1) ? 2'b0 : ((R == 1) ? screen_number + 1 : ((L == 1) ? screen_number - 1 : screen_number));
        mode <= (D == 1) ? screen_number + 1: ((U == 1) ? 3'b0 : mode);
    end
    
    always @ (posedge clkframes) begin
        frame <= frame + 1;
    end
    
    menu_vol volume_icon (clk, x, y, frame, volume_data);
    menu_music music_icon (clk, x, y, frame, music_data);
    menu_goku goku_icon (clk, x, y, frame, goku_data);
    menu_midi midi_icon (clk, x, y, frame, midi_data);
endmodule
