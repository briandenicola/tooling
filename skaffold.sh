#!/bin/bash 
set -e

VERSION=${1:-"latest"}
INSTALL_DIR=${2:-"$HOME/.local/bin"}
CMD=skaffold
NAME=skaffold

echo -e "\e[34m»»» 📦 \e[32mInstalling \e[33m$NAME $VERSION\e[0m ..."

curl -Lo skaffold https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64
sudo install skaffold ${INSTALL_DIR}
rm -rf skaffold

echo -e "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which $CMD)"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$($CMD version)"
