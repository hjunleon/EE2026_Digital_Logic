`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2021 10:35:54 AM
// Design Name: 
// Module Name: maxvolume
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


module maxvolume(input clk, sclk, [11:0]mic_in, output reg [3:0]vol = 4'd0

    );
    reg [11:0] max_in = 12'b0;
    reg  [22:0] COUNT = 23'b0;
    
    always @ (posedge clk) begin
        if (max_in < mic_in) max_in <= mic_in;
        COUNT <= COUNT + 1;
        if (COUNT == 22'b0) max_in <= mic_in;
    end
    
    /*always @ (posedge sclk) begin
            if (max_in >= 12'b111111110000) vol = 4'd15;
            else if (max_in >= 12'b111100000000) vol = 4'd14;
            else if (max_in >= 12'b110100100000) vol = 4'd13;
            else if (max_in >= 12'b110000110000) vol = 4'd12;
            else if (max_in >= 12'b101101000000) vol = 4'd11;
            else if (max_in >= 12'b101001010000) vol = 4'd10;
            else if (max_in >= 12'b100101100000) vol = 4'd9;
            else if (max_in >= 12'b100001110000) vol = 4'd8;
            else if (max_in >= 12'b011110000000) vol = 4'd7;
            else if (max_in >= 12'b011010010000) vol = 4'd6;
            else if (max_in >= 12'b010110100000) vol = 4'd5;
            else if (max_in >= 12'b010010110000) vol = 4'd4;
            else if (max_in >= 12'b001111000000) vol = 4'd3;
            else if (max_in >= 12'b001011010000) vol = 4'd2;
            else if (max_in >= 12'b000111100000) vol = 4'd1;
            else vol = 4'd0;
        end*/
        
    //Adjusted volume levels
    always @ (posedge sclk) begin
        if (max_in >= 12'd3936) vol <= 4'd15;
        else if (max_in >= 12'd3792) vol <= 4'd14;
        else if (max_in >= 12'd3648) vol <= 4'd13;
        else if (max_in >= 12'd3504) vol <= 4'd12;
        else if (max_in >= 12'd3360) vol <= 4'd11;
        else if (max_in >= 12'd3216) vol <= 4'd10;
        else if (max_in >= 12'd3072) vol <= 4'd9;
        else if (max_in >= 12'd2928) vol <= 4'd8;
        else if (max_in >= 12'd2784) vol <= 4'd7;
        else if (max_in >= 12'd2640) vol <= 4'd6;
        else if (max_in >= 12'd2496) vol <= 4'd5;
        else if (max_in >= 12'd2352) vol <= 4'd4;
        else if (max_in >= 12'd2208) vol <= 4'd3;
        else if (max_in >= 12'd2064) vol <= 4'd2;
        else if (max_in >= 12'd1920) vol <= 4'd1;
        else vol = 4'd0;
    end
        
endmodule
