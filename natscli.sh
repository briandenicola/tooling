#!/bin/bash
set -e

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" |
  grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/'
}

VERSION=${1:-"$(get_latest_release nats-io/natscli)"}
INSTALL_DIR=${2:-"$HOME/.local/bin"}
CMD=nats
NAME="nats cli"

echo -e "\n\e[34m»»» 💾 \e[32m Downloading ${CMD} Version ${VERSION}"

curl -sSL "https://github.com/nats-io/natscli/releases/download/v${VERSION}/nats-${VERSION}-linux-amd64.zip" -o /tmp/nats.zip
unzip /tmp/nats.zip -d /tmp
mv /tmp/nats-${VERSION}-linux-amd64/nats $INSTALL_DIR
rm -rf /tmp/nats*

echo -e "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which $CMD)"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$($CMD --version)"
