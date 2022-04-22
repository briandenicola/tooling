#!/bin/bash
set -e

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" |
  grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/'
}

VERSION=${1:-"$(get_latest_release azure/aztfy)"}
INSTALL_DIR=${2:-"$HOME/.local/bin"}
CMD=aztfy
NAME="Azure Terraform"

curl -Ls "https://github.com/azure/aztfy/releases/download/v${VERSION}/${CMD}_v${VERSION}_linux_amd64.zip" -o /tmp/${CMD}.zip
unzip /tmp/${CMD}.zip -d /tmp
mkdir -p $INSTALL_DIR
mv /tmp/${CMD} $INSTALL_DIR

echo -e "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which $CMD)"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$($CMD --version)"
