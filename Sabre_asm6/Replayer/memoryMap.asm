ZP_RAM = $0000
SOUND_RAM = $0100
SHADOW_OAM = $0200

;;;; ZERO PAGE VARIABLES
    .enum ZP_RAM
		vBlankTimer			.dsb 1
		doNMI				.dsb 1
		gameHandler 		.dsb 1
	;;	7 6 5 4 3 2 1 0
	;;	| + + + + + + + -- ???
	;;	+ ---------------- [1] Ready to do vBlank PPU updates
		soft2000			.dsb 1
		soft2001			.dsb 1
		XSCROLL				.dsb 1
		YSCROLL				.dsb 1
		temp				.dsb 1
		temp1				.dsb 1
		temp2				.dsb 1
		temp3				.dsb 1
		temp16				.dsb 2
		currentPRGbank		.dsb 1
		curCPUscanlines		.dsb 1
		maxCPUscanlines		.dsb 1
		gamepad				.dsb 1
		last_gamepad		.dsb 1
		pressed_gamepad		.dsb 1
		cursorY 			.dsb 1
		trackRestartStatus	.dsb 1
		
		;; Sabre ZP RAM vars
		.include "SabreFiles/sabre_ZP_RAM.asm"
	.ende
	
;;;; OVERFLOW RAM VARIABLES 
	.enum SOUND_RAM
		;; Sabre misc RAM vars
		.include "SabreFiles/sabre_Misc_RAM.asm"
	.ende 
	
