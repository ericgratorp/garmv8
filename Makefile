PREFIX := aarch64-linux-gnu-
CC = $(PREFIX)gcc
LD = $(PREFIX)ld
OBJCOPY = $(PREFIX)objcopy

CFLAGS = -g -march=armv8-a -mcpu=cortex-a53 -nostdlib --no-pie

all: image

run:
	./run.sh

image: start
	$(OBJCOPY) -O binary start.elf start.bin

start: start.o test.o
	$(LD) -T start.ld -o start.elf start.o test.o

test.o: test.c
	$(CC) $(CFLAGS) test.c -c -o test.o
start.o: start.S
	$(CC) $(CFLAGS) start.S -c -o start.o	

clean:
	rm -rf *.o *.bin *.elf
