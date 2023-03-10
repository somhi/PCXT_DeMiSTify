`define MIST_SIDI
//`define EMBED_8088_ROM	//  (16 M9K)
`define EMBED_CHAR_ROM_MDA	//  (4 M9K)
`define NO_ADLIB      	//  (9 M9K)
`define NO_CMSOUND    	//DOES NOT FIT LEs
`define NO_CREDITS	//DOES NOT FIT WITH CGA_32  (10 M9K)
//`define NO_CGA	//if not CGA, only MDA is available
//`define CGA_16      
`define CGA_32		//M9Ks 48 / 66 ( 83 % ) with EMBED_8088_ROM, NO_ADLIB, NO_CMSOUND, NO_CREDITS
			//M9Ks 60 / 66 ( 83 % ) with EMBED_CHAR_ROM_MDA, NO_ADLIB, NO_CREDITS
//`define CGA_64
//`define CGA_128
