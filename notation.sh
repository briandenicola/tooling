#!/bin/bash
set -e

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" |
  grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/'
}

REPO=notaryproject/notation
VERSION=${1:-"$(get_latest_release ${REPO})"}
INSTALL_DIR=${2:-"$HOME/.local/bin"}
CMD=notation
NAME="notation"

echo -e "\n\e[34m»»» 💾 \e[32mDownloading ${NAME} Version ${VERSION}"

curl -sSL "https://github.com/${REPO}/releases/download/v${VERSION}/${CMD}_${VERSION}_linux_amd64.tar.gz" -o /tmp/${CMD}.tar.gz
tar xzf /tmp/${CMD}.tar.gz -C /tmp
mv /tmp/${CMD} $INSTALL_DIR
rm -rf /tmp/${CMD}*

echo -e "\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which $CMD)"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$($CMD version)"
