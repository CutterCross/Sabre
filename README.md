# Sabre
 ![](SabreLogo.png)
 
 Sabre is a lightweight sound driver for NES homebrew projects, compatible with [FamiTracker](https://github.com/Dn-Programming-Core-Management/Dn-FamiTracker "Dn-FamiTracker GitHub Page") TXT export data. 
 
 Currently only written for [ASM6 / ASM6F](https://github.com/freem/asm6f "ASM6F Github Page")
 
## Features:
 - Note range: A0 - B7
 - Note cuts
 - Speed and tempo 
 - All 5 2A03 channels supported for music (Pulse 1, Pulse 2, Triangle, Noise, DMC)
 - SFX can use up to 4 channels at once (Pulse 1, Pulse 2, Triangle, Noise)
 - Volume, arpeggio (absolute), pitch (relative), and duty envelopes supported for instruments 
 - Loop points for all supported envelope types
 - BXX for arbitrary loop points
 - C00 for non-looping tracks
 - D00 for variable pattern length
 - FXX for variable playback rate
 - ZXX for setting DMC line level ($4011)
 - 63 instruments (255 unique envelopes total)
 - 256 tracks
 - 256 SFX 
 - 128 patterns per track 
 - 1 pattern per SFX
 - NTSC, PAL, and Dendy tempo & period adjustments
 
## Requirements:
 - 1757 bytes ROM
 - 42 bytes ZP RAM
 - 121 bytes non-ZP RAM 
 
## Usage Notes:
 - Assign DPCM samples to 1 instrument only
 - No DPCM for SFX  
 - No envelopes larger than size 254
 - No Hi-Pitch envelopes 
 - No Release points for envelopes
 - Pitch envelopes have no effect on Noise channel
 - Non-looping Pitch envelopes should end with 0
 - Do not expand effect columns to more than 1 effect per channel
 - BXX, C00, and D00 should only be placed in the first active channel (left -> right)
 - FXX and ZXX will be clobbered by BXX, C00, or D00 on the same row
 
## Sabre Replayer Controls:
 - D-Pad L/R: Change track index
 - D-Pad L/R (Holding B): Change SFX index
 - D-Pad U/D: Change selected 2A03 channel
 - Select: Stop/restart current track
 - Start: Pause/unpause current track 
 - B: Play current SFX index 
 - A: Mute/unmute selected 2A03 channel
 
## FamiTracker Usage Guide:
 - Add tracks and SFX through Module -> Module Properties -> Add.
 - To append a track to a seperate bank file, put a 2-digit prefix of the PRG bank number before the track name. (Example: `0B_testSong0` for PRG bank $0B)
 - SFX should have a prefix of `sfx_` before their track name.
 - Only use alphanumeric characters in instrument, track, and SFX names.
 - Export as FT TXT through File -> Export Text.
 
## Converting with sabre\_ft\_txt\_asm6.py: 
 You must have [Python](https://www.python.org/downloads/ "Python Downloads Page") installed in order to execute .py modules. Python 3 and above are recommended.
 
 Drag your exported FT TXT file to `sabre_ft_txt_asm6.py`. 
 
 Alternatively, you can run via the command line.
 ```
 python sabre_ft_txt_asm6.py {filename}.txt {title}
 ```
 Replace `{filename}` with the name of your exported FT txt file 
 
 (Optional) Replace `{title}` to use a different prefix than `{filename}` for your output files.
 
 If no files are created, there was likely a runtime error. Running via the command line can help list any errors that occur.
 
### Converted Music Data Files:
 - `{filename}_static.asm`: Include alongside `sabre.asm`. Contains LUTs, instruments, and SFX.
 - `{filename}_dpcm.asm`: If this file is generated, include in a static PRG bank at $C000-$FFFF. Contains DPCM sample data.
 - `{filename}_{bankNo.}.asm`: Include in the corresponding PRG bank where you want your track data to be stored. Contains track data.
 
### Including Your Music Data in the Sabre Replayer: 
 - `{filename}_static.asm`: Include in `UNROM_Bank07_static.asm`.
 - `{filename}_dpcm.asm`: If this file is generated, include in `UNROM_Bank07_static.asm`.
 - `{filename}_{bankNo.}.asm`: Include in the corresponding UNROM_Bank file in the `BankData` folder. (Default bank is $00.)
 
## Including Sabre in Your Project (ASM6):
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
 
#### Build Flags in sabre\_includes.asm:
 - `UNOFFICIAL_OPS`: Used by the Sabre replayer source to swap between `sabre.asm` and `sabre_uo.asm`.
 - `BANKSWITCH_TRACKS`: Used by the Sabre replayer and driver to bankswitch each track's corresponding PRG bank.
 - `ADJ_REGION_TEMPO_TRACK`: Enables tempo adjustment for music between NTSC, PAL, and Dendy regions.
 - `ADJ_REGION_TEMPO_SFX`: Enables tempo adjustment for SFX between NTSC, PAL, and Dendy regions. 
 
#### Differences Between sabre.asm and sabre\_uo.asm:
 - `sabre.asm`: Use if your project does not use unofficial CPU opcodes.
 - `sabre_uo.asm`: Uses unofficial CPU opcodes ANC {#imm}, AXS {#imm}, LAX {zp}, and DCP {abs,y}. (Requires ASM6F)
 
## Using Sabre in Your Project:

### Initialization:
 In your program's initialization, store your desired region value into `soundRegion`, and then call `sabre_initAPU`.
 - `REGION_NTSC`
 - `REGION_PAL`
 - `REGION_DENDY`
 ```
 LDA #REGION_NTSC
 STA soundRegion 
 JSR sabre_initAPU
 ```
 
### Updating:
 Once per frame, you must call `sabre_soundUpdate`. It's recommended, if possible, you do this near the end of your NMI routine so that lag frames won't affect music playback.
 ```
 JSR sabre_soundUpdate
 ```
 
### Bankswitching Tracks:
 If you have tracks in multiple PRG banks and can freely access Sabre during bankswitching, load `currentTrackPRGbank` and use your bankswitch routine to swap in that bank before calling `sabre_soundUpdate`.
 
 Don't forget to swap the original PRG bank back in after the sound update!
 
 Replace the default UNROM bankswitch subroutine call (located in the `sabre_playTrack` subroutine of the `sabre.asm` file) with your own bankswitch routine: 
 ```
	;;;; Custom bankswitch here!
	.ifdef BANKSWITCH_TRACKS
		TAY
		JSR UNROM_bankswitchNoSave
	.endif
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 ```
 Depending on your setup, you may need to swap in the previous PRG bank near the end of the `sabre_playTrack` subroutine:
 ```
	;;;; Custom return bankswitch here, if needed
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
 endPlayTrack:
 ```
 If you keep the `BANKSWITCH_TRACKS` build flag, ensure that it is enabled in `sabre_includes.asm`.
 
### If Not Bankswitching Tracks:
 If you are not bankswitching tracks, either disable the `BANKSWITCH_TRACKS` build flag, or delete the default UNROM bankswitch section in the `sabre_playTrack` subroutine.
 
### Playing Tracks and SFX:
 Your exported `{filename}_static.asm` file will contain a set of constants for each track and SFX index. 
 
 To play a track, store one of these constant track values into `currentTrack`, and then call `sabre_playTrack`:
 ```
 LDA #_default_track0
 STA currentTrack 
 JSR sabre_playTrack
 ```
 To play SFX, store one of these constant SFX values into `currentSFX`, and then call `sabre_playSFX`:
 ```
 LDA #_sfx_sfx0
 STA currentSFX
 JSR sabre_playSFX
 ```
 To stop music playback, call `sabre_stopTrack`:
 ```
 JSR sabre_stopTrack 
 ```
 To pause music playback, call `sabre_pauseTrack`. Call `sabre_pauseTrack` again to unpause:
 ```
 JSR sabre_pauseTrack 
 ```
 To mute specific channels for music or SFX playback, write #$00 to the corresponding `channelMuteStatus` variable:
 ```
 LDA #$00
 STA channelMuteStatus+CHANNEL_TRACK_PULSE1
 ```
 To unmute these channels, write #$FF to the corresponding `channelMuteStatus` variable instead:
 ```
 LDA #$FF 
 STA channelMuteStatus+CHANNEL_TRACK_PULSE1
 ```
 All of these channel number constants can be found in `sabre_includes.asm`.

## Composing Tips for Reducing Data Size:
 - Write channel patterns in ways which you can reuse them often.
 - Reuse instrument envelopes often.
 - Space out notes in ways that correspond to the common note lengths in `sabre_includes.asm`. (Example: NL4 = Next note in 4 rows)
 - Contiguous notes with the same note length do not use redundant data.
 - Contiguous notes with the same instrument do not use redundant data.
 - Contiguous notes with the same note period do not use redundant data. (Exception: Following change in note length or FT effect)


 