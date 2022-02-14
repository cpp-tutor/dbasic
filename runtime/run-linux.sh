#!/bin/sh

./dbasic < $1 > prog.s && arm-linux-gnueabihf-gcc -mcpu=arm3 -mfpu=vfp -march=armv2 -marm prog.s runtime/basic_lib.c -lm && QEMU_LD_PREFIX=/usr/arm-linux-gnueabihf qemu-arm ./a.out
