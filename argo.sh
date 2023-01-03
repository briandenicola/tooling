#!/bin/bash 
set -e

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" |
  grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/'
}

PROJECT="argoproj/argo-workflows"
VERSION=${1:-"$(get_latest_release ${PROJECT})"}
INSTALL_DIR=${2:-"$HOME/.local/bin"}
CMD=argo
NAME=argo-workflows

curl -sLO  https://github.com/${PROJECT}/releases/download/v${VERSION}/argo-linux-amd64.gz 
gunzip argo-linux-amd64.gz 
mkdir -p ${INSTALL_DIR}
mv argo-linux-amd64 ${INSTALL_DIR}/${CMD}
chmod 755 ${INSTALL_DIR}/${CMD}
rm -f argo-linux-amd64.gz 

echo -e "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which ${CMD})"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$(${CMD} version)"