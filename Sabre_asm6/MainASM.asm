;;=========================
;; iNES header
	.include "GameEngineData\header.asm"
;;=========================
;; Constants and RAM defines 
	.include "GameEngineData\sabre_includes.asm"
	.include "GameEngineData\memoryMap.asm"
;;=========================
;; Handle bank assignments
	.base $8000
	.include "GameEngineData\BankData\UNROM_Bank00.asm"
	.pad $c000
	.base $8000
	.include "GameEngineData\BankData\UNROM_Bank01.asm"
	.pad $c000
	.base $8000
	.include "GameEngineData\BankData\UNROM_Bank02.asm"
	.pad $c000
	.base $8000
	.include "GameEngineData\BankData\UNROM_Bank03.asm"
	.pad $c000
	.base $8000
	.include "GameEngineData\BankData\UNROM_Bank04.asm"
	.pad $c000
	.base $8000
	.include "GameEngineData\BankData\UNROM_Bank05.asm"
	.pad $c000
	.base $8000
	.include "GameEngineData\BankData\UNROM_Bank06.asm"
	.pad $c000
	.include "GameEngineData\BankData\UNROM_Bank07_static.asm"
;;=========================
