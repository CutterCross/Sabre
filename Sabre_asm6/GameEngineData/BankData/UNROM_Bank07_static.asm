;; UNROM Bank $07 - Static Data

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
;;=========================
;; Sabre Driver
	.include "GameEngineData\sabre.asm"
;;=========================
;; Sabre Static + DPCM Data
    .include "sabre_demoTracks_static.asm"
    .include "sabre_demoTracks_dpcm.asm"
;;=========================
;; Vectors
    .include "GameEngineData\vectors.asm"
;;=========================