`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/18/2021 09:50:17 AM
// Design Name: 
// Module Name: slow_blinky
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


module slow_blinky_module (input CLOCK, output reg SCLOCK = 0);  
    
    reg  [21:0] COUNT = 22'b0;
    //reg COUNT = 0;
    always @ (posedge CLOCK) begin  
        COUNT <= (COUNT == 22'b1001100010010110100000)? 0 : COUNT + 1;    
        SCLOCK <= (COUNT == 22'b1001100010010110100000) ? ~SCLOCK : SCLOCK;
    end 
    
 endmodule 


