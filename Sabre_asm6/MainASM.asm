;;=========================
;; iNES header
	.include "Replayer\header.asm"
;;=========================
;; Constants and RAM defines 
	.include "SabreFiles\sabre_includes.asm"
	.include "Replayer\memoryMap.asm"
;;=========================
;; Handle bank assignments
	.base $8000
	.include "Replayer\BankData\UNROM_Bank00.asm"
	.pad $c000
	.base $8000
	.include "Replayer\BankData\UNROM_Bank01.asm"
	.pad $c000
	.base $8000
	.include "Replayer\BankData\UNROM_Bank02.asm"
	.pad $c000
	.base $8000
	.include "Replayer\BankData\UNROM_Bank03.asm"
	.pad $c000
	.base $8000
	.include "Replayer\BankData\UNROM_Bank04.asm"
	.pad $c000
	.base $8000
	.include "Replayer\BankData\UNROM_Bank05.asm"
	.pad $c000
	.base $8000
	.include "Replayer\BankData\UNROM_Bank06.asm"
	.pad $c000
	.include "Replayer\BankData\UNROM_Bank07_static.asm"
;;=========================
