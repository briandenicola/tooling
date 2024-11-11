#!/bin/bash 
set -e

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases" | 
  grep '"tag_name":' | grep -v rc | awk 'NR==1{print $2}' |  sed -n 's/\"\(.*\)\",/\1/p'
}

REPO=drasi-project/drasi-platform
VERSION=${1:-"$(get_latest_release ${REPO})"}
CMD=drasi
NAME=drasi-cli

VERSION=${1:-"$(get_latest_release ${REPO})"}
INSTALL_DIR=${2:-"$HOME/.local/bin"}

echo -e "\e[34m»»» 📦 \e[32mInstalling \e[33m${NAME} v${VERSION}\e[0m ..."
curl -sSL "https://github.com/${REPO}/releases/download/${VERSION}/drasi-linux-x64" -o /tmp/${CMD}
mv /tmp/${CMD} ${INSTALL_DIR}
chmod +x ${INSTALL_DIR}/${CMD}
#wget -q "https://raw.githubusercontent.com/${REPO}/main/cli/installers/install-drasi-cli.sh" -O - | /bin/bash

echo -e "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which ${CMD})"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$(${CMD} version)"
