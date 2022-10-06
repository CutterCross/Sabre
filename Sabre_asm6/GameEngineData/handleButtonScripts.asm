doHandleButtonScripts:
    LDA last_gamepad 
    EOR #$FF 
    AND gamepad 
    STA pressed_gamepad
    ;;;; STANDARD GAMEPAD READS ;;;;
    LDA #%00000001
    ;;;;;;;; RIGHT PRESSED ;;;;;;;;;
    BIT pressed_gamepad
    BEQ endRightInput_pressed
        ;; Increment track
        LDA currentTrack
        CLC
        ADC #1
        CMP sabre_maxTracks
        BCC +
            LDA #0
        +
        STA currentTrack
        JSR sabre_playTrack
        ;; Reset track stop status
        LDA #0
        STA trackRestartStatus
        STA maxCPUscanlines
endRightInput_pressed:
    LDA #%00000010
    ;;;;;;;; LEFT PRESSED ;;;;;;;;;;
    BIT pressed_gamepad
    BEQ endLeftInput_pressed
        ;; Decrement track
        LDA currentTrack
        BNE +
            LDA sabre_maxTracks
            STA currentTrack
        +
        DEC currentTrack
        JSR sabre_playTrack
        ;; Reset track stop status
        LDA #0 
        STA trackRestartStatus
        STA maxCPUscanlines
endLeftInput_pressed:
    LDA #%00000100
    ;;;;;;;;; DOWN PRESSED ;;;;;;;;;
    BIT pressed_gamepad
    BEQ endDownInput_pressed
        ;; Move cursor down
        LDA cursorY
        CMP #4
        BCC +
            LDA #255
            STA cursorY
        +
        INC cursorY 
endDownInput_pressed:
    LDA #%00001000
    ;;;;;;;;;; UP PRESSED ;;;;;;;;;;
    BIT pressed_gamepad
    BEQ endUpInput_pressed
        ;; Move cursor up
        LDA cursorY
        BNE +
            LDA #5
            STA cursorY
        +
        DEC cursorY
endUpInput_pressed:
    LDA #%00010000
    ;;;;;;;;; START PRESSED ;;;;;;;;
    BIT pressed_gamepad
    BEQ endStartInput_pressed
        JSR sabre_pauseTrack
endStartInput_pressed:
    LDA #%00100000
    ;;;;;;;; SELECT PRESSED ;;;;;;;
    BIT pressed_gamepad
    BEQ endSelectInput_pressed
        ;; Toggle stopSong / restart song
        LDA trackRestartStatus
        EOR #$FF 
        STA trackRestartStatus
        BEQ +
            JSR sabre_stopTrack
            JMP endB_Input_pressed
        +
            JSR sabre_playTrack
endSelectInput_pressed:
    ;;;;;;;;;; B PRESSED ;;;;;;;;;;;
    BIT pressed_gamepad
    BVC endB_Input_pressed
        LDA #1
        STA currentSFX
        JSR sabre_playSFX
endB_Input_pressed:
    ;;;;;;;;;; A PRESSED ;;;;;;;;;;;
    BIT pressed_gamepad
    BPL endA_Input_pressed
        LDA cursorY
        ASL 
        TAX
        CPX #8
        BNE +
            LDA #%00001111
            STA $4015
        +
        LDA channelMuteStatus,x 
        EOR #$FF 
        STA channelMuteStatus,x 
endA_Input_pressed:

;;;; Update cursor Y position
    LDX cursorY
    LDA cursorYpositionTable,x
    STA SHADOW_OAM+4
    RTS

cursorYpositionTable:
	.db 127, 143, 159, 175, 192