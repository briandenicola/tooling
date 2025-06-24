#!/bin/bash
set -e

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" |
  grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/'
}

CMD=edit
NAME="Microsoft Edit"

REPO=microsoft/edit
VERSION=${1:-"$(get_latest_release ${REPO})"}
INSTALL_DIR=${2:-"$HOME/.local/bin"}
OUTPUT_FILE=/tmp/${CMD}-x86_64-linux-gnu.tar.zst


curl -Ls "https://github.com/${REPO}/releases/download/v${VERSION}/${CMD}-${VERSION}-x86_64-linux-gnu.tar.zst" -o ${OUTPUT_FILE}
mkdir -p $INSTALL_DIR
tar --zstd -xf ${OUTPUT_FILE} -C /tmp
mv /tmp/${CMD} $INSTALL_DIR/${CMD}
rm -rf ${OUTPUT_FILE}

echo -e "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which $CMD)"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$($CMD --version)"