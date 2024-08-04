_default_MoodSwings_header:
	.byte 3
	.byte 150
	.byte 22
	.word _default_MoodSwings_pulse1
	.word _default_MoodSwings_pulse2
	.word _default_MoodSwings_triangle
	.word _default_MoodSwings_noise
	.word _default_MoodSwings_DMC

_default_MoodSwings_pulse1:
	.word _default_MoodSwings_pulse1_pattern0
	.word _default_MoodSwings_pulse1_pattern1
	.word _default_MoodSwings_pulse1_pattern2
	.word _default_MoodSwings_pulse1_pattern1
	.word _default_MoodSwings_pulse1_pattern3
	.word _default_MoodSwings_pulse1_pattern1
	.word _default_MoodSwings_pulse1_pattern2
	.word _default_MoodSwings_pulse1_pattern1
	.word _default_MoodSwings_pulse1_pattern4
	.word _default_MoodSwings_pulse1_pattern5
	.word _default_MoodSwings_pulse1_pattern5
	.word _default_MoodSwings_pulse1_pattern5
	.word _default_MoodSwings_pulse1_pattern5
	.word _default_MoodSwings_pulse1_pattern5
	.word _default_MoodSwings_pulse1_pattern5
	.word _default_MoodSwings_pulse1_pattern5
	.word _default_MoodSwings_pulse1_pattern6
	.word _default_MoodSwings_pulse1_pattern7
	.word _default_MoodSwings_pulse1_pattern1
	.word _default_MoodSwings_pulse1_pattern2
	.word _default_MoodSwings_pulse1_pattern1
	.word _default_MoodSwings_pulse1_pattern8
_default_MoodSwings_pulse1_pattern0:
	.byte NL20,NUL,D00
_default_MoodSwings_pulse1_pattern1:
	.byte NL6,INST|CONT|37,E1,NL4,INST|CONT|36,B3,NL2,INST|CONT|37,E2,NL6
	.byte E1,NL4,INST|CONT|36,B3,NL2,B3,NL4,INST|CONT|37,D1,NL2
	.byte D1,NL4,INST|CONT|36,A3,NL6,INST|CONT|37,D1,NL2,D2,NL4
	.byte INST|CONT|36,A3,NL2,A3,D00
_default_MoodSwings_pulse1_pattern2:
	.byte NL6,INST|CONT|37,CS1,NL4,INST|CONT|36,GS3,NL2,INST|CONT|37,CS2,NL6
	.byte CS1,NL4,INST|CONT|36,GS3,NL2,GS3,NL4,INST|CONT|37,A0,NL2
	.byte A0,NL4,INST|CONT|36,FS3,NL6,INST|CONT|37,C1,NL2,D2,NL4
	.byte INST|CONT|36,A3,NL2,A3,D00
_default_MoodSwings_pulse1_pattern3:
	.byte NL6,INST|CONT|37,CS1,NL4,INST|CONT|36,GS3,NL2,INST|CONT|37,CS2,NL4
	.byte CS1,NL2,GS1,NL4,INST|CONT|36,GS3,NL8,INST|CONT|37,B0,NL18
	.byte INST|SLNT,D00
_default_MoodSwings_pulse1_pattern4:
	.byte NL6,INST|CONT|37,CS1,NL4,INST|CONT|36,GS3,NL2,INST|CONT|37,CS2,NL4
	.byte CS1,NL2,GS1,NL4,INST|CONT|36,GS3,NL6,FXX,$04,INST|CONT|37,B0
	.byte FXX,$05,NUL,NL4,FXX,$06,INST|CONT|22,DS3,FXX,$07,B2,NL2,FXX,$08
	.byte FS2,NL1,FXX,$12,NUL,NL2,E2,NL1,FXX,$04,NUL,D00
_default_MoodSwings_pulse1_pattern5:
	.byte NL1,INST|CONT|14,B4,INST|CONT|16,CS4,INST|CONT|14,AS4,INST|CONT|16,B4,INST|CONT|14
	.byte FS4,INST|CONT|16,AS4,INST|CONT|14,CS4,INST|CONT|16,FS4,INST|CONT|13,B4,INST|CONT|16
	.byte CS4,INST|CONT|13,AS4,INST|CONT|16,B4,INST|CONT|13,FS4,INST|CONT|16,AS4,INST|CONT|13
	.byte CS4,INST|CONT|16,FS4,INST|CONT|12,B4,INST|CONT|16,CS4,INST|CONT|12,AS4,INST|CONT|16
	.byte B4,INST|CONT|12,FS4,INST|CONT|16,AS4,INST|CONT|12,CS4,INST|CONT|16,FS4,INST|CONT|13
	.byte B4,INST|CONT|16,CS4,INST|CONT|13,AS4,INST|CONT|16,B4,INST|CONT|13,FS4,INST|CONT|16
	.byte AS4,INST|CONT|13,CS4,INST|CONT|16,FS4,D00
