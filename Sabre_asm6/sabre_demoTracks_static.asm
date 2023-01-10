sabre_maxTracks:
	.db 3
sabre_maxSFX:
	.db 4

trackHeaderTable_lo:
	.db <_default_MoodSwings_header
	.db <_default_Intermisison_header
	.db <_default_TriangleEchoTest_header
trackHeaderTable_hi:
	.db >_default_MoodSwings_header
	.db >_default_Intermisison_header
	.db >_default_TriangleEchoTest_header
trackTable_PRGbank:
	.db $00,$00,$00

sfxHeaderTable_lo:
	.db <_sfx_error_header
	.db <_sfx_zapperShot_header
	.db <_sfx_doorbell_header
	.db <_sfx_downSlide_header
sfxHeaderTable_hi:
	.db >_sfx_error_header
	.db >_sfx_zapperShot_header
	.db >_sfx_doorbell_header
	.db >_sfx_downSlide_header

;;;; Track index constants
	_default_MoodSwings       = 0
	_default_Intermisison     = 1
	_default_TriangleEchoTest = 2
;;;; SFX index constants
	_sfx_error      = 0
	_sfx_zapperShot = 1
	_sfx_doorbell   = 2
	_sfx_downSlide  = 3

env0:
	.db 0,ENV_LOOP,0
env1:
	.db 10,0,ENV_LOOP,1
env2:
	.db 12,7,5,4,3,2,1,1,0,ENV_LOOP,8
env3:
	.db 8,7,6,3,2,1,0,ENV_LOOP,6
env4:
	.db 8,7,6,6,5,5,5,5,4,4,4,4,4,3,3,3,3,3,2,2,2,2,2,2,1,ENV_LOOP,24
env5:
	.db 14,13,13,12,12,12,11,11,11,11,10,10,9,9,9,8,8,8,7,7,7,6,6,6,5,5,5,5,5,4,4,4,4,3,3,3,3,3,2,2,2,2,2,2,2,1,ENV_LOOP,45
env6:
	.db 6,ENV_LOOP,0
env7:
	.db 5,ENV_LOOP,0
env8:
	.db 4,ENV_LOOP,0
env9:
	.db 3,ENV_LOOP,0
env10:
	.db 2,ENV_LOOP,0
env11:
	.db 1,ENV_LOOP,0
env12:
	.db 12,9,8,8,7,7,6,6,6,6,5,5,5,5,4,4,4,4,4,3,ENV_LOOP,19
env13:
	.db 14,11,9,8,7,7,6,6,5,5,5,4,4,4,4,4,4,4,4,3,3,2,2,1,ENV_LOOP,23
env14:
	.db 0,6,ENV_LOOP,1
env15:
	.db 0,1,2,ENV_LOOP,1
env16:
	.db 12,0,ENV_LOOP,1
env17:
	.db -2,-1,0,ENV_LOOP,2
env18:
	.db 2,0,ENV_LOOP,1
env19:
	.db 2,1,0,ENV_LOOP,2
env20:
	.db 0,0,5,5,ENV_LOOP,0
env21:
	.db 80,ENV_LOOP,0
env22:
	.db 1,1,0,0,-1,-1,-1,-1,0,0,1,1,ENV_LOOP,0
env23:
	.db 40,ENV_LOOP,0
env24:
	.db 64,ENV_LOOP,0
env25:
	.db 32,ENV_LOOP,0
env26:
	.db 64,64,32,ENV_LOOP,2
env27:
	.db 32,32,0,ENV_LOOP,2
env28:
	.db 64,64,32,32,0,0,32,32,ENV_LOOP,0
env29:
	.db 32,32,32,32,32,32,32,32,32,32,32,0,ENV_LOOP,11

instrumentHeaderTable:
	.dw inst_silent
	.dw inst_DPCM_and_TriBlip
	.dw inst_TriKick
	.dw inst_NoiseKick
	.dw inst_NoiseSnare
	.dw inst_NoiseHiHat
	.dw inst_NoiseRide
	.dw inst_NoiseRideCrash
	.dw inst_PNoiseBell
	.dw inst_V02_6_Click
	.dw inst_V02_6_Q02
	.dw inst_V02_6
	.dw inst_V02_5_Vib
	.dw inst_V02_4_Vib
	.dw inst_V02_3_Vib
	.dw inst_V02_2_Vib
	.dw inst_V02_1_Vib
	.dw inst_V01_6_Pluck
	.dw inst_V01_6_Q02_Pluck
	.dw inst_V01_5_Vib
	.dw inst_V01_4_Vib
	.dw inst_V01_3_Vib
	.dw inst_V01_2_Vib
	.dw inst_V01_1_Vib
	.dw inst_V00_6_Baldwin_Blip
	.dw inst_V00_2_Baldwin_Blip
	.dw inst_V00_1_Baldwin_Blip
	.dw inst_V00_6_Q02_Pluck
	.dw inst_V00_5_Vib
	.dw inst_V00_4_Vib
	.dw inst_V00_3_Vib
	.dw inst_V00_2_Vib
	.dw inst_V00_1_Vib
	.dw inst_V02_6_R02
	.dw inst_V01_6_R02
	.dw inst_V00_6_R02
	.dw inst_Arp_05
	.dw inst_V01_Pick_Bass
	.dw inst_V02_6_SD
	.dw inst_ZapperShot

