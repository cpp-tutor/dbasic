#!/bin/sh

./dbasic < $1 | arm-linux-gnueabihf-gcc -mcpu=arm3 -mfpu=vfp -march=armv2 -marm -mfloat-abi=hard -O5 runtime/basic_lib.c -x assembler - -lm && QEMU_LD_PREFIX=/usr/arm-linux-gnueabihf qemu-arm ./a.out