_default_MoodSwings_pulse1_pattern6:
	.byte NL2,INST|CONT|9,CS4,CS4,NL4,INST|16,INST|CONT|6,FS1,NL2,INST|CONT|9
	.byte CS4,CS4,NL4,INST|16,NL2,INST|CONT|6,FS1,D00
_default_MoodSwings_pulse1_pattern7:
	.byte NL2,NUL,NL4,INST|CONT|38,FS3,NL6,FXX,$03,NUL,D00
_default_MoodSwings_pulse1_pattern8:
	.byte NL6,INST|CONT|37,CS1,NL4,INST|CONT|36,GS3,NL2,INST|CONT|37,CS2,NL4
	.byte CS1,NL2,GS1,NL4,INST|CONT|36,GS3,NL8,INST|CONT|37,B0,NL18
	.byte INST|SLNT,BXX,$01

_default_MoodSwings_pulse2:
	.word _default_MoodSwings_pulse2_pattern0
	.word _default_MoodSwings_pulse2_pattern1
	.word _default_MoodSwings_pulse2_pattern2
	.word _default_MoodSwings_pulse2_pattern1
	.word _default_MoodSwings_pulse2_pattern3
	.word _default_MoodSwings_pulse2_pattern1
	.word _default_MoodSwings_pulse2_pattern2
	.word _default_MoodSwings_pulse2_pattern1
	.word _default_MoodSwings_pulse2_pattern5
	.word _default_MoodSwings_pulse2_pattern6
	.word _default_MoodSwings_pulse2_pattern7
	.word _default_MoodSwings_pulse2_pattern6
	.word _default_MoodSwings_pulse2_pattern8
	.word _default_MoodSwings_pulse2_pattern10
	.word _default_MoodSwings_pulse2_pattern11
	.word _default_MoodSwings_pulse2_pattern12
	.word _default_MoodSwings_pulse2_pattern13
	.word _default_MoodSwings_pulse2_pattern14
	.word _default_MoodSwings_pulse2_pattern1
	.word _default_MoodSwings_pulse2_pattern2
	.word _default_MoodSwings_pulse2_pattern1
	.word _default_MoodSwings_pulse2_pattern3
_default_MoodSwings_pulse2_pattern0:
	.byte NL48,NUL,D00
_default_MoodSwings_pulse2_pattern1:
	.byte NL4,INST|CONT|18,B3,INST|12,INST|13,NL6,INST|CONT|17,A3,INST|CONT|11,GS3
	.byte NL2,INST|CONT|18,A3,INST|15,INST|17,NL4,INST|CONT|11,GS3,E3,NL2
	.byte INST|15,INST|11,NL4,FS3,NL2,INST|12,D00
_default_MoodSwings_pulse2_pattern2:
	.byte NL4,INST|CONT|18,GS3,NL2,INST|15,NL4,INST|11,NL2,INST|15,INST|18
	.byte INST|13,NL4,INST|11,NL2,INST|13,NL4,INST|CONT|10,A3,NL2,INST|13
	.byte INST|11,NL4,GS3,INST|CONT|17,E3,NL2,INST|12,INST|13,NL4,INST|CONT|10
	.byte FS3,NL2,INST|12,D00
_default_MoodSwings_pulse2_pattern3:
	.byte NL4,INST|CONT|18,GS3,NL2,INST|15,NL4,INST|11,NL2,INST|15,NL4
	.byte INST|18,NL2,INST|CONT|17,A3,NL4,INST|CONT|12,GS3,INST|CONT|33,FS3,INST|15
	.byte INST|16,NL14,INST|SLNT,D00
_default_MoodSwings_pulse2_pattern5:
	.byte NL4,INST|CONT|18,GS3,NL2,INST|15,NL4,INST|11,NL2,INST|15,NL4
	.byte INST|18,NL2,INST|CONT|17,A3,NL4,INST|CONT|12,GS3,INST|CONT|33,FS3,NL2
	.byte INST|12,NL4,INST|CONT|17,E3,DS3,B2,FS2,NL2,E2,INST|19
	.byte D00
_default_MoodSwings_pulse2_pattern6:
	.byte NL6,INST|CONT|19,E2,INST|13,NL4,INST|14,NL6,INST|CONT|19,DS2,INST|13
	.byte NL20,INST|14,D00
_default_MoodSwings_pulse2_pattern7:
	.byte NL6,INST|CONT|19,AS1,INST|13,NL7,INST|CONT|19,B1,INST|13,NL22,INST|14
	.byte D00
_default_MoodSwings_pulse2_pattern8:
	.byte NL6,INST|CONT|19,B2,INST|13,NL8,INST|14,NL4,INST|19,AS2,NL20
	.byte FS2,D00
