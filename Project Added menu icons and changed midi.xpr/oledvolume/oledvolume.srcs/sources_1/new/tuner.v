`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/31/2021 10:07:48 AM
// Design Name: 
// Module Name: tuner
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


module tuner(input[31:0] note_span,input direction, input[31:0] off_by,output [7:0] tuner_display_offset, output isInRange 

    );
    //direction 0 means negative, 1 is positive
    assign tuner_display_offset = (direction == 0)?43 - (off_by * 43 / note_span):43 + (off_by * 43 / note_span);
    assign isInRange = (tuner_display_offset >= 32 && tuner_display_offset <= 60)? 1 : 0;
endmodule
