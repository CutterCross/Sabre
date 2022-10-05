;;;; SABRE Sound Engine ;;;;

NTSC_PTNperiodTable_lo:
	.db <$07F1, <$077F, <$0713
    .db <$06AD, <$064D, <$05F3, <$059D, <$054C, <$0500, <$04B8, <$0474, <$0434, <$03F8, <$03BF, <$0389
    .db <$0356, <$0326, <$02F9, <$02CE, <$02A6, <$0280, <$025C, <$023A, <$021A, <$01FB, <$01DF, <$01C4
    .db <$01AB, <$0193, <$017C, <$0167, <$0152, <$013F, <$012D, <$011C, <$010C, <$00FD, <$00EF, <$00E1
    .db <$00D5, <$00C9, <$00BD, <$00B3, <$00A9, <$009F, <$0096, <$008E, <$0086, <$007E, <$0077, <$0070
    .db <$006A, <$0064, <$005E, <$0059, <$0054, <$004F, <$004B, <$0046, <$0042, <$003F, <$003B, <$0038
    .db <$0034, <$0031, <$002F, <$002C, <$0029, <$0027, <$0025, <$0023, <$0021, <$001F, <$001D, <$001B
    .db <$001A, <$0018, <$0017, <$0015, <$0014, <$0013, <$0012, <$0011, <$0010, <$000F, <$000E, <$000D
NTSC_PTNperiodTable_hi:
	.db >$07F1, >$077F, >$0713
    .db >$06AD, >$064D, >$05F3, >$059D, >$054C, >$0500, >$04B8, >$0474, >$0434, >$03F8, >$03BF, >$0389
    .db >$0356, >$0326, >$02F9, >$02CE, >$02A6, >$0280, >$025C, >$023A, >$021A, >$01FB, >$01DF, >$01C4
    .db >$01AB, >$0193, >$017C, >$0167, >$0152, >$013F, >$012D, >$011C, >$010C
PAL_PTNperiodTable_lo:
	.db <$0760, <$06F6, <$0692
    .db <$0634, <$05DB, <$0586, <$0537, <$04EC, <$04A5, <$0462, <$0423, <$03E8, <$03B0, <$037B, <$0349
    .db <$0319, <$02ED, <$02C3, <$029B, <$0275, <$0252, <$0231, <$0211, <$01F3, <$01D7, <$01BD, <$01A4
    .db <$018C, <$0176, <$0161, <$014D, <$013A, <$0129, <$0118, <$0108, <$00F9, <$00EB, <$00DE, <$00D1
    .db <$00C6, <$00BA, <$00B0, <$00A6, <$009D, <$0094, <$008B, <$0084, <$007C, <$0075, <$006E, <$0068
    .db <$0062, <$005D, <$0057, <$0052, <$004E, <$0049, <$0045, <$0041, <$003E, <$003A, <$0037, <$0034
    .db <$0031, <$002E, <$002B, <$0029, <$0026, <$0024, <$0022, <$0020, <$001E, <$001D, <$001B, <$0019
    .db <$0018, <$0016, <$0015, <$0014, <$0013, <$0012, <$0011, <$0010, <$000F, <$000E, <$000D, <$000C
PAL_PTNperiodTable_hi:
	.db >$0760, >$06F6, >$0692
    .db >$0634, >$05DB, >$0586, >$0537, >$04EC, >$04A5, >$0462, >$0423, >$03E8, >$03B0, >$037B, >$0349
    .db >$0319, >$02ED, >$02C3, >$029B, >$0275, >$0252, >$0231, >$0211, >$01F3, >$01D7, >$01BD, >$01A4
    .db >$018C, >$0176, >$0161, >$014D, >$013A, >$0129, >$0118, >$0108, >$00F9

sabre_registerInitTable:
	.db $30,$08,$00,$00
	.db $30,$08,$00,$00
	.db $80,$00,$00,$00
	.db $30,$00,$00,$00
	.db $00,$00,$00,$00
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

