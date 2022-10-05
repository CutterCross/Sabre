MainGameLoop:
	LDA vBlankTimer
vBlankTimerLoop:
	CMP vBlankTimer
	BEQ vBlankTimerLoop
	JSR spriteOverflowPolling
	LDA #%00011010
	STA $2001
	;;;; Sabre update ;;;;
	LDY currentTrackPRGbank
	JSR UNROM_bankswitchNoSave
	JSR sabre_soundUpdate
	LDY currentPRGbank
	JSR UNROM_bankswitchNoSave
	;;;;;;;;;;;;;;;;;;;;;;
	LDA #%00011000
	STA $2001
	JSR spriteZeroHitPolling_countScanlines
	JSR doHandleButtonScripts
	JMP MainGameLoop