`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2021 10:38:55 AM
// Design Name: 
// Module Name: oledborder
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


module oledborder(input [7:0]x, [6:0]y, input sw, output [15:0]pixel_data

    );
    reg [1:0] width = (sw == 1) ? 2'd3 : 2'd0;
    assign pixel_data = ((x <= width) || (x >= 95 - width) || (y <= width) || (y >= 63 - width)) ? 16'HFFFF : 16'h0000;
    
    
endmodule