sabre_initAPU:
	LDX #19
	-
	LDA sabre_registerInitTable,x
	STA $4000,x 		;; Initialize APU and shadow APU registers
	STA apuShadow4000,x
	DEX  
	BPL -
	LDA #%00001111		;; Enable Pulse 1, Pulse 2, Triangle, Noise
	STA $4015
	LDA #0				;; Won't be writing to $400F again
	STA $400F			;; But must be written once after Noise channel is enabled
	STA apuSFX4000
	STA apuSFX4004
	STA apuSFX4008
	STA apuSFX400C
	STA apuLast4003
	STA apuLast4007
	STA currentTrackPRGbank		;; Set track PRG bank to 0 [Default]
	LDX #8
	-
	STA channel_trackAddr,x 	;; Initialize track addresses to 0
	DEX 
	BPL -
	TXA
	STA sabrePauseStatus		;; Initialize pause status to unpaused
	LDX #8
	-
	STA channelMuteStatus,x		;; Initialized all channels to unmuted
	DEX 
	BPL -
	RTS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

sabre_playTrack:
	TXA 
	PHA
	TYA 
	PHA
	;; Get all info from track header
	LDY currentTrack
	LDA trackHeaderTable_lo,y 
	STA pointer16 
	LDA trackHeaderTable_hi,y
	STA pointer16+1
	LDA trackTable_PRGbank,y 
	STA currentTrackPRGbank
	LDY #0
	STY trackCurrentPattern
	LDA #$FF 
	SEC
	BIT soundRegion		;; Subtract 1 from track speed if PAL or Dendy
	BEQ +
		CLC 
	+
	ADC (pointer16),y 
	STA trackSpeed  
	STY trackFrameTimer 
	STY channelInstrument		;; Set channel instruments to 0 / silent
	STY channelInstrument+2
	STY channelInstrument+4
	STY channelInstrument+6
	STY channelInstrument+8
	INY
	STY channelNoteCountdown	;; Set 1 to channel countdown timers	
	STY channelNoteCountdown+2	;; So starting note will occur on next tick
	STY channelNoteCountdown+4
	STY channelNoteCountdown+6
	STY channelNoteCountdown+8
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
	INX 
	INX 
	INX 
	INX
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
	;; Initialize DMC
	LDA #1
	STA dmcStatus
	LDA #%00001111
	STA $4015
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
	;; Get all info from track header
	LDY currentSFX
	LDA sfxHeaderTable_lo,y 
	STA pointer16 
	LDA sfxHeaderTable_hi,y
	STA pointer16+1
	LDY #0
	LDA #$FF 
	SEC
	BIT soundRegion		;; Subtract 1 from track speed if PAL or Dendy
	BEQ +
		CLC 
	+
	ADC (pointer16),y 
	STA SFXspeed
	STY SFXframeTimer
	STY channelInstrument+1		;; Set channel instruments to 0 / silent
	STY channelInstrument+3
	STY channelInstrument+5
	STY channelInstrument+7
	INY 
	STY channelNoteCountdown+1	;; Set 1 to channel countdown timers
	STY channelNoteCountdown+3	;; So starting note will occur on next tick
	STY channelNoteCountdown+5
	STY channelNoteCountdown+7
	LDX #2
setChannelSFXaddresses:
	LDA (pointer16),y 
	STA channel_trackAddr,x		;; lo byte
	STA channel_patternOffsetAddr,x
	INY 
	LDA (pointer16),y 
	STA channel_trackAddr+1,x 	;; hi byte
	STA channel_patternOffsetAddr+1,x 
	INY
	TXA 
	INX 
	INX 
	INX 
	INX
	CPY #9
	BCC setChannelSFXaddresses
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
	TXA 
	PHA 
	TYA 
	PHA
	CLC
	LDX #0		;; X contains channel index << 1
	LDY #0		;; Y contains channel index 
sabre_processChannelRow:
	;; Cheack if this channel is active
	LDA channel_trackAddr+1,x
	AND sabrePauseStatus
	BNE +
		JMP iterateNextSoundChannel
	+
	;; Check if we need to advance to the next FT row [Ticks = 0]
	LDA trackFrameTimer
