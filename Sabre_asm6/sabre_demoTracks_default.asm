_default_MoodSwings_header:
	.db 3
	.db 150
	.db 22
	.dw _default_MoodSwings_pulse1
	.dw _default_MoodSwings_pulse2
	.dw _default_MoodSwings_triangle
	.dw _default_MoodSwings_noise
	.dw _default_MoodSwings_DMC

_default_MoodSwings_pulse1:
	.dw _default_MoodSwings_pulse1_pattern0
	.dw _default_MoodSwings_pulse1_pattern1
	.dw _default_MoodSwings_pulse1_pattern2
	.dw _default_MoodSwings_pulse1_pattern1
	.dw _default_MoodSwings_pulse1_pattern3
	.dw _default_MoodSwings_pulse1_pattern1
	.dw _default_MoodSwings_pulse1_pattern2
	.dw _default_MoodSwings_pulse1_pattern1
	.dw _default_MoodSwings_pulse1_pattern4
	.dw _default_MoodSwings_pulse1_pattern5
	.dw _default_MoodSwings_pulse1_pattern5
	.dw _default_MoodSwings_pulse1_pattern5
	.dw _default_MoodSwings_pulse1_pattern5
	.dw _default_MoodSwings_pulse1_pattern5
	.dw _default_MoodSwings_pulse1_pattern5
	.dw _default_MoodSwings_pulse1_pattern5
	.dw _default_MoodSwings_pulse1_pattern6
	.dw _default_MoodSwings_pulse1_pattern7
	.dw _default_MoodSwings_pulse1_pattern1
	.dw _default_MoodSwings_pulse1_pattern2
	.dw _default_MoodSwings_pulse1_pattern1
	.dw _default_MoodSwings_pulse1_pattern8
_default_MoodSwings_pulse1_pattern0:
	.db NL20,NUL,D00
_default_MoodSwings_pulse1_pattern1:
	.db NL6,INST|CONT|37,E1,NL4,INST|CONT|36,B3,NL2,INST|CONT|37,E2,NL6
	.db E1,NL4,INST|CONT|36,B3,NL2,B3,NL4,INST|CONT|37,D1,NL2
	.db D1,NL4,INST|CONT|36,A3,NL6,INST|CONT|37,D1,NL2,D2,NL4
	.db INST|CONT|36,A3,NL2,A3,D00
_default_MoodSwings_pulse1_pattern2:
	.db NL6,INST|CONT|37,CS1,NL4,INST|CONT|36,GS3,NL2,INST|CONT|37,CS2,NL6
	.db CS1,NL4,INST|CONT|36,GS3,NL2,GS3,NL4,INST|CONT|37,A0,NL2
	.db A0,NL4,INST|CONT|36,FS3,NL6,INST|CONT|37,C1,NL2,D2,NL4
	.db INST|CONT|36,A3,NL2,A3,D00
_default_MoodSwings_pulse1_pattern3:
	.db NL6,INST|CONT|37,CS1,NL4,INST|CONT|36,GS3,NL2,INST|CONT|37,CS2,NL4
	.db CS1,NL2,GS1,NL4,INST|CONT|36,GS3,NL8,INST|CONT|37,B0,NL18
	.db INST|SLNT,D00
_default_MoodSwings_pulse1_pattern4:
	.db NL6,INST|CONT|37,CS1,NL4,INST|CONT|36,GS3,NL2,INST|CONT|37,CS2,NL4
	.db CS1,NL2,GS1,NL4,INST|CONT|36,GS3,NL6,FXX,$04,INST|CONT|37,B0
	.db FXX,$05,NUL,NL4,FXX,$06,INST|CONT|22,DS3,FXX,$07,B2,NL2,FXX,$08
	.db FS2,NL1,FXX,$12,NUL,NL2,E2,NL1,FXX,$04,NUL,D00
_default_MoodSwings_pulse1_pattern5:
	.db NL1,INST|CONT|14,B4,INST|CONT|16,CS4,INST|CONT|14,AS4,INST|CONT|16,B4,INST|CONT|14
	.db FS4,INST|CONT|16,AS4,INST|CONT|14,CS4,INST|CONT|16,FS4,INST|CONT|13,B4,INST|CONT|16
	.db CS4,INST|CONT|13,AS4,INST|CONT|16,B4,INST|CONT|13,FS4,INST|CONT|16,AS4,INST|CONT|13
	.db CS4,INST|CONT|16,FS4,INST|CONT|12,B4,INST|CONT|16,CS4,INST|CONT|12,AS4,INST|CONT|16
	.db B4,INST|CONT|12,FS4,INST|CONT|16,AS4,INST|CONT|12,CS4,INST|CONT|16,FS4,INST|CONT|13
	.db B4,INST|CONT|16,CS4,INST|CONT|13,AS4,INST|CONT|16,B4,INST|CONT|13,FS4,INST|CONT|16
	.db AS4,INST|CONT|13,CS4,INST|CONT|16,FS4,D00
