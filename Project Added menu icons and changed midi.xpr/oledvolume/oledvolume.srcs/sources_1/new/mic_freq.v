`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 31.03.2021 16:16:59
// Design Name: 
// Module Name: mic_freq
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

module mic_freq(input CLK, input [11:0] MIC_IN, output reg [15:0] LEDFREQ = 0,output reg [31:0]FREQ = 0,
    input [31:0] M, output reg [2:0] FREQ_RANGE = 0);
    reg [31:0] COUNTER = 0;
    reg SOUNDPERIOD = 0;
    reg [31:0] SOUNDCOUNTER = 0;
    reg SOUNDRESET = 0;
    always @ (posedge CLK) 
    begin
        COUNTER <= COUNTER +1;
        SOUNDRESET = 0;
        if(MIC_IN > 2175) begin
            SOUNDPERIOD <= 1;
        end else begin
            SOUNDPERIOD <= 0;            
        end
        if(COUNTER == M)
        begin
            COUNTER <= 0;
            FREQ = 8 * SOUNDCOUNTER;
            SOUNDRESET = 1;
            if (FREQ > 9999) FREQ = 9999;
        end
    end
    
    always @ (posedge SOUNDPERIOD, posedge SOUNDRESET)
    begin
        if (SOUNDRESET == 1)
            SOUNDCOUNTER <= 0;
        else 
            SOUNDCOUNTER <= SOUNDCOUNTER + 1;
    end
    /*
    always @ (posedge SOUNDPERIOD)
    begin
        FREQ_PERIOD = 1000000000 / COUNTER_PERIOD;
        COUNTER_PERIOD = 0;
    end
    */
endmodule