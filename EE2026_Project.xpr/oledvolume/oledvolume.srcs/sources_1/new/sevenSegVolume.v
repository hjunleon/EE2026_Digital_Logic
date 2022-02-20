`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2021 02:06:19 AM
// Design Name: 
// Module Name: sevenSegVolume
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