_default_MoodSwings_pulse1_pattern6:
	.db NL2,INST|CONT|9,CS4,CS4,NL4,INST|16,INST|CONT|6,FS1,NL2,INST|CONT|9
	.db CS4,CS4,NL4,INST|16,NL2,INST|CONT|6,FS1,D00
_default_MoodSwings_pulse1_pattern7:
	.db NL2,NUL,NL4,INST|CONT|38,FS3,NL6,FXX,$03,NUL,D00
_default_MoodSwings_pulse1_pattern8:
	.db NL6,INST|CONT|37,CS1,NL4,INST|CONT|36,GS3,NL2,INST|CONT|37,CS2,NL4
	.db CS1,NL2,GS1,NL4,INST|CONT|36,GS3,NL8,INST|CONT|37,B0,NL18
	.db INST|SLNT,BXX,$01

_default_MoodSwings_pulse2:
	.dw _default_MoodSwings_pulse2_pattern0
	.dw _default_MoodSwings_pulse2_pattern1
	.dw _default_MoodSwings_pulse2_pattern2
	.dw _default_MoodSwings_pulse2_pattern1
	.dw _default_MoodSwings_pulse2_pattern3
	.dw _default_MoodSwings_pulse2_pattern1
	.dw _default_MoodSwings_pulse2_pattern2
	.dw _default_MoodSwings_pulse2_pattern1
	.dw _default_MoodSwings_pulse2_pattern5
	.dw _default_MoodSwings_pulse2_pattern6
	.dw _default_MoodSwings_pulse2_pattern7
	.dw _default_MoodSwings_pulse2_pattern6
	.dw _default_MoodSwings_pulse2_pattern8
	.dw _default_MoodSwings_pulse2_pattern10
	.dw _default_MoodSwings_pulse2_pattern11
	.dw _default_MoodSwings_pulse2_pattern12
	.dw _default_MoodSwings_pulse2_pattern13
	.dw _default_MoodSwings_pulse2_pattern14
	.dw _default_MoodSwings_pulse2_pattern1
	.dw _default_MoodSwings_pulse2_pattern2
	.dw _default_MoodSwings_pulse2_pattern1
	.dw _default_MoodSwings_pulse2_pattern3
_default_MoodSwings_pulse2_pattern0:
	.db NL48,NUL,D00
_default_MoodSwings_pulse2_pattern1:
	.db NL4,INST|CONT|18,B3,INST|CONT|12,B3,INST|CONT|13,B3,NL6,INST|CONT|17,A3
	.db INST|CONT|11,GS3,NL2,INST|CONT|18,A3,INST|CONT|15,A3,INST|CONT|17,A3,NL4
	.db INST|CONT|11,GS3,E3,NL2,INST|15,INST|CONT|11,E3,NL4,FS3,NL2
	.db INST|12,D00
_default_MoodSwings_pulse2_pattern2:
	.db NL4,INST|CONT|18,GS3,NL2,INST|15,NL4,INST|11,NL2,INST|15,INST|CONT|18
	.db GS3,INST|CONT|13,GS3,NL4,INST|11,NL2,INST|13,NL4,INST|CONT|10,A3
	.db NL2,INST|13,INST|CONT|11,A3,NL4,GS3,INST|CONT|17,E3,NL2,INST|12
	.db INST|CONT|13,E3,NL4,INST|CONT|10,FS3,NL2,INST|12,D00
_default_MoodSwings_pulse2_pattern3:
	.db NL4,INST|CONT|18,GS3,NL2,INST|15,NL4,INST|11,NL2,INST|15,NL4
	.db INST|18,NL2,INST|CONT|17,A3,NL4,INST|CONT|12,GS3,INST|CONT|33,FS3,INST|CONT|15
	.db FS3,INST|CONT|16,FS3,NL14,INST|SLNT,D00
_default_MoodSwings_pulse2_pattern5:
	.db NL4,INST|CONT|18,GS3,NL2,INST|15,NL4,INST|11,NL2,INST|15,NL4
	.db INST|18,NL2,INST|CONT|17,A3,NL4,INST|CONT|12,GS3,INST|CONT|33,FS3,NL2
	.db INST|12,NL4,INST|CONT|17,E3,DS3,B2,FS2,NL2,E2,INST|CONT|19
	.db E2,D00
_default_MoodSwings_pulse2_pattern6:
	.db NL6,INST|CONT|19,E2,INST|CONT|13,E2,NL4,INST|14,NL6,INST|CONT|19,DS2
	.db INST|CONT|13,DS2,NL20,INST|14,D00
_default_MoodSwings_pulse2_pattern7:
	.db NL6,INST|CONT|19,AS1,INST|CONT|13,AS1,NL7,INST|CONT|19,B1,INST|CONT|13,B1
	.db NL22,INST|14,D00
