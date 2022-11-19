sabre_maxTracks:
	.db 3
sabre_maxSFX:
	.db 2

trackHeaderTable_lo:
	.db <_default_Intermission_header
	.db <_default_Triangle_Echo_test_header
	.db <_default_testSong0_header
trackHeaderTable_hi:
	.db >_default_Intermission_header
	.db >_default_Triangle_Echo_test_header
	.db >_default_testSong0_header
trackTable_PRGbank:
	.db $00,$00,$00

sfxHeaderTable_lo:
	.db <_sfx_error_header
	.db <_sfx_downSlide_header
sfxHeaderTable_hi:
	.db >_sfx_error_header
	.db >_sfx_downSlide_header

env0:
	.db 0,ENV_LOOP,0
env1:
	.db 12,11,7,6,5,4,4,3,3,2,2,2,1,1,0,ENV_LOOP,14
env2:
	.db 4,ENV_LOOP,0
env3:
	.db 3,ENV_LOOP,0
env4:
	.db 2,ENV_LOOP,0
env5:
	.db 8,ENV_LOOP,0
env6:
	.db 8,7,6,3,2,1,0,ENV_LOOP,6
env7:
	.db 8,7,6,6,5,5,5,5,4,4,4,4,4,3,3,3,3,3,2,2,2,2,2,2,1,ENV_LOOP,24
env8:
	.db 12,0,ENV_LOOP,1
env9:
	.db 1,1,0,0,-1,-1,-1,-1,0,0,1,1,ENV_LOOP,0
env10:
	.db 24,ENV_LOOP,0
env11:
	.db 64,ENV_LOOP,0

instrumentHeaderTable:
	.dw inst_silent
	.dw inst_test0
	.dw inst_V02_4_Vib
	.dw inst_V02_3_vib
	.dw inst_V02_2_Vib
	.dw inst_TriBlip_Hold
	.dw inst_HiHatShort
	.dw inst_HiHatLong
	.dw inst_V00_8
	.dw inst_V00_8_SD
	.dw inst_V00_8_arpTest

inst_silent:
	.dw env0
	.dw env0
	.dw env0
	.dw env0
inst_test0:
	.dw env1
	.dw env0
	.dw env0
	.dw env11
inst_V02_4_Vib:
	.dw env2
	.dw env0
	.dw env9
	.dw env11
inst_V02_3_vib:
	.dw env3
	.dw env0
	.dw env9
	.dw env11
inst_V02_2_Vib:
	.dw env4
	.dw env0
	.dw env9
	.dw env11
inst_TriBlip_Hold:
	.dw env5
	.dw env8
	.dw env9
	.dw env11
inst_HiHatShort:
	.dw env6
	.dw env0
	.dw env0
	.dw env11
inst_HiHatLong:
	.dw env7
	.dw env0
	.dw env0
	.dw env11
inst_V00_8:
	.dw env5
	.dw env0
	.dw env0
	.dw env0
inst_V00_8_SD:
	.dw env5
	.dw env0
	.dw env10
	.dw env0
inst_V00_8_arpTest:
	.dw env5
	.dw env9
	.dw env0
	.dw env0

dpcm_sampleAddressTable:
	.db <(dpcm_sample_00_17byte_dmc >> 6)
	.db <(dpcm_sample_FF_17byte_dmc >> 6)
	.db <(dpcm_sample_Kick_Drum1_dmc >> 6)
	.db <(dpcm_sample_SnareDrum2_dmc >> 6)

dpcm_noteToSampleTable:
	.db $00,$01,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$02,$02,$02,$02,$02,$02
	.db $02,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.db $ff,$ff,$ff,$ff,$ff,$ff,$03,$03,$03,$03,$03,$03,$03,$03
dpcm_noteToSampleRateAndFlags:
	.db $00,$00,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$0f,$0e,$0c,$0a,$08,$04
	.db $00,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.db $ff,$ff,$ff,$ff,$ff,$ff,$0f,$0e,$0d,$0c,$0b,$0a,$09,$08
dpcm_noteToSampleLength:
	.db $01,$01,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.db $ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$19,$19,$19,$19,$19,$19
	.db $19,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	.db $ff,$ff,$ff,$ff,$ff,$ff,$19,$19,$19,$19,$19,$19,$19,$19

_sfx_error_header:
	.db 5
	.dw NULL_pulse1
	.dw _sfx_error_pulse2
	.dw NULL_triangle
	.dw NULL_noise
_sfx_error_pulse2:
	.db NL2,INST|CONT|7,B1,NL4,FS1,NL2,INST|SLNT,END_SFX

_sfx_downSlide_header:
	.db 6
	.dw _sfx_downSlide_pulse1
	.dw _sfx_downSlide_pulse2
	.dw _sfx_downSlide_triangle
	.dw _sfx_downSlide_noise
_sfx_downSlide_pulse1:
	.db NL8,INST|CONT|8,DS3,NL4,INST|9,INST|SLNT,END_SFX
_sfx_downSlide_pulse2:
	.db NL2,NUL,NL6,INST|CONT|8,GS3,NL5,INST|9,NL3,INST|SLNT,END_SFX
_sfx_downSlide_triangle:
	.db NL4,NUL,INST|CONT|8,AS4,NL6,INST|9,NL2,INST|SLNT,END_SFX
_sfx_downSlide_noise:
	.db NL8,NUL,NL7,INST|CONT|7,$8,NL1,INST|SLNT,END_SFX