inst_silent:
	.dw env0
	.dw env0
	.dw env0
	.dw env0
inst_DPCM_and_TriBlip:
	.dw env1
	.dw env0
	.dw env0
	.dw env24
inst_TriKick:
	.dw env2
	.dw env0
	.dw env21
	.dw env0
inst_NoiseKick:
	.dw env2
	.dw env14
	.dw env0
	.dw env24
inst_NoiseSnare:
	.dw env2
	.dw env15
	.dw env0
	.dw env24
inst_NoiseHiHat:
	.dw env3
	.dw env0
	.dw env0
	.dw env24
inst_NoiseRide:
	.dw env4
	.dw env0
	.dw env0
	.dw env24
inst_NoiseRideCrash:
	.dw env5
	.dw env0
	.dw env0
	.dw env24
inst_PNoiseBell:
	.dw env4
	.dw env0
	.dw env0
	.dw env25
inst_V02_6_Click:
	.dw env6
	.dw env16
	.dw env0
	.dw env24
inst_V02_6_Q02:
	.dw env6
	.dw env17
	.dw env0
	.dw env24
inst_V02_6:
	.dw env6
	.dw env0
	.dw env0
	.dw env24
inst_V02_5_Vib:
	.dw env7
	.dw env0
	.dw env22
	.dw env24
inst_V02_4_Vib:
	.dw env8
	.dw env0
	.dw env22
	.dw env24
inst_V02_3_Vib:
	.dw env9
	.dw env0
	.dw env22
	.dw env24
inst_V02_2_Vib:
	.dw env10
	.dw env0
	.dw env22
	.dw env24
inst_V02_1_Vib:
	.dw env11
	.dw env0
	.dw env22
	.dw env24
inst_V01_6_Pluck:
	.dw env6
	.dw env0
	.dw env0
	.dw env26
inst_V01_6_Q02_Pluck:
	.dw env6
	.dw env17
	.dw env0
	.dw env26
inst_V01_5_Vib:
	.dw env7
	.dw env0
	.dw env22
	.dw env25
inst_V01_4_Vib:
	.dw env8
	.dw env0
	.dw env22
	.dw env25
inst_V01_3_Vib:
	.dw env9
	.dw env0
	.dw env22
	.dw env25
inst_V01_2_Vib:
	.dw env10
	.dw env0
	.dw env22
	.dw env25
inst_V01_1_Vib:
	.dw env11
	.dw env0
	.dw env22
	.dw env25
inst_V00_6_Baldwin_Blip:
	.dw env6
	.dw env18
	.dw env0
	.dw env27
inst_V00_2_Baldwin_Blip:
	.dw env10
	.dw env18
	.dw env0
	.dw env27
inst_V00_1_Baldwin_Blip:
	.dw env11
	.dw env18
	.dw env0
	.dw env27
inst_V00_6_Q02_Pluck:
	.dw env6
	.dw env17
	.dw env0
	.dw env27
inst_V00_5_Vib:
	.dw env7
	.dw env0
	.dw env22
	.dw env0
inst_V00_4_Vib:
	.dw env8
	.dw env0
	.dw env22
	.dw env0
inst_V00_3_Vib:
	.dw env9
	.dw env0
	.dw env22
	.dw env0
inst_V00_2_Vib:
	.dw env10
	.dw env0
	.dw env22
	.dw env0
inst_V00_1_Vib:
	.dw env10
	.dw env0
	.dw env22
	.dw env0
inst_V02_6_R02:
	.dw env6
	.dw env19
	.dw env0
	.dw env24
inst_V01_6_R02:
	.dw env6
	.dw env19
	.dw env0
	.dw env25
inst_V00_6_R02:
	.dw env6
	.dw env19
	.dw env0
	.dw env0
inst_Arp_05:
	.dw env2
	.dw env20
	.dw env0
	.dw env28
inst_V01_Pick_Bass:
	.dw env12
	.dw env0
	.dw env0
	.dw env29
inst_V02_6_SD:
	.dw env6
	.dw env0
	.dw env23
	.dw env24
inst_ZapperShot:
	.dw env13
	.dw env15
	.dw env0
	.dw env0