_default_MoodSwings_pulse2_pattern10:
	.byte NL6,INST|CONT|19,E2,INST|13,INST|CONT|19,FS2,INST|13,NL4,INST|14,NL20
	.byte INST|CONT|19,B2,D00
_default_MoodSwings_pulse2_pattern11:
	.byte NL6,INST|CONT|19,AS2,INST|13,INST|CONT|19,B2,INST|13,NL24,INST|14,D00
_default_MoodSwings_pulse2_pattern12:
	.byte NL1,INST|CONT|24,E2,INST|31,INST|CONT|24,FS2,INST|CONT|31,E2,INST|CONT|24,AS2
	.byte INST|CONT|31,FS2,INST|CONT|24,B2,INST|CONT|31,AS2,INST|CONT|24,FS2,INST|CONT|31,B2
	.byte INST|CONT|24,AS2,INST|CONT|31,FS2,INST|CONT|24,B2,INST|CONT|31,AS2,INST|CONT|24,CS3
	.byte INST|CONT|31,B2,INST|CONT|24,AS2,INST|CONT|31,CS3,INST|CONT|24,B2,INST|CONT|31,AS2
	.byte INST|CONT|24,CS3,INST|CONT|31,B2,INST|CONT|24,DS3,INST|CONT|31,CS3,INST|CONT|24,B2
	.byte INST|CONT|31,DS3,INST|CONT|24,CS3,INST|CONT|31,B2,INST|CONT|24,DS3,INST|CONT|31,CS3
	.byte INST|CONT|24,GS3,NLC,17,INST|CONT|31,DS3,D00
_default_MoodSwings_pulse2_pattern13:
	.byte NL2,INST|CONT|20,FS3,INST|24,NL6,INST|32,NL2,INST|CONT|6,FS1,INST|CONT|20
	.byte FS3,INST|24,NL32,INST|32,D00
_default_MoodSwings_pulse2_pattern14:
	.byte NL2,INST|CONT|17,FS3,INST|CONT|18,E4,INST|CONT|34,B3,NL4,INST|CONT|17,GS3
	.byte NLC,38,AS3,D00

_default_MoodSwings_triangle:
	.word _default_MoodSwings_triangle_pattern0
	.word _default_MoodSwings_triangle_pattern1
	.word _default_MoodSwings_triangle_pattern2
	.word _default_MoodSwings_triangle_pattern1
	.word _default_MoodSwings_triangle_pattern3
	.word _default_MoodSwings_triangle_pattern1
	.word _default_MoodSwings_triangle_pattern2
	.word _default_MoodSwings_triangle_pattern1
	.word _default_MoodSwings_triangle_pattern4
	.word _default_MoodSwings_triangle_pattern5
	.word _default_MoodSwings_triangle_pattern6
	.word _default_MoodSwings_triangle_pattern5
	.word _default_MoodSwings_triangle_pattern7
	.word _default_MoodSwings_triangle_pattern8
	.word _default_MoodSwings_triangle_pattern9
	.word _default_MoodSwings_triangle_pattern10
	.word _default_MoodSwings_triangle_pattern11
	.word _default_MoodSwings_triangle_pattern12
	.word _default_MoodSwings_triangle_pattern1
	.word _default_MoodSwings_triangle_pattern2
	.word _default_MoodSwings_triangle_pattern1
	.word _default_MoodSwings_triangle_pattern3
_default_MoodSwings_triangle_pattern0:
	.byte NL48,NUL,D00
_default_MoodSwings_triangle_pattern1:
	.byte NL5,INST|CONT|9,E3,INST|12,NL2,INST|CONT|10,B3,NL4,INST|CONT|9,A3
	.byte GS3,NL2,INST|SLNT,INST|CONT|9,FS3,NL10,INST|12,NL2,INST|CONT|10,E4
	.byte NL4,INST|CONT|9,DS4,CS4,NL2,INST|SLNT,INST|CONT|9,B3,D00
_default_MoodSwings_triangle_pattern2:
	.byte NL6,INST|CONT|12,B3,INST|CONT|9,E3,NL10,INST|12,NL4,INST|CONT|10,A3
	.byte NL2,INST|SLNT,INST|9,GS3,INST|SLNT,INST|9,NL4,E3,FS3,INST|12
	.byte D00
_default_MoodSwings_triangle_pattern3:
	.byte NL16,INST|CONT|12,B3,NL2,INST|CONT|10,A3,NL4,INST|CONT|9,GS3,NL6
	.byte FS3,NL20,INST|SLNT,D00
_default_MoodSwings_triangle_pattern4:
	.byte NL6,INST|CONT|12,B3,INST|CONT|10,E4,NL10,INST|12,NL2,INST|CONT|9,B1
	.byte NL16,INST|12,NL4,INST|CONT|10,B2,INST|12,D00
