#!/bin/sh

./dbasic < $1 | arm-linux-gnueabihf-gcc -mcpu=arm710t -mfpu=vfp -marm -mfloat-abi=hard -O3 runtime/basic_lib.c -x assembler - -lm && QEMU_LD_PREFIX=/usr/arm-linux-gnueabihf qemu-arm ./a.out