SFXframeTimerReturnCheck:
	BNE sabre_ProcessChannelEnvelopes
	;; Check if there's something to process this row 
	LDA channelNoteCountdown,y 
	SBC #0
	STA channelNoteCountdown,y
	BNE sabre_ProcessChannelEnvelopes
	
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
		BNE getNextPatternByte
			INC channel_patternOffsetAddr+1,x
		BVS getNextPatternByte 
skipInstrumentChange:
	;; Check if current byte is a control instruction
	CMP #NOTE_CEILING 
	BCC skipControlOpcode
		STY sabreTemp 
		;; Increment pattern offset address 
		INC channel_patternOffsetAddr,x 
		BNE +
			INC channel_patternOffsetAddr+1,x
		+
		CMP #NOTE_LENGTHS_START
		BCC +
			SBC #NOTE_LENGTHS_START
			TAY 
			LDA sabre_noteLengthTable,y
			LDY sabreTemp
			STA channelNoteDuration,y
			JMP getNextPatternByte
		+
		;; Execute corresponding control opcode 
		TAY 
		LDA sabre_noteControlOpcodeTable_lo-NOTE_CEILING,y
		STA pointer16 
		LDA sabre_noteControlOpcodeTable_hi-NOTE_CEILING,y 
		STA pointer16+1 
		JMP (pointer16) 
		;; Will jump to getNextPatternByte - expects redundant note length byte 
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
	CPY #8 
	BCC +
		;; Reset DMC state on new note
		LDA #0
		STA dmcStatus
		JMP sabre_DMChandler
	+
	LDA #0
	STA channelVolEnvelopeStep,y
	STA channelArpEnvelopeStep,y
	STA channelPitchEnvelopeStep,y
	STA channelLastArpNote,y
	CPY #2
	BCS sabre_ProcessChannelEnvelopes
	STA channelDutyEnvelopeStep,y
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

sabre_ProcessChannelEnvelopes:
	CPY #8
	BCC +
		;; Skip envelope handling for DMC
		JMP sabre_DMChandler
	+
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
	BNE +skipLoopPoint
		;; Read next byte to get step to jump back to 
		INY 
		LDA (envelopeAddr),y 
		STA channelVolEnvelopeStep,x 
		TAY 
		;; Read next data byte 
		LDA (envelopeAddr),y 
+skipLoopPoint:
	AND channelMuteStatus,x
	STA apuShadow4000X,x
	
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
	BNE +skipLoopPoint 
		;; Read next byte to get step to jump back to 
		INY
		LDA (envelopeAddr),y 
		STA channelArpEnvelopeStep,x 
		TAY 
		;; Read next data byte 
		LDA (envelopeAddr),y
+skipLoopPoint:
	;; Add relative offset to base note 
	CLC 
	ADC channelBaseNote,x
	CMP channelLastArpNote,x 
	BEQ +endArpEnvelope
	;; Update new note period
	STA channelLastArpNote,x
	CPX #6
	BCC +
		;; Use period index directly for noise channel
		STA apuShadow4002X,x 
		JMP +endDutyEnvelope	;; Don't update pitch or duty envelopes
	+
	TAY 
	LDA soundRegion
	CMP #1
	BEQ +PAL
		;; Use NTSC / DENDY period table
		LDA NTSC_PTNperiodTable_lo,y 
		STA apuShadow4002X,x
		CPY #36 
		BCS +zeroHiByte
		LDA NTSC_PTNperiodTable_hi,y 
		BCC +store4003X
	+PAL:
		;; Use PAL period table
		LDA PAL_PTNperiodTable_lo,y 
		STA apuShadow4002X,x 
		LDA PAL_PTNperiodTable_hi,y 
		CPY #36
		BCC +store4003X
	+zeroHiByte:
		LDA #0
	+store4003X:
		STA apuShadow4003X,x
+endArpEnvelope:

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
	BNE +skipLoopPoint 
		;; Read next byte to get step to jump back to 
		INY
		LDA (envelopeAddr),y 
		STA channelPitchEnvelopeStep,x 
		TAY 
		;; Read next data byte 
