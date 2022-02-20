`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.04.2021 17:37:19
// Design Name: 
// Module Name: mic_freq2
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


module mic_freq2(input CLK, input clk20k,input clk180bpm, input [11:0] MIC_IN,output reg [31:0]FREQ, output reg[31:0] COUNTER_PERIOD

    );
    
    reg [31:0] COUNTER_PERIOD = 1;
    reg SOUNDPERIOD = 0;
    reg [31:0]TOOFASTFREQ = 0;
    reg PREVPERIOD = 0;
    always @ (posedge CLK) 
        begin
            COUNTER_PERIOD <= COUNTER_PERIOD + 1;
            if(MIC_IN > 2175) begin
                SOUNDPERIOD <= 1;
            end else begin
                SOUNDPERIOD <= 0;
            end
            if (PREVPERIOD != SOUNDPERIOD) begin
                PREVPERIOD <= SOUNDPERIOD;
                
                COUNTER_PERIOD <= 1;
                SOUNDPERIOD <= 0;
            end
        end
    /*always @ (posedge clk20k)
    begin
        TOOFASTFREQ <= 100000000 / COUNTER_PERIOD;
    end*/
    always @ (posedge clk180bpm)
    begin
        if (COUNTER_PERIOD >= 10000) begin
            FREQ <= 100000000 / COUNTER_PERIOD;
        end
    end
    /*
    always @ (posedge SOUNDPERIOD)
    begin
        COUNTER_PERIOD <= 1;
        SOUNDPERIOD <= 0;
    end*/
endmodule
