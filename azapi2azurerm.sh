#!/bin/bash 
set -e

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" |
  grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/'
}

PROJECT="Azure/azapi2azurerm"
VERSION=${1:-"$(get_latest_release ${PROJECT})"}
INSTALL_DIR=${2:-"$HOME/.local/bin"}
CMD=azapi2azurerm
NAME=azapi2azurerm

curl -sL  https://github.com/${PROJECT}/releases/download/v${VERSION}/azapi2azurerm_v${VERSION}_linux_amd64.zip -o /tmp/${CMD}.zip
unzip /tmp/${CMD}.zip -d ${INSTALL_DIR}

echo -e "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which ${CMD})"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$(${CMD} --version)"
