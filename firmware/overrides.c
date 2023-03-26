// Remove anything that is not needed

#include "statusword.h"
 
const char *bootrom_name1="PCXT    ROM";
const char *bootrom_name2="TANDY   ROM";
const char *bootrom_name3="XTIDE   ROM";

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

	statusword&=~1; 
	sendstatus(); 	//release reset
				
	return(result);
}
