`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2021 12:09:01 AM
// Design Name: 
// Module Name: supersaiyan
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


module supersaiyan(input clk, input [7:0]x, [6:0]y, [3:0]vol, [2:0] mode, output /*[3:0]an, [6:0]seg,*/ [15:0]pixel_data

    );
    reg [6:0]progress = 7'd0;
    reg [1:0]frame = 2'd0;
    wire [2:0]n = (vol >= 4'd12) ? 3'd3 : 
                  ((vol >= 4'd8) ? 3'd2 : 
                  ((vol >= 4'd4) ? 3'd1 : 3'd0));
    wire clkframes;
    clk4hz frames (clk, clkframes);
    
    always @ (posedge clkframes) begin 
        progress <= (mode == 3'd2) ? ((progress == 7'd100) ? progress : progress + n) : 0;
        frame <= frame + 1;
    end
    goku_display goku (x, y, frame, progress, pixel_data);
endmodule
