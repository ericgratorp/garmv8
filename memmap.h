#ifndef MEMMAP_H
#define MEMMAP_H

#define FLASH_BASE 0x0
#define FLASH_SIZE 0x8000000

/* QEMU adds a device tree to start of RAM, but we don't care about that */
#define RAM_BASE   0x40000000

#define RAM_SIZE   0x10000000

/* put stack at end of RAM */
#define STACK_BASE 0x50000000


#define UART_BASE 0x9000000
#endif /* MEMMAP_H */
