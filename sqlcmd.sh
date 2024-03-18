#!/bin/bash 
set -e

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" |
  grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/'
}

REPO=microsoft/go-sqlcmd
VERSION=${1:-"$(get_latest_release ${REPO})"}
INSTALL_DIR=${2:-"$HOME/.local/bin"}
CMD=sqlcmd
NAME="sqlcmd"

curl -Ls "https://github.com/${REPO}/releases/download/v${VERSION}/sqlcmd-v${VERSION}-linux-amd64.tar.bz2" -o /tmp/${CMD}.tar.bz2
tar -jxf /tmp/${CMD}.tar.bz2 -C /tmp 
mv /tmp/${CMD} $INSTALL_DIR/${CMD}


echo -e "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which $CMD)"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$($CMD --version)"
