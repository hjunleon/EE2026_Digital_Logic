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

module mic_freq(input CLK, input [11:0] MIC_IN, output reg [15:0] LEDFREQ = 0,output reg [31:0]FREQ = 440,
    input [31:0] M, output reg [2:0] FREQ_RANGE = 0);

    reg [31:0] COUNTER = 0;
    reg SOUNDPERIOD = 0;
    reg [12:0] SOUNDCOUNTER = 0;
    reg [31:0] FREQ = 0;
    reg SOUNDRESET = 0;
    

    always @ (posedge CLK) 
    begin
        COUNTER <= COUNTER +1;
        
        SOUNDRESET = 0;
        
        if(MIC_IN > 2175)
            SOUNDPERIOD <= 1;
        else
            SOUNDPERIOD <= 0;
       
        if(COUNTER == M)
        begin
            COUNTER <= 0;
            FREQ = 5 * SOUNDCOUNTER;
            //FREQ_RANGE = FREQ < 30 ? 0 : FREQ < 250 ? 1 : FREQ < 350 ? 2 : FREQ < 450 ? 3 : 4;
            SOUNDRESET = 1;
            
            if      (FREQ < 100)  LEDFREQ = 16'b0;
            else if (FREQ < 200)  LEDFREQ = 16'b1;
            else if (FREQ < 300)  LEDFREQ = 16'b11;
            else if (FREQ < 400)  LEDFREQ = 16'b111;
            else if (FREQ < 500)  LEDFREQ = 16'b1111;
            else if (FREQ < 600)  LEDFREQ = 16'b11111;
            else if (FREQ < 700)  LEDFREQ = 16'b111111;
            else if (FREQ < 800)  LEDFREQ = 16'b1111111;
            else if (FREQ < 900)  LEDFREQ = 16'b11111111;
            else if (FREQ < 1000) LEDFREQ = 16'b111111111;
            else if (FREQ < 1100) LEDFREQ = 16'b1111111111;
            else if (FREQ < 1200) LEDFREQ = 16'b11111111111;
            else if (FREQ < 1300) LEDFREQ = 16'b111111111111;
            else if (FREQ < 1400) LEDFREQ = 16'b1111111111111;
            else if (FREQ < 1500) LEDFREQ = 16'b11111111111111;
            else if (FREQ < 1600) LEDFREQ = 16'b111111111111111;
            else                  LEDFREQ = 16'b1111111111111111;
            
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

endmodule