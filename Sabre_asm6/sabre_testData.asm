;;;; SABRE MOCKUP DATA ;;;;

;;;; Static bank data ;;;;
sabre_maxTracks:
	.db 2
sabre_maxSFX:
	.db 0

;;;; Track pointers + PRG bank number
trackHeaderTable_lo:
	.db <_Intermission1_header, <_testSong0_header
trackHeaderTable_hi:
	.db >_Intermission1_header, >_testSong0_header
trackTable_PRGbank:
	.db $00,$00

;;;; SFX pointers + PRG bank number 
sfxHeaderTable_lo:
	.db <_sfx_error_header, <_sfx_downSlide_header
sfxHeaderTable_hi:
	.db >_sfx_error_header, >_sfx_downSlide_header

;;;; All envelopes used by each instrument
env0:
	.db 0,ENV_LOOP,0
env1:
	.db 12,11,7,6,5,4,4,3,3,2,2,2,1,1,0,ENV_LOOP,14
env2:
	.db 64,ENV_LOOP,0
env3:
	.db 4,ENV_LOOP,0
env4:
	.db 3,ENV_LOOP,0
env5:
	.db 2,ENV_LOOP,0
env6:
	.db 1,1,0,0,-1,-1,-1,-1,0,0,1,1,ENV_LOOP,0
env7:
	.db 8,ENV_LOOP,0
env8:
	.db 12,0,ENV_LOOP,1
env9:
	.db 8,7,6,3,2,1,0,ENV_LOOP,6 
env10:
	.db 8,7,6,6,5,5,5,5,4,4,4,4,4,3,3,3,3,3,2,2,2,2,2,2,1,ENV_LOOP,24
env11:
	.db 24,ENV_LOOP,0

;;;; All instruments
instrumentHeaderTable:
	.dw inst_silent
	.dw inst_test0,inst_V02_4_Vib,inst_V02_3_Vib,inst_V02_2_Vib
	.dw inst_TriBlip_Hold,inst_HiHatShort,inst_HiHatLong,inst_V00_8
	.dw inst_V00_8_SD,inst_V00_8_arpTest
	
;;;; Starting addresses for each DPCM sample [$4012] 
dpcm_sampleAddressTable:
  .db <(dpcm_sample_00_17byte_dmc >> 6)
  .db <(dpcm_sample_FF_17byte_dmc >> 6)
  .db <(dpcm_sample_Kick20Drum1_dmc >> 6)
  .db <(dpcm_sample_SnareDrum2_dmc >> 6)

;;;; Maps a sample index to each FT note
dpcm_noteToSampleTable:
	.db $00,$01,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
  	.db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
  	.db $ff,$ff,$ff,$02,$02,$02,$02,$02,$02,$02,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
  	.db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$03,$03,$03,$03,$03,$03,$03,$03

;;;; Maps a sample playback rate and loop flag to each FT note [$4010]
dpcm_noteToSampleRateAndFlags:
	.db $00,$00,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
  	.db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
  	.db $ff,$ff,$ff,$0f,$0e,$0c,$0a,$08,$04,$00,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
  	.db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$0f,$0e,$0d,$0c,$0b,$0a,$09,$08

;;;; Maps a sample length to a each FT note	[$4013]
dpcm_noteToSampleLength:
	.db $01,$01,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
  	.db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
  	.db $ff,$ff,$ff,$19,$19,$19,$19,$19,$19,$19,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
  	.db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$19,$19,$19,$19,$19,$19,$19,$19

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

inst_silent:
	.dw env0	;; Volume
	.dw env0	;; Arpeggio
	.dw env0	;; Pitch
	.dw env0	;; Duty
inst_test0:
	.dw env1	;; Volume
	.dw env0	;; Arpeggio
	.dw env0	;; Pitch
	.dw env2	;; Duty
inst_V02_4_Vib:
	.dw env3	;; Volume
	.dw env0	;; Arpeggio
	.dw env6	;; Pitch
	.dw env2	;; Duty
inst_V02_3_Vib:
	.dw env4	;; Volume
	.dw env0	;; Arpeggio
	.dw env6	;; Pitch
	.dw env2	;; Duty
inst_V02_2_Vib:
	.dw env5	;; Volume
	.dw env0	;; Arpeggio
	.dw env6	;; Pitch
	.dw env2	;; Duty
inst_TriBlip_Hold:
	.dw env7	;; Volume
	.dw env8	;; Arpeggio
	.dw env6	;; Pitch
	.dw env2	;; Duty
inst_HiHatShort:
	.dw env9	;; Volume
	.dw env0	;; Arpeggio
	.dw env0	;; Pitch
	.dw env2	;; Duty
inst_HiHatLong:
	.dw env10	;; Volume
	.dw env0	;; Arpeggio
	.dw env0	;; Pitch
	.dw env2	;; Duty
inst_V00_8:
	.dw env7	;; Volume
	.dw env0	;; Arpeggio
	.dw env0	;; Pitch
	.dw env0	;; Duty