_default_MoodSwings_pulse2_pattern8:
	.db NL6,INST|CONT|19,B2,INST|CONT|13,B2,NL8,INST|14,NL4,INST|19,AS2
	.db NL20,FS2,D00
_default_MoodSwings_pulse2_pattern10:
	.db NL6,INST|CONT|19,E2,INST|CONT|13,E2,INST|CONT|19,FS2,INST|CONT|13,FS2,NL4
	.db INST|14,NL20,INST|CONT|19,B2,D00
_default_MoodSwings_pulse2_pattern11:
	.db NL6,INST|CONT|19,AS2,INST|CONT|13,AS2,INST|CONT|19,B2,INST|CONT|13,B2,NL24
	.db INST|14,D00
_default_MoodSwings_pulse2_pattern12:
	.db NL1,INST|CONT|24,E2,INST|CONT|31,E2,INST|CONT|24,FS2,INST|CONT|31,E2,INST|CONT|24
	.db AS2,INST|CONT|31,FS2,INST|CONT|24,B2,INST|CONT|31,AS2,INST|CONT|24,FS2,INST|CONT|31
	.db B2,INST|CONT|24,AS2,INST|CONT|31,FS2,INST|CONT|24,B2,INST|CONT|31,AS2,INST|CONT|24
	.db CS3,INST|CONT|31,B2,INST|CONT|24,AS2,INST|CONT|31,CS3,INST|CONT|24,B2,INST|CONT|31
	.db AS2,INST|CONT|24,CS3,INST|CONT|31,B2,INST|CONT|24,DS3,INST|CONT|31,CS3,INST|CONT|24
	.db B2,INST|CONT|31,DS3,INST|CONT|24,CS3,INST|CONT|31,B2,INST|CONT|24,DS3,INST|CONT|31
	.db CS3,INST|CONT|24,GS3,NLC,17,INST|CONT|31,DS3,D00
_default_MoodSwings_pulse2_pattern13:
	.db NL2,INST|CONT|20,FS3,INST|CONT|24,FS3,NL6,INST|32,NL2,INST|CONT|6,FS1
	.db INST|CONT|20,FS3,INST|CONT|24,FS3,NL32,INST|32,D00
_default_MoodSwings_pulse2_pattern14:
	.db NL2,INST|CONT|17,FS3,INST|CONT|18,E4,INST|CONT|34,B3,NL4,INST|CONT|17,GS3
	.db NLC,38,AS3,D00

_default_MoodSwings_triangle:
	.dw _default_MoodSwings_triangle_pattern0
	.dw _default_MoodSwings_triangle_pattern1
	.dw _default_MoodSwings_triangle_pattern2
	.dw _default_MoodSwings_triangle_pattern1
	.dw _default_MoodSwings_triangle_pattern3
	.dw _default_MoodSwings_triangle_pattern1
	.dw _default_MoodSwings_triangle_pattern2
	.dw _default_MoodSwings_triangle_pattern1
	.dw _default_MoodSwings_triangle_pattern4
	.dw _default_MoodSwings_triangle_pattern5
	.dw _default_MoodSwings_triangle_pattern6
	.dw _default_MoodSwings_triangle_pattern5
	.dw _default_MoodSwings_triangle_pattern7
	.dw _default_MoodSwings_triangle_pattern8
	.dw _default_MoodSwings_triangle_pattern9
	.dw _default_MoodSwings_triangle_pattern10
	.dw _default_MoodSwings_triangle_pattern11
	.dw _default_MoodSwings_triangle_pattern12
	.dw _default_MoodSwings_triangle_pattern1
	.dw _default_MoodSwings_triangle_pattern2
	.dw _default_MoodSwings_triangle_pattern1
	.dw _default_MoodSwings_triangle_pattern3
_default_MoodSwings_triangle_pattern0:
	.db NL48,NUL,D00
_default_MoodSwings_triangle_pattern1:
	.db NL5,INST|CONT|9,E3,INST|CONT|12,E3,NL2,INST|CONT|10,B3,NL4,INST|CONT|9
	.db A3,GS3,NL2,INST|SLNT,INST|CONT|9,FS3,NL10,INST|12,NL2,INST|CONT|10
	.db E4,NL4,INST|CONT|9,DS4,CS4,NL2,INST|SLNT,INST|CONT|9,B3,D00
_default_MoodSwings_triangle_pattern2:
	.db NL6,INST|CONT|12,B3,INST|CONT|9,E3,NL10,INST|12,NL4,INST|CONT|10,A3
	.db NL2,INST|SLNT,INST|CONT|9,A3,GS3,INST|SLNT,INST|CONT|9,GS3,NL4,E3
	.db FS3,INST|CONT|12,FS3,D00
