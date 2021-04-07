#!/bin/bash

POLICY=${1:-egress}
OBJFILE=${2:-bpf_host.o}
SECNAME=${3:-to-netdev}
NETDEV=${4:-ens33}

tc filter replace dev ${NETDEV} ${POLICY} prio 1 handle 1 bpf da obj ${OBJFILE} sec ${SECNAME}