_default_MoodSwings_triangle_pattern5:
	.byte NL2,INST|CONT|10,B3,NL4,INST|12,NL6,FS4,NL4,B3,NL6
	.byte AS3,NL2,INST|CONT|10,GS4,NL24,INST|12,D00
_default_MoodSwings_triangle_pattern6:
	.byte NL6,INST|CONT|11,FS4,INST|CONT|10,CS4,NL12,INST|CONT|33,B3,NL4,INST|CONT|12
	.byte AS3,NL20,B3,D00
_default_MoodSwings_triangle_pattern7:
	.byte NL6,INST|CONT|11,FS4,NL2,INST|CONT|10,B4,NL4,INST|12,NL2,INST|CONT|33
	.byte FS4,NLC,34,INST|12,D00
_default_MoodSwings_triangle_pattern8:
	.byte NL6,INST|CONT|10,GS4,INST|CONT|35,E4,NL8,INST|CONT|10,FS4,NL4,INST|CONT|12
	.byte E4,DS4,NL20,CS4,D00
_default_MoodSwings_triangle_pattern9:
	.byte NL6,INST|CONT|12,AS3,INST|CONT|33,FS3,NL4,INST|CONT|10,B3,NL8,INST|12
	.byte NL4,CS4,NL20,DS4,D00
_default_MoodSwings_triangle_pattern10:
	.byte NL2,INST|CONT|10,E4,NL6,INST|12,NL4,DS4,NL8,B3,NL4
	.byte FS3,NL24,INST|CONT|10,GS4,D00
_default_MoodSwings_triangle_pattern11:
	.byte NL2,INST|CONT|33,FS4,NL4,INST|12,NL6,INST|SLNT,NL2,INST|33,NL4
	.byte INST|12,NL30,INST|SLNT,D00
_default_MoodSwings_triangle_pattern12:
	.byte NL6,NUL,NLC,42,INST|CONT|12,FS3,D00

_default_MoodSwings_noise:
	.word _default_MoodSwings_noise_pattern0
	.word _default_MoodSwings_noise_pattern1
	.word _default_MoodSwings_noise_pattern2
	.word _default_MoodSwings_noise_pattern1
	.word _default_MoodSwings_noise_pattern3
	.word _default_MoodSwings_noise_pattern1
	.word _default_MoodSwings_noise_pattern2
	.word _default_MoodSwings_noise_pattern1
	.word _default_MoodSwings_noise_pattern4
	.word _default_MoodSwings_noise_pattern5
	.word _default_MoodSwings_noise_pattern6
	.word _default_MoodSwings_noise_pattern5
	.word _default_MoodSwings_noise_pattern6
	.word _default_MoodSwings_noise_pattern7
	.word _default_MoodSwings_noise_pattern7
	.word _default_MoodSwings_noise_pattern8
	.word _default_MoodSwings_noise_pattern9
	.word _default_MoodSwings_noise_pattern10
	.word _default_MoodSwings_noise_pattern1
	.word _default_MoodSwings_noise_pattern2
	.word _default_MoodSwings_noise_pattern1
	.word _default_MoodSwings_noise_pattern3
_default_MoodSwings_noise_pattern0:
	.byte NL2,INST|CONT|5,$E,NL4,$F,NL2,$E,NL10,INST|CONT|6,$D
	.byte NL30,$D,D00
_default_MoodSwings_noise_pattern1:
	.byte NL6,INST|CONT|4,$C,NL4,INST|CONT|5,$E,NL2,$F,NL6,INST|CONT|6
	.byte $D,NL4,INST|CONT|5,$E,NL2,$F,NL6,INST|CONT|4,$C,NL4
	.byte INST|CONT|5,$E,NL2,$F,NL6,INST|CONT|6,$D,NL4,INST|CONT|5,$E
	.byte NL2,$F,D00
_default_MoodSwings_noise_pattern2:
	.byte NL6,INST|CONT|4,$C,NL4,INST|CONT|5,$E,NL2,$F,NL6,INST|CONT|6
	.byte $D,NL4,INST|CONT|5,$E,NL2,$F,NL6,INST|CONT|4,$C,NL4
	.byte INST|CONT|5,$E,NL2,$F,NL6,INST|CONT|6,$D,NL2,INST|CONT|4,$C
	.byte $D,$C,D00
_default_MoodSwings_noise_pattern3:
	.byte NL6,INST|CONT|4,$C,NL4,INST|CONT|5,$E,NL2,$F,NL6,INST|CONT|6
	.byte $D,NL4,INST|CONT|5,$E,NL12,INST|CONT|6,$D,NL2,INST|CONT|4,$C
	.byte NL4,INST|CONT|6,$D,NL2,INST|CONT|5,$E,NL4,INST|CONT|6,$D,NL2
	.byte INST|CONT|4,$C,D00
_default_MoodSwings_noise_pattern4:
	.byte NL6,INST|CONT|4,$C,NL4,INST|CONT|5,$E,NL2,$F,NL6,INST|CONT|6
	.byte $D,NL4,INST|CONT|5,$E,NL18,INST|CONT|7,$D,NL8,$D,D00
