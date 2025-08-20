#!/bin/bash 
set -e

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" |
  grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/'
}

CMD=ollama-cli
REPO=masgari/${CMD}
NAME="Ollama Terminal Client"
OUT_FILE=/tmp/${CMD}
INSTALL_PATH=${HOME}/.local/bin

VERSION=${1:-"$(get_latest_release ${REPO})"}
INSTALL_DIR=${2:-"$HOME/.local/bin"}

echo -e "\e[34m»»» 📦 \e[32mInstalling \e[33m${NAME} ${VERSION}\e[0m ..."
curl -sSL https://github.com/${REPO}/releases/download/${VERSION}/ollama-cli-linux-amd64 -o ${OUT_FILE}

mv ${OUT_FILE} ${INSTALL_DIR}
chmod +x ${INSTALL_PATH}/${CMD}

echo -e "\n\e[34m»»» 💾 \e[32mAdd to PATH variable: \e[33m${INSTALL_PATH}/${CMD}"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$(${INSTALL_PATH}/${CMD} version)"
