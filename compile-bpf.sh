#!/bin/bash

TARGET=${1:-host}
NETDEV=${2:-cilium_vxlan}

function mac2array()
{
  echo "{0x${1//:/,0x}}"
}

NODE_MAC=$(ip link show ${NETDEV} | grep ether | awk '{print $2}')
NODE_MAC="{.addr=$(mac2array $NODE_MAC)}"

clang -emit-llvm -g -O2 -target bpf -std=gnu89 -nostdinc -DNODE_MAC=${NODE_MAC} -DSECLABEL=12345678 -DFROM_ENCAP_DEV=1 -D__NR_CPUS__=128 -DENABLE_ARP_RESPONDER=1 -Wall -Wextra -Werror -Wshadow -Wno-address-of-packed-member -Wno-unknown-warning-option -Wno-gnu-variable-sized-type-not-at-end -Wdeclaration-after-statement -Iconfigs/${TARGET} -Iconfigs -Iinclude -I. -c bpf_${TARGET}.c -o bpf_${TARGET}.bc
#opt -O2 -debug-pass=Arguments bpf_${TARGET}.ll -disable-output
opt -S bpf_${TARGET}.bc > bpf_${TARGET}.ll
llc -mattr=dwarfris -march=bpf -mcpu=v2 -filetype=obj -o bpf_${TARGET}.o bpf_${TARGET}.ll
