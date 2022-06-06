#!/bin/bash 
set -e

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" |
  grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/'
}

VERSION=${1:-"$(get_latest_release hashicorp/vault)"}
INSTALL_DIR=${2:-"$HOME/.local/bin"}
CMD=vault
NAME=Vault

echo -e "\e[34m»»» 📦 \e[32mInstalling \e[33m$NAME v$VERSION\e[0m ..."

curl -sSL "https://releases.hashicorp.com/${CMD}/${VERSION}/${CMD}_${VERSION}_linux_amd64.zip" -o /tmp/${CMD}.zip
unzip /tmp/${CMD}.zip -d /tmp > /dev/null
mkdir -p $INSTALL_DIR
mv /tmp/${CMD} $INSTALL_DIR
rm -f /tmp/${CMD}.zip

echo -e "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which $CMD)"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$($CMD --version)"
