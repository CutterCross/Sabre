sabre_maxTracks:
	.byte 4
sabre_maxSFX:
	.byte 4

trackHeaderTable_lo:
	.byte <_default_MoodSwings_header
	.byte <_default_Intermisison_header
	.byte <_default_TriangleEchoTest_header
	.byte <_default_TriangleGrowlTest_header
trackHeaderTable_hi:
	.byte >_default_MoodSwings_header
	.byte >_default_Intermisison_header
	.byte >_default_TriangleEchoTest_header
	.byte >_default_TriangleGrowlTest_header
trackTable_PRGbank:
	.byte $00,$00,$00,$00

sfxHeaderTable_lo:
	.byte <_sfx_error_header
	.byte <_sfx_zapperShot_header
	.byte <_sfx_doorbell_header
	.byte <_sfx_downSlide_header
sfxHeaderTable_hi:
	.byte >_sfx_error_header
	.byte >_sfx_zapperShot_header
	.byte >_sfx_doorbell_header
	.byte >_sfx_downSlide_header

;;;; Track index constants
	_default_MoodSwings        = 0
	_default_Intermisison      = 1
	_default_TriangleEchoTest  = 2
	_default_TriangleGrowlTest = 3
;;;; SFX index constants
	_sfx_error      = 0
	_sfx_zapperShot = 1
	_sfx_doorbell   = 2
	_sfx_downSlide  = 3

env0:
	.byte 0,ENV_LOOP,0
env1:
	.byte 10,0,ENV_LOOP,1
env2:
	.byte 12,7,5,4,3,2,1,1,0,ENV_LOOP,8
env3:
	.byte 8,7,6,3,2,1,0,ENV_LOOP,6
env4:
	.byte 8,7,6,6,5,5,5,5,4,4,4,4,4,3,3,3,3,3,2,2,2,2,2,2,1,ENV_LOOP,24
env5:
	.byte 14,13,13,12,12,12,11,11,11,11,10,10,9,9,9,8,8,8,7,7,7,6,6,6,5,5,5,5,5,4,4,4,4,3,3,3,3,3,2,2,2,2,2,2,2,1,ENV_LOOP,45
env6:
	.byte 6,ENV_LOOP,0
env7:
	.byte 5,ENV_LOOP,0
env8:
	.byte 4,ENV_LOOP,0
env9:
	.byte 3,ENV_LOOP,0
env10:
	.byte 2,ENV_LOOP,0
env11:
	.byte 1,ENV_LOOP,0
env12:
	.byte 12,9,8,8,7,7,6,6,6,6,5,5,5,5,4,4,4,4,4,3,ENV_LOOP,19
env13:
	.byte 14,11,9,8,7,7,6,6,5,5,5,4,4,4,4,4,4,4,4,3,3,2,2,1,ENV_LOOP,23
env14:
	.byte 0,6,ENV_LOOP,1
env15:
	.byte 0,1,2,ENV_LOOP,1
env16:
	.byte 12,0,ENV_LOOP,1
env17:
	.byte 254,255,0,ENV_LOOP,2
env18:
	.byte 2,0,ENV_LOOP,1
env19:
	.byte 2,1,0,ENV_LOOP,2
env20:
	.byte 0,0,5,5,ENV_LOOP,0
env21:
	.byte 80,ENV_LOOP,0
env22:
	.byte 1,1,0,0,255,255,255,255,0,0,1,1,ENV_LOOP,0
env23:
	.byte 40,ENV_LOOP,0
env24:
	.byte 64,ENV_LOOP,0
env25:
	.byte 32,ENV_LOOP,0
env26:
	.byte 64,64,32,ENV_LOOP,2
env27:
	.byte 32,32,0,ENV_LOOP,2
env28:
	.byte 64,64,32,32,0,0,32,32,ENV_LOOP,0
env29:
	.byte 32,32,32,32,32,32,32,32,32,32,32,0,ENV_LOOP,11

