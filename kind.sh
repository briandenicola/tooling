#!/bin/bash 
set -e

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" |
  grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/'
}

REPO=kubernetes-sigs/kind
CMD=kind
NAME=kind
OUT_FILE=/tmp/${CMD}

VERSION=${1:-"$(get_latest_release ${REPO})"}
INSTALL_DIR=${2:-"$HOME/.local/bin"}

echo -e "\e[34m»»» 📦 \e[32mInstalling \e[33m${NAME} v${VERSION}\e[0m ..."
curl -sSL https://github.com/${REPO}/releases/download/v${VERSION}/kind-linux-amd64 -o ${OUT_FILE}
chmod +x ${OUT_FILE}
mv ${OUT_FILE} ${INSTALL_DIR}

echo -e "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which ${CMD})"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$(${CMD} version)"