#!/bin/bash 
set -e

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" |
  grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/'
}

REPO=opentofu/opentofu
VERSION=${1:-"$(get_latest_release ${REPO})"}
INSTALL_DIR=${2:-"$HOME/.local/bin"}
CMD=tofu
NAME=OpenTofu

#https://github.com/opentofu/opentofu/releases/download/v1.6.2/tofu_1.6.2_linux_amd64.zip

echo -e "\n\e[34m»»» 💾 \e[32mDownloading ${NAME} Version ${VERSION}"

curl -sSL "https://github.com/${REPO}/releases/download/v${VERSION}/${CMD}_${VERSION}_linux_amd64.zip" -o /tmp/${CMD}.zip
unzip /tmp/${CMD}.zip -d /tmp > /dev/null
mv /tmp/${CMD} $INSTALL_DIR
rm -f /tmp/${CMD}.zip

echo -e "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which $CMD)"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$($CMD --version)"