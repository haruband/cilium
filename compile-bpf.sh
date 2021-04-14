#!/bin/bash

TARGET=${1:-host}

clang -emit-llvm -g -O2 -target bpf -std=gnu89 -nostdinc -D__NR_CPUS__=128 -Wall -Wextra -Werror -Wshadow -Wno-address-of-packed-member -Wno-unknown-warning-option -Wno-gnu-variable-sized-type-not-at-end -Wdeclaration-after-statement -Iconfigs/${TARGET} -Iconfigs -Iinclude -I. -c bpf_${TARGET}.c -o bpf_${TARGET}.bc
llvm-dis bpf_${TARGET}.bc
llc -mattr=dwarfris -march=bpf -mcpu=v2 -filetype=obj -o bpf_${TARGET}.o bpf_${TARGET}.bc
