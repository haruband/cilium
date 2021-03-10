#!/bin/bash

sudo systemctl stop cilium
sudo systemctl stop cilium-operator

sudo make install

sudo systemctl start cilium
sudo systemctl start cilium-operator
