#!/bin/bash

sudo mkdir -p /etc/sysconfig/
sudo cp contrib/systemd/cilium.service /etc/systemd/system/
sudo cp contrib/systemd/cilium-operator.service /etc/systemd/system/
sudo cp contrib/systemd/cilium-docker.service /etc/systemd/system/
sudo cp contrib/systemd/cilium-consul.service /etc/systemd/system/
sudo cp cilium.cfg /etc/sysconfig/cilium
sudo usermod -a -G cilium $(whoami)
sudo systemctl enable cilium-docker
sudo systemctl restart cilium-docker
sudo systemctl enable cilium-consul
sudo systemctl restart cilium-consul
sudo systemctl enable cilium-operator
sudo systemctl restart cilium-operator
sudo systemctl enable cilium
sudo systemctl restart cilium
