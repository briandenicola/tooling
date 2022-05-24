#!/bin/bash
set -e

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" |
  grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/'
}

VERSION=${1:-"$(get_latest_release Azure/draft)"}
INSTALL_DIR=${2:-"$HOME/.local/bin"}
CMD=draft
NAME="draft"

curl -Ls "https://github.com/Azure/draft/releases/download/v${VERSION}/draft-linux-amd64" -o /tmp/draft-linux-amd64
mkdir -p $INSTALL_DIR
chmod 755 /tmp/draft-linux-amd64 
mv /tmp/draft-linux-amd64 $INSTALL_DIR/draft

echo -e "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which $CMD)"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$($CMD version)"
