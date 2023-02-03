#!/bin/bash 
set -e

VERSION=${1:-"latest"}
INSTALL_DIR=${2:-"$HOME/.local/bin"}
CMD=up
NAME=Upbound

echo -e "\e[34m»»» 📦 \e[32mInstalling \e[33m$NAME $VERSION\e[0m ..."
curl -sL https://cli.upbound.io | sh
mv up ${INSTALL_DIR}

echo -e "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which $CMD)"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$($CMD --version)"