_default_MoodSwings_triangle_pattern3:
	.db NL16,INST|CONT|12,B3,NL2,INST|CONT|10,A3,NL4,INST|CONT|9,GS3,NL6
	.db FS3,NL20,INST|SLNT,D00
_default_MoodSwings_triangle_pattern4:
	.db NL6,INST|CONT|12,B3,INST|CONT|10,E4,NL10,INST|12,NL2,INST|CONT|9,B1
	.db NL16,INST|12,NL4,INST|CONT|10,B2,INST|CONT|12,B2,D00
_default_MoodSwings_triangle_pattern5:
	.db NL2,INST|CONT|10,B3,NL4,INST|12,NL6,FS4,NL4,B3,NL6
	.db AS3,NL2,INST|CONT|10,GS4,NL24,INST|12,D00
_default_MoodSwings_triangle_pattern6:
	.db NL6,INST|CONT|11,FS4,INST|CONT|10,CS4,NL12,INST|CONT|33,B3,NL4,INST|CONT|12
	.db AS3,NL20,B3,D00
_default_MoodSwings_triangle_pattern7:
	.db NL6,INST|CONT|11,FS4,NL2,INST|CONT|10,B4,NL4,INST|12,NL2,INST|CONT|33
	.db FS4,NLC,34,INST|12,D00
_default_MoodSwings_triangle_pattern8:
	.db NL6,INST|CONT|10,GS4,INST|CONT|35,E4,NL8,INST|CONT|10,FS4,NL4,INST|CONT|12
	.db E4,DS4,NL20,CS4,D00
_default_MoodSwings_triangle_pattern9:
	.db NL6,INST|CONT|12,AS3,INST|CONT|33,FS3,NL4,INST|CONT|10,B3,NL8,INST|12
	.db NL4,CS4,NL20,DS4,D00
_default_MoodSwings_triangle_pattern10:
	.db NL2,INST|CONT|10,E4,NL6,INST|12,NL4,DS4,NL8,B3,NL4
	.db FS3,NL24,INST|CONT|10,GS4,D00
_default_MoodSwings_triangle_pattern11:
	.db NL2,INST|CONT|33,FS4,NL4,INST|12,NL6,INST|SLNT,NL2,INST|33,NL4
	.db INST|12,NL30,INST|SLNT,D00
_default_MoodSwings_triangle_pattern12:
	.db NL6,NUL,NLC,42,INST|CONT|12,FS3,D00

_default_MoodSwings_noise:
	.dw _default_MoodSwings_noise_pattern0
	.dw _default_MoodSwings_noise_pattern1
	.dw _default_MoodSwings_noise_pattern2
	.dw _default_MoodSwings_noise_pattern1
	.dw _default_MoodSwings_noise_pattern3
	.dw _default_MoodSwings_noise_pattern1
	.dw _default_MoodSwings_noise_pattern2
	.dw _default_MoodSwings_noise_pattern1
	.dw _default_MoodSwings_noise_pattern4
	.dw _default_MoodSwings_noise_pattern5
	.dw _default_MoodSwings_noise_pattern6
	.dw _default_MoodSwings_noise_pattern5
	.dw _default_MoodSwings_noise_pattern6
	.dw _default_MoodSwings_noise_pattern7
	.dw _default_MoodSwings_noise_pattern7
	.dw _default_MoodSwings_noise_pattern8
	.dw _default_MoodSwings_noise_pattern9
	.dw _default_MoodSwings_noise_pattern10
	.dw _default_MoodSwings_noise_pattern1
	.dw _default_MoodSwings_noise_pattern2
	.dw _default_MoodSwings_noise_pattern1
	.dw _default_MoodSwings_noise_pattern3
_default_MoodSwings_noise_pattern0:
	.db NL2,INST|CONT|5,$E,NL4,$F,NL2,$E,NL10,INST|CONT|6,$D
	.db NL30,$D,D00
_default_MoodSwings_noise_pattern1:
	.db NL6,INST|CONT|4,$C,NL4,INST|CONT|5,$E,NL2,$F,NL6,INST|CONT|6
	.db $D,NL4,INST|CONT|5,$E,NL2,$F,NL6,INST|CONT|4,$C,NL4
	.db INST|CONT|5,$E,NL2,$F,NL6,INST|CONT|6,$D,NL4,INST|CONT|5,$E
	.db NL2,$F,D00
_default_MoodSwings_noise_pattern2:
	.db NL6,INST|CONT|4,$C,NL4,INST|CONT|5,$E,NL2,$F,NL6,INST|CONT|6
	.db $D,NL4,INST|CONT|5,$E,NL2,$F,NL6,INST|CONT|4,$C,NL4
	.db INST|CONT|5,$E,NL2,$F,NL6,INST|CONT|6,$D,NL2,INST|CONT|4,$C
	.db $D,$C,D00
