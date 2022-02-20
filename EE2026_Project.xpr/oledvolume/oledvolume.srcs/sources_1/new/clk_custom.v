`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.04.2021 03:58:39
// Design Name: 
// Module Name: clk_custom
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


module clk_custom(
    input CLOCK,
    input [32:0] COUNT_TO,
    output reg SCLOCK = 0
    );
    reg [31:0] count = 32'b0;
    always @ (posedge CLOCK) begin
        count <= (count == COUNT_TO) ? 0 : count + 1; //2499
        SCLOCK <= (count == 32'b0) ? ~SCLOCK : SCLOCK;
    end
endmodule
