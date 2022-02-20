`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2021 06:46:42 PM
// Design Name: 
// Module Name: pixel_coords
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


module pixel_coords(input [12:0]pixel_index, output [7:0]x, [6:0]y

    );
    assign x = pixel_index % 96;
    assign y = pixel_index / 96;
endmodule
