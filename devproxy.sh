#!/bin/bash 
set -e

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" |
  grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/'
}

REPO=dotnet/dev-proxy 
CMD=devproxy 
NAME="Dev Proxy"
OUT_FILE=/tmp/${CMD}
INSTALL_PATH=${HOME}/.local/bin/${CMD}

VERSION=${1:-"$(get_latest_release ${REPO})"}
INSTALL_DIR=${2:-"$HOME/.local/bin"}

echo -e "\e[34m»»» 📦 \e[32mInstalling \e[33m${NAME} ${VERSION}\e[0m ..."
curl -sSL https://github.com/${REPO}/releases/download/${VERSION}/dev-proxy-linux-x64-${VERSION}.zip -o ${OUT_FILE}.zip

mkdir ${OUT_FILE}
unzip ${OUT_FILE}.zip -d ${OUT_FILE}

mv ${OUT_FILE} ${INSTALL_DIR}
rm -rf ${OUT_FILE}.zip

chmod +x ${INSTALL_PATH}/${CMD}

echo -e "\n\e[34m»»» 💾 \e[32mAdd to PATH variable: \e[33m${INSTALL_PATH}/${CMD}"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$(${INSTALL_PATH}/${CMD} --version)"
