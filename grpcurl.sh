#!/bin/bash
set -e

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" |
  grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/'
}

VERSION=${1:-"$(get_latest_release fullstorydev/grpcurl)"}
INSTALL_DIR=${2:-"$HOME/.local/bin"}
CMD=grpcurl
NAME="GrpcUrl"

curl -Ls "https://github.com/fullstorydev/grpcurl/releases/download/v${VERSION}/grpcurl_${VERSION}_linux_x86_64.tar.gz" -o /tmp/grpcurl.tar.gz
tar -xf /tmp/grpcurl.tar.gz -C /tmp grpcurl
mv /tmp/grpcurl $INSTALL_DIR
rm -f /tmp/grpcurl.tar.gz
rm -rf /tmp/grpcurl

echo -e "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which $CMD)"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$($CMD -version)"
