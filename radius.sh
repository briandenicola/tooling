#!/bin/bash
set -e

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" |
  grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/'
}

REPO=radius-project/radius
VERSION=${1:-"$(get_latest_release ${REPO})"}
INSTALL_DIR=${2:-"$HOME/.local/bin"}
CMD=rad
NAME="radius"
  
curl -Ls "https://github.com/${REPO}/releases/download/v${VERSION}/rad_linux_amd64" -o /tmp/rad_linux_amd64
mv /tmp/rad_linux_amd64 $INSTALL_DIR/${CMD}
chmod +x $INSTALL_DIR/${CMD}
${CMD} bicep download 

echo -e "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which $CMD)"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$($CMD version)"