_default_MoodSwings_noise_pattern5:
	.byte NL8,INST|CONT|6,$E,INST|CONT|8,$F,INST|CONT|6,$E,NL24,INST|CONT|8,$F
	.byte D00
_default_MoodSwings_noise_pattern6:
	.byte NL8,INST|CONT|6,$E,NL4,INST|CONT|8,$F,INST|5,NL8,INST|CONT|6,$E
	.byte NL24,INST|CONT|8,$F,D00
_default_MoodSwings_noise_pattern7:
	.byte NL4,INST|CONT|6,$E,INST|CONT|8,$F,INST|CONT|6,$E,INST|CONT|8,$F,INST|CONT|6
	.byte $E,INST|CONT|8,$F,INST|CONT|6,$E,NL20,INST|CONT|8,$F,D00
_default_MoodSwings_noise_pattern8:
	.byte NL4,INST|CONT|6,$E,NL2,INST|CONT|4,$C,INST|CONT|5,$F,NL4,INST|CONT|6
	.byte $E,NL2,INST|CONT|4,$C,INST|CONT|5,$F,NL4,INST|CONT|6,$E,NL2
	.byte INST|CONT|4,$C,INST|CONT|5,$F,NL4,INST|CONT|6,$E,NL2,INST|CONT|4,$C
	.byte NL18,$C,D00
_default_MoodSwings_noise_pattern9:
	.byte NL2,INST|CONT|6,$D,NL6,$D,NL4,INST|SLNT,NL2,INST|6,NL6
	.byte $D,NL28,INST|SLNT,D00
_default_MoodSwings_noise_pattern10:
	.byte NL2,NUL,INST|CONT|5,$F,INST|CONT|6,$D,NL4,$D,NLC,38
	.byte $D,D00

_default_MoodSwings_DMC:
	.word _default_MoodSwings_DMC_pattern0
	.word _default_MoodSwings_DMC_pattern1
	.word _default_MoodSwings_DMC_pattern2
	.word _default_MoodSwings_DMC_pattern1
	.word _default_MoodSwings_DMC_pattern3
	.word _default_MoodSwings_DMC_pattern1
	.word _default_MoodSwings_DMC_pattern2
	.word _default_MoodSwings_DMC_pattern1
	.word _default_MoodSwings_DMC_pattern4
	.word _default_MoodSwings_DMC_pattern5
	.word _default_MoodSwings_DMC_pattern6
	.word _default_MoodSwings_DMC_pattern5
	.word _default_MoodSwings_DMC_pattern7
	.word _default_MoodSwings_DMC_pattern8
	.word _default_MoodSwings_DMC_pattern9
	.word _default_MoodSwings_DMC_pattern10
	.word _default_MoodSwings_DMC_pattern11
	.word _default_MoodSwings_DMC_pattern12
	.word _default_MoodSwings_DMC_pattern1
	.word _default_MoodSwings_DMC_pattern2
	.word _default_MoodSwings_DMC_pattern1
	.word _default_MoodSwings_DMC_pattern3
_default_MoodSwings_DMC_pattern0:
	.byte NL8,NUL,NL4,FS7,NL2,D7,NL4,D7,NL30,FS7
	.byte D00
_default_MoodSwings_DMC_pattern1:
	.byte NL6,AS7,NL2,D7,AS0,AS7,NL6,FS7,NL4,A7
	.byte NL6,AS7,NL2,D7,D7,AS0,AS7,NL6,FS7,NL4
	.byte A7,NL2,AS7,D00
_default_MoodSwings_DMC_pattern2:
	.byte NL6,AS7,NL2,D7,AS0,AS7,NL6,FS7,NL4,A7
	.byte NL6,AS7,NL2,D7,NL4,D7,NL2,AS7,NL6,FS7
	.byte NL2,A7,AS7,F7,D00
_default_MoodSwings_DMC_pattern3:
	.byte NL6,AS7,NL4,D7,NL2,AS7,NL4,FS7,NL2,D7
	.byte NL4,A7,A7,NL8,AS0,NL2,A0,D7,D7,D7
	.byte NL4,FS7,NL2,AS7,D00
_default_MoodSwings_DMC_pattern4:
	.byte NL6,AS7,NL4,D7,NL2,AS7,NL4,FS7,NL2,D7
	.byte NL4,A7,NL18,A7,NL8,A7,D00
_default_MoodSwings_DMC_pattern5:
	.byte NL4,NUL,NL6,B3,FS4,NL4,B3,NL6,AS3,NL22
	.byte GS4,D00
_default_MoodSwings_DMC_pattern6:
	.byte NL4,NUL,NL6,FS4,CS4,NL12,B3,NL20,AS3,D00
