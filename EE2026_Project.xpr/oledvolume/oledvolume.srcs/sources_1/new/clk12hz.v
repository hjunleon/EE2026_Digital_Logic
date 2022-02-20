`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/30/2021 04:49:45 PM
// Design Name: 
// Module Name: clk12hz
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


module clk8hz(input CLOCK, output reg SCLOCK = 0);  
    
    reg  [22:0] COUNT = 23'b0;
    //reg COUNT = 0;
    always @ (posedge CLOCK) begin  
        COUNT <= COUNT + 1;    
        SCLOCK <= (COUNT == 23'b0) ? ~SCLOCK : SCLOCK;
    end 


endmodule
