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
    //wire clk10k;
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
    wire [15:0]oled_midi;
    wire [15:0] oled_tuner;
    assign led = out;//segcontrol == 0? out;
    
    wire [2:0]mode;
    assign an = (segcontrol == 0)?an_vol:an_freq;
    assign seg = (segcontrol == 0)? seg_vol:seg_freq;
    wire [15:0] oled_data = (mode == 3'd1) ? oled_vol :
                            ((mode == 3'd2) ? oled_ssj :
                            ((mode == 3'd3) ? oled_tuner : 
                            ((mode == 3'd4) ? oled_midi : oled_menu)));
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
    
    //tuner
    wire [7:0] tuner_offset;
    wire [31:0] note_span;
    wire isInRange;
    wire [2:0] seg_mode;
    wire segcontrol = sw[5];
    wire [3:0]an_freq;
    wire[6:0]seg_freq;
    
    wire clk180beats;
    
    clk20k clk20khz (CLK100MHZ, clk20k);
    clk_custom clk180bpm (CLK100MHZ,3666666,clk180beats); //3hz->12hz for semi quavers, but i just change to 15hz
    Audio_Capture audio (CLK100MHZ, clk20k, J_MIC3_Pin3, J_MIC3_Pin1, J_MIC3_Pin4, mic_in);
    //Menu Display
    menu menudisplay (CLK100MHZ, x, y, up_menu, down_menu, left_menu, right_menu, oled_menu, mode);
    // Volume Display
    volumedisplay volume (CLK100MHZ, mic_in, sw[15], ledvol, vol, an_vol, seg_vol);
    multiplexer switch (mic_in, ledvol, sw[0], out);
    // Volume OLED Display
    oledvolume volumebar (CLK100MHZ, vol, x, y, volcontrol, left_vol, right_vol, oled_vol);
    //Supersaiyan
    supersaiyan goku_game (CLK100MHZ, x, y, vol, mode, oled_ssj);
    //Midi
    midi_display midi (clk180beats, determined_note, x, y, oled_midi);
    
    // Frequency
    mic_freq freq (clk20k,mic_in,LEDFREQ,SOUNDFREQ,2500,FREQ_RANGE);
    //mic_freq2 freq2 (CLK100MHZ,clk20k,clk180beats,mic_in, SOUNDFREQ2, COUNTER_PERIOD);
    note_determiner note_deter(SOUNDFREQ,determined_note,freq_direction,freq_off,needed_freq, note_span);
    display_freq dip_freq (CLK100MHZ,SOUNDFREQ,an_freq,seg_freq, sw[6],determined_note);
    
    //TUNER
    tuner tuner(note_span,freq_direction,freq_off,tuner_offset, isInRange);
    tuner_display tunerDisplay(CLK100MHZ,x,y,determined_note,tuner_offset, isInRange,oled_tuner);
    // OLED Display
    flipflop resetbutton (CLK100MHZ, btnC, reset);
    clk6p25m clkled (CLK100MHZ, clk);
    pixel_coords coordinates (pixel_index, x, y);
    Oled_Display oled (clk, reset, frame_begin, /*sending_pixels*/,
      /*sample_pixel*/, pixel_index, oled_data, cs, sdin, sclk, d_cn, resn, vccen,
      pmoden,/*teststate*/);
    
endmodule