_default_MoodSwings_noise_pattern3:
	.db NL6,INST|CONT|4,$C,NL4,INST|CONT|5,$E,NL2,$F,NL6,INST|CONT|6
	.db $D,NL4,INST|CONT|5,$E,NL12,INST|CONT|6,$D,NL2,INST|CONT|4,$C
	.db NL4,INST|CONT|6,$D,NL2,INST|CONT|5,$E,NL4,INST|CONT|6,$D,NL2
	.db INST|CONT|4,$C,D00
_default_MoodSwings_noise_pattern4:
	.db NL6,INST|CONT|4,$C,NL4,INST|CONT|5,$E,NL2,$F,NL6,INST|CONT|6
	.db $D,NL4,INST|CONT|5,$E,NL18,INST|CONT|7,$D,NL8,$D,D00
_default_MoodSwings_noise_pattern5:
	.db NL8,INST|CONT|6,$E,INST|CONT|8,$F,INST|CONT|6,$E,NL24,INST|CONT|8,$F
	.db D00
_default_MoodSwings_noise_pattern6:
	.db NL8,INST|CONT|6,$E,NL4,INST|CONT|8,$F,INST|CONT|5,$F,NL8,INST|CONT|6
	.db $E,NL24,INST|CONT|8,$F,D00
_default_MoodSwings_noise_pattern7:
	.db NL4,INST|CONT|6,$E,INST|CONT|8,$F,INST|CONT|6,$E,INST|CONT|8,$F,INST|CONT|6
	.db $E,INST|CONT|8,$F,INST|CONT|6,$E,NL20,INST|CONT|8,$F,D00
_default_MoodSwings_noise_pattern8:
	.db NL4,INST|CONT|6,$E,NL2,INST|CONT|4,$C,INST|CONT|5,$F,NL4,INST|CONT|6
	.db $E,NL2,INST|CONT|4,$C,INST|CONT|5,$F,NL4,INST|CONT|6,$E,NL2
	.db INST|CONT|4,$C,INST|CONT|5,$F,NL4,INST|CONT|6,$E,NL2,INST|CONT|4,$C
	.db NL18,$C,D00
_default_MoodSwings_noise_pattern9:
	.db NL2,INST|CONT|6,$D,NL6,$D,NL4,INST|SLNT,NL2,INST|6,NL6
	.db $D,NL28,INST|SLNT,D00
_default_MoodSwings_noise_pattern10:
	.db NL2,NUL,INST|CONT|5,$F,INST|CONT|6,$D,NL4,$D,NLC,38
	.db $D,D00

_default_MoodSwings_DMC:
	.dw _default_MoodSwings_DMC_pattern0
	.dw _default_MoodSwings_DMC_pattern1
	.dw _default_MoodSwings_DMC_pattern2
	.dw _default_MoodSwings_DMC_pattern1
	.dw _default_MoodSwings_DMC_pattern3
	.dw _default_MoodSwings_DMC_pattern1
	.dw _default_MoodSwings_DMC_pattern2
	.dw _default_MoodSwings_DMC_pattern1
	.dw _default_MoodSwings_DMC_pattern4
	.dw _default_MoodSwings_DMC_pattern5
	.dw _default_MoodSwings_DMC_pattern6
	.dw _default_MoodSwings_DMC_pattern5
	.dw _default_MoodSwings_DMC_pattern7
	.dw _default_MoodSwings_DMC_pattern8
	.dw _default_MoodSwings_DMC_pattern9
	.dw _default_MoodSwings_DMC_pattern10
	.dw _default_MoodSwings_DMC_pattern11
	.dw _default_MoodSwings_DMC_pattern12
	.dw _default_MoodSwings_DMC_pattern1
	.dw _default_MoodSwings_DMC_pattern2
	.dw _default_MoodSwings_DMC_pattern1
	.dw _default_MoodSwings_DMC_pattern3
_default_MoodSwings_DMC_pattern0:
	.db NL8,NUL,NL4,FS7,NL2,D7,NL4,D7,NL30,FS7
	.db D00
_default_MoodSwings_DMC_pattern1:
	.db NL6,AS7,NL2,D7,AS0,AS7,NL6,FS7,NL4,A7
	.db NL6,AS7,NL2,D7,D7,AS0,AS7,NL6,FS7,NL4
	.db A7,NL2,AS7,D00
_default_MoodSwings_DMC_pattern2:
	.db NL6,AS7,NL2,D7,AS0,AS7,NL6,FS7,NL4,A7
	.db NL6,AS7,NL2,D7,NL4,D7,NL2,AS7,NL6,FS7
	.db NL2,A7,AS7,F7,D00
_default_MoodSwings_DMC_pattern3:
	.db NL6,AS7,NL4,D7,NL2,AS7,NL4,FS7,NL2,D7
	.db NL4,A7,A7,NL8,AS0,NL2,A0,D7,D7,D7
	.db NL4,FS7,NL2,AS7,D00