_default_MoodSwings_DMC_pattern7:
	.byte NL4,NUL,NL6,FS4,B4,NL32,FS4,D00
_default_MoodSwings_DMC_pattern8:
	.byte NL16,B2,NL32,CS3,D00
_default_MoodSwings_DMC_pattern9:
	.byte NL16,AS2,NL32,FS2,D00
_default_MoodSwings_DMC_pattern10:
	.byte NL16,E2,NL8,FS2,NL24,GS2,D00
_default_MoodSwings_DMC_pattern11:
	.byte NL2,A7,A7,FS4,A0,NL4,FS1,NL2,A7,A7
	.byte FS4,A0,NL28,FS1,D00
_default_MoodSwings_DMC_pattern12:
	.byte NL1,AS7,AS7,NL2,AS7,FS7,NL4,FS7,NLC,38
	.byte FS7,D00

_default_Intermisison_header:
	.byte 7
	.byte 150
	.byte 2
	.word _default_Intermisison_pulse1
	.word _default_Intermisison_pulse2
	.word _default_Intermisison_triangle
	.word _default_Intermisison_noise
	.word _default_Intermisison_DMC

_default_Intermisison_pulse1:
	.word _default_Intermisison_pulse1_pattern0
	.word _default_Intermisison_pulse1_pattern0
_default_Intermisison_pulse1_pattern0:
	.byte NL2,INST|CONT|14,AS2,INST|CONT|13,D2,DS2,AS2,INST|14,INST|CONT|13,DS2
	.byte F2,AS2,INST|14,INST|CONT|13,D2,F2,AS2,INST|14,INST|CONT|13,DS2
	.byte F2,AS2,D00

_default_Intermisison_pulse2:
	.word _default_Intermisison_pulse2_pattern0
	.word _default_Intermisison_pulse2_pattern0
_default_Intermisison_pulse2_pattern0:
	.byte NL1,NUL,NL2,INST|CONT|15,AS2,AS2,D2,DS2,AS2,AS2
	.byte DS2,F2,AS2,AS2,D2,F2,AS2,AS2,DS2,NL1
	.byte F2,D00

_default_Intermisison_triangle:
	.word _default_Intermisison_triangle_pattern0
	.word _default_Intermisison_triangle_pattern1
_default_Intermisison_triangle_pattern0:
	.byte NL6,INST|CONT|9,D2,NL10,DS2,NL6,F2,DS2,NL2,A2
	.byte AS2,D00
_default_Intermisison_triangle_pattern1:
	.byte NL6,INST|CONT|9,D2,NL2,DS2,G1,NL4,AS1,NL2,DS2
	.byte D2,G1,AS1,NL4,C2,NL2,F1,NL4,AS1,D00

_default_Intermisison_noise:
	.word _default_Intermisison_noise_pattern0
	.word _default_Intermisison_noise_pattern0
_default_Intermisison_noise_pattern0:
	.byte NL4,INST|CONT|6,$F,NL2,INST|5,NL4,$D,NL2,$F,$D
	.byte $F,NL4,INST|6,NL2,INST|5,NL4,$D,NL2,$F,$D
	.byte $F,D00

_default_Intermisison_DMC:
	.word _default_Intermisison_DMC_pattern0
	.word _default_Intermisison_DMC_pattern0
_default_Intermisison_DMC_pattern0:
	.byte NL6,AS7,NL8,E7,NL2,AS7,NL6,AS7,E7,NL2
	.byte AS7,A7,D00

_default_TriangleEchoTest_header:
	.byte 6
	.byte 150
	.byte 16
	.word _default_TriangleEchoTest_pulse1
	.word NULL_pulse2
	.word _default_TriangleEchoTest_triangle
	.word NULL_noise
	.word _default_TriangleEchoTest_DMC

_default_TriangleEchoTest_pulse1:
	.word _default_TriangleEchoTest_pulse1_pattern0
	.word _default_TriangleEchoTest_pulse1_pattern0
	.word _default_TriangleEchoTest_pulse1_pattern0
	.word _default_TriangleEchoTest_pulse1_pattern0
	.word _default_TriangleEchoTest_pulse1_pattern1
	.word _default_TriangleEchoTest_pulse1_pattern2
	.word _default_TriangleEchoTest_pulse1_pattern3
	.word _default_TriangleEchoTest_pulse1_pattern4
	.word _default_TriangleEchoTest_pulse1_pattern5
	.word _default_TriangleEchoTest_pulse1_pattern4
	.word _default_TriangleEchoTest_pulse1_pattern3
	.word _default_TriangleEchoTest_pulse1_pattern2
	.word _default_TriangleEchoTest_pulse1_pattern1
	.word _default_TriangleEchoTest_pulse1_pattern0
	.word _default_TriangleEchoTest_pulse1_pattern6
	.word _default_TriangleEchoTest_pulse1_pattern7
