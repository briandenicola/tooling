#!/bin/bash
set -e

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" |
  grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/'
}

REPO=fullstorydev/grpcurl
VERSION=${1:-"$(get_latest_release ${REPO})"}
INSTALL_DIR=${2:-"$HOME/.local/bin"}
CMD=grpcurl
NAME="GrpcUrl"

echo -e "\n\e[34m»»» 💾 \e[32mDownloading ${NAME} Version ${VERSION}"

curl -Ls "https://github.com/${REPO}/releases/download/v${VERSION}/${CMD}_${VERSION}_linux_x86_64.tar.gz" -o /tmp/${CMD}.tar.gz
tar -xf /tmp/${CMD}.tar.gz -C /tmp ${CMD}
mv /tmp/${CMD} $INSTALL_DIR
rm -rf /tmp/${CMD}*

echo -e "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which $CMD)"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$($CMD -version)"
