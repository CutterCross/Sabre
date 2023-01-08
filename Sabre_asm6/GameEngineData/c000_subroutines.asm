.align 64

waitVBlankCycle:
	BIT $2002
	BPL waitVBlankCycle
	RTS

DEX_waitLoop:
	DEX 
	BNE DEX_waitLoop
	BIT temp 
	RTS
	
getTVSystem:
    LDX #0
    LDY #0
    LDA vBlankTimer
-nmiwait1:
    CMP vBlankTimer
    BEQ -nmiwait1
    LDA vBlankTimer
-nmiwait2:
    ;; Each iteration takes 11 cycles.
    ;; NTSC NES: 29780 cycles or 2707 = $A93 iterations
    ;; PAL NES:  33247 cycles or 3022 = $BCE iterations
    ;; Dendy:    35464 cycles or 3224 = $C98 iterations
    ;; so we can divide by $100 (rounding down), subtract ten,
    ;; and end up with 0=ntsc, 1=pal, 2=dendy, 3=unknown
    INX 
    BNE +nminoiny
    INY 
+nminoiny:
    CMP vBlankTimer
    BEQ -nmiwait2
    TYA 
    SEC 
    SBC #10
    CMP #3
    BCC +notAbove3
    LDA #3
+notAbove3:
    RTS
	
UNROM_bankTable:
	.db $00,$01,$02,$03,$04,$05,$06,$07

UNROM_bankswitchY:
	STY currentPRGbank
UNROM_bankswitchNoSave:
	LDA UNROM_bankTable,y 
	STA UNROM_bankTable,y 
	RTS 
	
UNROM_loadCHR:
	LDA #<CHR_BCKtest
	STA temp16 
	LDA #>CHR_BCKtest
	STA temp16+1
	LDY #0
	LDX #16
	STY $2006
	STY $2006
loop_writePatternTable0:
	LDA (temp16),y 
	STA $2007
	INY 
	BNE loop_writePatternTable0
	INC temp16+1
	DEX 
	BNE loop_writePatternTable0
	LDA #<CHR_BCKtest
	STA temp16 
	LDA #>CHR_BCKtest
	STA temp16+1
	LDX #16
loop_writePatternTable1:
	LDA (temp16),y 
	STA $2007
	INY 
	BNE loop_writePatternTable1
	INC temp16+1 
	DEX 
	BNE loop_writePatternTable1
	RTS

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
loadSoundTestScreen:
	;;;; Load palette
	BIT $2002
    LDX #$3F
    STX $2006
	LDX #$00
    STX $2006
	-
	LDA SABRE_soundTest_PAL,x
	STA $2007
	INX 
	CPX #32
	BCC -
	;;;; Load CHR 
	JSR UNROM_loadCHR
	;;;; Load nametables + attributes
	;; $2000
	LDY #$20
	STY $2006
	LDY #$00
	STY $2006
	LDX #4
	LDA #<SABRE_soundTest_NAM
	STA temp16
	LDA #>SABRE_soundTest_NAM
	STA temp16+1 
	-
	LDA (temp16),y 
	STA $2007
	INY 
	BNE -
	INC temp16+1 
	DEX 
	BNE -
	;; $2400
	LDA #0
	LDX #4
	-
	STA $2007
	DEY 
	BNE -
	DEX 
	BNE -
	;;;; Set up sprite 0
	LDA #144
	STA SHADOW_OAM
	LDA #32
	STA SHADOW_OAM+3
	LDA #1
	STA SHADOW_OAM+1
	LDA #%00100011
	STA SHADOW_OAM+2
	;;;; Set up input cursor sprite
	LDA #127
	STA SHADOW_OAM+4
	LDA #43
	STA SHADOW_OAM+7
	LDA #$1F
	STA SHADOW_OAM+5
	LDA #0
	STA SHADOW_OAM+6
	;;;; Set up 9 sprite overflow sprites
	LDX #8
	-
	LDA #95
	STA SHADOW_OAM,x
	LDA #0
	STA SHADOW_OAM+1,x
	STA SHADOW_OAM+2,x
	STA SHADOW_OAM+3,x
	INX 
	INX 
	INX 
	INX
	CPX #44
	BCC -
	;; Set up overlay sprites
	-
	LDA sabreLogoOverlaySpritesTable-44,x 
	STA SHADOW_OAM,x 
	INX 
	CPX #68
	BCC -
	LDA #254
	-
	STA SHADOW_OAM,x
	INX 
	BNE -
	RTS

sabreLogoOverlaySpritesTable:
	.db 55,$8f,%00000010,64
	.db 47,$7f,%00000010,64
	.db 39,$6d,%00000010,64
	.db 31,$5d,%00000010,64
	.db 39,$88,%00000010,72
	.db 31,$68,%00000010,72
	
spriteOverflowPolling:
	LDA #%10100000
	-
	BIT $2002
	BNE -
	-
	BIT $2002
	BEQ -
	RTS

spriteZeroHitPolling_countScanlines:
	LDY #15
	LDA #<NTSC_3dotAlign
	STA pointer16 
	LDA #>NTSC_3dotAlign
	STA pointer16+1
	LDA soundRegion
	AND #$01 
	BEQ +
		LDA #<PAL_5dotAlign
		STA pointer16 
		LDA #>PAL_5dotAlign
		STA pointer16+1
		LDY #13
	+
	LDA #%11000000
	LDX #0			;; Number of scanlines elapsed
	STX temp		;; Reset dot alignment counter
	-
	BIT $2002
	BNE -
-countScanlines:
	INX 
	-
	DEY 
	BNE -
	JMP (pointer16)
