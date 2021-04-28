#!/bin/bash

git clone https://github.com/cilium/iproute2 && cd iproute2
git checkout static-data-5.9

./configure
make -j $(nproc)

sudo cp -av tc/tc /usr/sbin/tc
sudo cp -av ip/ip /usr/sbin/ip
sudo cp -av misc/ss /usr/sbin/ss