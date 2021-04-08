# GARM: bare metal program for ARMv8 cortex a53 #

GARM is a bare metal program for the QEMU ARMv8 cortex-a53 virt platform. The
QEMU armv8 virt platform has the following memory layout:

0   ... 128M   flash (Note! Read only)
128 ... 1G     Peripherals including GIC, uart, etc.
1G  ... X      RAM

## building ##
Change PREFIX to your aarch64 toolchain prefix, then run:
make

## run ##
make run

## QEMU ##
GARM assumes the following hw spec:
At least 256M RAM
CPU boots in EL3

This can be achieved by starting QEMU with the following parameters:
-m 256M
-machine secure=on




