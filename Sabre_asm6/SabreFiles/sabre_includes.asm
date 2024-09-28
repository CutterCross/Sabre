;;;; SABRE constants ;;;;

;;;; Driver / Replayer build flags - comment out to disable
;UNOFFICIAL_OPS = 1
;BANKSWITCH_TRACKS = 1
SFX_FLUSH = 1
LINEAR_COUNTER_TRILL = 1
MANUALLY_CLOCK_APU = 1
ADJ_REGION_TEMPO_TRACK = 1
ADJ_REGION_TEMPO_SFX = 1

;;;; Sound region constants
REGION_NTSC     = 0
REGION_PAL      = 1
REGION_DENDY    = 2
REGION_TICK_NTSC_DENDY  = 150
REGION_TICK_PAL = 125

;;;; Channel number constants 
CHANNEL_TRACK_PULSE1    = 0
CHANNEL_TRACK_PULSE2    = 2
CHANNEL_TRACK_TRIANGLE  = 4
CHANNEL_TRACK_NOISE     = 6
CHANNEL_TRACK_DMC       = 8

CHANNEL_SFX_PULSE1      = 1
CHANNEL_SFX_PULSE2      = 3
CHANNEL_SFX_TRIANGLE    = 5
CHANNEL_SFX_NOISE       = 7

;;;; Notes / periods
A0  = 0
AS0 = 1
B0  = 2
C1  = 3
CS1 = 4
D1  = 5
DS1 = 6
E1  = 7
F1  = 8
FS1 = 9
G1  = 10
GS1 = 11
A1  = 12
AS1 = 13
B1  = 14
C2  = 15
CS2 = 16
D2  = 17
DS2 = 18
E2  = 19
F2  = 20
FS2 = 21
G2  = 22
GS2 = 23
A2  = 24
AS2 = 25
B2  = 26
C3  = 27
CS3 = 28
D3  = 29
DS3 = 30
E3  = 31
F3  = 32
FS3 = 33
G3  = 34
GS3 = 35
A3  = 36
AS3 = 37
B3  = 38
C4  = 39
CS4 = 40
D4  = 41
DS4 = 42
E4  = 43
F4  = 44
FS4 = 45
G4  = 46
GS4 = 47
A4  = 48
AS4 = 49
B4  = 50
C5  = 51
CS5 = 52
D5  = 53
DS5 = 54
E5  = 55
F5  = 56
FS5 = 57
G5  = 58
GS5 = 59
A5  = 60
AS5 = 61
B5  = 62
C6  = 63
CS6 = 64
D6  = 65
DS6 = 66
E6  = 67
F6  = 68
FS6 = 69
G6  = 70
GS6 = 71
A6  = 72
AS6 = 73
B6  = 74
C7  = 75
CS7 = 76
D7  = 77
DS7 = 78
E7  = 79
F7  = 80
FS7 = 81
G7  = 82
GS7 = 83
A7  = 84
AS7 = 85
B7  = 86

NOTE_CEILING        = 87
NOTE_LENGTHS_START  = 97
;;;;;;;;;;;;;;;;;;;;

;;;; Control instructions
D00         = 87    ;; End of note pattern [Return and jump to next pattern]
BXX         = 88    ;; End of note pattern, pattern value to jump to
C00         = 89    ;; Terminate track
NLC         = 90    ;; Note Length [Custom], length value
FXX         = 91	;; Change Speed, speed value
ZXX         = 92    ;; Set DMC Line Level [$4011], value
NUL         = 93    ;; Null note value [Skip to processing envelopes]
END_SFX     = 94    ;; End SFX playback [Restore current channel]

;;;; Instruments [64 Max]
INST        = 128   ;; Bitwise OR | with instrument index value [0-63]
CONT        = 64    ;; Bitwise OR | with instrument index value [0-63]
                    ;; - Process next byte
SLNT        = 0     ;; Silence note

;;;; Envelope constants
ENV_LOOP    = 128   ;; Jump to Envelope Loop Point, Loop point value

;;;; Channel Header Constants
NULL_pulse1     = 0 ;; Track doesn't use pulse 1
NULL_pulse2     = 0 ;; Track doesn't use pulse 2
NULL_triangle   = 0 ;; Track doesn't use triangle
NULL_noise      = 0 ;; Track doesn't use noise
NULL_DMC        = 0 ;; Track doesn't use DMC
;;;;;;;;;;;;;;;;;;;;

;;;; Common Note Lengths [FT rows] 
NL1         = 97
NL2         = 98
NL3         = 99
NL4         = 100
NL5         = 101
NL6         = 102
NL7         = 103
NL8         = 104
NL9         = 105
NL10        = 106
NL11        = 107
NL12        = 108
NL13        = 109
NL14        = 110
NL15        = 111
NL16        = 112
;;;;
NL18        = 113
NL20        = 114
NL22        = 115
NL24        = 116
NL26        = 117
NL28        = 118
NL30        = 119
NL32        = 120
;;;;
NL36        = 121
NL40        = 122
;;;;
NL48        = 123
NL64        = 124
NL96        = 125
NL128       = 126
;;;;
NL256       = 127
;;;;;;;;;;;;;;;;;;;;
