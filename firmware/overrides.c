// Remove anything that is not needed

#include "statusword.h"

int LoadROM(const char *fn);
 
const char *bootrom_name1="PCXT    ROM";
const char *bootrom_name2="TANDY   ROM";
const char *bootrom_name3="XTIDE   ROM";

const char *bootvhd_name1="PCXT1   VHD";
const char *bootvhd_name2="PCXT2   VHD";

//Note the filename must be in 8/3 format with no dot and capital letters. 
//If the name have less than 8 letters then leave spaces so total characters must be 11.

extern unsigned char romtype;
extern unsigned int statusword;

char *autoboot()
{
	char *result=0;

	statusword |= 1; 
	sendstatus(); 	//put the core in reset

	romtype=2;
	LoadROM(bootrom_name2);

	romtype=1;
	LoadROM(bootrom_name1);
	
	romtype=3;
	LoadROM(bootrom_name3);
	
	loadimage(bootvhd_name1,'0');
	loadimage(bootvhd_name2,'1');
	
	statusword&=~1; 
	sendstatus(); 	//release reset
				
	return(result);
}

