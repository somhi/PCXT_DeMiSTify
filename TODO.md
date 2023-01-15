### BUGs and TODO list

* Keyboard error controller message with Turbo mode. Please start BIOS with 4.77 MHz to avoid this error.

* IBM5160 BIOS keyboard hungs if started at CPU speed 9.54 or higher

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

  


### Differences in Demistify ports

* SW/ROMS/*.rom  roms are adapted for serdrive (XT-IDE BIOS) usage
* SW/   splash.txt, make_splash_ascii-hex.py, serdrive*   DeMiSTify splash screen and serdrive binaries
* rtl/8088/eu_rom.v includes macro EMBED_8088_ROM to use fabric LEs instead of BRAM
* rtl/KFPC-XT/HDL/KFPS2KB/KFPS2KB.sv includes many changes by kitune-san to avoid problems with direct keyboard connection conflicting with DeMiSTify controller (error flag). F12 key has been disabled  as it is used for deMiSTify and was sending a character that was interfering with the DOS applications.
* PCXT.sv
  * All Mister framework modules changed by MiST modules
  * BIOS loader has some differences
* Using UART port 1 for serdrive, and UART port 2 por serial mouse
* Video is quite different  (rtl/video and PCXT.sv)



### MACROS defined in defs.v

Not all boards have the resources (BRAM, logic cells) to implement  all the sound cards and video modes with maximum memory, so there is a defs.v file in each board folder that defines witch modules are implemented.

Comment with // each line that apply or don't apply to your board.

//define EMBED_8088_ROM		 // Embeds ROM in LEs. Define for boards with not enough BRAM (16 M9K)
//define EMBED_CHAR_ROM_MDA  //Embeds ROM in LEs. Define for boards with not enough BRAM (4 M9K)
define NO_ADLIB							// Adlib sound. Define for boards with not enough BRAM (4 M9K)
define NO_CMSOUND      			 // Game Blaster sound
//define NO_CREDITS			   // Remove Credits screen. Define for boards with not enough BRAM (10 M9K)
define NO_MDA							  // Removes MDA video. Define for boards with not enough BRAM (8 M9K)
//define NO_CGA							// Removes CGA video	
//define CGA_16							  // Defines CGA memory (13, 32, 64, 128). Define only one of them 	
//define CGA_32							  // depending of the BRAM available for your board	
//define CGA_64
define CGA_128							  // BRAM usage (128 M9K)
