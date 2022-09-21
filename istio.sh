#!/bin/bash
set -e

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" |  grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/'
}

VERSION=${1:-"$(get_latest_release istio/istio)"}
INSTALL_DIR=${2:-"$HOME/.local/bin"}
CMD=istioctl
NAME="istio"

echo -e "\e[34m»»» 📦 \e[32mInstalling \e[33m$NAME \e[35mv$VERSION\e[0m ..."

curl -sSL "https://github.com/istio/istio/releases/download/${VERSION}/istio-${VERSION}-linux-amd64.tar.gz" -o /tmp/istio.tar.gz

tar -xf /tmp/istio.tar.gz -C /tmp
mkdir -p $INSTALL_DIR
sudo mv /tmp/istio-${VERSION}/bin/istioctl $INSTALL_DIR
rm -f /tmp/istio-${VERSION}.tar.gz
rm -rf tmp/istio-${VERSION}

echo -e "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which $CMD)"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \n\e[39m$($CMD version)"
