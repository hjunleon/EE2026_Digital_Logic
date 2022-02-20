`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2021 17:29:14
// Design Name: 
// Module Name: display_freq
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


module display_freq( input CLOCK, input [31:0]SOUNDFREQ, output [3:0]an, output [6:0]seg, input toggleNote, input [3:0] note
    );
    wire clk381;
    wire slwclk;
    parameter [6:0]null = 7'b1111111;
    parameter [6:0]zero = 7'b1000000;
    parameter [6:0]one = 7'b1111001;
    parameter [6:0]two = 7'b0100100;
    parameter [6:0]three = 7'b0110000;
    parameter [6:0]four = 7'b0011001;
    parameter [6:0]five = 7'b0010010;
    parameter [6:0]six = 7'b0000010;
    parameter [6:0]seven = 7'b1111000;
    parameter [6:0]eight = 7'b0000000;
    parameter [6:0]nine = 7'b0010000;
    parameter [6:0]a = 7'b0001000;
    parameter [6:0]b = 7'b0000011;
    parameter [6:0]c = 7'b1000110;
    parameter [6:0]d = 7'b0100001;
    parameter [6:0]e = 7'b0000110;
    parameter [6:0]f = 7'b0001110;
    parameter [6:0]g = 7'b0010000;
    
    //reg [6:0]first; 
    //reg [15:0] curFreq;
    //assign curFreq = SOUNDFREQ;
    wire[3:0]firstdigit = (SOUNDFREQ / 1000) % 10;
    wire[3:0]seconddigit = (SOUNDFREQ/100) % 10;
    wire[3:0]thirddigit = (SOUNDFREQ/10) % 10;
    wire[3:0]fourthdigit = SOUNDFREQ % 10;
    /*always @ (posedge CLOCK)
    begin
        curFreq = SOUNDFREQ;
        if (curFreq >= 9000) begin
            first <= nine;
            curFreq = curFreq - 9000;
        end else if (curFreq >= 8000) begin
            first <= eight;
            curFreq = curFreq - 8000;
        end else if (curFreq >= 7000) begin
            first <= seven;
            curFreq = curFreq - 7000;
        end else if (curFreq >= 6000) begin
            first <= six;
            curFreq = curFreq - 6000;
        end else if (curFreq >= 5000) begin
           first <= five;
           curFreq = curFreq - 5000;
        end else if (curFreq >= 4000) begin
             first <= four;
             curFreq = curFreq - 4000;
        end else if (curFreq >= 3000) begin
             first <= three;
             curFreq = curFreq - 3000;
        end else if (curFreq >= 2000) begin
             first <= two;
             curFreq = curFreq - 2000;
        end  else if (curFreq >= 1000) begin
             first <= one;
             curFreq = curFreq - 1000;
        end else begin
             first <= zero;
        end
    end
    */
    //wire [6:0]first = nine;
    wire [6:0]first = (toggleNote)?null:(firstdigit == 9)? nine:(firstdigit == 8)? eight:(firstdigit == 7)? seven:(firstdigit == 6)? six:(firstdigit == 5)? five:(firstdigit == 4)? four:(firstdigit == 3)? three:(firstdigit == 2)? two:(firstdigit == 1)? one : zero; 
    wire [6:0]second = (toggleNote)?null:(seconddigit == 9)? nine:(seconddigit == 8)? eight:(seconddigit == 7)? seven:(seconddigit == 6)? six:(seconddigit == 5)? five:(seconddigit == 4)? four:(seconddigit == 3)? three:(seconddigit == 2)? two:(seconddigit == 1)? one : zero; 
    wire [6:0]third = (toggleNote)?((note == 1 || note == 4 || note == 6 || note == 9 || note == 11)?eight:null)
    :(thirddigit == 9)? nine:(thirddigit == 8)? eight:(thirddigit == 7)? seven:(thirddigit == 6)? six:(thirddigit == 5)? five:(thirddigit == 4)? four:(thirddigit == 3)? three:(thirddigit == 2)? two:(thirddigit == 1)? one : zero; 
    wire [6:0]fourth = (toggleNote)?((note == 0 || note == 1)?a:(note == 2)?b:(note == 3 || note == 4)?c:(note == 5 || note == 6)?d:
    (note == 7)?e:(note == 8 || note == 9)?f:(note == 10 || note == 11)?g:null // should set unknowns to null
    ):
    (fourthdigit == 9)? nine:(fourthdigit == 8)? eight:(fourthdigit == 7)? seven:(fourthdigit == 6)? six:(fourthdigit == 5)? five:(fourthdigit == 4)? four:(fourthdigit == 3)? three:(fourthdigit == 2)? two:(fourthdigit == 1)? one : zero; 
    
    //assign leds = SOUNDFREQ;
    clk381hz segmentclk (CLOCK, clk381);
    segmentdisplay (clk381, first, second, third, fourth, an, seg);
    clk8hz slowclk (CLOCK, slwclk);
endmodule
