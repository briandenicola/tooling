#!/bin/bash 
set -e

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" |
  grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/'
}


# or wget
wget https://github.com/ddo/fast/releases/download/v0.0.4/fast_linux_amd64 -O fast

VERSION=${1:-"$(get_latest_release ddo/fast)"}
INSTALL_DIR=${2:-"$HOME/.local/bin"}
CMD=fast
NAME=fast

echo -e "\e[34m»»» 📦 \e[32mInstalling \e[33m$NAME v$VERSION\e[0m ..."

curl -sSL "https://github.com/ddo/fast/releases/download/v${VERSION}/fast_linux_amd64" -o ${INSTALL_DIR}/${CMD}
chmod +x ${INSTALL_DIR}/${CMD}

echo -e "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which $CMD)"
