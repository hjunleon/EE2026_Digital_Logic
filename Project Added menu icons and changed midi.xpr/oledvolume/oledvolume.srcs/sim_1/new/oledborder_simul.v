`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/18/2021 10:49:07 AM
// Design Name: 
// Module Name: oledborder_simul
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


module oledborder_simul(

    );
    reg [11:0]pixel_index = 12'b0;
    reg [1:0]sw = 2'b0;
    reg clk = 0;
    wire [15:0]pixel_data;
    
    always begin
        #10 pixel_index = pixel_index + 46;
        #10 pixel_index = pixel_index + 50;
    end
    
    always begin
           #5 clk = ~clk;
    end
    
    oledborder dut (clk, pixel_index, sw, pixel_data);
endmodule
