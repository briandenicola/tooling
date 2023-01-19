#!/bin/bash 
set -e

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" |
  grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/'
}

PROJECT="argoproj/argo-cd"
VERSION=${1:-"$(get_latest_release ${PROJECT})"}
INSTALL_DIR=${2:-"$HOME/.local/bin"}
CMD=argocd
NAME=argo-cd

curl -sLO  https://github.com/${PROJECT}/releases/download/v${VERSION}/argocd-linux-amd64 
mv argocd-linux-amd64 ${INSTALL_DIR}/${CMD}
chmod 755 ${INSTALL_DIR}/${CMD}

echo "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which ${CMD})"
echo "\e[34m»»» 💡 \e[32mVersion details: \e[39m$(${CMD} version --client)"
