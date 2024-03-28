#!/bin/bash 
set -e

get_latest_release() {
  #curl --silent "https://api.github.com/repos/$1/releases/latest" |  grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/'
  curl --silent "https://api.github.com/repos/$1/releases/latest" |  grep '"tag_name":' | sed -E 's/(.*)v(.*)".*/\2/'
}

VERSION=${1:-"$(get_latest_release knative/func)"}
INSTALL_DIR=${2:-"$HOME/.local/bin"}
CMD=kn-func
NAME="Knative Func"

echo -e "\e[34m»»» 📦 \e[32mInstalling \e[33m$NAME \e[35mv$VERSION\e[0m ..."
curl -sSL https://github.com/knative/func/releases/download/knative-v${VERSION}/func_linux_amd64  -o ${CMD}
install ${CMD} ${INSTALL_DIR}
rm -rf ${CMD} 

echo -e "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which $CMD)"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$($CMD version)"