#!/bin/bash

TARGET=${1:-host}

clang -emit-llvm -O1 -target bpf -g -std=gnu89 -nostdinc -DNODE_MAC="{.addr={0xb3,0x05,0x00,0x00,0x00,0x00}}" -DSECLABEL=12345678 -D__NR_CPUS__=128 -DENABLE_ARP_RESPONDER=1 -Wall -Wextra -Werror -Wshadow -Wno-address-of-packed-member -Wno-unknown-warning-option -Wno-gnu-variable-sized-type-not-at-end -Wdeclaration-after-statement -I/var/run/cilium/state -I/var/run/cilium/state/globals -I/var/lib/cilium/bpf -I/var/lib/cilium/bpf/include -c bpf_${TARGET}.c -o bpf_${TARGET}.bc
opt -jump-threading -sroa -print-before-all -print-after-all -S bpf_${TARGET}.bc > bpf_${TARGET}.ll 2> bpf_${TARGET}.dump
#opt -print-before-all -print-after-all -S bpf_${TARGET}.bc > bpf_${TARGET}.ll 2> bpf_${TARGET}.dump
#opt -O2 -debug-pass=Arguments -S bpf_${TARGET}.bc -disable-output 2> bpf_${TARGET}.opt
llc -mattr=dwarfris -march=bpf -mcpu=v2 -filetype=obj -o bpf_${TARGET}.o bpf_${TARGET}.ll
