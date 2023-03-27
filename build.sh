#!/bin/bash

#aarch64-xr-linux-gcc -g -nostdlib --no-pie -c start.S
aarch64-linux-gnu-gcc -march=armv8-a -mcpu=cortex-a53 -g -nostdlib --no-pie -c start.S test.c
aarch64-linux-gnu-ld -g -T start.ld -o start.elf start.o test.o
aarch64-linux-gnu-objcopy -O binary start.elf start.bin
