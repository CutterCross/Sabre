_default_Intermission_header:
	.db 7
	.db 150
	.db 2
	.dw _default_Intermission_pulse1
	.dw _default_Intermission_pulse2
	.dw _default_Intermission_triangle
	.dw _default_Intermission_noise
	.dw _default_Intermission_DMC

_default_Intermission_pulse1:
	.dw _default_Intermission_pulse1_pattern0
	.dw _default_Intermission_pulse1_pattern0
_default_Intermission_pulse1_pattern0:
	.db NL2,INST|CONT|3,AS2,INST|CONT|2,D2,DS2,AS2,INST|CONT|3,AS2,INST|CONT|2
	.db DS2,F2,AS2,INST|CONT|3,AS2,INST|CONT|2,D2,F2,AS2,INST|CONT|3
	.db AS2,INST|CONT|2,DS2,F2,AS2,D00

_default_Intermission_pulse2:
	.dw _default_Intermission_pulse2_pattern0
	.dw _default_Intermission_pulse2_pattern0
_default_Intermission_pulse2_pattern0:
	.db NL1,NUL,NL2,INST|CONT|4,AS2,AS2,D2,DS2,AS2,AS2
	.db DS2,F2,AS2,AS2,D2,F2,AS2,AS2,DS2,NL1
	.db F2,D00

_default_Intermission_triangle:
	.dw _default_Intermission_triangle_pattern0
	.dw _default_Intermission_triangle_pattern1
_default_Intermission_triangle_pattern0:
	.db NL6,INST|CONT|5,D2,NL10,DS2,NL6,F2,DS2,NL2,A2
	.db AS2,D00
_default_Intermission_triangle_pattern1:
	.db NL6,INST|CONT|5,D2,NL2,DS2,G1,NL4,AS1,NL2,DS2
	.db D2,G1,AS1,NL4,C2,NL2,F1,NL4,AS1,D00

_default_Intermission_noise:
	.dw _default_Intermission_noise_pattern0
	.dw _default_Intermission_noise_pattern0
_default_Intermission_noise_pattern0:
	.db NL4,INST|CONT|7,$F,NL2,INST|6,NL4,$D,NL2,$F,$D
	.db $F,NL4,INST|7,NL2,INST|6,NL4,$D,NL2,$F,$D
	.db $F,D00

_default_Intermission_DMC:
	.dw _default_Intermission_DMC_pattern0
	.dw _default_Intermission_DMC_pattern0
_default_Intermission_DMC_pattern0:
	.db NL6,DS4,NL8,E7,NL2,E4,NL6,DS4,E7,NL2
	.db DS4,A7,D00

_default_Triangle_Echo_test_header:
	.db 6
	.db 150
	.db 16
	.dw _default_Triangle_Echo_test_pulse1
	.dw NULL_pulse2
	.dw _default_Triangle_Echo_test_triangle
	.dw NULL_noise
	.dw _default_Triangle_Echo_test_DMC

_default_Triangle_Echo_test_pulse1:
	.dw _default_Triangle_Echo_test_pulse1_pattern0
	.dw _default_Triangle_Echo_test_pulse1_pattern0
	.dw _default_Triangle_Echo_test_pulse1_pattern0
	.dw _default_Triangle_Echo_test_pulse1_pattern0
	.dw _default_Triangle_Echo_test_pulse1_pattern1
	.dw _default_Triangle_Echo_test_pulse1_pattern2
	.dw _default_Triangle_Echo_test_pulse1_pattern3
	.dw _default_Triangle_Echo_test_pulse1_pattern4
	.dw _default_Triangle_Echo_test_pulse1_pattern5
	.dw _default_Triangle_Echo_test_pulse1_pattern4
	.dw _default_Triangle_Echo_test_pulse1_pattern3
	.dw _default_Triangle_Echo_test_pulse1_pattern2
	.dw _default_Triangle_Echo_test_pulse1_pattern1
	.dw _default_Triangle_Echo_test_pulse1_pattern0
	.dw _default_Triangle_Echo_test_pulse1_pattern6
	.dw _default_Triangle_Echo_test_pulse1_pattern7
_default_Triangle_Echo_test_pulse1_pattern0:
	.db NL64,FXX,$06,NUL,D00
_default_Triangle_Echo_test_pulse1_pattern1:
	.db NL64,FXX,$05,NUL,D00
_default_Triangle_Echo_test_pulse1_pattern2:
	.db NL64,FXX,$04,NUL,D00
_default_Triangle_Echo_test_pulse1_pattern3:
	.db NL64,FXX,$03,NUL,D00
_default_Triangle_Echo_test_pulse1_pattern4:
	.db NL64,FXX,$02,NUL,D00
