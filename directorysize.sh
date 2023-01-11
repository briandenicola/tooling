#!/bin/bash
set -e

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" |
  grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/'
}

REPO="briandenicola/directory-size"
VERSION=${1:-"$(get_latest_release ${REPO})"}
INSTALL_DIR=${2:-"$HOME/.local/bin"}
CMD=DirectorySize
NAME="DirectorySize"

curl -Ls "https://github.com/${REPO}/releases/download/${VERSION}/directorysize-linux-x64.tar.gz" -o /tmp/${CMD}.tar.gz
tar -zxf /tmp/${CMD}.tar.gz -C /tmp
mv /tmp/publish/${CMD} $INSTALL_DIR
rm -f /tmp/${CMD}.tar.gz
rm -rf /tmp/publish

echo "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which $CMD)"
echo "\e[34m»»» 💡 \e[32mVersion details: \e[39m$($CMD --version)"