instrumentHeaderTable:
	.word inst_silent
	.word inst_DPCM_and_TriBlip
	.word inst_TriKick
	.word inst_NoiseKick
	.word inst_NoiseSnare
	.word inst_NoiseHiHat
	.word inst_NoiseRide
	.word inst_NoiseRideCrash
	.word inst_PNoiseBell
	.word inst_V02_6_Click
	.word inst_V02_6_Q02
	.word inst_V02_6
	.word inst_V02_5_Vib
	.word inst_V02_4_Vib
	.word inst_V02_3_Vib
	.word inst_V02_2_Vib
	.word inst_V02_1_Vib
	.word inst_V01_6_Pluck
	.word inst_V01_6_Q02_Pluck
	.word inst_V01_5_Vib
	.word inst_V01_4_Vib
	.word inst_V01_3_Vib
	.word inst_V01_2_Vib
	.word inst_V01_1_Vib
	.word inst_V00_6_Baldwin_Blip
	.word inst_V00_2_Baldwin_Blip
	.word inst_V00_1_Baldwin_Blip
	.word inst_V00_6_Q02_Pluck
	.word inst_V00_5_Vib
	.word inst_V00_4_Vib
	.word inst_V00_3_Vib
	.word inst_V00_2_Vib
	.word inst_V00_1_Vib
	.word inst_V02_6_R02
	.word inst_V01_6_R02
	.word inst_V00_6_R02
	.word inst_Arp_05
	.word inst_V01_Pick_Bass
	.word inst_V02_6_SD
	.word inst_ZapperShot

inst_silent:
	.word env0
	.word env0
	.word env0
	.word env0
inst_DPCM_and_TriBlip:
	.word env1
	.word env0
	.word env0
	.word env24
inst_TriKick:
	.word env2
	.word env0
	.word env21
	.word env0
inst_NoiseKick:
	.word env2
	.word env14
	.word env0
	.word env24
inst_NoiseSnare:
	.word env2
	.word env15
	.word env0
	.word env24
inst_NoiseHiHat:
	.word env3
	.word env0
	.word env0
	.word env24
inst_NoiseRide:
	.word env4
	.word env0
	.word env0
	.word env24
inst_NoiseRideCrash:
	.word env5
	.word env0
	.word env0
	.word env24
inst_PNoiseBell:
	.word env4
	.word env0
	.word env0
	.word env25
inst_V02_6_Click:
	.word env6
	.word env16
	.word env0
	.word env24
inst_V02_6_Q02:
	.word env6
	.word env17
	.word env0
	.word env24
inst_V02_6:
	.word env6
	.word env0
	.word env0
	.word env24
inst_V02_5_Vib:
	.word env7
	.word env0
	.word env22
	.word env24
inst_V02_4_Vib:
	.word env8
	.word env0
	.word env22
	.word env24
inst_V02_3_Vib:
	.word env9
	.word env0
	.word env22
	.word env24
inst_V02_2_Vib:
	.word env10
	.word env0
	.word env22
	.word env24
inst_V02_1_Vib:
	.word env11
	.word env0
	.word env22
	.word env24
inst_V01_6_Pluck:
	.word env6
	.word env0
	.word env0
	.word env26
inst_V01_6_Q02_Pluck:
	.word env6
	.word env17
	.word env0
	.word env26
inst_V01_5_Vib:
	.word env7
	.word env0
	.word env22
	.word env25
inst_V01_4_Vib:
	.word env8
	.word env0
	.word env22
	.word env25
inst_V01_3_Vib:
	.word env9
	.word env0
	.word env22
	.word env25
inst_V01_2_Vib:
	.word env10
	.word env0
	.word env22
	.word env25
inst_V01_1_Vib:
	.word env11
	.word env0
	.word env22
	.word env25
inst_V00_6_Baldwin_Blip:
	.word env6
	.word env18
	.word env0
	.word env27
inst_V00_2_Baldwin_Blip:
	.word env10
	.word env18
	.word env0
	.word env27
inst_V00_1_Baldwin_Blip:
	.word env11
	.word env18
	.word env0
	.word env27
inst_V00_6_Q02_Pluck:
	.word env6
	.word env17
	.word env0
	.word env27
inst_V00_5_Vib:
	.word env7
	.word env0
	.word env22
	.word env0
inst_V00_4_Vib:
	.word env8
	.word env0
	.word env22
	.word env0
inst_V00_3_Vib:
	.word env9
	.word env0
	.word env22
	.word env0
inst_V00_2_Vib:
	.word env10
	.word env0
	.word env22
	.word env0
inst_V00_1_Vib:
	.word env10
	.word env0
	.word env22
	.word env0
inst_V02_6_R02:
	.word env6
	.word env19
	.word env0
	.word env24
inst_V01_6_R02:
	.word env6
	.word env19
	.word env0
	.word env25
inst_V00_6_R02:
	.word env6
	.word env19
	.word env0
	.word env0
inst_Arp_05:
	.word env2
	.word env20
	.word env0
	.word env28
inst_V01_Pick_Bass:
	.word env12
	.word env0
	.word env0
	.word env29
inst_V02_6_SD:
	.word env6
	.word env0
	.word env23
	.word env24
inst_ZapperShot:
	.word env13
	.word env15
	.word env0
	.word env0