_default_Triangle_Echo_test_pulse1_pattern5:
	.db NL64,FXX,$01,NUL,D00
_default_Triangle_Echo_test_pulse1_pattern6:
	.db NL16,FXX,$07,NUL,FXX,$08,NUL,FXX,$09,NUL,FXX,$0A,NUL,D00
_default_Triangle_Echo_test_pulse1_pattern7:
	.db NL8,FXX,$0B,NUL,FXX,$0C,NUL,FXX,$0D,NUL,FXX,$0E,NUL,NL4
	.db FXX,$0F,NUL,FXX,$10,NUL,FXX,$11,NUL,FXX,$12,NUL,NL2,FXX,$13
	.db NUL,FXX,$14,NUL,FXX,$15,NUL,FXX,$16,NUL,FXX,$17,NUL,FXX,$18
	.db NUL,FXX,$19,NUL,FXX,$1A,NUL,D00

_default_Triangle_Echo_test_triangle:
	.dw _default_Triangle_Echo_test_triangle_pattern1
	.dw _default_Triangle_Echo_test_triangle_pattern1
	.dw _default_Triangle_Echo_test_triangle_pattern2
	.dw _default_Triangle_Echo_test_triangle_pattern0
	.dw _default_Triangle_Echo_test_triangle_pattern0
	.dw _default_Triangle_Echo_test_triangle_pattern0
	.dw _default_Triangle_Echo_test_triangle_pattern0
	.dw _default_Triangle_Echo_test_triangle_pattern0
	.dw _default_Triangle_Echo_test_triangle_pattern0
	.dw _default_Triangle_Echo_test_triangle_pattern0
	.dw _default_Triangle_Echo_test_triangle_pattern0
	.dw _default_Triangle_Echo_test_triangle_pattern0
	.dw _default_Triangle_Echo_test_triangle_pattern0
	.dw _default_Triangle_Echo_test_triangle_pattern0
	.dw _default_Triangle_Echo_test_triangle_pattern0
	.dw _default_Triangle_Echo_test_triangle_pattern0
_default_Triangle_Echo_test_triangle_pattern0:
	.db NL1,INST|CONT|5,AS3,INST|CONT|2,E4,INST|CONT|5,DS4,INST|CONT|2,AS3,INST|CONT|5
	.db AS4,INST|CONT|2,DS4,INST|CONT|5,FS4,INST|CONT|2,AS4,INST|CONT|5,AS3,INST|CONT|2
	.db FS4,INST|CONT|5,DS4,INST|CONT|2,AS3,INST|CONT|5,AS4,INST|CONT|2,DS4,INST|CONT|5
	.db FS4,INST|CONT|2,AS4,INST|CONT|5,AS3,INST|CONT|2,FS4,INST|CONT|5,DS4,INST|CONT|2
	.db AS3,INST|CONT|5,AS4,INST|CONT|2,DS4,INST|CONT|5,FS4,INST|CONT|2,AS4,INST|CONT|5
	.db AS3,INST|CONT|2,FS4,INST|CONT|5,DS4,INST|CONT|2,AS3,INST|CONT|5,AS4,INST|CONT|2
	.db DS4,INST|CONT|5,FS4,INST|CONT|2,AS4,INST|CONT|5,AS3,INST|CONT|2,FS4,INST|CONT|5
	.db CS4,INST|CONT|2,AS3,INST|CONT|5,GS4,INST|CONT|2,CS4,INST|CONT|5,E4,INST|CONT|2
	.db GS4,INST|CONT|5,AS3,INST|CONT|2,E4,INST|CONT|5,CS4,INST|CONT|2,AS3,INST|CONT|5
	.db GS4,INST|CONT|2,CS4,INST|CONT|5,E4,INST|CONT|2,GS4,INST|CONT|5,AS3,INST|CONT|2
	.db E4,INST|CONT|5,CS4,INST|CONT|2,AS3,INST|CONT|5,GS4,INST|CONT|2,CS4,INST|CONT|5
	.db E4,INST|CONT|2,GS4,INST|CONT|5,AS3,INST|CONT|2,E4,INST|CONT|5,CS4,INST|CONT|2
	.db AS3,INST|CONT|5,GS4,INST|CONT|2,CS4,INST|CONT|5,E4,INST|CONT|2,GS4,D00
_default_Triangle_Echo_test_triangle_pattern1:
	.db NL2,INST|CONT|2,AS3,DS4,AS4,FS4,AS3,DS4,AS4,FS4
	.db AS3,DS4,AS4,FS4,AS3,DS4,AS4,FS4,AS3,CS4
	.db GS4,E4,AS3,CS4,GS4,E4,AS3,CS4,GS4,E4
	.db AS3,CS4,GS4,E4,D00
