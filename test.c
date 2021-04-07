#include "memmap.h"


/* just to try test .bss and .data sections */
unsigned long t1 = 0;
char t2 = 0x3;
unsigned long t4 = 0xdeadbeef;
unsigned long t3;
extern char END_OF_RODATA, START_OF_DATA, END_OF_DATA, START_OF_BSS, END_OF_BSS;

void print(const char *str)
{
    unsigned int *uart = (unsigned int *)UART_BASE;
    while (*str) {
        *((unsigned int *) uart) = *str;
        str++;
    }

}

/* relocate data section from flash to ram */
void relocate(void)
{
    unsigned long data_section_size = &END_OF_DATA - &START_OF_DATA;
    char *ram_start = &START_OF_DATA;
    char *flash_start = &END_OF_RODATA;

    while (data_section_size-- > 0) {
        *ram_start = *flash_start;
        ram_start++;
        flash_start++;
    }
}

void main(void)
{
    relocate(); /* must be called before anything in data section is accessed */
    print("Hello world\n");

    if (t2 == 0x3 && t4 == 0xdeadbeef) {
        print("Data section successfully relocated\n");
    } else {
        print("something is fishy with .data");
    }
}

