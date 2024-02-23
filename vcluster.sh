#!/bin/bash 
set -e

INSTALL_DIR=${2:-"$HOME/.local/bin"}
CMD=vcluster
NAME=vcluster

echo -e "\e[34m»»» 📦 \e[32mInstalling \e[33m$NAME v$VERSION\e[0m ..."

curl -L -o ${CMD} "https://github.com/loft-sh/vcluster/releases/latest/download/vcluster-linux-amd64" 
install -c -m 0755 ${CMD} ${INSTALL_DIR} 
rm -f ${CMD}

echo -e "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which ${CMD})"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$($CMD --version)"
