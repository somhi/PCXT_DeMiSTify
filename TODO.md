### BUGs and TODO list

* In the last big update from MiSTer core, there seems to be some timing issues which could give issues with the keyboard beeping when pressing a key and eventually outputing a wrong character. It depends on the board though, so it is more accusated on de10lite than on Deca board for example.

* Keyboard error controller message with Turbo mode. Please start BIOS with 4.77 MHz to avoid this error.

* IBM5160 BIOS keyboard hungs if started at CPU speed 9.54 or higher

* MiST and SiDi constraints need to be fully revised.  Constraints paths have been deliveratelly set incorrect as it has been found that it works better in this way (e.g. no beeps while typing with the IBM5160 rom). Each board constraints file located at DeMiSTfify/Board/*/constraints.sdc, identifies the paths of the guest module. 

  * in MiST is defined as `set topmodule ""` but should be `set topmodule "guest|"`

  * In SiDi is defined as  `set topmodule "guest|"`but should be `set topmodule "guest2|"`

  
  
* Video

  * Area5150 demo: Apart from the glitches present in the real Graphic Gremlin card, there is some black cuts in two demos at the beginning and no video in the squares demo at 4.77 MHz. Running at max. speed it is worst. Better results are seen at 7.16 MHz.

  * video in pause & credits screen could be improved. Screen is shifted to the right because the first 18 left characters appear repeated

  * RGB 15 kHz video output . CGA video deformed at top part of screen in some resolutions (don't happen so often in TGA). The same happens in the original MiSTer core.

  * YPbPr video output did not work on my setup.

  * Real composite video output
    * Credits screen not implemented
    * Center image from core through hblank delays
    * Hot-key to enable composite mode without OSD 
    * OSD background solid color to improve visualization (display green workaround)
    
      


### Parts from MiSTer core not implemented in DeMiSTify ports

* FDD based on ao486 core that has dependencies with the MiSTer firmware (main)
  
* IDE based on ao486 core that has dependencies with the MiSTer firmware (main)

* RTC has dependencies with the MiSTer firmware (main)

* UART 16750 not updated because of serdrive not loading HDD images

* Video
  
  * Overscan delay control with scandoubler done in PCXT.sv
    
    No overscan with Graphic Gremlins scandoubler (//.video(video))
    
    [signals: color used in demisitfy, tandy_16_gfx & tandy_color_16 used in mister]
    
  * Border on/off option from OSD
  * Simulated composite video output
  
* OSD save configuration

  Notes: the BBC core can load and save configs.  (The config file has to be pre-existing on the SD Card, though - the filesystem code can't create files.)  You can save whatever you want in the config file, there are configtocore() and coretoconfig() functions in overrides.c.  The loading / saving is done from an extra menu page, accessed with the right cursor key while the menu is shown.

  


### Differences in DeMiSTify ports

* SW/ROMS/*.rom  roms are adapted for serdrive (XT-IDE BIOS) usage
* SW/   splash.txt, make_splash_ascii-hex.py, serdrive*   DeMiSTify splash screen and serdrive binaries
* credits/msg  Credits for DeMiSTify have differences from MiSTer port
* games/ This folder is linked in Readme to the MiSTer port
* releases/  no releases included because it will grow the repository size too much
* rtl/ 
  * rtl/8088/eu_rom.v includes macro EMBED_8088_ROM option to use logic cells instead of BRAM
  * rtl/KFPC-XT/HDL/KFPS2KB/KFPS2KB.sv version used for MiST/SiDi ports. Is nearly identical to MiSTer port except for that F12 key is disabled to not interfere with deMiSTify's OSD and F11 key is used for Pause&Credits screen. 
  * rtl/KFPC-XT/HDL/KFPS2KB/KFPS2KB_direct.sv includes many changes by kitune-san to avoid problems with direct keyboard connection conflicting with DeMiSTify controller (error flag). F12 key has been disabled  as it is used for deMiSTify's OSD and was sending a character that was interfering with the DOS applications.
  * rtl/KFPC-XT/HDL/Chipset.sv   Ports differences
  * rtl/KFPC-XT/HDL/Peripherals.sv  has many changes. Includes lots of macro optionals which load parts of code depending on the definitions file (defs.v) of each board. Video memory modules instantiations are different and make use of Altera's IP to reduce to half BRAM consumption. No IDE, FDD, RTC modules used.

* rtl/common/
  * rtl/common/common.qip  commented out those modules not used in DeMiSTify ports. 
  * rtl/common/msg.bin credits message file is different.

* rtl/sound
  * jt89/ added as submodule differs a litle bit from MiSTer version
  * jtopl/ added as submodule differs a litle bit from MiSTer version
  * jt89.qip file added to not modify the submodule folder
  * sigma_delta_dac.v added

* rtl/uart usign 16550 version because of serdrive not loading HDD images with 16750
* rtl/uart2 includes 16750 version that is not used
* rtl/video is quite different
  * serialize_comt_tx*  is used for real composite video output
  * vram_ip* video memory modules are different and make use of Altera's IP to reduce to half BRAM consumption

* sys/ folder is a modified version for demistify ports but not currently used 
* PCXT.sdc Constraints file is different
* PCXT.sv
  * Port signals totally different
  * OSD organization has differences
  * All Mister framework modules changed by MiST modules
  * BIOS loader has some differences
  * Using UART port 1 for serdrive, and UART port 2 por serial mouse
  * SDRAM_CLK phased is sent to SDRAM pin
  * No IDE, FDD 
  * Added Sigma-Delta module instantation
  * Video part is quite different 

* files.qip has some differences

### MACROS defined in defs.v

Not all boards have the resources (BRAM, logic cells) to implement  all the sound cards and video modes with maximum memory, so there is a defs.v file in each board folder that defines witch modules are implemented.

```verilog
// Comment with // each line that apply or don't apply to your board.

//`define EMBED_8088_ROM //Embeds ROM in LEs. For boards with not enough BRAM (16 M9K)
//`define EMBED_CHAR_ROM_MDA  //Embeds ROM in LEs. For boards with not enough BRAM (4 M9K)
`define NO_ADLIB		// Adlib sound. For boards with not enough BRAM (4/9 M9K)
`define NO_CMSOUND      // Game Blaster sound
//`define NO_CREDITS	// Remove Credits screen. For boards with not enough BRAM (10 M9K)
`define NO_MDA			// Removes MDA video. For boards with not enough BRAM (8 M9K)
//`define NO_CGA		// Removes CGA video	
//`define CGA_16		// Defines CGA memory (13, 32, 64, 128). Define only one of them
//`define CGA_32		// depending of the BRAM available for your board	
//`define CGA_64
`define CGA_128			// BRAM usage (128 M9K)

// Specific macros for Cyclone V boards
`define MDA_CV			// MDA for Cyclone V boards
`define CGA_128_CV 		// CGA for Cyclone V boards

// Specific macros for MiST / SiDi boards
`define MIST_SIDI		// Define if your board is MiST compatible
```

