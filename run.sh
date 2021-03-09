
#!/bin/bash
qemu-system-aarch64 \
    -machine virt \
    -cpu cortex-a53 \
    -bios start.bin \
    -m 256M         \
    -machine secure=on -nographic $@

