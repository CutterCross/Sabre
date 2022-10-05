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
;;=========================
;; Reset
	.include "GameEngineData\reset.asm"
;;=========================
;; Initialization + game loop
	.include "GameEngineData\initialization.asm"
	.include "GameEngineData\mainGameLoop.asm"
;;=========================
;; NMI
	.include "GameEngineData\NMI.asm"
;;=========================
;; $C000 Subroutines
	.include "GameEngineData\c000_subroutines.asm"
	.pad $F000	;; Nice visual way to see engine size in NESsc
	.include "GameEngineData\sabre_uo.asm"
;;=========================
;; Vectors
    .include "GameEngineData\vectors.asm"
;;=========================
