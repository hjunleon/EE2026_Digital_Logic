`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/01/2021 04:48:38 AM
// Design Name: 
// Module Name: notegenerator
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


module note(input clk, output reg [3:0]notee

    );
    always @ (posedge clk) begin
        notee <= notee + 1;
    end
endmodule
