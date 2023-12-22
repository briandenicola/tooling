#!/bin/bash 
set -e

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" |
  grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/'
}

VERSION=${1:-"$(get_latest_release hashicorp/packer)"}
INSTALL_DIR=${2:-"$HOME/.local/bin"}
CMD=packer
NAME=Packer

echo -e "\e[34m»»» 📦 \e[32mInstalling \e[33m$NAME v$VERSION\e[0m ..."

curl -sSL "https://releases.hashicorp.com/packer/${VERSION}/packer_${VERSION}_linux_amd64.zip" -o /tmp/packer.zip
unzip /tmp/packer.zip -d /tmp > /dev/null
mv /tmp/packer $INSTALL_DIR
rm -f /tmp/packer.zip

echo -e "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which $CMD)"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$($CMD --version)"
