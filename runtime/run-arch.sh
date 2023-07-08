#!/bin/sh

./dbasic 4 < $1 | arm-none-linux-gnueabihf-gcc -mcpu=arm710t -mfpu=vfp -marm -mfloat-abi=hard -O3 runtime/basic_lib.c -x assembler - -lm && QEMU_LD_PREFIX=/usr/arm-none-linux-gnueabihf/libc qemu-arm ./a.out