dotAlignReturn:
	BIT $2002
	BEQ -countScanlines
	;; X contains number of scanlines elapsed to sprite0 hit
	TXA 
	SEC 
	SBC #50
	EOR #$FF 
	;; Accumulator now has number of scanlines SABRE used
	STA curCPUscanlines
	CMP maxCPUscanlines
	BCC +
		STA maxCPUscanlines
	+
	RTS
	
.align 16
NTSC_3dotAlign:
	INC temp 
	LDY temp 
	CPY #3
	LDY #0
	BCS +
		NOP 
		BCC ++
	+
	STY temp 
	++
	LDY #15
	NOP 
	JMP dotAlignReturn
PAL_5dotAlign:
	INC temp
    LDY temp 
    CPY #5
    LDY #0
    BCS +
        BIT temp
        BCC ++
    +
    STY temp
    ++
	LDY #13
	NOP 
	NOP
	JMP dotAlignReturn

convertToBase10_digits:
    ;; Initial value in A
    LDY #$FF
    SEC 
    ;; Get hundreds place
    -
    INY
    SBC #100
    BCS -
    STY temp3
    ;; Get tens place
    ADC #100 
    LDY #$FF
    -
    INY
    SBC #10
    BCS -
    STY temp2 
    ;; Get ones place
    ADC #10 
	STA temp1
    RTS

updateParameterInfo:
	TEXT_BASE = $A0
	CHANNEL_ENABLED_TILE = $1E
	CHANNEL_DISABLED_TILE = $1D
	;;;; Set current Track number
	LDA #$21
	STA $2006
	LDA #$B0 
	STA $2006
	LDA currentTrack
	JSR updateByteDecimalNumberNAM
	;;;; Set current SFX number
	LDA #$21
	STA $2006
	LDA #$B8
	STA $2006
	LDA currentSFX
	JSR updateByteDecimalNumberNAM
	;;;; Set Current CPU Scanline usage
	LDA #$21
	STA $2006 
	LDA #$48
	STA $2006
	LDA curCPUscanlines
	JSR updateByteDecimalNumberNAM
	;;;; Set Max CPU Scanline usage
	LDA #$21 
	STA $2006 
	LDA #$59 
	STA $2006 
	LDA maxCPUscanlines
	JSR updateByteDecimalNumberNAM
	;;;; Set channel volume meters
	LDA #$22
	STA $2006
	LDA #$12
	STA $2006 
	;; Pulse 1
	LDA apuSFX4000 
	BNE +
		LDA apuShadow4000 
	+
	JSR loop_soundEquUpdateTiles
	LDA #$22
	STA $2006
	LDA #$52
	STA $2006 
	;; Pulse 2
	LDA apuSFX4004 
	BNE +
		LDA apuShadow4004
	+
	JSR loop_soundEquUpdateTiles
	LDA #$22
	STA $2006
	LDA #$92
	STA $2006 
	;; Triangle 
	LDX #8
    LDY #$0B
	LDA apuSFX4008
	BNE +
    	LDA apuShadow4008
	+
    AND #%01111111
    BNE +
        INY 
        INY
    +
    -
    STY $2007
    DEX 
    BNE -
	LDA #$22
	STA $2006
	LDA #$D2
	STA $2006 
	;; Noise 
	LDA apuSFX400C 
	BNE +
		LDA apuShadow400C 
	+
	JSR loop_soundEquUpdateTiles
	LDA #$23
	STA $2006
	LDA #$12
	STA $2006 
	;; DMC 
	LDX #8
    LDY #$0B
	LDA $4015
	AND #%00010000
    BNE +
        INY 
        INY
    +
    -
    STY $2007
    DEX 
    BNE -
	;;;; Set correct tiles for channel enable status
	LDA #%10010100		;; Set 32 increment mode
	STA $2000
	LDA #$22
	STA $2006
	LDA #$07
	STA $2006
	-
	LDA #CHANNEL_ENABLED_TILE
	LDY channelMuteStatus,x
	BNE +
		LDA #CHANNEL_DISABLED_TILE
	+
	STA $2007
	AND #0
	STA $2007
	INX 
	INX
	CPX #10
	BCC -
	LDA #%10010000		;; Set back to 1 increment mode
	STA $2000
	RTS

loop_soundEquUpdateTiles:
	ALR #$0F 
	TAX 
	LDY #8
	LDA #$0B
-drawDoubleUnits:
	DEX 
	BMI +endDoubleUnits
	STA $2007
	DEY 
	BNE -drawDoubleUnits
	RTS
+endDoubleUnits:
	BCC +skipSingleUnit
	LDA #$0C 
	STA $2007
	DEY 
	BEQ +return 
+skipSingleUnit:
	LDA #$0D
-drawEmptyUnits:
	STA $2007
	DEY 
	BNE -drawEmptyUnits
+return:
	RTS

updateByteDecimalNumberNAM:
	JSR convertToBase10_digits
	LDA temp3
	CLC 
	ADC #TEXT_BASE
	STA $2007
	LDA temp2 
	ADC #TEXT_BASE 
	STA $2007 
	LDA temp1
	ADC #TEXT_BASE 
	STA $2007
	RTS

.include "GameEngineData\handleInputs.asm"
.include "GameEngineData\handleButtonScripts.asm"
	
.include "GameEngineData\PPU_DATA\SABRE_soundTest_NAM_ATT.asm"
.include "GameEngineData\PPU_DATA\SABRE_soundTest_PAL.asm"

.include "sabre_testData_static.asm"
.include "sabre_testData_dpcm.asm"