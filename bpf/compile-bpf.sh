#!/bin/bash

DIR=
LIB=
NR_CPUS=
MCPU=
TYPE=
EXTRA_OPTS=
IN=
OUT=

clang -O2 -target bpf -std=gnu89 -nostdinc -emit-llvm \
        -g -Wall -Wextra -Werror -Wshadow \
        -Wno-address-of-packed-member \
        -Wno-unknown-warning-option \
        -Wno-gnu-variable-sized-type-not-at-end \
        -Wdeclaration-after-statement \
        -I. -I$DIR -I$LIB -I$LIB/include \
        -D__NR_CPUS__=$NR_CPUS \
        -DENABLE_ARP_RESPONDER=1 \
        $EXTRA_OPTS \
        -c $LIB/$IN -o - | \
llc -march=bpf -mcpu=$MCPU -mattr=dwarfris -filetype=$TYPE -o $OUT