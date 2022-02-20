`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2021 02:56:42 AM
// Design Name: 
// Module Name: midi_display
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


module midi_display(input clk, [3:0]note, [7:0]x, [6:0]y, output reg  [15:0]pixel_data

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
    
    wire [15:0]BACKGROUND = WHITE;
    wire clkframes;
    reg [2:0]frame = 3'b0;
    reg[9:0]note1 = 10'b0; // position 0 being top, 7 being lowest
    reg[9:0]note2 = 10'b0;
    reg[9:0]note3 = 10'b0;
    reg[9:0]note4 = 10'b0;
    reg[9:0]note5 = 10'b0;
    reg[9:0]note6 = 10'b0;
    reg[9:0]note7 = 10'b0;
    reg[9:0]note8 = 10'b0;
    reg[9:0]note9 = 10'b0;
    reg[9:0]note10 = 10'b0;
    reg[9:0]note11 = 10'b0;
    reg[9:0]note12 = 10'b0;

    always @ (posedge clk) begin
        note1 <= (note == 4'd3) ? (note1*2) + 1 : note1 <<1;
        note2 <= (note == 4'd4) ? (note2*2) + 1 : note2 <<1;
        note3 <= (note == 4'd5) ? (note3*2) + 1 : note3 <<1;
        note4 <= (note == 4'd6) ? (note4*2) + 1 : note4 <<1;
        note5 <= (note == 4'd7) ? (note5*2) + 1 : note5 <<1;
        note6 <= (note == 4'd8) ? (note6*2) + 1 : note6 <<1;
        note7 <= (note == 4'd9) ? (note7*2) + 1 : note7 <<1;
        note8 <= (note == 4'd10) ? (note8*2) + 1 : note8 <<1;
        note9 <= (note == 4'd11) ? (note9*2) + 1 : note9 <<1;
        note10<= (note == 4'd0) ? (note10*2) + 1 : note10<<1;
        note11<= (note == 4'd1) ? (note11*2) + 1 : note11<<1;
        note12<= (note == 4'd2) ? (note12*2) + 1 : note12<<1;
    end
    
    always @ (*) begin
        //Keyboard
        if (y >= 50 && (x == 10 || x == 21 || x == 32 || x == 43 || x == 54 || x == 65 || x == 76 || x == 87)) pixel_data = BLACK;
        else if (y == 50 && (x >= 10 && x <= 87)) pixel_data = BLACK;
        else if ((y >= 50 && y <= 56) && ((x >= 18 && x <= 23) || (x >= 30 && x <= 35) || (x >= 51 && x <= 56) || (x >= 51 && x <= 56) || (x >= 63 && x <= 67) || (x >= 74 && x <= 79))) pixel_data = BLACK;
        
        // Note1
        else if (note1[0] == 1 && (y >= 0 && y <= 3) && (x >= 11 && x <= 17)) pixel_data = GREEN;
        else if (note1[1] == 1 && (y >= 4 && y <= 8) && (x >= 11 && x <= 17)) pixel_data = GREEN;
        else if (note1[2] == 1 && (y >= 9 && y <= 13) && (x >= 11 && x <= 17)) pixel_data = GREEN;
        else if (note1[3] == 1 && (y >= 14 && y <= 18) && (x >= 11 && x <= 17)) pixel_data = GREEN;
        else if (note1[4] == 1 && (y >= 19 && y <= 23) && (x >= 11 && x <= 17)) pixel_data = GREEN;
        else if (note1[5] == 1 && (y >= 24 && y <= 28) && (x >= 11 && x <= 17)) pixel_data = GREEN;
        else if (note1[6] == 1 && (y >= 29 && y <= 33) && (x >= 11 && x <= 17)) pixel_data = GREEN;
        else if (note1[7] == 1 && (y >= 34 && y <= 38) && (x >= 11 && x <= 17)) pixel_data = GREEN;
        else if (note1[8] == 1 && (y >= 39 && y <= 43) && (x >= 11 && x <= 17)) pixel_data = GREEN;
        else if (note1[9] == 1 && (y >= 44 && y <= 47) && (x >= 11 && x <= 17)) pixel_data = GREEN;
        else if (note1[10] == 1 && (y >= 48 && y <= 50) && (x >= 11 && x <= 17)) pixel_data = GREEN;
        
        // Note2
        else if (note2[0] == 1 && (y >= 0 && y <= 3) && (x >= 18 && x <= 23)) pixel_data = ORANGE;
        else if (note2[1] == 1 && (y >= 4 && y <=  8) && (x >= 18 && x <= 23)) pixel_data = ORANGE;
        else if (note2[2] == 1 && (y >=  9 && y <= 13) && (x >= 18 && x <= 23)) pixel_data = ORANGE;
        else if (note2[3] == 1 && (y >= 14 && y <= 18) && (x >= 18 && x <= 23)) pixel_data = ORANGE;
        else if (note2[4] == 1 && (y >= 19 && y <= 23) && (x >= 18 && x <= 23)) pixel_data = ORANGE;
        else if (note2[5] == 1 && (y >= 24 && y <= 28) && (x >= 18 && x <= 23)) pixel_data = ORANGE;
        else if (note2[6] == 1 && (y >= 29 && y <= 33) && (x >= 18 && x <= 23)) pixel_data = ORANGE;
        else if (note2[7] == 1 && (y >= 34 && y <= 38) && (x >= 18 && x <= 23)) pixel_data = ORANGE;
        else if (note2[8] == 1 && (y >= 39 && y <= 43) && (x >= 18 && x <= 23)) pixel_data = ORANGE;
        else if (note2[9] == 1 && (y >= 44 && y <= 47) && (x >= 18 && x <= 23)) pixel_data = ORANGE;
        else if (note2[10] == 1 && (y >= 48 && y <= 50) && (x >= 18 && x <= 23)) pixel_data = ORANGE;
        
        // Note3
        else if (note3[0] == 1 && (y >= 0 && y <= 3) && (x >= 24 && x <= 29)) pixel_data = GREEN;
        else if (note3[1] == 1 && (y >= 4 && y <=  8) && (x >= 24 && x <= 29)) pixel_data = GREEN;
        else if (note3[2] == 1 && (y >= 9 && y <= 13) && (x >= 24 && x <= 29)) pixel_data = GREEN;
        else if (note3[3] == 1 && (y >= 14 && y <= 18) && (x >= 24 && x <= 29)) pixel_data = GREEN;
        else if (note3[4] == 1 && (y >= 19 && y <= 23) && (x >= 24 && x <= 29)) pixel_data = GREEN;
        else if (note3[5] == 1 && (y >= 24 && y <= 28) && (x >= 24 && x <= 29)) pixel_data = GREEN;
        else if (note3[6] == 1 && (y >= 29 && y <= 33) && (x >= 24 && x <= 29)) pixel_data = GREEN;
        else if (note3[7] == 1 && (y >= 34 && y <= 38) && (x >= 24 && x <= 29)) pixel_data = GREEN;
        else if (note3[8] == 1 && (y >= 39 && y <= 43) && (x >= 24 && x <= 29)) pixel_data = GREEN;
        else if (note3[9] == 1 && (y >= 44 && y <= 47) && (x >= 24 && x <= 29)) pixel_data = GREEN;
        else if (note3[10] == 1 && (y >= 48 && y <= 50) && (x >= 24 && x <= 29)) pixel_data = GREEN;
        
        // Note4
        else if (note4[0] == 1 && (y >= 0 && y <= 3) && (x >= 30 && x <= 35)) pixel_data = ORANGE;
        else if (note4[1] == 1 && (y >= 4 && y <=  8) && (x >= 30 && x <= 35)) pixel_data = ORANGE;
        else if (note4[2] == 1 && (y >= 9 && y <= 13) && (x >= 30 && x <= 35)) pixel_data = ORANGE;
        else if (note4[3] == 1 && (y >= 14 && y <= 18) && (x >= 30 && x <= 35)) pixel_data = ORANGE;
        else if (note4[4] == 1 && (y >= 19 && y <= 23) && (x >= 30 && x <= 35)) pixel_data = ORANGE;
        else if (note4[5] == 1 && (y >= 24 && y <= 28) && (x >= 30 && x <= 35)) pixel_data = ORANGE;
        else if (note4[6] == 1 && (y >= 29 && y <= 33) && (x >= 30 && x <= 35)) pixel_data = ORANGE;
        else if (note4[7] == 1 && (y >= 34 && y <= 38) && (x >= 30 && x <= 35)) pixel_data = ORANGE;
        else if (note4[8] == 1 && (y >= 39 && y <= 43) && (x >= 30 && x <= 35)) pixel_data = ORANGE;
        else if (note4[9] == 1 && (y >= 44 && y <= 47) && (x >= 30 && x <= 35)) pixel_data = ORANGE;
        else if (note4[10] == 1 && (y >= 48 && y <= 50) && (x >= 30 && x <= 35)) pixel_data = ORANGE;
        
        // Note5
        else if (note5[0] == 1 && (y >= 0 && y <= 3) && (x >= 36 && x <= 42)) pixel_data = GREEN;
        else if (note5[1] == 1 && (y >= 4 && y <=  8) && (x >= 36 && x <= 42)) pixel_data = GREEN;
        else if (note5[2] == 1 && (y >= 9 && y <= 13) && (x >= 36 && x <= 42)) pixel_data = GREEN;
        else if (note5[3] == 1 && (y >= 14 && y <= 18) && (x >= 36 && x <= 42)) pixel_data = GREEN;
        else if (note5[4] == 1 && (y >= 19 && y <= 23) && (x >= 36 && x <= 42)) pixel_data = GREEN;
        else if (note5[5] == 1 && (y >= 24 && y <= 28) && (x >= 36 && x <= 42)) pixel_data = GREEN;
        else if (note5[6] == 1 && (y >= 29 && y <= 33) && (x >= 36 && x <= 42)) pixel_data = GREEN;
        else if (note5[7] == 1 && (y >= 34 && y <= 38) && (x >= 36 && x <= 42)) pixel_data = GREEN;
        else if (note5[8] == 1 && (y >= 39 && y <= 43) && (x >= 36 && x <= 42)) pixel_data = GREEN;
        else if (note5[9] == 1 && (y >= 44 && y <= 47) && (x >= 36 && x <= 42)) pixel_data = GREEN;
        else if (note5[10] == 1 && (y >= 48 && y <= 50) && (x >= 36 && x <= 42)) pixel_data = GREEN;  
        
        // Note6
        else if (note6[0] == 1 && (y >= 0 && y <= 3) && (x >= 44 && x <= 50)) pixel_data = GREEN;
        else if (note6[1] == 1 && (y >= 4 && y <=  8) && (x >= 44 && x <= 50)) pixel_data = GREEN;
        else if (note6[2] == 1 && (y >= 9 && y <= 13) && (x >= 44 && x <= 50)) pixel_data = GREEN;
        else if (note6[3] == 1 && (y >= 14 && y <= 18) && (x >= 44 && x <= 50)) pixel_data = GREEN;
        else if (note6[4] == 1 && (y >= 19 && y <= 23) && (x >= 44 && x <= 50)) pixel_data = GREEN;
        else if (note6[5] == 1 && (y >= 24 && y <= 28) && (x >= 44 && x <= 50)) pixel_data = GREEN;
        else if (note6[6] == 1 && (y >= 29 && y <= 33) && (x >= 44 && x <= 50)) pixel_data = GREEN;
        else if (note6[7] == 1 && (y >= 34 && y <= 38) && (x >= 44 && x <= 50)) pixel_data = GREEN;
        else if (note6[8] == 1 && (y >= 39 && y <= 43) && (x >= 44 && x <= 50)) pixel_data = GREEN;
        else if (note6[9] == 1 && (y >= 44 && y <= 47) && (x >= 44 && x <= 50)) pixel_data = GREEN;
        else if (note6[10] == 1 && (y >= 48 && y <= 50) && (x >= 44 && x <= 50)) pixel_data = GREEN;    
        
        // Note7
        else if (note7[0] == 1 && (y >= 0 && y <= 3) && (x >= 51 && x <= 56)) pixel_data = ORANGE;
        else if (note7[1] == 1 && (y >= 4 && y <=  8) && (x >= 51 && x <= 56)) pixel_data = ORANGE;
        else if (note7[2] == 1 && (y >= 9 && y <= 13) && (x >= 51 && x <= 56)) pixel_data = ORANGE;
        else if (note7[3] == 1 && (y >= 14 && y <= 18) && (x >= 51 && x <= 56)) pixel_data = ORANGE;
        else if (note7[4] == 1 && (y >= 19 && y <= 23) && (x >= 51 && x <= 56)) pixel_data = ORANGE;
        else if (note7[5] == 1 && (y >= 24 && y <= 28) && (x >= 51 && x <= 56)) pixel_data = ORANGE;
        else if (note7[6] == 1 && (y >= 29 && y <= 33) && (x >= 51 && x <= 56)) pixel_data = ORANGE;
        else if (note7[7] == 1 && (y >= 34 && y <= 38) && (x >= 51 && x <= 56)) pixel_data = ORANGE;
        else if (note7[8] == 1 && (y >= 39 && y <= 43) && (x >= 51 && x <= 56)) pixel_data = ORANGE;
        else if (note7[9] == 1 && (y >= 44 && y <= 47) && (x >= 51 && x <= 56)) pixel_data = ORANGE;
        else if (note7[10] == 1 && (y >= 48 && y <= 50) && (x >= 51 && x <= 56)) pixel_data = ORANGE;
        
        // Note8
        else if (note8[0] == 1 && (y >= 0 && y <= 3) && (x >= 57 && x <= 62)) pixel_data = GREEN;
        else if (note8[1] == 1 && (y >= 4 && y <=  8) && (x >= 57 && x <= 62)) pixel_data = GREEN;
        else if (note8[2] == 1 && (y >= 9 && y <= 13) && (x >= 57 && x <= 62)) pixel_data = GREEN;
        else if (note8[3] == 1 && (y >= 14 && y <= 18) && (x >= 57 && x <= 62)) pixel_data = GREEN;
        else if (note8[4] == 1 && (y >= 19 && y <= 23) && (x >= 57 && x <= 62)) pixel_data = GREEN;
        else if (note8[5] == 1 && (y >= 24 && y <= 28) && (x >= 57 && x <= 62)) pixel_data = GREEN;
        else if (note8[6] == 1 && (y >= 29 && y <= 33) && (x >= 57 && x <= 62)) pixel_data = GREEN;
        else if (note8[7] == 1 && (y >= 34 && y <= 38) && (x >= 57 && x <= 62)) pixel_data = GREEN;
        else if (note8[8] == 1 && (y >= 39 && y <= 43) && (x >= 57 && x <= 62)) pixel_data = GREEN;
        else if (note8[9] == 1 && (y >= 44 && y <= 47) && (x >= 57 && x <= 62)) pixel_data = GREEN;
        else if (note8[10] == 1 && (y >= 48 && y <= 50) && (x >= 57 && x <= 62)) pixel_data = GREEN;    
        
        // Note9
        else if (note9[0] == 1 && (y >= 0 && y <= 3) && (x >= 63 && x <= 67)) pixel_data = ORANGE;
        else if (note9[1] == 1 && (y >= 4 && y <=  8) && (x >= 63 && x <= 67)) pixel_data = ORANGE;
        else if (note9[2] == 1 && (y >= 9 && y <= 13) && (x >= 63 && x <= 67)) pixel_data = ORANGE;
        else if (note9[3] == 1 && (y >= 14 && y <= 18) && (x >= 63 && x <= 67)) pixel_data = ORANGE;
        else if (note9[4] == 1 && (y >= 19 && y <= 23) && (x >= 63 && x <= 67)) pixel_data = ORANGE;
        else if (note9[5] == 1 && (y >= 24 && y <= 28) && (x >= 63 && x <= 67)) pixel_data = ORANGE;
        else if (note9[6] == 1 && (y >= 29 && y <= 33) && (x >= 63 && x <= 67)) pixel_data = ORANGE;
        else if (note9[7] == 1 && (y >= 34 && y <= 38) && (x >= 63 && x <= 67)) pixel_data = ORANGE;
        else if (note9[8] == 1 && (y >= 39 && y <= 43) && (x >= 63 && x <= 67)) pixel_data = ORANGE;
        else if (note9[9] == 1 && (y >= 44 && y <= 47) && (x >= 63 && x <= 67)) pixel_data = ORANGE;
        else if (note9[10] == 1 && (y >= 48 && y <= 50) && (x >= 63 && x <= 67)) pixel_data = ORANGE;    
        
        // Note10
        else if (note10[0] == 1 && (y >= 0 && y <= 3) && (x >= 68 && x <= 73)) pixel_data = GREEN;
        else if (note10[1] == 1 && (y >= 4 && y <=  8) && (x >= 68 && x <= 73)) pixel_data = GREEN;
        else if (note10[2] == 1 && (y >= 9 && y <= 13) && (x >= 68 && x <= 73)) pixel_data = GREEN;
        else if (note10[3] == 1 && (y >= 14 && y <= 18) && (x >= 68 && x <= 73)) pixel_data = GREEN;
        else if (note10[4] == 1 && (y >= 19 && y <= 23) && (x >= 68 && x <= 73)) pixel_data = GREEN;
        else if (note10[5] == 1 && (y >= 24 && y <= 28) && (x >= 68 && x <= 73)) pixel_data = GREEN;
        else if (note10[6] == 1 && (y >= 29 && y <= 33) && (x >= 68 && x <= 73)) pixel_data = GREEN;
        else if (note10[7] == 1 && (y >= 34 && y <= 38) && (x >= 68 && x <= 73)) pixel_data = GREEN;
        else if (note10[8] == 1 && (y >= 39 && y <= 43) && (x >= 68 && x <= 73)) pixel_data = GREEN;
        else if (note10[9] == 1 && (y >= 44 && y <= 47) && (x >= 68 && x <= 73)) pixel_data = GREEN;
        else if (note10[10] == 1 && (y >= 48 && y <= 50) && (x >= 68 && x <= 73)) pixel_data = GREEN;    
        
        // Note11
        else if (note11[0] == 1 && (y >= 0 && y <= 3) && (x >= 74 && x <= 79)) pixel_data = ORANGE;
        else if (note11[1] == 1 && (y >= 4 && y <=  8) && (x >= 74 && x <= 79)) pixel_data = ORANGE;
        else if (note11[2] == 1 && (y >= 9 && y <= 13) && (x >= 74 && x <= 79)) pixel_data = ORANGE;
        else if (note11[3] == 1 && (y >= 14 && y <= 18) && (x >= 74 && x <= 79)) pixel_data = ORANGE;
        else if (note11[4] == 1 && (y >= 19 && y <= 23) && (x >= 74 && x <= 79)) pixel_data = ORANGE;
        else if (note11[5] == 1 && (y >= 24 && y <= 28) && (x >= 74 && x <= 79)) pixel_data = ORANGE;
        else if (note11[6] == 1 && (y >= 29 && y <= 33) && (x >= 74 && x <= 79)) pixel_data = ORANGE;
        else if (note11[7] == 1 && (y >= 34 && y <= 38) && (x >= 74 && x <= 79)) pixel_data = ORANGE;
        else if (note11[8] == 1 && (y >= 39 && y <= 43) && (x >= 74 && x <= 79)) pixel_data = ORANGE;
        else if (note11[9] == 1 && (y >= 44 && y <= 47) && (x >= 74 && x <= 79)) pixel_data = ORANGE;
        else if (note11[10] == 1 && (y >= 48 && y <= 50) && (x >= 74 && x <= 79)) pixel_data = ORANGE;               
        
        // Note12
        else if (note12[0] == 1 && (y >= 0 && y <= 3) && (x >= 80 && x <= 86)) pixel_data = GREEN;
        else if (note12[1] == 1 && (y >= 4 && y <=  8) && (x >= 80 && x <= 86)) pixel_data = GREEN;
        else if (note12[2] == 1 && (y >= 9 && y <= 13) && (x >= 80 && x <= 86)) pixel_data = GREEN;
        else if (note12[3] == 1 && (y >= 14 && y <= 18) && (x >= 80 && x <= 86)) pixel_data = GREEN;
        else if (note12[4] == 1 && (y >= 19 && y <= 23) && (x >= 80 && x <= 86)) pixel_data = GREEN;
        else if (note12[5] == 1 && (y >= 24 && y <= 28) && (x >= 80 && x <= 86)) pixel_data = GREEN;
        else if (note12[6] == 1 && (y >= 29 && y <= 33) && (x >= 80 && x <= 86)) pixel_data = GREEN;
        else if (note12[7] == 1 && (y >= 34 && y <= 38) && (x >= 80 && x <= 86)) pixel_data = GREEN;
        else if (note12[8] == 1 && (y >= 39 && y <= 43) && (x >= 80 && x <= 86)) pixel_data = GREEN;
        else if (note12[9] == 1 && (y >= 44 && y <= 47) && (x >= 80 && x <= 86)) pixel_data = GREEN;
        else if (note12[10] == 1 && (y >= 48 && y <= 50) && (x >= 80 && x <= 86)) pixel_data = GREEN;
        
         
        else pixel_data = WHITE;
    end
endmodule
