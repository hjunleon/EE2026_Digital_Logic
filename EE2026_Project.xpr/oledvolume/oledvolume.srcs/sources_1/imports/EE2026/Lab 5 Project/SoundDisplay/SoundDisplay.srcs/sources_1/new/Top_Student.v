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
    input  J_MIC3_Pin3, CLK100MHZ,btnD, btnU, btnC, btnL, btnR, [15:0]sw,  // Connect from this signal to Audio_Capture.v
    output J_MIC3_Pin1,   // Connect to this signal from Audio_Capture.v
    output J_MIC3_Pin4,
    output cs, sdin, sclk, d_cn, resn, vccen, pmoden, //output from OLED Displays   
    output [15:0]led,
    output [3:0]an, [6:0]seg, output dp
    // Connect to this signal from Audio_Capture.v
    // Delete this comment and include other inputs and outputs here
    );
    assign dp = 1;
    wire clk;
    wire clk20k;
    wire slwclk;
    wire reset;
    wire frame_begin, sending_pixels, sample_pixel;    
    wire [11:0] mic_in;

    wire [15:0] out;
    wire [12:0]pixel_index;
    wire [7:0]x;
    wire [6:0]y;
    wire [15:0]ledvol;
    wire [3:0]vol;
    
    wire [3:0]an_vol;
    wire[6:0]seg_vol;
    wire [15:0]oled_vol;
    wire [15:0]oled_menu;
    wire [3:0]an_ssj;
    wire[6:0]seg_ssj;
    wire[15:0]oled_ssj;
    assign led = segcontrol == 0? out:needed_freq ;
    
    wire [2:0]mode;
    assign an = (segcontrol == 0)?an_vol:an_freq;
    assign seg = (segcontrol == 0)? seg_vol:seg_freq;
    wire [15:0] oled_data = (mode == 3'd1) ? oled_vol :
                            ((mode == 3'd2) ? oled_ssj : oled_menu);
    //wire [15:0] oled_data = oled_menu;
    wire up_menu = btnU;
    wire down_menu = (mode == 3'b0) ? btnD : 0;
    wire right_menu = (mode == 3'b0) ? btnR : 0;
    wire left_menu = (mode == 3'b0) ? btnL : 0;
    wire right_vol = (mode == 3'b1) ? btnR : 0;
    wire left_vol = (mode == 3'b1) ? btnL : 0;
         
    wire [3:0]volcontrol = {sw[4],sw[3],sw[2],sw[1]};
    
    //freq
    wire [2:0] FREQ_RANGE;
    wire [31:0] SOUNDFREQ;
    wire [15:0] LEDFREQ;
    
    wire freq_direction;
    wire [31:0]freq_off;
    wire [3:0] determined_note;
    wire [31:0]needed_freq;
    
    wire [2:0] seg_mode;
    wire segcontrol = sw[5];
    wire [3:0]an_freq;
    wire[6:0]seg_freq;
    
    wire clk180beats;
    
    // Delete this comment and write your codes and instantiations here
    clk20k clk20khz (CLK100MHZ, clk20k);
    clk_custom clk180bpm (CLK100MHZ,8333333,clk180beats); //3hz->12hz for semi quavers
    // 1 - 16 so 4 bit
    // the notes are best broken into A1 to A8
    // so A - G# has 12 combi, so 4 bit, 0 -11
    // 1 - 8, 3 bits
    // Need create a one to one mapping of A1 to A8, but for the context of this song just 16 notes
    Audio_Capture audio (CLK100MHZ, clk20k, J_MIC3_Pin3, J_MIC3_Pin1, J_MIC3_Pin4, mic_in);
    //Menu Display
    menu menudisplay (CLK100MHZ, x, y, up_menu, down_menu, left_menu, right_menu, oled_menu, mode);
    // Volume Display
    volumedisplay volume (CLK100MHZ, mic_in, sw[15], ledvol, vol, an_vol, seg_vol);
    multiplexer switch (mic_in, ledvol, sw[0], out);
    // Volume OLED Display
    oledvolume volumebar (CLK100MHZ, vol, x, y, volcontrol, left_vol, right_vol, oled_vol);
    //Supersaiyan
    supersaiyan goku_game (CLK100MHZ, x, y, vol, mode, /*an_ssj, seg_ssj,*/ oled_ssj);
    
    // Frequency
    mic_freq freq (clk20k,mic_in,LEDFREQ,SOUNDFREQ,4000,FREQ_RANGE);
    note_determiner note_deter(SOUNDFREQ,determined_note,freq_direction,freq_off,needed_freq);
    display_freq dip_freq (CLK100MHZ,SOUNDFREQ,an_freq,seg_freq, sw[6],determined_note);
    
    // Midi. Treat it like a C++ iterator that generates a note with corresponding duration
    //midi_generator kerokero(clk180beats, next_note, next_freq, next_duration);
    // check against the note
    //note_checker check_kero(clk20k,next_note,next_freq,next_duration);
    // OLED Display
    flipflop resetbutton (CLK100MHZ, btnC, reset);
    clk6p25m clkled (CLK100MHZ, clk);
    pixel_coords coordinates (pixel_index, x, y);
    Oled_Display oled (clk, reset, frame_begin, /*sending_pixels*/,
      /*sample_pixel*/, pixel_index, oled_data, cs, sdin, sclk, d_cn, resn, vccen,
      pmoden,/*teststate*/);
    
endmodule