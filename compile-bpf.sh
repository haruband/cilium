#!/bin/bash

TEMPDIR=${1:-/var/run/cilium/state/templates/...}
SRCFILE=${2:-bpf_host.c}

clang -emit-llvm -g -O2 -target bpf -std=gnu89 -nostdinc -D__NR_CPUS__128 -Wall -Wextra -Werror -Wshadow -Wno-address-of-packed-member -Wno-unknown-warning-option -Wno-gnu-variable-sized-type-not-at-end -Wdeclaration-after-statement -I/var/run/cilium/state/globals -I${TEMPDIR} -I/var/lib/cilium/bpf -I/var/lib/cilium/bpf/include -c ${SRCFILE} -o ${SRCFILE}.bc
llc -mattr=dwarfris -march=bpf -mcpu=v2 -filetype=obj -o ${SRCFILE}.o ${SRCFILE}.bc