inst_V00_8_SD:
	.dw env7	;; Volume
	.dw env0	;; Arpeggio
	.dw env11	;; Pitch
	.dw env0	;; Duty
inst_V00_8_arpTest:
	.dw env7	;; Volume
	.dw env6	;; Arpeggio
	.dw env0	;; Pitch
	.dw env0	;; Duty
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

_sfx_error_header:
	.db 5					;; Speed [frames in-between rows]
	.dw NULL_pulse1
	.dw _sfx_error_pulse2
	.dw NULL_triangle
	.dw NULL_noise 
_sfx_error_pulse2:
	.db NL2,INST|CONT|7,B1,NL4,FS1,END_SFX

_sfx_downSlide_header:
	.db 6					;; Speed [frames in-between rows]
	.dw _sfx_downSlide_pulse1
	.dw _sfx_downSlide_pulse2
	.dw _sfx_downSlide_triangle
	.dw _sfx_downSlide_noise
_sfx_downSlide_pulse1:
	.db NL8,INST|CONT|8,DS3,NL4,INST|9,END_SFX
_sfx_downSlide_pulse2:
	.db NL2,NUL,NL6,INST|CONT|8,GS3,NL5,INST|9,END_SFX
_sfx_downSlide_triangle:
	.db NL4,NUL,NL4,INST|CONT|8,AS4,NL6,INST|9,END_SFX 
_sfx_downSlide_noise:
	.db NL7,NUL,INST|CONT|7,$8^$F,END_SFX

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;; Dynamic track data [any PRG bank] ;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

_Intermission1_header:
	.db 7					;; Speed [frames in-between rows]
	.db 2					;; Total FT frames
	.dw _Intermission1_pulse1
	.dw _Intermission1_pulse2
	.dw _Intermission1_triangle
	.dw _Intermission1_noise 
	.dw _Intermission1_dmc

_Intermission1_pulse1:
	.dw _Intermission1_pulse1_pattern0
	.dw _Intermission1_pulse1_pattern0
_Intermission1_pulse1_pattern0:
	.db NL2,INST|CONT|3,AS2,INST|CONT|2,D2,DS2,AS2,INST|CONT|3,AS2 
	.db INST|CONT|2,DS2,F2,AS2,INST|CONT|3,AS2,INST|CONT|2,D2,F2,AS2 
	.db INST|CONT|3,AS2,INST|CONT|2,DS2,F2,AS2,D00

_Intermission1_pulse2:
	.dw _Intermission1_pulse2_pattern0
	.dw _Intermission1_pulse2_pattern0
_Intermission1_pulse2_pattern0:
	.db NL1,NUL,NL2,INST|CONT|4,AS2,AS2,D2,DS2,AS2,AS2,DS2,F2,AS2,AS2 
	.db D2,F2,AS2,AS2,DS2,NL1,F2,D00

_Intermission1_triangle:
	.dw _Intermission1_triangle_pattern0
	.dw _Intermission1_triangle_pattern1
_Intermission1_triangle_pattern0:
	.db NL6,INST|CONT|5,D2,NL10,DS2,NL6,F2,DS2,NL2,A2,AS2,D00
_Intermission1_triangle_pattern1:
	.db NL6,INST|CONT|5,D2,NL2,DS2,G1,NL4,AS1,NL2,DS2,D2,G1,AS1
	.db NL4,C2,NL2,F1,NL4,AS1,D00

_Intermission1_noise:
	.dw _Intermission1_noise_pattern0
	.dw _Intermission1_noise_pattern0
_Intermission1_noise_pattern0:
	.db NL4,INST|CONT|7,$F,NL2,INST|6,NL4,$D,NL2,$F,$D,$F
	.db NL4,INST|7,NL2,INST|6,NL4,$D,NL2,$F,$D,$F,D00 

_Intermission1_dmc:
	.dw _Intermission1_dmc_pattern0
	.dw _Intermission1_dmc_pattern0
_Intermission1_dmc_pattern0:
	.db NL6,DS4,NL8,E7,NL2,E4,NL6,DS4,E7,NL2,DS4,A7,D00

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

_testSong0_header:
	.db 6					;; Speed [frames in-between rows]
	.db 2					;; Total FT frames
	.dw _testSong0_pulse1
	.dw NULL_pulse2		
	.dw NULL_triangle	
	.dw NULL_noise
	.dw NULL_DMC		

_testSong0_pulse1:
	.dw _testSong0_pulse1_pattern0
	.dw _testSong0_pulse1_pattern1
_testSong0_pulse1_pattern0:
	.db NL2,INST|CONT|2,C3,D3,E3,NL6,INST|SLNT,INST|CONT|1,NL2,B3,C4,D00
_testSong0_pulse1_pattern1:
	.db NL4,INST|CONT|1,C4,NL2,B3,NL4,A3,NL6,G3,D00

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


