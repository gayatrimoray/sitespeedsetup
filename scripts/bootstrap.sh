#! /bin/bash

set -e

sudo apt-get update

# install basic dependencies
echo "[Install] dependencies"
sudo apt-get install -y git
sudo apt-get install -y curl
sudo apt-get install -y libfontconfig
sudo apt-get install -y default-jre

# https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-an-ubuntu-14-04
# How To Install Using a PPA steps followed
echo "[Install] npm"
curl -sL https://deb.nodesource.com/setup | sudo bash -
sudo apt-get install -y nodejs
sudo apt-get install -y build-essential

# update to latest npm
echo "[Update] npm@latest-2"
sudo npm install -g npm@latest-2
# install sitespeed
echo "[Install] sitespeed"
sudo npm install -g sitespeed.io
