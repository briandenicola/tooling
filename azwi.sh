#!/bin/bash
set -e

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" |
  grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/'
}

VERSION=${1:-"$(get_latest_release Azure/azure-workload-identity)"}
INSTALL_DIR=${2:-"$HOME/.local/bin"}
CMD=azwi
NAME="azwi"

curl -Ls "https://github.com/Azure/azure-workload-identity/releases/download/v${VERSION}/azwi-v${VERSION}-linux-amd64.tar.gz" -o /tmp/azwi.tar.gz
tar -xf /tmp/azwi.tar.gz -C /tmp azwi
mkdir -p $INSTALL_DIR
sudo mv /tmp/azwi $INSTALL_DIR
rm -f /tmp/azwi.tar.gz
rm -rf tmp/azwi

echo -e "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which $CMD)"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$($CMD version)"
