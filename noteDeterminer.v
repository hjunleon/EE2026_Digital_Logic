module note_determiner(
    input [31:0] freq,
    output [3:0] note,
    output direction,
    output [31:0] freq_off,
    output [31:0] needed_freq,
    output [31:0] note_span
    );
    wire [31:0] needed_freq = 0;
    wire [31:0] freq_off = 0;
    assign needed_freq = (freq <= 113 && freq >= 100) ? 110 : 
    (freq<=120) ? 116 :(freq <=127)?123:(freq<=134)?130:(freq<=142)?138:(freq<=151)?147:
    (freq <= 160)? 155:(freq <= 169)? 165:(freq <= 179)? 175:(freq <= 190)? 185:(freq <= 199)? 196:
    (freq <= 214)? 208:(freq <= 226)? 220:(freq <= 240)? 233:(freq <= 254)? 247:(freq <= 269)? 262:
    (freq <= 285)? 277:(freq <= 302)? 294:(freq <= 320)? 311:(freq <= 340)? 330:(freq <= 360)? 350:
    (freq <= 381)? 370:(freq <= 402)? 392:(freq <= 427)? 415:(freq <= 453)? 440:(freq <= 480)? 466:
    (freq <= 508)? 494:(freq <= 538)? 523:(freq <= 570)? 554:(freq <= 604)? 587:(freq <= 640)? 622:
    (freq <= 678)? 659:(freq <= 719)? 698:(freq <= 762)? 740:(freq <= 807)? 784:(freq <= 856)? 831:
    (freq <= 906)? 880:(freq <= 960)? 932:(freq <= 1017)? 988:(freq <= 1077)? 1046:(freq <= 1142)? 1109:
    (freq <= 1210)? 1175:(freq <= 1282)? 1245:(freq <= 1358)? 1319:(freq <= 1438)? 1397:(freq <= 1524)? 1480:
    (freq <= 1614)? 1568:(freq <= 1710)? 1661:(freq <= 1812)? 1760:(freq <= 1919)? 1864:(freq <= 2034)? 1975:
    (freq <= 2155)? 2093:(freq <= 2283)? 2218:(freq <= 2419)? 2349:(freq <= 2563)? 2489:(freq <= 2715)? 2637:
    (freq <= 2877)? 2794:(freq <= 3048)? 2960:(freq <= 3229)? 3136:(freq <= 3421)? 3322:(freq <= 3625)? 3520:
    (freq <= 3840)? 3729:(freq <= 4068)? 3951:(freq <= 4310)? 4186:(freq <= 4566)? 4434:(freq <= 4838)? 4698:
    (freq <= 5126)? 4978:(freq <= 5430)? 5274:(freq <= 5754)? 5587:(freq <= 6098)? 5920:(freq <= 6459)? 6272:
    (freq <= 6843)? 6645:(freq <= 7250)? 7040:(freq <= 7680)? 7459:(freq <= 8300)? 7902:0
    ;
    // 0 means negative, 1 means positive
    assign direction = (needed_freq > freq)? 0:1;
    assign freq_off = (needed_freq > freq)? needed_freq-freq : freq-needed_freq;
    // A is 0, A# 1, B 2, C 3.... G 10, G# 11
    assign note = (needed_freq == 110 || needed_freq == 220 || needed_freq == 440 || needed_freq == 880 || needed_freq == 1760
        || needed_freq == 3520 || needed_freq == 7040
     ) ? 0 : 
    (needed_freq == 116 || needed_freq == 233 || needed_freq == 466 || needed_freq == 932 || needed_freq == 1864
             || needed_freq == 3729 || needed_freq == 7459
          ) ? 1 :
    (needed_freq == 123 || needed_freq == 247 || needed_freq == 494 || needed_freq == 988 || needed_freq == 1975 
                       || needed_freq == 3951 || needed_freq == 7902
                    ) ? 2 :
     (needed_freq == 130 || needed_freq == 262 || needed_freq == 523 || needed_freq == 1046 || needed_freq == 2093 
                                           || needed_freq == 4186
                                        ) ? 3 :
      (needed_freq == 138 || needed_freq == 277 || needed_freq == 554 || needed_freq == 1109 || needed_freq == 2218
           || needed_freq == 4434
        ) ? 4:
      (needed_freq == 147 || needed_freq == 294 || needed_freq == 587 || needed_freq == 1175 || needed_freq == 2349 
                   || needed_freq == 4698
                ) ? 5:   
       (needed_freq == 156 || needed_freq == 311 || needed_freq == 622 || needed_freq == 1245 || needed_freq == 2489 
           || needed_freq == 4978
        ) ? 6:          
       (needed_freq == 165 || needed_freq == 330 || needed_freq == 659 || needed_freq == 1319 || needed_freq == 2637
           || needed_freq == 5274
        ) ? 7:
        (needed_freq == 175 || needed_freq == 349 || needed_freq == 698 || needed_freq == 1397 || needed_freq == 2794
           || needed_freq == 5587
        ) ? 8:  
        (needed_freq == 185 || needed_freq == 370 || needed_freq == 740 || needed_freq == 1480 || needed_freq == 2960
           || needed_freq == 5920
        ) ? 9:     
        (needed_freq == 196 || needed_freq == 392 || needed_freq == 784 || needed_freq == 1568 || needed_freq == 3136
           || needed_freq == 6272
        ) ? 10:(needed_freq==0)?15:11;     
        /*(needed_freq == 208 || needed_freq == 415 || needed_freq == 831 || needed_freq == 1661 || needed_freq == 3322
           || needed_freq == 6645
        ) ? 11: 12;  */                                  
    assign note_span = (freq <= 113 && freq >= 100) ? 3 : 
        (freq<=120) ? 4 :(freq <=127)?4:(freq<=134)?4:(freq<=142)?4:(freq<=151)?4:
        (freq <= 160)? 4:(freq <= 169)? 4:(freq <= 179)? 4:(freq <= 190)? 5:(freq <= 199)? 4:
        (freq <= 214)? 6:(freq <= 226)? 6:(freq <= 240)? 7:(freq <= 254)? 7:(freq <= 269)? 7:
        (freq <= 285)? 8:(freq <= 302)? 8:(freq <= 320)? 9:(freq <= 340)? 10:(freq <= 360)? 10:
        (freq <= 381)? 11:(freq <= 402)? 10:(freq <= 427)? 12:(freq <= 453)? 13:(freq <= 480)? 14:
        (freq <= 508)? 14:(freq <= 538)? 15:(freq <= 570)? 16:(freq <= 604)? 17:(freq <= 640)? 18:
        (freq <= 678)? 18:(freq <= 719)? 21:(freq <= 762)? 22:(freq <= 807)? 23:(freq <= 856)? 25:
        (freq <= 906)? 26:(freq <= 960)? 28:(freq <= 1017)? 29:(freq <= 1077)? 31:(freq <= 1142)? 33:
        (freq <= 1210)? 35:(freq <= 1282)? 37:(freq <= 1358)? 39:(freq <= 1438)? 41:(freq <= 1524)? 44:
        (freq <= 1614)? 46:(freq <= 1710)? 49:(freq <= 1812)? 52:(freq <= 1919)? 55:(freq <= 2034)? 59:
        (freq <= 2155)? 62:(freq <= 2283)? 65:(freq <= 2419)? 70:(freq <= 2563)? 74:(freq <= 2715)? 78:
        (freq <= 2877)? 83:(freq <= 3048)? 88:(freq <= 3229)? 93:(freq <= 3421)? 99:(freq <= 3625)? 105:
        (freq <= 3840)? 111:(freq <= 4068)? 117:(freq <= 4310)? 124:(freq <= 4566)? 132:(freq <= 4838)? 140:
        (freq <= 5126)? 148:(freq <= 5430)? 156:(freq <= 5754)? 167:(freq <= 6098)? 178:(freq <= 6459)? 187:
        (freq <= 6843)? 198:(freq <= 7250)? 210:(freq <= 7680)? 221:(freq <= 8300)? 398:0
        ;
endmodule