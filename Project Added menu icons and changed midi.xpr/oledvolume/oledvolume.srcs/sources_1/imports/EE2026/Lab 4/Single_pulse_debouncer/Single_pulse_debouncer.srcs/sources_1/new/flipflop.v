`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/04/2021 09:30:01 AM
// Design Name: 
// Module Name: flipflop
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


module flipflop (input CLOCK, D, output Q

    );
    wire Q1;
    wire Q2;
    wire SCLOCK;
    assign Q = Q1 & ~Q2;
    slow_blinky_module sclock(CLOCK, SCLOCK);
    dflipflop dff1 (SCLOCK, D, Q1);
    dflipflop dff2 (SCLOCK, Q1, Q2);
    
endmodule
