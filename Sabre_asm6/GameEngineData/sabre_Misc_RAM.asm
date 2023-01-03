;;;; SABRE Misc RAM [Non-ZP] ;;;;

	apuShadow4000X				.dsb 8
	apuShadow4002X				.dsb 8
	apuShadow4003X				.dsb 6
	dmcStatus					.dsb 1	;; [0] Play new sample; [1] Don't update
	apuLast4003					.dsb 1
	apuLast4007					.dsb 1

	apuShadow4000 = apuShadow4000X
	apuShadow4002 = apuShadow4002X
	apuShadow4003 = apuShadow4003X
	apuShadow4004 = apuShadow4000X+2
	apuShadow4006 = apuShadow4002X+2
	apuShadow4007 = apuShadow4003X+2
	apuShadow4008 = apuShadow4000X+4
	apuShadow400A = apuShadow4002X+4
	apuShadow400B = apuShadow4003X+4
	apuShadow400C = apuShadow4000X+6
	apuShadow400E = apuShadow4002X+6
	apuSFX4000 = apuShadow4000X+1
	apuSFX4002 = apuShadow4002X+1
	apuSFX4003 = apuShadow4003X+1
	apuSFX4004 = apuShadow4000X+3
	apuSFX4006 = apuShadow4002X+3
	apuSFX4007 = apuShadow4003X+3
	apuSFX4008 = apuShadow4000X+5
	apuSFX400A = apuShadow4002X+5
	apuSFX400B = apuShadow4003X+5
	apuSFX400C = apuShadow4000X+7
	apuSFX400E = apuShadow4002X+7

	sabrePauseStatus 			.dsb 1
	channelMuteStatus			.dsb 9
	channelNoteDuration			.dsb 9
	channelNoteCountdown		.dsb 9
	channelInstrument 			.dsb 9
	channelVolEnvelopeStep		.dsb 8
	channelArpEnvelopeStep		.dsb 8
	channelPitchEnvelopeStep	.dsb 6
	channelDutyEnvelopeStep		.dsb 4
	noiseDutyEnvelopeStep		.dsb 2
	channelBaseNote 			.dsb 9
	channelLastArpNote			.dsb 8
	
	trackSpeed					.dsb 1
	trackTempo 					.dsb 1
	trackSpeedElapsed 			.dsb 1 
	trackTempoElapsed 			.dsb 1
	SFXspeed					.dsb 1
	SFXtempo 					.dsb 1
	SFXspeedElapsed 			.dsb 1 
	SFXtempoElapsed 			.dsb 1
	regionTickRate_track 		.dsb 1
	regionTickRate_SFX			.dsb 1
	trackCurrentPattern			.dsb 1
	trackMaxPatterns			.dsb 1

	currentTrack				.dsb 1
	currentSFX					.dsb 1
	currentTrackPRGbank			.dsb 1

	;; 122 bytes non-ZP 
	
	