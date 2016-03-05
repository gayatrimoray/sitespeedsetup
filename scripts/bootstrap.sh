#! /bin/bash

set -e

sudo apt-get update
sudo apt-get install -y git

# https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-an-ubuntu-14-04
# How To Install Using a PPA steps followed

curl -sL https://deb.nodesource.com/setup | sudo bash -
sudo apt-get install -y nodejs
sudo apt-get install build-essential

sudo npm install -g npm@latest-2
sudo npm install -g sitespeed.io
