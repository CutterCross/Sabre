NMI:
	PHP
	PHA
	LDA doNMI
	BEQ dontSkipNMI
		JMP skipWholeNMI
dontSkipNMI:
	TXA 
	PHA
	TYA 
	PHA 
	INC doNMI
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	INC vBlankTimer
	;; Update OAM and inputs
	LDA #0
	STA $2001
	STA $2003
	LDA #2
	STA $4014
	JSR doHandleInputs	;; get put get put get put

	BIT gameHandler 
	BPL endVBlankPPUupdates
		;; Update PPU things
		BIT $2002
		JSR updateParameterInfo
		LDA #0 
		STA $2005 
		STA $2005
endVBlankPPUupdates:
	LDA #%00011000
	STA $2001
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	DEC doNMI 
	PLA
	TAY 
	PLA 
	TAX 
skipWholeNMI:
	PLA	
	PLP
	RTI	