#!/bin/bash 
set -e

CMD=buildah
NAME=buildah
VERSION_ID=$(lsb_release -r | cut -f2)

echo -e "\e[34m»»» 📦 \e[32mInstalling \e[33m${NAME} \e[0m ..."

sudo apt-get update
sudo apt-get install -y wget ca-certificates gnupg2
echo "deb http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${VERSION_ID}/ /" | sudo tee /etc/apt/sources.list.d/devel-kubic-libcontainers-stable.list

curl -Ls https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable/xUbuntu_$VERSION_ID/Release.key | sudo apt-key add -

sudo apt-get update
sudo apt install ${NAME} podman -y

echo -e "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which $CMD)"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$($CMD --version)"
