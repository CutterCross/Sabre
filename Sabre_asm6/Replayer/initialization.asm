;;;; Initialization
	JSR loadSoundTestScreen
	
;;;; Get ready to enable rendering	
	
	;; Enable NMI
    LDA #%10010000  ;; Turn on NMI, set sprites $0000, bkg to $1000
    STA $2000
    STA soft2000
    ;; Init PPUSCROLL
    LDY #0
    STY $2005
    STY $2005
    ;; UNROM bank init
    JSR UNROM_bankswitchY

    JSR waitVBlankCycle
    JSR getTVSystem
	STA soundRegion
	JSR sabre_initAPU
    LDA #%10000000
    STA gameHandler
	
	LDA #%00011000
	STA $2001
    STA soft2001

    LDA #0
	STA currentTrack
	JSR sabre_playTrack