+skipLoopPoint:
	LDA (envelopeAddr),y
	CLC 
	BPL +isAddition
		;; Is subtraction 
		ADC apuShadow4002X,x 
		STA apuShadow4002X,x 
		BCS +endPitchEnvelope
			LDA apuShadow4003X,x
			BEQ +endPitchEnvelope
			DEC apuShadow4003X,x
			JMP +endPitchEnvelope
	+isAddition:
		;; Is addition 
		ADC apuShadow4002X,x
		STA apuShadow4002X,x
		BCC +endPitchEnvelope
			LDA apuShadow4003X,x 
			CMP #8
			BCS +endPitchEnvelope
			INC apuShadow4003X,x
+endPitchEnvelope: 

	;;;; Update duty envelope [Pulse 1 and 2]
	CPX #4
	BCS +endDutyEnvelope
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
		BNE +skipLoopPoint 
			;; Read next byte to get step to jump back to 
			INY
			LDA (envelopeAddr),y 
			STA channelDutyEnvelopeStep,x 
			TAY 
			;; Read next data byte 
			LDA (envelopeAddr),y
	+skipLoopPoint: 
		ASL 
		ORA apuShadow4000X,x 
		STA apuShadow4000X,x
+endDutyEnvelope:	
	LDX sabreTemp 
	TXA
	LSR 
	TAY 
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

iterateNextSoundChannel:
	INX 
	INX 
	INY
	CPY #9
	BCS sabre_DMChandler
	TYA 
	AND #%00000001
	BNE sabre_processChannelSFXrow
	JMP sabre_processChannelRow
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
sabre_processChannelSFXrow:
	;; Cheack if this channel is active
	LDA channel_trackAddr+1,x
	BEQ iterateNextSoundChannel
	;; Check if we need to advance to the next FT row [Ticks = 0]
	LDA SFXframeTimer
	JMP SFXframeTimerReturnCheck

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

sabre_DMChandler:
	;; Cheack if DMC is active
	LDA channel_trackAddr+17
	AND channelMuteStatus+8
	BEQ sabre_updateAPUregisters 
	;; Check DMC status
	LDA dmcStatus
	BNE sabre_updateAPUregisters
	;; Start new DPCM sample
	INC dmcStatus
	LDX channelBaseNote+8
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
	;; Pulse 1 registers
	LDA apuSFX4000
	BEQ +noSFX
		;; Use SFX
		ORA #%00110000
		STA $4000
		LDA apuSFX4002
		STA $4002
		LDA apuSFX4003
		JMP +checkHiTimer
+noSFX:
	LDA apuShadow4000
	ORA #%00110000
	STA $4000
	LDA apuShadow4002
	STA $4002
	LDA apuShadow4003
+checkHiTimer:
	CMP apuLast4003
	BEQ +
		STA $4003
		STA apuLast4003
	+
	;; Pulse 2 registers 
	LDA apuSFX4004
	BEQ +noSFX
		;; Use SFX
		ORA #%00110000
		STA $4004
		LDA apuSFX4006
		STA $4006
		LDA apuSFX4007
		JMP +checkHiTimer
+noSFX:
	LDA apuShadow4004
	ORA #%00110000
	STA $4004
	LDA apuShadow4006
	STA $4006
	LDA apuShadow4007
+checkHiTimer:
	CMP apuLast4007
	BEQ +
		STA $4007
		STA apuLast4007
	+
	;; Triangle registers 
	LDA apuSFX4008
	BEQ +noSFX
		;; Use SFX
		AND #%00001111
		ORA #%10000000
		STA $4008
		LDA apuSFX400A
		STA $400A
		LDA apuSFX400B
		JMP +
+noSFX:
	LDA apuShadow4008
	AND #%00001111
	ORA #%10000000
	STA $4008
	LDA apuShadow400A
	STA $400A 
	LDA apuShadow400B
	+
	STA $400B 
	;; Noise registers 
	LDA apuSFX400C
	BEQ +noSFX
		;; Use SFX
		ORA #%00110000
		STA $400C 
		LDA apuSFX400E
		JMP +
