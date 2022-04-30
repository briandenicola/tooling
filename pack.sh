#!/bin/bash
set -e

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" |
  grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/'
}

VERSION=${1:-"$(get_latest_release buildpacks/pack)"}
INSTALL_DIR=${2:-"$HOME/.local/bin"}
CMD=pack
NAME="pack"

curl -Ls "https://github.com/buildpacks/pack/releases/download/v${VERSION}/pack-v${VERSION}-linux.tgz" -o /tmp/pack.tar.gz
tar -xf /tmp/pack.tar.gz -C /tmp pack 
mkdir -p $INSTALL_DIR
mv /tmp/pack $INSTALL_DIR
rm -f /tmp/pack.tar.gz
rm -rf tmp/pack

echo -e "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which $CMD)"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$($CMD --version)"