_default_MoodSwings_DMC_pattern4:
	.db NL6,AS7,NL4,D7,NL2,AS7,NL4,FS7,NL2,D7
	.db NL4,A7,NL18,A7,NL8,A7,D00
_default_MoodSwings_DMC_pattern5:
	.db NL4,NUL,NL6,B3,FS4,NL4,B3,NL6,AS3,NL22
	.db GS4,D00
_default_MoodSwings_DMC_pattern6:
	.db NL4,NUL,NL6,FS4,CS4,NL12,B3,NL20,AS3,D00
_default_MoodSwings_DMC_pattern7:
	.db NL4,NUL,NL6,FS4,B4,NL32,FS4,D00
_default_MoodSwings_DMC_pattern8:
	.db NL16,B2,NL32,CS3,D00
_default_MoodSwings_DMC_pattern9:
	.db NL16,AS2,NL32,FS2,D00
_default_MoodSwings_DMC_pattern10:
	.db NL16,E2,NL8,FS2,NL24,GS2,D00
_default_MoodSwings_DMC_pattern11:
	.db NL2,A7,A7,FS4,A0,NL4,FS1,NL2,A7,A7
	.db FS4,A0,NL28,FS1,D00
_default_MoodSwings_DMC_pattern12:
	.db NL1,AS7,AS7,NL2,AS7,FS7,NL4,FS7,NLC,38
	.db FS7,D00

_default_Intermisison_header:
	.db 7
	.db 150
	.db 2
	.dw _default_Intermisison_pulse1
	.dw _default_Intermisison_pulse2
	.dw _default_Intermisison_triangle
	.dw _default_Intermisison_noise
	.dw _default_Intermisison_DMC

_default_Intermisison_pulse1:
	.dw _default_Intermisison_pulse1_pattern0
	.dw _default_Intermisison_pulse1_pattern0
_default_Intermisison_pulse1_pattern0:
	.db NL2,INST|CONT|14,AS2,INST|CONT|13,D2,DS2,AS2,INST|CONT|14,AS2,INST|CONT|13
	.db DS2,F2,AS2,INST|CONT|14,AS2,INST|CONT|13,D2,F2,AS2,INST|CONT|14
	.db AS2,INST|CONT|13,DS2,F2,AS2,D00

_default_Intermisison_pulse2:
	.dw _default_Intermisison_pulse2_pattern0
	.dw _default_Intermisison_pulse2_pattern0
_default_Intermisison_pulse2_pattern0:
	.db NL1,NUL,NL2,INST|CONT|15,AS2,AS2,D2,DS2,AS2,AS2
	.db DS2,F2,AS2,AS2,D2,F2,AS2,AS2,DS2,NL1
	.db F2,D00

_default_Intermisison_triangle:
	.dw _default_Intermisison_triangle_pattern0
	.dw _default_Intermisison_triangle_pattern1
_default_Intermisison_triangle_pattern0:
	.db NL6,INST|CONT|9,D2,NL10,DS2,NL6,F2,DS2,NL2,A2
	.db AS2,D00
_default_Intermisison_triangle_pattern1:
	.db NL6,INST|CONT|9,D2,NL2,DS2,G1,NL4,AS1,NL2,DS2
	.db D2,G1,AS1,NL4,C2,NL2,F1,NL4,AS1,D00

_default_Intermisison_noise:
	.dw _default_Intermisison_noise_pattern0
	.dw _default_Intermisison_noise_pattern0
_default_Intermisison_noise_pattern0:
	.db NL4,INST|CONT|6,$F,NL2,INST|5,NL4,$D,NL2,$F,$D
	.db $F,NL4,INST|6,NL2,INST|5,NL4,$D,NL2,$F,$D
	.db $F,D00

_default_Intermisison_DMC:
	.dw _default_Intermisison_DMC_pattern0
	.dw _default_Intermisison_DMC_pattern0
_default_Intermisison_DMC_pattern0:
	.db NL6,AS7,NL8,E7,NL2,AS7,NL6,AS7,E7,NL2
	.db AS7,A7,D00

_default_TriangleEchoTest_header:
	.db 6
	.db 150
	.db 16
	.dw _default_TriangleEchoTest_pulse1
	.dw NULL_pulse2
	.dw _default_TriangleEchoTest_triangle
	.dw NULL_noise
	.dw _default_TriangleEchoTest_DMC

