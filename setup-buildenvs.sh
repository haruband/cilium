#!/bin/bash

KERNEL_VERSION=$(uname -r)

sudo apt-get install -y linux-tools-common linux-tools-${KERNEL_VERSION} linux-cloud-tools-${KERNEL_VERSION}
sudo apt-get install -y build-essential libelf-dev llvm clang flex bison