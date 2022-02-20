`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01.04.2021 11:35:47
// Design Name: 
// Module Name: midi_generator
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


module midi_generator(
    input clkbeats,
    input triggerStart,
    output [3:0] note,
    output [31:0] freq,
    output [3:0] duration
    );
    //cuz only 1,2,4,6,8, 16 durations
   /*
    reg [343:0] music_times = (triggerStart && music_times == 0)?344'h8442222116222468441144222264444114422222222222222222221162224684411442222644441144222:music_times);
    reg [344:0] music_char = 345'h653b86b89a13a3a2568988631ba68368a88631b1b6b86866b6b86b89a13a3a2568988631ba68368a88631b;
    reg [344:0] music_level = 346'h6665655655555656556666666655566666666665555655656656556555556565566666666555666666666655;*/
    
    reg[3:0] duration_count = 0;
    reg[3:0] cur_duration = 0;
    
    
    always @ (posedge clkbeats) 
        begin
            if (duration_count == cur_duration) begin
                
            end
        end
        
    
endmodule
