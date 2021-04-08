ENTRY(start)

MEMORY
{
	flash (rx) : ORIGIN = 0x0, LENGTH = 0x08000000
	sram (rwx) : ORIGIN = 0x40000000, LENGTH = 256M
	/* ARM qemu has no SRAM, so pretend that a DRAM area
	 * is SRAM
         */
	/*ram (rwx) : ORIGIN = 0x40000000, LENGTH = 0x10000000*/
}

SECTIONS
{
	.text : {
	      *(.vector_table)
	      *(.text)
	} > flash

	.rodata : {
	      *(.rodata)
	      /*
		This align is needed to put END_OF_RODATA at the same address
		as start of .data. Both ALIGNS(8) are strictly not necessary for
		the memory layout. 
	      */
	      . = ALIGN(8);
	      END_OF_RODATA = .;
	} > flash

	.data : ALIGN(8) {
	      START_OF_DATA = .;
      	      *(.data)
	      END_OF_DATA = .;
	} >sram  AT> flash

	.bss : ALIGN(8) {
	     START_OF_BSS = .;
     	     *(.bss)
	     END_OF_BSS = .;
	} > sram

	/DISCARD/ : {
            /*
		Not sure what this is (some sort of exception handling?)
		but I need to remove it or it will offset the .data section
		in flash
	    */
            *(.eh_frame)
	}
}
