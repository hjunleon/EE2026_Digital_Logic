`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
//
//  FILL IN THE FOLLOWING INFORMATION:
//
//  LAB SESSION DAY (Delete where applicable): MONDAY P.M, TUESDAY P.M, WEDNESDAY P.M, THURSDAY A.M., THURSDAY P.M
//
//  STUDENT A NAME: 
//  STUDENT A MATRICULATION NUMBER: 
//
//  STUDENT B NAME: 
//  STUDENT B MATRICULATION NUMBER: 
//
//////////////////////////////////////////////////////////////////////////////////


module Top_Student (
    input  J_MIC3_Pin3, CLK100MHZ, btnC, sw,  // Connect from this signal to Audio_Capture.v
    output J_MIC3_Pin1,   // Connect to this signal from Audio_Capture.v
    output J_MIC3_Pin4,
    //output cs, sdin, sclk, d_cn, resn, vccen, pmoden, //output from OLED Displays   
    output [15:0]led,
    output [1:0] an,
    output [6:0] seg,
    output dp
    // Connect to this signal from Audio_Capture.v
    // Delete this comment and include other inputs and outputs here
    );
    assign dp = 0;
    wire clk;
    wire clk20k;
    wire reset;
    wire frame_begin, sending_pixels, sample_pixel;
    //reg [15:0] oled_data = 16'h07E0;
    wire [11:0] mic_in;
    wire [11:0] out;
    assign led = out;
    // Delete this comment and write your codes and instantiations here
    wire [15:0] volume_level; //https://electronics.stackexchange.com/questions/385955/variable-should-not-be-used-in-output-port-connection
    volumeLeveller vl (mic_in,CLK100MHZ,volume_level);
   
    
    clk6p25m clkled (CLK100MHZ, clk);
    single_pulse resetbutton (CLK100MHZ, btnC, reset);
    clk20k clk20khz (CLK100MHZ, clk20k);
    Audio_Capture audio (CLK100MHZ, clk20k, J_MIC3_Pin3, J_MIC3_Pin1, J_MIC3_Pin4, mic_in);
    alternate_view av(volume_level,sw,CLOCK,an,seg,led);
    
    //multiplexer switch (volume_level, 0, sw, out);
   /* Oled_Display oled (clk, reset, frame_begin, sending_pixels,, oled_data, cs, sdin, sclk, d_cn, resn, vccen,
      pmoden);*/
endmodule

module alternate_view(input [15:0] number,input sw, input CLOCK, output[1:0]an, output[6:0]seg, output [15:0] led);
    sevenSegVolume ssv(number, CLOCK, an, seg);
    assign led = number;
endmodule
module sevenSegVolume(input[15:0] number, input CLOCK, output[1:0]an, output[6:0]seg);
    reg[15:0] COUNT_SET = 16'b1111111111111111;
    reg[15:0] COUNT_NOW = 0;
    reg[1:0] currentAN = 3;
    reg [6:0] currentSeg = 7'b1111111;
    reg  isSecondDigit = 1;
    always @ (posedge CLOCK) begin  
        COUNT_NOW <= COUNT_NOW + 1;
        if (COUNT_NOW == COUNT_SET) begin
            if (number == 0) begin
                currentAN <= 2'b10;
                currentSeg <= 7'b0111111;
            end else if (number == 1) begin
                currentAN <= 2'b10;
                currentSeg <= 7'b1111001;
            end else if (number == 2'b11) begin
                currentAN <= 2'b10;
                currentSeg <= 7'b0100100;
            end  else if (number == 3'b111) begin
               currentAN <= 2'b10;
               currentSeg <= 7'b0110000;
            end  else if (number == 4'b1111) begin
                 currentAN <= 2'b10;
                 currentSeg <= 7'b0011001;
            end else if (number == 5'b11111) begin
                  currentAN <= 2'b10;
                  currentSeg <= 7'b0010010;
             end else if (number == 6'b111111) begin
                    currentAN <= 2'b10;
                    currentSeg <= 7'b0000010;
               end else if (number == 7'b1111111) begin
                    currentAN <= 2'b10;
                    currentSeg <= 7'b0111000;
               end else if (number == 8'b11111111) begin
                    currentAN <= 2'b10;
                    currentSeg <= 7'b0000000;
               end else if (number == 9'b111111111) begin
                    currentAN <= 2'b10;
                    currentSeg <= 7'b0011000;
               end else if (number == 10'b1111111111) begin
                    if (isSecondDigit) begin
                        currentAN <= 2'b10;
                        currentSeg <= 7'b0011000;
                    end else begin
                        currentAN <= 2'b01;
                        currentSeg <= 7'b1111001;
                    end
                    isSecondDigit <= ~isSecondDigit;
               end else if (number == 11'b11111111111) begin
                   if (isSecondDigit) begin
                       currentAN <= 2'b10;
                       currentSeg <= 7'b1111001;
                   end else begin
                       currentAN <= 2'b01;
                       currentSeg <= 7'b1111001;
                   end
                   isSecondDigit <= ~isSecondDigit;
              end else if (number == 12'b111111111111) begin
                     if (isSecondDigit) begin
                         currentAN <= 2'b10;
                         currentSeg <= 7'b0100100;
                     end else begin
                         currentAN <= 2'b01;
                         currentSeg <= 7'b1111001;
                     end
                     isSecondDigit <= ~isSecondDigit;
                end else if (number == 13'b1111111111111) begin
                      if (isSecondDigit) begin
                          currentAN <= 2'b10;
                          currentSeg <= 7'b0110000;
                      end else begin
                          currentAN <= 2'b01;
                          currentSeg <= 7'b1111001;
                      end
                      isSecondDigit <= ~isSecondDigit;
                 end  else if (number == 14'b1111111111111) begin
                       if (isSecondDigit) begin
                           currentAN <= 2'b10;
                           currentSeg <= 7'b0011001;
                       end else begin
                           currentAN <= 2'b01;
                           currentSeg <= 7'b1111001;
                       end
                       isSecondDigit <= ~isSecondDigit;
                  end else if (number == 15'b11111111111111) begin
                         if (isSecondDigit) begin
                             currentAN <= 2'b10;
                             currentSeg <= 7'b0010010;
                         end else begin
                             currentAN <= 2'b01;
                             currentSeg <= 7'b1111001;
                         end
                         isSecondDigit <= ~isSecondDigit;
                    end
                    COUNT_NOW <= 0;
        end
    end

    
      assign an = currentAN;
      assign seg = currentSeg;

endmodule

module volumeLeveller(input [11:0] mic_in, input CLOCK, output reg[15:0] level);
      //assign reg[11:0] mic_in2 = mic_in;
      reg[24:0] VOLUME_SET = 25'b100110001001011010000000;
      reg[24:0] VOLUME_COUNT = 0;
      always @ (posedge CLOCK) begin  
        VOLUME_COUNT <= VOLUME_COUNT + 1;
        if (VOLUME_COUNT == VOLUME_SET) begin
                if (mic_in < 12'b000011110000) begin
                    level <= 0;
                end else if (mic_in < 12'b000111100000) begin
                    level <= 1;
                end else if (mic_in < 12'b001011010000) begin
                    level <= 2'b11;
                end else if (mic_in < 12'b001111000000) begin 
                    level <= 3'b111;
                end else if (mic_in < 12'b010010110000) begin 
                    level <= 4'b1111; 
                end else if (mic_in < 12'b010110100000) begin 
                    level <= 5'b11111; 
                end else if (mic_in < 12'b011010010000) begin 
                    level <= 6'b111111; 
                end else if (mic_in < 12'b011110000000) begin 
                    level <= 7'b1111111; 
                end else if (mic_in < 12'b100001110000) begin 
                    level <= 8'b11111111; 
                end else if (mic_in < 12'b100101100000) begin 
                    level <= 9'b111111111; 
                end else if (mic_in < 12'b101001010000) begin 
                    level <= 10'b1111111111; 
                end else if (mic_in < 12'b101101000000) begin 
                    level <= 11'b11111111111;
                end else if (mic_in < 12'b110000110000) begin 
                    level <= 12'b111111111111;
                end else if (mic_in < 12'b110100100000) begin 
                    level <= 13'b1111111111111; 
                end else if (mic_in < 12'b111100000000) begin 
                    level <= 14'b11111111111111; 
                end else if (mic_in < 12'b111111110000) begin 
                    level <= 15'b111111111111111; 
                end else begin
                    level <= 16'b1111111111111111; 
                end
             VOLUME_COUNT <= 0;
        end
      end
endmodule

module multiplexer(input [15:0] first, second, sw, output [11:0] out

    );
    assign out = (sw == 1) ? first : second;
endmodule



module single_pulse(input CLOCK, D, output Q

    );
    wire SCLOCK;
    
    slow_blinky_module slow_clk (CLOCK, SCLOCK);
    flipflop single_pulse_debouncer (SCLOCK, D, Q);
    
endmodule


module flipflop (input CLOCK, D, output Q

    );
    wire Q1;
    wire Q2;
    wire SCLOCK;
    assign Q = Q1 & ~Q2;
    slow_blinky_module(CLOCK, SCLOCK);
    dflipflop dff1 (SCLOCK, D, Q1);
    dflipflop dff2 (SCLOCK, Q1, Q2);
    
endmodule




module slow_blinky_module (input CLOCK, output reg SCLOCK = 0);  
    
    reg  [21:0] COUNT = 22'b0;
    //reg COUNT = 0;
    always @ (posedge CLOCK) begin  
        COUNT <= (COUNT == 22'b1001100010010110100000)? 0 : COUNT + 1;    
        SCLOCK <= (COUNT == 22'b1001100010010110100000) ? ~SCLOCK : SCLOCK;
    end 
    
 endmodule 

module dflipflop(
    input DFF_CLOCK,
    D,
    output reg Q =0
    );
    always @ (posedge DFF_CLOCK) begin
        Q <= D;
    end 
endmodule


module clk20k(input CLOCK, output reg SCLOCK = 0

    );
    reg [11:0] count = 12'b0;
    
    always @ (posedge CLOCK) begin
        count <= (count == 12'b100111000011) ? 0 : count + 1; //2499
        SCLOCK <= (count == 12'b0) ? ~SCLOCK : SCLOCK;
    end
endmodule




module clk6p25m(input CLOCK, output reg clk = 0

    );
    reg [2:0]count = 3'b0;
   
    
    always @ (posedge CLOCK) begin
        count <= count + 1;
        clk <= (count == 3'b0) ? ~clk : clk;
    end
endmodule