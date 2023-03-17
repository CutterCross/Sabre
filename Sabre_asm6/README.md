# Including Sabre in Your Project (ASM6):
 - `sabre_includes.asm`: Include at the top of your program, along with any other program constants you have defined.
 - `sabre_ZP_RAM.asm`: Include in your Zero Page RAM defines.
 ```
 .enum $0000
 ;; ...
 .include "sabre_ZP_RAM.asm"
 .ende
 ```
 - `sabre_Misc_RAM.asm`: Include somewhere else in your RAM defines. 
 ```
 .enum $0100
 ;; ...
 .include "sabre_Misc_RAM.asm"
 .ende
 ```
 - `sabre.asm`: Include where you want the driver to be stored.
 
# Building the Sabre Replayer Source (ASM6):
 The `TestBuild.bat` file executes this line, which can also be executed via the command line:
 ```
 asm6f -m MainASM.nes SabreUNROM.nes SabreUNROM_source.txt
 ```
 You should replace the default `asm6f` name with the actual name of your asm6-derivative assembler.
 
 You should remove the `-m` argument if you are using vanilla ASM6.