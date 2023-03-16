;;;; DEFAULT HEADER FILE

    .db "NES",$1a   ;; iNES identifier
    .db $08         ;; Number of PRG-ROM banks [8]
    .db $00         ;; Number of CHR-ROM banks [0]
    .db %00100001   ;; Vertical mirroring
    ;;   ||||
    ;MAP 3210
    
    .db %00000000 
    ;;   ||||
    ;MAP 7654
                    ;; UNROM [INES mapper 2]
    
    .db $00,$00,$00,$00,$00,$00,$00,$00   ;filler
    