`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/11/2021 11:27:58 AM
// Design Name: 
// Module Name: clk20k
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


module clk20k(input CLOCK, output reg SCLOCK = 0

    );
    reg [11:0] count = 12'b0;
    
    always @ (posedge CLOCK) begin
        count <= (count == 12'b100111000011) ? 0 : count + 1; //2499
        SCLOCK <= (count == 12'b0) ? ~SCLOCK : SCLOCK;
    end
endmodule
