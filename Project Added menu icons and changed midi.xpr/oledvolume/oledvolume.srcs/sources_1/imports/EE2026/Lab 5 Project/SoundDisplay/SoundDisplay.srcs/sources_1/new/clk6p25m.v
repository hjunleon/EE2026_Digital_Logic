`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2021 10:42:31 AM
// Design Name: 
// Module Name: clk6p25m
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


module clk6p25m(input CLOCK, output reg clk = 0

    );
    reg [2:0]count = 3'b0;
   
    
    always @ (posedge CLOCK) begin
        count <= count + 1;
        clk <= (count == 3'b0) ? ~clk : clk;
    end
endmodule
