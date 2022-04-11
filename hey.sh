#!/bin/bash 
set -e

VERSION=latest
INSTALL_DIR=${2:-"$HOME/.local/bin"}
CMD=hey
NAME="Hey"

echo -e "\e[34m»»» 📦 \e[32mInstalling \e[33m$NAME \e[35mv$VERSION\e[0m ..."

mkdir -p $INSTALL_DIR
curl -sSL https://hey-release.s3.us-east-2.amazonaws.com/hey_linux_amd64 -o $INSTALL_DIR/hey
chmod +x $INSTALL_DIR/hey

echo -e "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which $CMD)"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$($CMD)"
