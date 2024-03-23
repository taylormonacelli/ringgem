#!/usr/bin/env bash

# https://apt.syncthing.net/
# https://docs.syncthing.net/intro/getting-started.html

export DEBIAN_FRONTEND=noninteractive

sudo mkdir -p /etc/apt/keyrings
sudo curl -L -o /etc/apt/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg

echo "deb [signed-by=/etc/apt/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list

sudo apt-get update
sudo apt-get --assume-yes install apt-transport-https
sudo apt-get --assume-yes install ca-certificates
sudo apt-get --assume-yes install syncthing

sudo systemctl daemon-reload
sudo systemctl enable syncthing@.service
sudo systemctl start syncthing@.service
sudo systemctl status syncthing@.service
