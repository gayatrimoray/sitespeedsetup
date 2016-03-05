#! /bin/bash

set -e

sudo apt-get update

# install basic dependencies
echo "[Install] dependencies"
sudo apt-get install -y git
sudo apt-get install -y curl
sudo apt-get install -y libfontconfig
sudo apt-get install -y default-jre
sudo apt-get install -y apt-transport-https ca-certificates

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

echo "[Install] docker"
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" >> /etc/apt/sources.list.d/docker.list

sudo apt-get update
sudo apt-get install -y linux-image-extra-$(uname -r)
sudo apt-get install -y apparmor
sudo apt-get install -y docker-engine

echo "[Install] graphite"
sudo mkdir -p /data/graphite/storage/whisper
sudo docker run -d \
  --name graphite \
  -p 8080:80 \
  -p 2003:2003 \
  --restart="always" \
  -v /data/graphite/storage/whisper:/opt/graphite/storage/whisper  \
  sitespeedio/graphite

echo "[Install] Graphana"
sudo mkdir -p /data/grafana
sudo docker run -d -p 3000:3000 \
-v /data/grafana:/var/lib/grafana \
-e "GF_SECURITY_ADMIN_USER=gayatrimoray" \
-e "GF_SECURITY_ADMIN_PASSWORD=wrap" \
--name grafana \
--restart="always" \
grafana/grafana
