#!/bin/bash 
set -e

VERSION=${1:-"latest"}
INSTALL_DIR=${2:-"$HOME/.local/bin"}
CMD=crossplane
NAME=Crossplane

echo -e "\e[34m»»» 📦 \e[32mInstalling \e[33m$NAME $VERSION\e[0m ..."
curl -sL https://raw.githubusercontent.com/crossplane/crossplane/master/install.sh | sh
mv kubectl-crossplane ${INSTALL_DIR}

echo -e "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m${INSTALL_DIR}"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$(kubectl $CMD --version)"