dpcm_sampleAddressTable:
	.byte <(dpcm_sample_tri_4cycle_dmc >> 6)
	.byte <(dpcm_sample_tri_2cycle_dmc >> 6)
	.byte <(dpcm_sample_tri_1cycle_dmc >> 6)
	.byte <(dpcm_sample_00_17byte_dmc >> 6)
	.byte <(dpcm_sample_FF_17byte_dmc >> 6)
	.byte <(dpcm_sample_KickDrum1_00_dmc >> 6)
	.byte <(dpcm_sample_SnareDrum2_00_dmc >> 6)

dpcm_noteToSampleTable:
	.byte $03,$04,$02,$ff,$02,$ff,$02,$02,$ff,$02,$ff,$02,$ff,$02,$01,$ff,$01,$ff,$01,$01,$ff,$01,$ff,$01
	.byte $ff,$01,$00,$ff,$00,$ff,$00,$00,$ff,$00,$ff,$00,$ff,$00,$00,$ff,$00,$ff,$ff,$00,$ff,$00,$ff,$00
	.byte $ff,$ff,$00,$ff,$ff,$ff,$ff,$00,$ff,$00,$ff,$ff,$ff,$ff,$00,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$02,$01,$00,$06,$06,$06,$06,$06,$06,$06,$05,$05
dpcm_noteToSampleRateAndFlags:
	.byte $00,$00,$40,$ff,$41,$ff,$42,$43,$ff,$44,$ff,$45,$ff,$46,$40,$ff,$41,$ff,$42,$43,$ff,$44,$ff,$45
	.byte $ff,$46,$40,$ff,$41,$ff,$42,$43,$ff,$44,$ff,$45,$ff,$46,$47,$ff,$48,$ff,$ff,$49,$ff,$4a,$ff,$4b
	.byte $ff,$ff,$4c,$ff,$ff,$ff,$ff,$4d,$ff,$4e,$ff,$ff,$ff,$ff,$4f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$0f,$0f,$0f,$0f,$0e,$0d,$0c,$0b,$0a,$09,$0f,$0e
dpcm_noteToSampleLength:
	.byte $01,$01,$01,$ff,$01,$ff,$01,$01,$ff,$01,$ff,$01,$ff,$01,$01,$ff,$01,$ff,$01,$01,$ff,$01,$ff,$01
	.byte $ff,$01,$01,$ff,$01,$ff,$01,$01,$ff,$01,$ff,$01,$ff,$01,$01,$ff,$01,$ff,$ff,$01,$ff,$01,$ff,$01
	.byte $ff,$ff,$01,$ff,$ff,$ff,$ff,$01,$ff,$01,$ff,$ff,$ff,$ff,$01,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.byte $ff,$ff,$ff,$01,$01,$01,$19,$19,$19,$19,$19,$19,$19,$19,$19

_sfx_error_header:
	.byte 5
	.byte 150
	.word NULL_pulse1
	.word _sfx_error_pulse2
	.word NULL_triangle
	.word NULL_noise
_sfx_error_pulse2:
	.byte NL2,INST|CONT|7,B1,NL6,FS1,END_SFX

_sfx_zapperShot_header:
	.byte 5
	.byte 150
	.word NULL_pulse1
	.word NULL_pulse2
	.word NULL_triangle
	.word _sfx_zapperShot_noise
_sfx_zapperShot_noise:
	.byte NL8,INST|CONT|39,$3,END_SFX

_sfx_doorbell_header:
	.byte 6
	.byte 150
	.word _sfx_doorbell_pulse1
	.word _sfx_doorbell_pulse2
	.word NULL_triangle
	.word NULL_noise
_sfx_doorbell_pulse1:
	.byte NL10,INST|CONT|7,AS4,END_SFX
_sfx_doorbell_pulse2:
	.byte NL2,NUL,NL8,INST|CONT|7,F4,END_SFX

_sfx_downSlide_header:
	.byte 6
	.byte 150
	.word _sfx_downSlide_pulse1
	.word _sfx_downSlide_pulse2
	.word _sfx_downSlide_triangle
	.word _sfx_downSlide_noise
_sfx_downSlide_pulse1:
	.byte NL8,INST|CONT|28,DS3,NL4,INST|38,INST|SLNT,END_SFX
_sfx_downSlide_pulse2:
	.byte NL2,NUL,NL6,INST|CONT|28,GS3,NL5,INST|38,NL3,INST|SLNT,END_SFX
_sfx_downSlide_triangle:
	.byte NL4,NUL,INST|CONT|28,AS4,NL6,INST|38,NL2,INST|SLNT,END_SFX
_sfx_downSlide_noise:
	.byte NL8,NUL,NL7,INST|CONT|7,$8,NL1,INST|SLNT,END_SFX