_default_TriangleEchoTest_pulse1:
	.dw _default_TriangleEchoTest_pulse1_pattern0
	.dw _default_TriangleEchoTest_pulse1_pattern0
	.dw _default_TriangleEchoTest_pulse1_pattern0
	.dw _default_TriangleEchoTest_pulse1_pattern0
	.dw _default_TriangleEchoTest_pulse1_pattern1
	.dw _default_TriangleEchoTest_pulse1_pattern2
	.dw _default_TriangleEchoTest_pulse1_pattern3
	.dw _default_TriangleEchoTest_pulse1_pattern4
	.dw _default_TriangleEchoTest_pulse1_pattern5
	.dw _default_TriangleEchoTest_pulse1_pattern4
	.dw _default_TriangleEchoTest_pulse1_pattern3
	.dw _default_TriangleEchoTest_pulse1_pattern2
	.dw _default_TriangleEchoTest_pulse1_pattern1
	.dw _default_TriangleEchoTest_pulse1_pattern0
	.dw _default_TriangleEchoTest_pulse1_pattern6
	.dw _default_TriangleEchoTest_pulse1_pattern7
_default_TriangleEchoTest_pulse1_pattern0:
	.db NL64,FXX,$06,NUL,D00
_default_TriangleEchoTest_pulse1_pattern1:
	.db NL64,FXX,$05,NUL,D00
_default_TriangleEchoTest_pulse1_pattern2:
	.db NL64,FXX,$04,NUL,D00
_default_TriangleEchoTest_pulse1_pattern3:
	.db NL64,FXX,$03,NUL,D00
_default_TriangleEchoTest_pulse1_pattern4:
	.db NL64,FXX,$02,NUL,D00
_default_TriangleEchoTest_pulse1_pattern5:
	.db NL64,FXX,$01,NUL,D00
_default_TriangleEchoTest_pulse1_pattern6:
	.db NL16,FXX,$07,NUL,FXX,$08,NUL,FXX,$09,NUL,FXX,$0A,NUL,D00
_default_TriangleEchoTest_pulse1_pattern7:
	.db NL8,FXX,$0B,NUL,FXX,$0C,NUL,FXX,$0D,NUL,FXX,$0E,NUL,NL4
	.db FXX,$0F,NUL,FXX,$10,NUL,FXX,$11,NUL,FXX,$12,NUL,NL2,FXX,$13
	.db NUL,FXX,$14,NUL,FXX,$15,NUL,FXX,$16,NUL,FXX,$17,NUL,FXX,$18
	.db NUL,FXX,$19,NUL,FXX,$1A,NUL,D00

_default_TriangleEchoTest_triangle:
	.dw _default_TriangleEchoTest_triangle_pattern0
	.dw _default_TriangleEchoTest_triangle_pattern1
	.dw _default_TriangleEchoTest_triangle_pattern2
	.dw _default_TriangleEchoTest_triangle_pattern3
	.dw _default_TriangleEchoTest_triangle_pattern3
	.dw _default_TriangleEchoTest_triangle_pattern3
	.dw _default_TriangleEchoTest_triangle_pattern3
	.dw _default_TriangleEchoTest_triangle_pattern3
	.dw _default_TriangleEchoTest_triangle_pattern3
	.dw _default_TriangleEchoTest_triangle_pattern3
	.dw _default_TriangleEchoTest_triangle_pattern3
	.dw _default_TriangleEchoTest_triangle_pattern3
	.dw _default_TriangleEchoTest_triangle_pattern3
	.dw _default_TriangleEchoTest_triangle_pattern3
	.dw _default_TriangleEchoTest_triangle_pattern3
	.dw _default_TriangleEchoTest_triangle_pattern3
_default_TriangleEchoTest_triangle_pattern0:
	.db NL2,INST|CONT|12,AS3,DS4,AS4,FS4,AS3,DS4,AS4,FS4
	.db AS3,DS4,AS4,FS4,AS3,DS4,AS4,FS4,AS3,CS4
	.db GS4,E4,AS3,CS4,GS4,E4,AS3,CS4,GS4,E4
	.db AS3,CS4,GS4,E4,D00
_default_TriangleEchoTest_triangle_pattern1:
	.db NL2,INST|CONT|12,AS3,DS4,AS4,FS4,AS3,DS4,AS4,FS4
	.db AS3,DS4,AS4,FS4,AS3,DS4,AS4,FS4,AS3,CS4
	.db GS4,E4,AS3,CS4,GS4,E4,AS3,CS4,GS4,E4
	.db AS3,CS4,GS4,E4,D00
_default_TriangleEchoTest_triangle_pattern2:
	.db NL1,INST|CONT|12,AS3,E4,DS4,AS3,AS4,DS4,FS4,AS4
	.db AS3,FS4,DS4,AS3,AS4,DS4,FS4,AS4,AS3,FS4
	.db DS4,AS3,AS4,DS4,FS4,AS4,AS3,FS4,DS4,AS3
	.db AS4,DS4,FS4,AS4,AS3,FS4,CS4,AS3,GS4,CS4
	.db E4,GS4,AS3,E4,CS4,AS3,GS4,CS4,E4,GS4
	.db AS3,E4,CS4,AS3,GS4,CS4,E4,GS4,AS3,E4
	.db CS4,AS3,GS4,CS4,E4,GS4,D00
