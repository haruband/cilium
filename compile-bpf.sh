#!/bin/bash

TARGET=${1:-host}

clang -emit-llvm -g -O1 -target bpf -std=gnu89 -nostdinc -D__NR_CPUS__=128 -Wall -Wextra -Werror -Wshadow -Wno-address-of-packed-member -Wno-unknown-warning-option -Wno-gnu-variable-sized-type-not-at-end -Wdeclaration-after-statement -Iconfigs/${TARGET} -Iconfigs -Iinclude -I. -c bpf_${TARGET}.c -o bpf_${TARGET}.bc
#opt -O2 -debug-pass=Arguments bpf_${TARGET}.ll -disable-output
opt -loop-simplify -S bpf_${TARGET}.bc > bpf_${TARGET}.ll
llc -mattr=dwarfris -march=bpf -mcpu=v2 -filetype=obj -o bpf_${TARGET}.o bpf_${TARGET}.ll