_default_TriangleEchoTest_pulse1_pattern0:
	.byte NL64,FXX,$06,NUL,D00
_default_TriangleEchoTest_pulse1_pattern1:
	.byte NL64,FXX,$05,NUL,D00
_default_TriangleEchoTest_pulse1_pattern2:
	.byte NL64,FXX,$04,NUL,D00
_default_TriangleEchoTest_pulse1_pattern3:
	.byte NL64,FXX,$03,NUL,D00
_default_TriangleEchoTest_pulse1_pattern4:
	.byte NL64,FXX,$02,NUL,D00
_default_TriangleEchoTest_pulse1_pattern5:
	.byte NL64,FXX,$01,NUL,D00
_default_TriangleEchoTest_pulse1_pattern6:
	.byte NL16,FXX,$07,NUL,FXX,$08,NUL,FXX,$09,NUL,FXX,$0A,NUL,D00
_default_TriangleEchoTest_pulse1_pattern7:
	.byte NL8,FXX,$0B,NUL,FXX,$0C,NUL,FXX,$0D,NUL,FXX,$0E,NUL,NL4
	.byte FXX,$0F,NUL,FXX,$10,NUL,FXX,$11,NUL,FXX,$12,NUL,NL2,FXX,$13
	.byte NUL,FXX,$14,NUL,FXX,$15,NUL,FXX,$16,NUL,FXX,$17,NUL,FXX,$18
	.byte NUL,FXX,$19,NUL,FXX,$1A,NUL,D00

_default_TriangleEchoTest_triangle:
	.word _default_TriangleEchoTest_triangle_pattern0
	.word _default_TriangleEchoTest_triangle_pattern1
	.word _default_TriangleEchoTest_triangle_pattern2
	.word _default_TriangleEchoTest_triangle_pattern3
	.word _default_TriangleEchoTest_triangle_pattern3
	.word _default_TriangleEchoTest_triangle_pattern3
	.word _default_TriangleEchoTest_triangle_pattern3
	.word _default_TriangleEchoTest_triangle_pattern3
	.word _default_TriangleEchoTest_triangle_pattern3
	.word _default_TriangleEchoTest_triangle_pattern3
	.word _default_TriangleEchoTest_triangle_pattern3
	.word _default_TriangleEchoTest_triangle_pattern3
	.word _default_TriangleEchoTest_triangle_pattern3
	.word _default_TriangleEchoTest_triangle_pattern3
	.word _default_TriangleEchoTest_triangle_pattern3
	.word _default_TriangleEchoTest_triangle_pattern3
_default_TriangleEchoTest_triangle_pattern0:
	.byte NL2,INST|CONT|12,AS3,DS4,AS4,FS4,AS3,DS4,AS4,FS4
	.byte AS3,DS4,AS4,FS4,AS3,DS4,AS4,FS4,AS3,CS4
	.byte GS4,E4,AS3,CS4,GS4,E4,AS3,CS4,GS4,E4
	.byte AS3,CS4,GS4,E4,D00
_default_TriangleEchoTest_triangle_pattern1:
	.byte NL2,INST|CONT|12,AS3,DS4,AS4,FS4,AS3,DS4,AS4,FS4
	.byte AS3,DS4,AS4,FS4,AS3,DS4,AS4,FS4,AS3,CS4
	.byte GS4,E4,AS3,CS4,GS4,E4,AS3,CS4,GS4,E4
	.byte AS3,CS4,GS4,E4,D00
_default_TriangleEchoTest_triangle_pattern2:
	.byte NL1,INST|CONT|12,AS3,E4,DS4,AS3,AS4,DS4,FS4,AS4
	.byte AS3,FS4,DS4,AS3,AS4,DS4,FS4,AS4,AS3,FS4
	.byte DS4,AS3,AS4,DS4,FS4,AS4,AS3,FS4,DS4,AS3
	.byte AS4,DS4,FS4,AS4,AS3,FS4,CS4,AS3,GS4,CS4
	.byte E4,GS4,AS3,E4,CS4,AS3,GS4,CS4,E4,GS4
	.byte AS3,E4,CS4,AS3,GS4,CS4,E4,GS4,AS3,E4
	.byte CS4,AS3,GS4,CS4,E4,GS4,D00
