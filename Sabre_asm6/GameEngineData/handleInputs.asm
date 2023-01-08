.align 32
doHandleInputs:
    LDA gamepad             ;; get put get
    STA last_gamepad        ;; put get put
    LDX #1                  ;; get put
    STX gamepad             ;; get put get
    STX $4016               ;; put get put GET
    DEX                     ;; put get
    STX $4016               ;; put get put GET
gamepadPollingLoop:
    LDA $4016               ;; put get put GET
    LSR                     ;; put get
    ROL gamepad             ;; put get put get put
    BCC gamepadPollingLoop  ;; get put [get]
    RTS