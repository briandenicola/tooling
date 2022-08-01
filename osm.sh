#!/bin/bash
set -e

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" |
  grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/'
}

VERSION=${1:-"$(get_latest_release openservicemesh/osm)"}
INSTALL_DIR=${2:-"$HOME/.local/bin"}
CMD=osm
NAME="Open Service Mesh"

curl -Ls "https://github.com/openservicemesh/osm/releases/download/v${VERSION}/osm-v${VERSION}-linux-amd64.tar.gz" -o /tmp/osm.tar.gz
tar -xf /tmp/osm.tar.gz -C /tmp 
mkdir -p $INSTALL_DIR
sudo mv  /tmp/linux-amd64/$CMD $INSTALL_DIR
rm -f /tmp/osm.tar.gz
rm -rf tmp/linux-amd64

echo -e "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which $CMD)"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$($CMD version)"
