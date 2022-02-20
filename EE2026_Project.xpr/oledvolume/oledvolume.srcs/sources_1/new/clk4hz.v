`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2021 07:16:18 PM
// Design Name: 
// Module Name: clk4hz
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


module clk4hz(input CLOCK, output reg SCLOCK = 0);  
    
    reg  [23:0] COUNT = 24'b0;
    //reg COUNT = 0;
    always @ (posedge CLOCK) begin  
        COUNT <= (COUNT == 24'b101111101011110000100000) ? 0 : COUNT + 1;    
        SCLOCK <= (COUNT == 24'b101111101011110000100000) ? ~SCLOCK : SCLOCK;
    end 


endmodule