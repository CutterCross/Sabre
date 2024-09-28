
RESET:
    SEI         ;; Ignore interrupts for the reset
    CLD         ;; Disable decimal mode 
    LDX #$FF        
    TXS         ;; Initialize the stack
    INX
    STX $2000   ;; Disable NMI
    STX $2001   ;; Disable rendering
    STX $4010   ;; Disable DMC IRQ 
    STX $4015   ;; Disable APU sound
    LDA #64
    STA $4017   ;; Disable Frame Counter IRQ
    
;; First vblank 
    BIT $2002
    JSR waitVBlankCycle
    
;; Clear all ram 
    LDX #$00
clrMemLoop:
    LDA #$FE        ;; Instead of zero, write #$FE to 0200,x
    STA $0200,x     ;; To place sprites off screen
    STA $0400,x     ;; and object RAM as well
    LDA #$00
    STA $00,x
    STA $0100,x 
    STA $0300,x
    STA $0500,x
    STA $0600,x
    STA $0700,x
    INX
    BNE clrMemLoop
    
;; Second vblank 
    JSR waitVBlankCycle
    JSR waitVBlankCycle
