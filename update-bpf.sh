#!/bin/bash

OBJFILE=${1:-bpf_overlay.o}
SECNAME=${2:-to-overlay}
POLICY=${3:-egress}
NETDEV=${4:-cilium_host}

sudo tc filter replace dev ${NETDEV} ${POLICY} prio 1 handle 1 bpf da obj ${OBJFILE} sec ${SECNAME} verbose