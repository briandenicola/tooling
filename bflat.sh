#!/bin/bash
set -e

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" |
  grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/'
}

VERSION=${1:-"$(get_latest_release bflattened/bflat)"}
INSTALL_DIR=${2:-"$HOME/.local/bin"}
CMD=${INSTALL_DIR}/bflat-${VERSION}/bflat
NAME="bflat"

mkdir /tmp/bflat-${VERSION}
curl -Ls "https://github.com/bflattened/bflat/releases/download/v${VERSION}/bflat-${VERSION}-linux-glibc-x64.tar.gz" -o /tmp/bflat-${VERSION}/bflat.tar.gz
tar -xvzf /tmp/bflat-${VERSION}/bflat.tar.gz -C /tmp/bflat-${VERSION}
rm -f /tmp/bflat-${VERSION}/bflat.tar.gz
mkdir -p $INSTALL_DIR
mv /tmp/bflat-${VERSION} $INSTALL_DIR

echo -e "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m${CMD}"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$($CMD -v)"
