#!/bin/bash
set -e

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" |  grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/'
}

VERSION=${1:-"$(get_latest_release azure/kubelogin)"}
INSTALL_DIR=${2:-"$HOME/.local/bin"}
CMD=kubelogin
NAME="kubelogin"

echo -e "\e[34m»»» 📦 \e[32mInstalling \e[33m$NAME \e[35mv$VERSION\e[0m ..."

curl -sSL "https://github.com/azure/kubelogin/releases/download/v${VERSION}/kubelogin-linux-amd64.zip" -o /tmp/kubelogin.zip

unzip /tmp/kubelogin.zip
mkdir -p $INSTALL_DIR
mv /tmp/kubelogin.zip $INSTALL_DIR
mv /tmp/bin/linux_amd64/kubelogin $INSTALL_DIR
rm -rf /tmp/kubelogin.zip
rm -rf /tmp/bin

echo -e "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which $CMD)"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \n\e[39m$($CMD version)"
