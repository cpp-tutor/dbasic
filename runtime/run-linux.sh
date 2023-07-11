#!/bin/sh

if [ ! -f "./runtime/basic_lib.ll" ] ; then
  echo "Creating runtime/basic_lib.ll"
  clang -S -emit-llvm -o ./runtime/basic_lib.ll ./runtime/basic_lib.c
fi

./dbasic 4 < $1 > run_basic.ll && clang -O3 -o run_basic run_basic.ll ./runtime/basic_lib.ll -lm && ./run_basic
