
PREFIX = aarch64-xr-linux-

# need --no-pie for bare metal code
CFLAGS = -g -march=armv8-a -mcpu=cortex-a53 -Wall -Wextra --no-pie -ffreestanding -nostdlib
LDFLAGS = -g

CC = ${PREFIX}gcc
LD = ${PREFIX}ld
OBJCOPY = ${PREFIX}objcopy

OBJS = start.o test.o

all: ${OBJS}
	${LD} ${LDFLAGS} -T start.ld -o start.elf $^
	${OBJCOPY} -O binary start.elf start.bin

# compile each .c file to .o file
%.o: %.c
	${CC} ${CFLAGS} -c $< -o $@

# compile each .S file to .o file
%.o: %.S
	${CC} ${CFLAGS} -c $< -o $@

clean:
	rm -f *.o *.bin *.elf
