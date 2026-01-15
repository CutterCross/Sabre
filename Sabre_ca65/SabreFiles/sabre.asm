;;;; SABRE Sound Driver ;;;;

NTSC_PTNperiodTable_lo:
	.byte <$07F1, <$077F, <$0713
    .byte <$06AD, <$064D, <$05F3, <$059D, <$054C, <$0500, <$04B8, <$0474, <$0434, <$03F8, <$03BF, <$0389
    .byte <$0356, <$0326, <$02F9, <$02CE, <$02A6, <$0280, <$025C, <$023A, <$021A, <$01FB, <$01DF, <$01C4
    .byte <$01AB, <$0193, <$017C, <$0167, <$0152, <$013F, <$012D, <$011C, <$010C, <$00FD, <$00EF, <$00E1
    .byte <$00D5, <$00C9, <$00BD, <$00B3, <$00A9, <$009F, <$0096, <$008E, <$0086, <$007E, <$0077, <$0070
    .byte <$006A, <$0064, <$005E, <$0059, <$0054, <$004F, <$004B, <$0046, <$0042, <$003F, <$003B, <$0038
    .byte <$0034, <$0031, <$002F, <$002C, <$0029, <$0027, <$0025, <$0023, <$0021, <$001F, <$001D, <$001B
    .byte <$001A, <$0018, <$0017, <$0015, <$0014, <$0013, <$0012, <$0011, <$0010, <$000F, <$000E, <$000D
NTSC_PTNperiodTable_hi:
	.byte >$07F1, >$077F, >$0713
    .byte >$06AD, >$064D, >$05F3, >$059D, >$054C, >$0500, >$04B8, >$0474, >$0434, >$03F8, >$03BF, >$0389
    .byte >$0356, >$0326, >$02F9, >$02CE, >$02A6, >$0280, >$025C, >$023A, >$021A, >$01FB, >$01DF, >$01C4
    .byte >$01AB, >$0193, >$017C, >$0167, >$0152, >$013F, >$012D, >$011C, >$010C
PAL_PTNperiodTable_lo:
	.byte <$0760, <$06F6, <$0692
    .byte <$0634, <$05DB, <$0586, <$0537, <$04EC, <$04A5, <$0462, <$0423, <$03E8, <$03B0, <$037B, <$0349
    .byte <$0319, <$02ED, <$02C3, <$029B, <$0275, <$0252, <$0231, <$0211, <$01F3, <$01D7, <$01BD, <$01A4
    .byte <$018C, <$0176, <$0161, <$014D, <$013A, <$0129, <$0118, <$0108, <$00F9, <$00EB, <$00DE, <$00D1
    .byte <$00C6, <$00BA, <$00B0, <$00A6, <$009D, <$0094, <$008B, <$0084, <$007C, <$0075, <$006E, <$0068
    .byte <$0062, <$005D, <$0057, <$0052, <$004E, <$0049, <$0045, <$0041, <$003E, <$003A, <$0037, <$0034
    .byte <$0031, <$002E, <$002B, <$0029, <$0026, <$0024, <$0022, <$0020, <$001E, <$001D, <$001B, <$0019
    .byte <$0018, <$0016, <$0015, <$0014, <$0013, <$0012, <$0011, <$0010, <$000F, <$000E, <$000D, <$000C
PAL_PTNperiodTable_hi:
	.byte >$0760, >$06F6, >$0692
    .byte >$0634, >$05DB, >$0586, >$0537, >$04EC, >$04A5, >$0462, >$0423, >$03E8, >$03B0, >$037B, >$0349
    .byte >$0319, >$02ED, >$02C3, >$029B, >$0275, >$0252, >$0231, >$0211, >$01F3, >$01D7, >$01BD, >$01A4
    .byte >$018C, >$0176, >$0161, >$014D, >$013A, >$0129, >$0118, >$0108, >$00F9

sabre_registerInitTable:
	.byte $30,$08,$00,$00
	.byte $30,$08,$00,$00
	.byte $80,$00,$00,$00
	.byte $30,$00,$00,$00
	.byte $00,$00,$00,$00
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

sabre_initAPU: 
	LDX #19
