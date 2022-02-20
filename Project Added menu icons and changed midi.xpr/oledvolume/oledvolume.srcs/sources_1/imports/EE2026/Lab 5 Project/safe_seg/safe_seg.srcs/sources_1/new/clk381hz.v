`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2021 10:55:07 PM
// Design Name: 
// Module Name: clk381hz
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


module clk381hz(input CLOCK, output reg SCLOCK = 0

    );
    reg [17:0] count = 18'b0;
    
    always @ (posedge CLOCK) begin
        count <= (count == 18'b100000000010100000) ? 0 : count + 1;
        SCLOCK <= (count == 18'b0) ? ~SCLOCK : SCLOCK;
     end
endmodule