_default_TriangleEchoTest_triangle_pattern3:
	.db NL1,INST|CONT|9,AS3,INST|CONT|12,E4,INST|CONT|9,DS4,INST|CONT|12,AS3,INST|CONT|9
	.db AS4,INST|CONT|12,DS4,INST|CONT|9,FS4,INST|CONT|12,AS4,INST|CONT|9,AS3,INST|CONT|12
	.db FS4,INST|CONT|9,DS4,INST|CONT|12,AS3,INST|CONT|9,AS4,INST|CONT|12,DS4,INST|CONT|9
	.db FS4,INST|CONT|12,AS4,INST|CONT|9,AS3,INST|CONT|12,FS4,INST|CONT|9,DS4,INST|CONT|12
	.db AS3,INST|CONT|9,AS4,INST|CONT|12,DS4,INST|CONT|9,FS4,INST|CONT|12,AS4,INST|CONT|9
	.db AS3,INST|CONT|12,FS4,INST|CONT|9,DS4,INST|CONT|12,AS3,INST|CONT|9,AS4,INST|CONT|12
	.db DS4,INST|CONT|9,FS4,INST|CONT|12,AS4,INST|CONT|9,AS3,INST|CONT|12,FS4,INST|CONT|9
	.db CS4,INST|CONT|12,AS3,INST|CONT|9,GS4,INST|CONT|12,CS4,INST|CONT|9,E4,INST|CONT|12
	.db GS4,INST|CONT|9,AS3,INST|CONT|12,E4,INST|CONT|9,CS4,INST|CONT|12,AS3,INST|CONT|9
	.db GS4,INST|CONT|12,CS4,INST|CONT|9,E4,INST|CONT|12,GS4,INST|CONT|9,AS3,INST|CONT|12
	.db E4,INST|CONT|9,CS4,INST|CONT|12,AS3,INST|CONT|9,GS4,INST|CONT|12,CS4,INST|CONT|9
	.db E4,INST|CONT|12,GS4,INST|CONT|9,AS3,INST|CONT|12,E4,INST|CONT|9,CS4,INST|CONT|12
	.db AS3,INST|CONT|9,GS4,INST|CONT|12,CS4,INST|CONT|9,E4,INST|CONT|12,GS4,D00

_default_TriangleEchoTest_DMC:
	.dw _default_TriangleEchoTest_DMC_pattern0
	.dw _default_TriangleEchoTest_DMC_pattern1
	.dw _default_TriangleEchoTest_DMC_pattern0
	.dw _default_TriangleEchoTest_DMC_pattern0
	.dw _default_TriangleEchoTest_DMC_pattern0
	.dw _default_TriangleEchoTest_DMC_pattern0
	.dw _default_TriangleEchoTest_DMC_pattern0
	.dw _default_TriangleEchoTest_DMC_pattern0
	.dw _default_TriangleEchoTest_DMC_pattern0
	.dw _default_TriangleEchoTest_DMC_pattern0
	.dw _default_TriangleEchoTest_DMC_pattern0
	.dw _default_TriangleEchoTest_DMC_pattern0
	.dw _default_TriangleEchoTest_DMC_pattern0
	.dw _default_TriangleEchoTest_DMC_pattern0
	.dw _default_TriangleEchoTest_DMC_pattern0
	.dw _default_TriangleEchoTest_DMC_pattern0
_default_TriangleEchoTest_DMC_pattern0:
	.db NL1,A0,AS0,A0,AS0,A0,AS0,A0,AS0,A0
	.db AS0,A0,AS0,A0,AS0,A0,AS0,A0,AS0,A0
	.db AS0,A0,AS0,A0,AS0,A0,AS0,A0,AS0,A0
	.db AS0,A0,AS0,A0,AS0,A0,AS0,A0,AS0,A0
	.db AS0,A0,AS0,A0,AS0,A0,AS0,A0,AS0,A0
	.db AS0,A0,AS0,A0,AS0,A0,AS0,A0,AS0,A0
	.db AS0,A0,AS0,A0,AS0,D00
_default_TriangleEchoTest_DMC_pattern1:
	.db NL1,AS0,A0,AS0,A0,AS0,A0,AS0,A0,AS0
	.db A0,AS0,A0,AS0,A0,AS0,A0,AS0,A0,AS0
	.db A0,AS0,A0,AS0,A0,AS0,A0,AS0,A0,AS0
	.db A0,AS0,A0,AS0,A0,AS0,A0,AS0,A0,AS0
	.db A0,AS0,A0,AS0,A0,AS0,A0,AS0,A0,AS0
	.db A0,AS0,A0,AS0,A0,AS0,A0,AS0,A0,AS0
	.db A0,AS0,A0,AS0,A0,D00

