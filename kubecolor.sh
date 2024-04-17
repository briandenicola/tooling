#!/bin/bash
set -e

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" |
  grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/'
}

REPO=kubecolor/kubecolor
VERSION=${1:-"$(get_latest_release ${REPO})"}
INSTALL_DIR=${2:-"$HOME/.local/bin"}
CMD=kubecolor
NAME="kubecolor"

curl -Ls "https://github.com/${REPO}/releases/download/v${VERSION}/kubecolor_${VERSION}_linux_amd64.tar.gz" -o /tmp/kubecolor.tar.gz  
tar -xvf /tmp/kubecolor.tar.gz -C /tmp
mv /tmp/${CMD} $INSTALL_DIR/${CMD}
chmod +x $INSTALL_DIR/${CMD}
rm -rf /tmp/kubecolor.tar.gz /tmp/${CMD}

echo -e "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which $CMD)"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$($CMD version)"
