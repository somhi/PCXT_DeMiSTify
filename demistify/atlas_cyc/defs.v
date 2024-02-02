////////////////////////////////////   MACROS DEFINITIONS  /////////////////////////////////////////
//
// Not all boards have the resources (BRAM (M9K), logic cells) to implement  all the sound cards 
// and video modes with maximum memory, so there is a defs.v file in each board folder that 
// defines witch modules are implemented in the board.
//
////////////////////////////////////////////////////////////////////////////////////////////////////

// Comment with // each `define line that apply or doesn't apply to your board.

// RELEASE MACROS			[M9Ks  63 / 66 ]  [98% LEs]
`define EMBED_8088_ROM        	// (16 M9K)
`define NO_MDA			// MDA video disabled
`define NO_ADLIB     		// Adlib. (4/9 M9K) 
`define NO_CMSOUND   		// Game Blaster. For board with not enough Logic cells
`define NO_CREDITS		// (10 M9K) Remove Credits screen. For boards with not enough BRAM 
`define CGA_32			// (32 M9K)    
//`define NO_UART1		// (2 M9K) 

// DEVELOPMENT MACROS
//`define NO_MDA
//`define NO_ADLIB     		// Adlib. (4/9 M9K) 
//`define NO_CMSOUND   		// Game Blaster. For board with not enough Logic cells
//`define NO_CREDITS		// (10 M9K) Remove Credits screen. For boards with not enough BRAM 
//`define CGA_16		// (16 M9K)	
//`define DEBUG2		// Define if want to show DEBUG menu in OSD

/////////////////////////////////   COMPLETE LIST OF MACROS   //////////////////////////////////////

////// MiST / SiDi & compatible boards specific macros //////
//`define MIST_SIDI		// Define if your board is MiST compatible

////// EMBED ROMs into Logic Cells to free BRAM resources needed for video and audio //////
//`define EMBED_8088_ROM        // (16 M9K)
//`define EMBED_CHAR_ROM_MDA  	// (4 M9K)

////// AUDIO //////
//`define NO_ADLIB     		// Adlib. (4/9 M9K) 
//`define NO_CMSOUND   		// Game Blaster. For board with not enough Logic cells

////// CREDITS screen //////
//`define NO_CREDITS		// (10 M9K) Remove Credits screen. 

////// VIDEO CGA memory assigned //////
// Defines CGA memory (16, 32, 64, 128) depending of the BRAM available for your board	
// Define only one of the following macros:
//`define NO_CGA		// if defined NO_CGA Removes CGA video and enables only MDA output	
//`define CGA_16		// (16 M9K)
//`define CGA_32		// (32 M9K)	
//`define CGA_64		// (64 M9K)  64 MB does not seem to have any improvement over 32 MB
//`define CGA_128		// (128 M9K) 
//`define CGA_128_CV 		// (128 M9K) CGA for CYCLONE V boards, enables MDA video also

////// VIDEO MDA //////
//`define NO_MDA		// if defined, MDA video output is disabled

////// UART 1  //////
//`define NO_UART1		// (2 M9K) 

////// DEBUG information //////
//`define DEBUG2		// Define if you want to show DEBUG menu in OSD