dpcm_sampleAddressTable:
	.db <(dpcm_sample_tri_4cycle_dmc >> 6)
	.db <(dpcm_sample_tri_2cycle_dmc >> 6)
	.db <(dpcm_sample_tri_1cycle_dmc >> 6)
	.db <(dpcm_sample_00_17byte_dmc >> 6)
	.db <(dpcm_sample_FF_17byte_dmc >> 6)
	.db <(dpcm_sample_KickDrum1_00_dmc >> 6)
	.db <(dpcm_sample_SnareDrum2_00_dmc >> 6)

dpcm_noteToSampleTable:
	.db $03,$04,$02,$ff,$02,$ff,$02,$02,$ff,$02,$ff,$02,$ff,$02,$01,$ff,$01,$ff,$01,$01,$ff,$01,$ff,$01
	.db $ff,$01,$00,$ff,$00,$ff,$00,$00,$ff,$00,$ff,$00,$ff,$00,$00,$ff,$00,$ff,$ff,$00,$ff,$00,$ff,$00
	.db $ff,$ff,$00,$ff,$ff,$ff,$ff,$00,$ff,$00,$ff,$ff,$ff,$ff,$00,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.db $ff,$ff,$ff,$02,$01,$00,$06,$06,$06,$06,$06,$06,$06,$05
dpcm_noteToSampleRateAndFlags:
	.db $00,$00,$40,$ff,$41,$ff,$42,$43,$ff,$44,$ff,$45,$ff,$46,$40,$ff,$41,$ff,$42,$43,$ff,$44,$ff,$45
	.db $ff,$46,$40,$ff,$41,$ff,$42,$43,$ff,$44,$ff,$45,$ff,$46,$47,$ff,$48,$ff,$ff,$49,$ff,$4a,$ff,$4b
	.db $ff,$ff,$4c,$ff,$ff,$ff,$ff,$4d,$ff,$4e,$ff,$ff,$ff,$ff,$4f,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.db $ff,$ff,$ff,$0f,$0f,$0f,$0f,$0e,$0d,$0c,$0b,$0a,$09,$0f
dpcm_noteToSampleLength:
	.db $01,$01,$01,$ff,$01,$ff,$01,$01,$ff,$01,$ff,$01,$ff,$01,$01,$ff,$01,$ff,$01,$01,$ff,$01,$ff,$01
	.db $ff,$01,$01,$ff,$01,$ff,$01,$01,$ff,$01,$ff,$01,$ff,$01,$01,$ff,$01,$ff,$ff,$01,$ff,$01,$ff,$01
	.db $ff,$ff,$01,$ff,$ff,$ff,$ff,$01,$ff,$01,$ff,$ff,$ff,$ff,$01,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.db $ff,$ff,$ff,$01,$01,$01,$19,$19,$19,$19,$19,$19,$19,$19

_sfx_error_header:
	.db 5
	.db 150
	.dw NULL_pulse1
	.dw _sfx_error_pulse2
	.dw NULL_triangle
	.dw NULL_noise
_sfx_error_pulse2:
	.db NL2,INST|CONT|7,B1,NL6,FS1,END_SFX

_sfx_zapperShot_header:
	.db 5
	.db 150
	.dw NULL_pulse1
	.dw NULL_pulse2
	.dw NULL_triangle
	.dw _sfx_zapperShot_noise
_sfx_zapperShot_noise:
	.db NL8,INST|CONT|39,$3,END_SFX

_sfx_doorbell_header:
	.db 6
	.db 150
	.dw _sfx_doorbell_pulse1
	.dw _sfx_doorbell_pulse2
	.dw NULL_triangle
	.dw NULL_noise
_sfx_doorbell_pulse1:
	.db NL10,INST|CONT|7,AS4,END_SFX
_sfx_doorbell_pulse2:
	.db NL2,NUL,NL8,INST|CONT|7,F4,END_SFX

_sfx_downSlide_header:
	.db 6
	.db 150
	.dw _sfx_downSlide_pulse1
	.dw _sfx_downSlide_pulse2
	.dw _sfx_downSlide_triangle
	.dw _sfx_downSlide_noise
_sfx_downSlide_pulse1:
	.db NL8,INST|CONT|28,DS3,NL4,INST|38,INST|SLNT,END_SFX
_sfx_downSlide_pulse2:
	.db NL2,NUL,NL6,INST|CONT|28,GS3,NL5,INST|38,NL3,INST|SLNT,END_SFX
_sfx_downSlide_triangle:
	.db NL4,NUL,INST|CONT|28,AS4,NL6,INST|38,NL2,INST|SLNT,END_SFX
_sfx_downSlide_noise:
	.db NL8,NUL,NL7,INST|CONT|7,$8,NL1,INST|SLNT,END_SFX

