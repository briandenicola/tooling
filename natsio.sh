#!/bin/bash
set -e

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" |
  grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/'
}

VERSION=${1:-"$(get_latest_release nats-io/nats-server)"}
INSTALL_DIR=${2:-"$HOME/.local/bin"}
CMD=nats-server
NAME="nats.io"

curl -sSL "https://github.com/nats-io/nats-server/releases/download/v${VERSION}/nats-server-v${VERSION}-linux-amd64.tar.gz" -o /tmp/nats.tar.gz 
tar -zxvf /tmp/nats.tar.gz  -C /tmp
mkdir -p $INSTALL_DIR
mv /tmp/nats-server-v${VERSION}-linux-amd64/nats-server $INSTALL_DIR
rm -f /tmp/nats.tar.gz
rm -rf /tmp/nats-server*

echo -e "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which $CMD)"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$($CMD --version)"