_default_TriangleEchoTest_triangle_pattern3:
	.byte NL1,INST|CONT|9,AS3,INST|CONT|12,E4,INST|CONT|9,DS4,INST|CONT|12,AS3,INST|CONT|9
	.byte AS4,INST|CONT|12,DS4,INST|CONT|9,FS4,INST|CONT|12,AS4,INST|CONT|9,AS3,INST|CONT|12
	.byte FS4,INST|CONT|9,DS4,INST|CONT|12,AS3,INST|CONT|9,AS4,INST|CONT|12,DS4,INST|CONT|9
	.byte FS4,INST|CONT|12,AS4,INST|CONT|9,AS3,INST|CONT|12,FS4,INST|CONT|9,DS4,INST|CONT|12
	.byte AS3,INST|CONT|9,AS4,INST|CONT|12,DS4,INST|CONT|9,FS4,INST|CONT|12,AS4,INST|CONT|9
	.byte AS3,INST|CONT|12,FS4,INST|CONT|9,DS4,INST|CONT|12,AS3,INST|CONT|9,AS4,INST|CONT|12
	.byte DS4,INST|CONT|9,FS4,INST|CONT|12,AS4,INST|CONT|9,AS3,INST|CONT|12,FS4,INST|CONT|9
	.byte CS4,INST|CONT|12,AS3,INST|CONT|9,GS4,INST|CONT|12,CS4,INST|CONT|9,E4,INST|CONT|12
	.byte GS4,INST|CONT|9,AS3,INST|CONT|12,E4,INST|CONT|9,CS4,INST|CONT|12,AS3,INST|CONT|9
	.byte GS4,INST|CONT|12,CS4,INST|CONT|9,E4,INST|CONT|12,GS4,INST|CONT|9,AS3,INST|CONT|12
	.byte E4,INST|CONT|9,CS4,INST|CONT|12,AS3,INST|CONT|9,GS4,INST|CONT|12,CS4,INST|CONT|9
	.byte E4,INST|CONT|12,GS4,INST|CONT|9,AS3,INST|CONT|12,E4,INST|CONT|9,CS4,INST|CONT|12
	.byte AS3,INST|CONT|9,GS4,INST|CONT|12,CS4,INST|CONT|9,E4,INST|CONT|12,GS4,D00

_default_TriangleEchoTest_DMC:
	.word _default_TriangleEchoTest_DMC_pattern0
	.word _default_TriangleEchoTest_DMC_pattern1
	.word _default_TriangleEchoTest_DMC_pattern0
	.word _default_TriangleEchoTest_DMC_pattern0
	.word _default_TriangleEchoTest_DMC_pattern0
	.word _default_TriangleEchoTest_DMC_pattern0
	.word _default_TriangleEchoTest_DMC_pattern0
	.word _default_TriangleEchoTest_DMC_pattern0
	.word _default_TriangleEchoTest_DMC_pattern0
	.word _default_TriangleEchoTest_DMC_pattern0
	.word _default_TriangleEchoTest_DMC_pattern0
	.word _default_TriangleEchoTest_DMC_pattern0
	.word _default_TriangleEchoTest_DMC_pattern0
	.word _default_TriangleEchoTest_DMC_pattern0
	.word _default_TriangleEchoTest_DMC_pattern0
	.word _default_TriangleEchoTest_DMC_pattern0
_default_TriangleEchoTest_DMC_pattern0:
	.byte NL1,A0,AS0,A0,AS0,A0,AS0,A0,AS0,A0
	.byte AS0,A0,AS0,A0,AS0,A0,AS0,A0,AS0,A0
	.byte AS0,A0,AS0,A0,AS0,A0,AS0,A0,AS0,A0
	.byte AS0,A0,AS0,A0,AS0,A0,AS0,A0,AS0,A0
	.byte AS0,A0,AS0,A0,AS0,A0,AS0,A0,AS0,A0
	.byte AS0,A0,AS0,A0,AS0,A0,AS0,A0,AS0,A0
	.byte AS0,A0,AS0,A0,AS0,D00
_default_TriangleEchoTest_DMC_pattern1:
	.byte NL1,AS0,A0,AS0,A0,AS0,A0,AS0,A0,AS0
	.byte A0,AS0,A0,AS0,A0,AS0,A0,AS0,A0,AS0
	.byte A0,AS0,A0,AS0,A0,AS0,A0,AS0,A0,AS0
	.byte A0,AS0,A0,AS0,A0,AS0,A0,AS0,A0,AS0
	.byte A0,AS0,A0,AS0,A0,AS0,A0,AS0,A0,AS0
	.byte A0,AS0,A0,AS0,A0,AS0,A0,AS0,A0,AS0
	.byte A0,AS0,A0,AS0,A0,D00

_default_TriangleGrowlTest_header:
	.byte 6
	.byte 150
	.byte 1
	.word NULL_pulse1
	.word NULL_pulse2
	.word _default_TriangleGrowlTest_triangle
	.word NULL_noise
	.word NULL_DMC

_default_TriangleGrowlTest_triangle:
	.word _default_TriangleGrowlTest_triangle_pattern0
_default_TriangleGrowlTest_triangle_pattern0:
	.byte NL4,INST|CONT|16,AS3,INST|15,INST|14,INST|13,INST|CONT|16,CS4,INST|15,INST|14
	.byte INST|13,INST|CONT|16,GS4,INST|15,INST|14,INST|13,INST|CONT|16,AS5,INST|15,INST|14
	.byte INST|13,D00