+noSFX:
	LDA apuShadow400C 
	ORA #%00110000
	STA $400C 
	LDA apuShadow400E
	+
	STA $400E 

	;; Update track frame timer
	CLC
	LDA trackFrameTimer
	BNE +
		LDA trackSpeed 
		BEQ ++	;; Exception for PAL speed "0"
	+
	SBC #0
	STA trackFrameTimer
	++
	;; Update SFX frame timer
	LDA SFXframeTimer
	BNE +
		LDA SFXspeed
		BEQ ++	;; Exception for PAL speed "0"
	+
	CLC 
	SBC #0
	STA SFXframeTimer
	++
	PLA 
	TAY 
	PLA 
	TAX
	RTS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

sabre_stopTrack:
	;;;; Stop sing playback of all channels
	LDA #0
	LDY #17
	-
	STA channel_trackAddr,y 
	DEY 
	BPL -
	;; Clear volume registers
	STA apuShadow4000
	STA apuShadow4004
	STA apuShadow4008
	STA apuShadow400C
	;; Stop DMC 
	LDA #%00001111
	STA $4015
	RTS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

sabre_pauseTrack:
	;;;; Pause song playback of all channels - ready to resume playback
	LDA sabrePauseStatus
	EOR #$FF 
	STA sabrePauseStatus
	BNE +
		;; Paused - clear volume registers
		STA apuShadow4000
		STA apuShadow4004
		STA apuShadow4008
		STA apuShadow400C
		;; Stop DMC 
		LDA #%00001111
		STA $4015
	+
	RTS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

sabre_noteControlOpcodeTable_lo:
	.db <op_D00, <op_BXX, <op_C00, <op_NLC, <op_FXX, <op_ZXX, <op_NUL, <op_END_SFX
sabre_noteControlOpcodeTable_hi:
	.db >op_D00, >op_BXX, >op_C00, >op_NLC, >op_FXX, >op_ZXX, >op_NUL, >op_END_SFX

sabre_noteLengthTable:
	.db 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16
	.db 18,20,22,24,26,28,30,32
	.db 36,40,48
	.db 64,98,128
	.db 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

op_D00:
	;; DXX - Advance to beginning of next pattern in sequence
	LDA trackCurrentPattern
	ADC #1		;; Carry guaranteed to be cleared 
	CMP trackMaxPatterns
	BCC +
		LDA #0
	+
	STA trackCurrentPattern
	ASL 
	TAY 
	JSR setChannelPatternAddresses
	LDY sabreTemp 
	JMP getNextPatternByte

op_BXX:
	;; BXX - Jump to beginning of specified pattern of next byte
	LDA (channel_patternOffsetAddr,x)
	STA trackCurrentPattern
	ASL
	TAY 
	JSR setChannelPatternAddresses
	LDY sabreTemp 
	JMP getNextPatternByte

op_C00:
	;; CXX - Terminate track
	JSR sabre_stopTrack
	JMP sabre_updateAPUregisters

op_NLC:
	;; NLC - Note Length Custom - Set custom note length of next byte
	LDA (channel_patternOffsetAddr,x)
	LDY sabreTemp 
	STA channelNoteDuration,y 
	INC channel_patternOffsetAddr,x 
	BNE +
		INC channel_patternOffsetAddr+1,x
	+
	JMP getNextPatternByte

op_FXX:
	;; FXX - Set track speed with next byte 
	LDA #$FF 
	SEC
	BIT soundRegion		;; Subtract 1 from track speed if PAL or Dendy
	BEQ +
		CLC 
	+
	ADC (channel_patternOffsetAddr,x)
	STA trackSpeed
	INC channel_patternOffsetAddr,x 
	BNE +
		INC channel_patternOffsetAddr+1,x
	+
	LDY sabreTemp 
	JMP getNextPatternByte

op_ZXX:
	;; ZXX - Set direct DMC load counter [$4011] with next byte
	LDA (channel_patternOffsetAddr,x)
	STA $4011
	LDY sabreTemp 
	JMP getNextPatternByte

op_NUL:
	;; NULL - Null note value. Skip to processing envelopes
	LDY sabreTemp 
	LDA channelNoteDuration,y 
	STA channelNoteCountdown,y 
	JMP sabre_ProcessChannelEnvelopes

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