_default_Triangle_Echo_test_triangle_pattern2:
	.db NL1,INST|CONT|2,AS3,E4,DS4,AS3,AS4,DS4,FS4,AS4
	.db AS3,FS4,DS4,AS3,AS4,DS4,FS4,AS4,AS3,FS4
	.db DS4,AS3,AS4,DS4,FS4,AS4,AS3,FS4,DS4,AS3
	.db AS4,DS4,FS4,AS4,AS3,FS4,CS4,AS3,GS4,CS4
	.db E4,GS4,AS3,E4,CS4,AS3,GS4,CS4,E4,GS4
	.db AS3,E4,CS4,AS3,GS4,CS4,E4,GS4,AS3,E4
	.db CS4,AS3,GS4,CS4,E4,GS4,D00

_default_Triangle_Echo_test_DMC:
	.dw _default_Triangle_Echo_test_DMC_pattern0
	.dw _default_Triangle_Echo_test_DMC_pattern1
	.dw _default_Triangle_Echo_test_DMC_pattern0
	.dw _default_Triangle_Echo_test_DMC_pattern0
	.dw _default_Triangle_Echo_test_DMC_pattern0
	.dw _default_Triangle_Echo_test_DMC_pattern0
	.dw _default_Triangle_Echo_test_DMC_pattern0
	.dw _default_Triangle_Echo_test_DMC_pattern0
	.dw _default_Triangle_Echo_test_DMC_pattern0
	.dw _default_Triangle_Echo_test_DMC_pattern0
	.dw _default_Triangle_Echo_test_DMC_pattern0
	.dw _default_Triangle_Echo_test_DMC_pattern0
	.dw _default_Triangle_Echo_test_DMC_pattern0
	.dw _default_Triangle_Echo_test_DMC_pattern0
	.dw _default_Triangle_Echo_test_DMC_pattern0
	.dw _default_Triangle_Echo_test_DMC_pattern0
_default_Triangle_Echo_test_DMC_pattern0:
	.db NL1,A0,AS0,A0,AS0,A0,AS0,A0,AS0,A0
	.db AS0,A0,AS0,A0,AS0,A0,AS0,A0,AS0,A0
	.db AS0,A0,AS0,A0,AS0,A0,AS0,A0,AS0,A0
	.db AS0,A0,AS0,A0,AS0,A0,AS0,A0,AS0,A0
	.db AS0,A0,AS0,A0,AS0,A0,AS0,A0,AS0,A0
	.db AS0,A0,AS0,A0,AS0,A0,AS0,A0,AS0,A0
	.db AS0,A0,AS0,A0,AS0,D00
_default_Triangle_Echo_test_DMC_pattern1:
	.db NL1,AS0,A0,AS0,A0,AS0,A0,AS0,A0,AS0
	.db A0,AS0,A0,AS0,A0,AS0,A0,AS0,A0,AS0
	.db A0,AS0,A0,AS0,A0,AS0,A0,AS0,A0,AS0
	.db A0,AS0,A0,AS0,A0,AS0,A0,AS0,A0,AS0
	.db A0,AS0,A0,AS0,A0,AS0,A0,AS0,A0,AS0
	.db A0,AS0,A0,AS0,A0,AS0,A0,AS0,A0,AS0
	.db A0,AS0,A0,AS0,A0,D00

_default_testSong0_header:
	.db 6
	.db 150
	.db 2
	.dw _default_testSong0_pulse1
	.dw NULL_pulse2
	.dw NULL_triangle
	.dw NULL_noise
	.dw _default_testSong0_DMC

_default_testSong0_pulse1:
	.dw _default_testSong0_pulse1_pattern0
	.dw _default_testSong0_pulse1_pattern1
_default_testSong0_pulse1_pattern0:
	.db NL2,INST|CONT|2,C3,D3,E3,NL6,INST|SLNT,NL2,INST|CONT|1,B3
	.db C4,D00
_default_testSong0_pulse1_pattern1:
	.db NL4,INST|CONT|1,C4,NL2,B3,NL4,A3,NL6,G3,D00

_default_testSong0_DMC:
	.dw _default_testSong0_DMC_pattern0
	.dw _default_testSong0_DMC_pattern1
_default_testSong0_DMC_pattern0:
	.db NL4,ZXX,$00,NUL,ZXX,$18,NUL,ZXX,$30,NUL,ZXX,$48,NUL,D00
_default_testSong0_DMC_pattern1:
	.db NL4,ZXX,$60,NUL,ZXX,$48,NUL,ZXX,$30,NUL,ZXX,$15,NUL,D00