@loop_initAPUregs:
	LDA sabre_registerInitTable,x 
	STA $4000,x 				;; Initialize hardware APU registers
	DEX 
	BPL @loop_initAPUregs
	LDA #%00001111				;; Enable Pulse 1, Pulse 2, Triangle, and Noise channels
	STA $4015 
	LDA #0 						;; Won't be writing to $400F again
	STA $400F 					;; But must be written once after Noise channel is enabled
	STA currentTrackPRGbank		;; Set track PRG bank to 0 [Default]
	LDX #23
@loop_initTrackAddr_shadowAPUregs:
	STA apuShadow4000,x 		;; Initialize shadow APU registers to 0
	STA channel_trackAddr,x 	;; Initialize track addresses to 0
	DEX 						;; [It's okay if writes bleed into channel_patternOffsetAddr]
	BPL @loop_initTrackAddr_shadowAPUregs
	STX sabrePauseStatus
	TXA
	LDX #8
@loop_unmuteChannels:
	STA channelMuteStatus,x 	;; Unmute all channels
	DEX 
	BPL @loop_unmuteChannels
	;; Determine region tick rate [NTSC / PAL / Dendy]
	LDX #REGION_TICK_NTSC_DENDY		;; Default
	STX regionTickRate_track
	STX regionTickRate_SFX
	LDA soundRegion
	CMP #REGION_PAL
	BCC @NTSC
		;; PAL and Dendy tempo adjustment
		LDX #REGION_TICK_PAL
	.ifdef ADJ_REGION_TEMPO_TRACK
		STX regionTickRate_track
	.endif 
	.ifdef ADJ_REGION_TEMPO_SFX
		STX regionTickRate_SFX
	.endif 
@NTSC:
	RTS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

sabre_playTrack:
	TXA 
	PHA
	TYA 
	PHA
	;; Check if this track index is valid
	LDY currentTrack
	CPY sabre_maxTracks
	BCC @validTrackIndex
		JMP endPlayTrack
@validTrackIndex:
	;; Get all info from track header
	LDA trackHeaderTable_lo,y 
	STA pointer16 
	LDA trackHeaderTable_hi,y
	STA pointer16+1
	LDA trackTable_PRGbank,y 
	STA currentTrackPRGbank
	;;;; Custom bankswitch here!
	.ifdef BANKSWITCH_TRACKS
		TAY
		JSR UNROM_bankswitchNoSave
	.endif
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	LDY #0
	LDA (pointer16),y
	STA trackSpeed 
	STA trackSpeedElapsed  
	INY 
	LDA (pointer16),y 
	STA trackTempo 
	LDA #0
	STA trackCurrentPattern 
	STA trackTempoElapsed
	LDY #8
	;; Zero out instruments and envelope steps
@loop_clearInstEnvelopes:
	STA channelInstrument,y 
	STA channelVolEnvelopeStep,y 
	STA channelArpEnvelopeStep,y
	STA channelPitchEnvelopeStep,y 
	DEY 
	DEY 
	BPL @loop_clearInstEnvelopes
	STA channelDutyEnvelopeStep+2
	STA noiseDutyEnvelopeStep

	LDY #1
	STY channelNoteCountdown	;; Set 1 to channel countdown timers	
	STY channelNoteCountdown+2	;; So starting note will occur on next tick
	STY channelNoteCountdown+4
	STY channelNoteCountdown+6
	STY channelNoteCountdown+8
	INY
	LDA (pointer16),y 
	STA trackMaxPatterns
	INY 
	LDX #0
setChannelTrackAddresses:
	LDA (pointer16),y 
	STA channel_trackAddr,x		;; lo byte
	INY 
	LDA (pointer16),y 
	STA channel_trackAddr+1,x 	;; hi byte
	INY
.ifdef UNOFFICIAL_OPS
	TXA 
	AXS #252
.else 
	INX 
	INX 
	INX 
	INX
.endif
	CPY #12
	BCC setChannelTrackAddresses
	LDY #0
	JSR setChannelPatternAddresses
	;; Silence all channels
	LDA #0
	STA apuShadow4000
	STA apuShadow4004
	STA apuShadow400C
	STA $4011
	LDA #$80
	STA apuShadow4008
	STA apuLast4003
	STA apuLast4007
	;; Initialize DMC
	LDA #%00001111
	STA $4015
	;;;; Custom return bankswitch here, if needed

	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
endPlayTrack:
	PLA 
	TAY
	PLA 
	TAX
	RTS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

sabre_playSFX:
	TXA 
	PHA
	TYA 
	PHA 
	;; Check if this SFX index is valid
	LDY currentSFX
	CPY sabre_maxSFX
	BCS endPlaySFX
	;; Get all info from track header
	LDA sfxHeaderTable_lo,y 
	STA pointer16 
	LDA sfxHeaderTable_hi,y
	STA pointer16+1
	LDY #0
	LDA (pointer16),y 
	STA SFXspeed
	STA SFXspeedElapsed
	INY 
	LDA (pointer16),y 
	STA SFXtempo
	LDA #0
	STA SFXtempoElapsed 

.ifdef SFX_FLUSH
	;;;; New SFX will completely flush old SFX channels
	STA apuSFX4000
	STA apuSFX4004
	STA apuSFX4008
	STA apuSFX400C
	LDY #7
@loop_clearInstEnvelopes:
	;; Zero out instruments and envelope steps [SFX]
	STA channelInstrument,y 
	STA channelVolEnvelopeStep,y 
	STA channelArpEnvelopeStep,y
	STA channelPitchEnvelopeStep,y 
	DEY 
	DEY 
	BPL @loop_clearInstEnvelopes
	STA channelDutyEnvelopeStep+3
	STA noiseDutyEnvelopeStep+1

	LDY #1 
	STY channelNoteCountdown+1	;; Set 1 to channel countdown timers
	STY channelNoteCountdown+3	;; So starting note will occur on next tick
	STY channelNoteCountdown+5
	STY channelNoteCountdown+7
	INY
	LDX #2
setChannelSFXaddresses:
	LDA (pointer16),y 
	STA channel_trackAddr,x		;; lo byte
	STA channel_patternOffsetAddr,x
	INY 
	LDA (pointer16),y 
	STA channel_trackAddr+1,x 	;; hi byte
	STA channel_patternOffsetAddr+1,x 
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.else 
	;;;; New SFX will keep untouched SFX channels playing
	INY
	LDX #2
setChannelSFXaddresses:
	LDA (pointer16),y 
	STA sabreTemp
	INY 
	LDA (pointer16),y 
	BEQ @nextChannel
		;; Valid SFX address - Write new channel track + pattern addresses
		STA channel_trackAddr+1,x 	;; hi byte
		STA channel_patternOffsetAddr+1,x 
		LDA sabreTemp 
		STA channel_trackAddr,x		;; lo byte
		STA channel_patternOffsetAddr,x
		;; Init channel instrument + envelopes [SFX]
		LDA #1
		STA channelNoteCountdown-2,y
		LDA #0
		STA channelInstrument-2,y
		STA channelVolEnvelopeStep-2,y
		STA channelArpEnvelopeStep-2,y
		;; Special conditionals for Pitch + Duty envelopes
		CPY #CHANNEL_SFX_NOISE+2
		BNE @notNoiseChannel
			STA noiseDutyEnvelopeStep+1
			BEQ endPlaySFX
	@notNoiseChannel:
		STA channelPitchEnvelopeStep-2,y 
		CPY #CHANNEL_SFX_PULSE2+2 
		BCS @nextChannel
			STA channelDutyEnvelopeStep-2,y
@nextChannel:
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
.endif 
	INY
.ifdef UNOFFICIAL_OPS 
	TXA 
	AXS #252
.else
	INX 
	INX 
	INX 
	INX
.endif
	CPY #9
	BCC setChannelSFXaddresses
endPlaySFX:
	PLA 
	TAY 
	PLA 
	TAX
	RTS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

setChannelPatternAddresses:
	;; Pulse 1 starting pattern - lo
	LDA (channel_trackAddr),y 	
	STA channel_patternOffsetAddr
	;; Pulse 2 starting pattern - lo
	LDA (channel_trackAddr+4),y 
	STA channel_patternOffsetAddr+4
	;; Triangle starting pattern - lo
	LDA (channel_trackAddr+8),y 
	STA channel_patternOffsetAddr+8
	;; Noise starting pattern - lo
	LDA (channel_trackAddr+12),y 
	STA channel_patternOffsetAddr+12
	;; DMC starting pattern  - lo
	LDA (channel_trackAddr+16),y 
	STA channel_patternOffsetAddr+16
	INY 
	;; Pulse 1 starting pattern - hi
	LDA (channel_trackAddr),y 
	STA channel_patternOffsetAddr+1
	;; Pulse 2 starting pattern - hi
	LDA (channel_trackAddr+4),y 
	STA channel_patternOffsetAddr+5
	;; Triangle starting pattern - hi
	LDA (channel_trackAddr+8),y 
	STA channel_patternOffsetAddr+9
	;; Noise starting pattern - hi
	LDA (channel_trackAddr+12),y 
	STA channel_patternOffsetAddr+13
	;; DMC starting pattern  - hi
	LDA (channel_trackAddr+16),y 
	STA channel_patternOffsetAddr+17
	RTS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;; CHANNEL SETUP
;; 0 - Pulse 1
;; 1 - Pulse 1 SFX
;; 2 - Pulse 2
;; 3 - Pulse 2 SFX 
;; 4 - Triangle 
;; 5 - Triangle SFX 
;; 6 - Noise 
;; 7 - Noise SFX
;; 8 - DMC

sabre_soundUpdate:
	LDA regionTickRate_track
	BNE @validTickRate
		RTS		;; In case update called before sabre_initAPU finishes
@validTickRate:
	TXA 
	PHA 
	TYA 
	PHA
	LDX #0
	LDY #0
	BEQ trackProcessChannelRow
	
endAllChannelProcessing:
	JMP sabre_updateAPUregisters	

SFXprocessChannelRow:
	;; Channel bounds checking
	CPY #CHANNEL_TRACK_DMC+1
	BCS endAllChannelProcessing
	;; SFX channel
	LDA channel_trackAddr+1,x
	BEQ iterateNextSoundChannel
	;; Check if we need to advance to the next FT row
	LDA SFXspeedElapsed
	CMP SFXspeed
	JMP SFXspeedReturnCheck	

iterateNextSoundChannel:
	INX 
	INX 	;; X contains channel index << 1
	INY		;; Y contains channel index 
	TYA 
	LSR
	BCS SFXprocessChannelRow
trackProcessChannelRow:
	;; Music channel
	LDA channel_trackAddr+1,x
	AND sabrePauseStatus
	BEQ iterateNextSoundChannel
	;; Check if we need to advance to the next FT row
	LDA trackSpeedElapsed
	CMP trackSpeed
SFXspeedReturnCheck:
	;; Check if there's something to process this row 
.ifdef UNOFFICIAL_OPS
	LDA #0
	BCC sabre_ProcessChannelEnvelopes_DMCcheck
	;; Check if there's something to process this row 
	DCP channelNoteCountdown,y
.else
	LDA channelNoteCountdown,y 
	BCC sabre_ProcessChannelEnvelopes_DMCcheck
	SBC #1
	STA channelNoteCountdown,y
.endif
	BNE sabre_ProcessChannelEnvelopes_DMCcheck
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
getNextPatternByte:
	LDA (channel_patternOffsetAddr,x)
	BPL skipInstrumentChange
		;; Set new instrument 
		STA sabreTemp
		AND #%00111111
		STA channelInstrument,y 
		BIT sabreTemp
		BVC setNoteDurationToCountdown
		;; Increment pattern offset address 
		INC channel_patternOffsetAddr,x 
		BNE @endInc16
			INC channel_patternOffsetAddr+1,x
	@endInc16:
		LDA (channel_patternOffsetAddr,x)	;; Will never have 2 INST changes in a row
skipInstrumentChange:
	;; Check if current byte is a control instruction
	CMP #NOTE_CEILING 
	BCC skipControlOpcode
		STY sabreTemp 
		;; Increment pattern offset address 
		INC channel_patternOffsetAddr,x 
		BNE @endInc16
			INC channel_patternOffsetAddr+1,x
	@endInc16:
		TAY 
		SBC #NOTE_LENGTHS_START
		BCC @controlOpcode
			TAY 
			LDA sabre_noteLengthTable,y
			LDY sabreTemp
			STA channelNoteDuration,y
			BCS getNextPatternByte
	@controlOpcode:
		;; Execute corresponding control opcode 
		LDA sabre_noteControlOpcodeTable_lo-NOTE_CEILING,y
		STA pointer16 
		LDA sabre_noteControlOpcodeTable_hi-NOTE_CEILING,y 
		STA pointer16+1 
		JMP (pointer16) 
		;; Will eventually return to getNextPatternByte - expects redundant note length byte 
skipControlOpcode:
	STA channelBaseNote,y 
setNoteDurationToCountdown:
	LDA channelNoteDuration,y 
	STA channelNoteCountdown,y 
	;; Increment pattern offset address 
	INC channel_patternOffsetAddr,x 
	BNE endProcessChannelRow
		INC channel_patternOffsetAddr+1,x
endProcessChannelRow:
	CPY #CHANNEL_TRACK_DMC
	BCC @notDMC
		;; Play new sample
		JMP sabre_DMChandler
@notDMC:
	LDA #$FF 
	STA channelLastArpNote,y
	LDA #0
	STA channelVolEnvelopeStep,y
	STA channelArpEnvelopeStep,y
	CPY #CHANNEL_TRACK_NOISE
	BCC @notNoise
		STA noiseDutyEnvelopeStep-6,y
		BCS sabre_ProcessChannelEnvelopes
@notNoise:
	STA channelPitchEnvelopeStep,y
	CPY #CHANNEL_TRACK_TRIANGLE 
	BCS sabre_ProcessChannelEnvelopes
		STA channelDutyEnvelopeStep,y
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

sabre_ProcessChannelEnvelopes_DMCcheck:
	CPY #CHANNEL_TRACK_DMC
	BCC sabre_ProcessChannelEnvelopes
		;; Skip envelope handling for DMC
		JMP sabre_updateAPUregisters
sabre_ProcessChannelEnvelopes:
	STX sabreTemp 
	TYA 
	TAX
	;; X now contains channel index 
	;;;; Get instrument header from instrument table
	LDA channelInstrument,x 
	ASL 
	TAY
	LDA instrumentHeaderTable,y
	STA instrumentAddr
	INY
	LDA instrumentHeaderTable,y
	STA instrumentAddr+1 
	
	;;;; Update volume envelope
	LDY #0
	LDA (instrumentAddr),y 
	STA envelopeAddr
	INY 
	LDA (instrumentAddr),y 
	STA envelopeAddr+1
	;; Get value offset into envelope and update shadow APU registers
	LDY channelVolEnvelopeStep,x 
	INC channelVolEnvelopeStep,x 
	LDA (envelopeAddr),y 
	CMP #ENV_LOOP
	BNE @skipLoopPoint
		;; Read next byte to get step to jump back to 
		INY 
		LDA (envelopeAddr),y 
		TAY 
		ADC #0
		STA channelVolEnvelopeStep,x 
		;; Read next data byte 
		LDA (envelopeAddr),y 
@skipLoopPoint:
	AND channelMuteStatus,x
	STA apuShadow4000X,x
endVolumeEnvelope:
	
	;;;; Update arpeggio enveleope 
	LDY #2
	LDA (instrumentAddr),y 
	STA envelopeAddr
	INY 
	LDA (instrumentAddr),y 
	STA envelopeAddr+1
	;; Get value offset into envelope and update shadow APU registers
	LDY channelArpEnvelopeStep,x 
	INC channelArpEnvelopeStep,x 
	LDA (envelopeAddr),y 
	CMP #ENV_LOOP 
	BNE @skipLoopPoint
		;; Read next byte to get step to jump back to 
		INY
		LDA (envelopeAddr),y 
		TAY 
		ADC #0
		STA channelArpEnvelopeStep,x 
		;; Read next data byte 
		LDA (envelopeAddr),y
@skipLoopPoint:
	;; Add relative offset to base note 
	CLC 
	ADC channelBaseNote,x
	CPX #CHANNEL_TRACK_NOISE
	BCC @notNoiseChannel
		CMP channelLastArpNote,x 
		BEQ @skipNewPeriodUpdate
			;; Update new note period
			STA channelLastArpNote,x
	@skipNewPeriodUpdate:
		;; Use period index directly for noise channel
		AND #$0F
		EOR #$0F
		STA apuShadow4002X,x 
		JMP noiseDutyEnvelope
@notNoiseChannel:
	CMP channelLastArpNote,x 
	BEQ endArpEnvelope
	;; Update new note period
	STA channelLastArpNote,x
	TAY 
	LDA soundRegion
	CMP #REGION_PAL
	BEQ @PAL
		;; Use NTSC period table
		LDA NTSC_PTNperiodTable_lo,y 
		STA apuShadow4002X,x
		CPY #36 
		BCS @zeroHiByte
		LDA NTSC_PTNperiodTable_hi,y 
		BCC @store4003X
	@PAL:
		;; Use PAL period table
		LDA PAL_PTNperiodTable_lo,y 
		STA apuShadow4002X,x 
		LDA PAL_PTNperiodTable_hi,y 
		CPY #36
		BCC @store4003X
	@zeroHiByte:
		LDA #0
	@store4003X:
		STA apuShadow4003X,x
endArpEnvelope:

	;;;; Update pitch envelope 
	LDY #4
	LDA (instrumentAddr),y 
	STA envelopeAddr
	INY 
	LDA (instrumentAddr),y 
	STA envelopeAddr+1
	;; Get value offset into envelope and update shadow APU registers
	LDY channelPitchEnvelopeStep,x 
	INC channelPitchEnvelopeStep,x
	LDA (envelopeAddr),y 
	CMP #ENV_LOOP 
	BNE @skipLoopPoint
		;; Read next byte to get step to jump back to 
		INY
		LDA (envelopeAddr),y 
		TAY 
		ADC #0
		STA channelPitchEnvelopeStep,x 
		;; Read next data byte 
@skipLoopPoint:
	LDA (envelopeAddr),y
	CLC 
	BPL @isAddition
		;; Is subtraction 
		ADC apuShadow4002X,x 
		STA apuShadow4002X,x 
		BCS endPitchEnvelope
			LDA apuShadow4003X,x
			BEQ endPitchEnvelope
			DEC apuShadow4003X,x
			JMP endPitchEnvelope
	@isAddition:
		;; Is addition 
		ADC apuShadow4002X,x
		STA apuShadow4002X,x
		BCC endPitchEnvelope
			LDA apuShadow4003X,x 
			CMP #8
			BCS endPitchEnvelope
			INC apuShadow4003X,x
endPitchEnvelope: 

	;;;; Update duty envelope [Pulse 1 and 2]
	CPX #CHANNEL_TRACK_TRIANGLE
	BCS endDutyEnvelope
		LDY #6
		LDA (instrumentAddr),y 
		STA envelopeAddr
		INY 
		LDA (instrumentAddr),y 
		STA envelopeAddr+1
		;; Get value offset into envelope and update shadow APU register
		LDY channelDutyEnvelopeStep,x 
		INC channelDutyEnvelopeStep,x 
		LDA (envelopeAddr),y 
		CMP #ENV_LOOP 
		BNE @skipLoopPoint 
			;; Read next byte to get step to jump back to 
			INY
			LDA (envelopeAddr),y 
			TAY 
			ADC #0
			STA channelDutyEnvelopeStep,x 
			;; Read next data byte 
			LDA (envelopeAddr),y
	@skipLoopPoint: 
		ASL 
		ORA apuShadow4000X,x 
		STA apuShadow4000X,x
		JMP endDutyEnvelope

noiseDutyEnvelope:
	;;;; Update noise duty/mode [special case]
	LDY #6
	LDA (instrumentAddr),y 
	STA envelopeAddr
	INY 
	LDA (instrumentAddr),y 
	STA envelopeAddr+1
	;; Get value offset into envelope and update shadow APU register
	LDY noiseDutyEnvelopeStep-6,x 
	INC noiseDutyEnvelopeStep-6,x 
	LDA (envelopeAddr),y 
	CMP #ENV_LOOP 
	BNE @skipLoopPoint 
		;; Read next byte to get step to jump back to 
		INY
		LDA (envelopeAddr),y 
		TAY 
		ADC #0
		STA noiseDutyEnvelopeStep-6,x 
		;; Read next data byte 
		LDA (envelopeAddr),y
@skipLoopPoint: 
	ASL 
	ASL
	ORA apuShadow4002X,x 
	STA apuShadow4002X,x

endDutyEnvelope:
.ifdef UNOFFICIAL_OPS 
	LAX sabreTemp 
.else
	LDX sabreTemp 
	TXA
.endif
	LSR 
	TAY 
	JMP iterateNextSoundChannel

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

sabre_DMChandler:
	;; Cheack if DMC is active
	LDA channelMuteStatus+CHANNEL_TRACK_DMC
	BEQ sabre_updateAPUregisters 
	;; Start new DPCM sample
	LDX channelBaseNote+CHANNEL_TRACK_DMC
	LDA dpcm_noteToSampleRateAndFlags,x 
	STA $4010
	LDY dpcm_noteToSampleTable,x 
	LDA dpcm_sampleAddressTable,y 
	STA $4012
	LDA dpcm_noteToSampleLength,x 
	STA $4013
	;; Restart DMC
    LDA #%00001111
    STA $4015
    LDA #%00011111
    STA $4015

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
sabre_updateAPUregisters:
.ifdef MANUALLY_CLOCK_APU
	;; Forcibly clock APU frame counter for consistant triangle growl at vol 1-3
	LDA #%11000000
	STA $4017
	LDA #%01000000
	STA $4017
.endif
pulse1_regUpload:
	LDY #1
	LDA apuSFX4000
	BNE @useSFX
	DEY		;; No SFX
	LDA apuShadow4000,y 
@useSFX:
	ORA #%00110000
	STA $4000
	LDA apuShadow4002,y 
	STA $4002
	LDA apuShadow4003,y 
	CMP apuLast4003
	BEQ pulse2_regUpload 
	STA $4003
	STA apuLast4003 
	
pulse2_regUpload:
	LDY #1
	LDA apuSFX4004 
	BNE @useSFX 
	DEY 	;; No SFX 
	LDA apuShadow4004,y
@useSFX:
	ORA #%00110000
	STA $4004 
	LDA apuShadow4006,y 
	STA $4006 
	LDA apuShadow4007,y 
	CMP apuLast4007 
	BEQ triangle_regUpload
	STA $4007 
	STA apuLast4007 
	
triangle_regUpload:
	LDY #1
	LDA apuSFX4008 
	BNE @useSFX 
	DEY 	;; No SFX 
	LDA apuShadow4008,y 
@useSFX:
	AND #%00001111
.ifndef LINEAR_COUNTER_TRILL
	ORA #%10000000
.endif 
	STA $4008 
	LDA apuShadow400A,y 
	STA $400A 
	LDA apuShadow400B,y 
	STA $400B 
	
noise_regUpload:
	LDY #1
	LDA apuSFX400C
	BNE @useSFX 
	DEY 	;; No SFX
	LDA apuShadow400C,y
@useSFX:
	ORA #%00110000
	STA $400C 
	LDA apuShadow400E,y 
	STA $400E  



updateTrackSpeed:
	LDA trackSpeedElapsed
	SEC
	SBC trackSpeed 
	BCC updateSFXspeed
		STA trackSpeedElapsed
updateSFXspeed:
	LDA SFXspeedElapsed
	SEC 
	SBC SFXspeed 
	BCC updateTrackTempo
		STA SFXspeedElapsed
updateTrackTempo:
	LDA trackTempoElapsed
	CLC
	ADC trackTempo 
	BCS @incTrackSpeedElapsed
	CMP regionTickRate_track
	BCC @storeTrackSpeedElapsed
@incTrackSpeedElapsed:
	SBC regionTickRate_track
	INC trackSpeedElapsed
	CMP regionTickRate_track
	BCS @incTrackSpeedElapsed
@storeTrackSpeedElapsed:
	STA trackTempoElapsed
updateSFXtempo:
	LDA SFXtempoElapsed 
	ADC SFXtempo 
	BCS @incSFXspeedElapsed
	CMP regionTickRate_SFX 
	BCC @storeSFXtempoElapsed
@incSFXspeedElapsed:
	SBC regionTickRate_SFX
	INC SFXspeedElapsed
	CMP regionTickRate_SFX
	BCS @incSFXspeedElapsed
@storeSFXtempoElapsed:
	STA SFXtempoElapsed
	PLA 
	TAY 
	PLA 
	TAX
	RTS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

sabre_stopTrack:
	;;;; Stop playback of all music channels
	TYA 
	PHA
	LDA #0
	;; Clear track addresses - hi
	STA channel_trackAddr+1
	STA channel_trackAddr+5
	STA channel_trackAddr+9
	STA channel_trackAddr+13
	STA channel_trackAddr+17
	;; Clear track envelope steps
	LDY #26
@loop_clearEnvelopes:
	STA channelVolEnvelopeStep,y 
	DEY 
	DEY 
	BPL @loop_clearEnvelopes
	;; Clear track volume registers
	STA apuShadow4000
	STA apuShadow4004
	STA apuShadow4008
	STA apuShadow400C
	;; Stop DMC 
	LDA #%00001111
	STA $4015
	PLA 
	TAY
	RTS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

sabre_pauseTrack:
	;;;; Pause song playback of all channels - ready to resume playback
	LDA sabrePauseStatus
	EOR #$FF 
	STA sabrePauseStatus
	BNE @return
		;; Paused - clear volume registers
		STA apuShadow4000
		STA apuShadow4004
		STA apuShadow4008
		STA apuShadow400C
		;; Stop DMC 
		LDA #%00001111
		STA $4015
@return:
	RTS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

sabre_noteControlOpcodeTable_lo:
	.byte <op_D00, <op_BXX, <op_C00, <op_NLC, <op_FXX, <op_ZXX, <op_NUL, <op_END_SFX
sabre_noteControlOpcodeTable_hi:
	.byte >op_D00, >op_BXX, >op_C00, >op_NLC, >op_FXX, >op_ZXX, >op_NUL, >op_END_SFX

sabre_noteLengthTable:
	.byte 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16
	.byte 18,20,22,24,26,28,30,32
	.byte 36,40,48
	.byte 64,98,128
	.byte 0

sabre_op_incChannelPatternOffsetAddr:
	LDY sabreTemp 
sabre_op_incChannelPatternOffsetAddr_skipY:
	INC channel_patternOffsetAddr,x 
	BNE @endInc16
		INC channel_patternOffsetAddr+1,x
@endInc16:
	JMP getNextPatternByte

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

op_D00:
	;; DXX - Advance to beginning of next pattern in sequence
	LDA trackCurrentPattern
	ADC #1		;; Carry guaranteed to be cleared 
	CMP trackMaxPatterns
	BCC setNewTrackPattern
		LDA #0
setNewTrackPattern:
	STA trackCurrentPattern
	ASL 
	TAY 
	JSR setChannelPatternAddresses
	LDA #1
	STA channelNoteCountdown+2
	STA channelNoteCountdown+4
	STA channelNoteCountdown+6
	STA channelNoteCountdown+8
	LDY sabreTemp 
	JMP getNextPatternByte

op_BXX:
	;; BXX - Jump to beginning of specified pattern of next byte
	LDA (channel_patternOffsetAddr,x)
	JMP setNewTrackPattern

op_C00:
	;; CXX - Terminate track
	JSR sabre_stopTrack
	JMP sabre_updateAPUregisters

op_NLC:
	;; NLC - Note Length Custom - Set custom note length of next byte
	LDA (channel_patternOffsetAddr,x)
	LDY sabreTemp 
	STA channelNoteDuration,y 
	JMP sabre_op_incChannelPatternOffsetAddr_skipY

op_FXX:
	;; FXX - Set track speed with next byte 
	LDA (channel_patternOffsetAddr,x)
	STA trackSpeed
	STA trackSpeedElapsed
	JMP sabre_op_incChannelPatternOffsetAddr

op_ZXX:
	;; ZXX - Set direct DMC load counter [$4011] with next byte
	LDA (channel_patternOffsetAddr,x)
	STA $4011
	JMP sabre_op_incChannelPatternOffsetAddr

op_NUL:
	;; NULL - Null note value. Skip to processing envelopes
	LDY sabreTemp 
	LDA channelNoteDuration,y 
	STA channelNoteCountdown,y 
	JMP sabre_ProcessChannelEnvelopes_DMCcheck

op_END_SFX:
	;; END_SFX - End SFX playback. Restore current channel
	TXA 
	LSR 
	TAY
	LDA #0
	STA channel_trackAddr+1,x 
	STA apuShadow4000X,y
	STA channelInstrument,y
	LDY sabreTemp 
	JMP iterateNextSoundChannel