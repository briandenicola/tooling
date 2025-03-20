#!/bin/bash
set -e

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" |
  grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/'
}

REPO=vi/websocat
VERSION=${1:-"$(get_latest_release ${REPO})"}
INSTALL_DIR=${2:-"$HOME/.local/bin"}
CMD=websocat
NAME="WebSoCat"

echo -e "\n\e[34m»»» 💾 \e[32mDownloading ${NAME} Version ${VERSION}"
curl -Ls "https://github.com/${REPO}/releases/download/v${VERSION}/websocat.x86_64-unknown-linux-musl" -o /tmp/${CMD}
chmod +x /tmp/${CMD}
mv /tmp/${CMD} $INSTALL_DIR

echo -e "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which $CMD)"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$($CMD --version)"
