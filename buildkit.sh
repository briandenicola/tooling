#!/bin/bash 
set -e

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" |
  grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/'
}

REPO=moby/buildkit
VERSION=${1:-"$(get_latest_release ${REPO})"}
INSTALL_DIR=${2:-"$HOME/.local/bin"}
CMD=buildkit
NAME=buildkit

echo -e "\e[34m»»» 📦 \e[32mInstalling \e[33m$NAME v$VERSION\e[0m ..."

curl -sSL "https://github.com/${REPO}/releases/download/v${VERSION}/${CMD}-v${VERSION}.linux-amd64.tar.gz" -o /tmp/${CMD}.tar.gz
mkdir /tmp/${CMD}
tar -zxf /tmp/${CMD}.tar.gz -C /tmp/${CMD}
mv /tmp/${CMD} $INSTALL_DIR
rm -f /tmp/${CMD}.tar.gz

echo -e "\e[34m»»» 💾 \e[32mInstalled to: \e[33m${INSTALL_DIR}/${CMD}/bin"
echo -e "\e[34m»»» 💾 \e[32mVersion Installed: \e[33m$(${INSTALL_DIR}/${CMD}/bin/buildctl --version)"
