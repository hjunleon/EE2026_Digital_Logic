`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2021 05:50:31 PM
// Design Name: 
// Module Name: volumedisplay
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


module volumedisplay(input CLOCK, input [11:0]mic_in, input sw, output [15:0]ledvol, [3:0]vol, [3:0]an, [6:0]seg

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
    parameter [6:0]L = 7'b1000111;
    parameter [6:0]M = 7'b1101010;
    parameter [6:0]H = 7'b0001001;
 
    wire [6:0]first = (sw == 1)  ? 
                            ((vol >= 4'd11) ? H : 
                            ((vol >= 4'd6) ? M : L)) : null;
    wire [6:0]second = null;
    wire [6:0]third = (sw == 0) ? 
                                ((vol <= 4'd9) ? zero : one) : null;
    wire [6:0]fourth = (sw == 0) ? 
                                ((vol == 4'd0 || vol == 4'd10) ? zero :
                                ((vol == 4'd1 || vol == 4'd11) ? one :
                                ((vol == 4'd2 || vol == 4'd12) ? two :
                                ((vol == 4'd3 || vol == 4'd13) ? three :
                                ((vol == 4'd4 || vol == 4'd14) ? four :
                                ((vol == 4'd5 || vol == 4'd15) ? five :
                                ((vol == 4'd6) ? six :
                                ((vol == 4'd7) ? seven :
                                ((vol == 4'd8) ? eight : nine))))))))) : null;
                                
    assign ledvol = (vol == 4'd0) ? 16'b1 :
                        ((vol == 4'd1) ? 16'b11 :
                        ((vol == 4'd2) ? 16'b111 :
                        ((vol == 4'd3) ? 16'b1111 :
                        ((vol == 4'd4) ? 16'b11111 :
                        ((vol == 4'd5) ? 16'b111111 :
                        ((vol == 4'd6) ? 16'b1111111 :
                        ((vol == 4'd7) ? 16'b11111111 :
                        ((vol == 4'd8) ? 16'b111111111 :
                        ((vol == 4'd9) ? 16'b1111111111 :
                        ((vol == 4'd10) ? 16'b11111111111 :
                        ((vol == 4'd11) ? 16'b111111111111 :
                        ((vol == 4'd12) ? 16'b1111111111111 :
                        ((vol == 4'd13) ? 16'b11111111111111 :
                        ((vol == 4'd14) ? 16'b111111111111111 : 16'b1111111111111111))))))))))))));
    clk381hz segmentclk (CLOCK, clk381);
    segmentdisplay (clk381, first, second, third, fourth, an, seg);
    clk8hz slowclk (CLOCK, slwclk);
    maxvolume (CLOCK, slwclk, mic_in, vol);
endmodule
