;;;; SABRE Misc RAM [Non-ZP] ;;;;

	apuShadow4000X:				.res 8
	apuShadow4002X:				.res 8
	apuShadow4003X:				.res 6
	apuLast4003:				.res 1
	apuLast4007:				.res 1

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

	sabrePauseStatus:			.res 1
	channelMuteStatus:			.res 9
	channelNoteDuration:		.res 9
	channelNoteCountdown:		.res 9
	channelInstrument:			.res 9
	channelVolEnvelopeStep:		.res 8
	channelArpEnvelopeStep:		.res 8
	channelPitchEnvelopeStep:	.res 6
	channelDutyEnvelopeStep:	.res 4
	noiseDutyEnvelopeStep:		.res 2
	channelBaseNote:			.res 9
	channelLastArpNote:			.res 8
	
	trackSpeed:					.res 1
	trackTempo:					.res 1
	trackSpeedElapsed:			.res 1 
	trackTempoElapsed:			.res 1
	SFXspeed:					.res 1
	SFXtempo:					.res 1
	SFXspeedElapsed:			.res 1 
	SFXtempoElapsed:			.res 1
	regionTickRate_track:		.res 1
	regionTickRate_SFX:			.res 1
	trackCurrentPattern:		.res 1
	trackMaxPatterns:			.res 1

	currentTrack:				.res 1
	currentSFX:					.res 1
	currentTrackPRGbank:		.res 1

	;; 121 bytes non-ZP 
	
	