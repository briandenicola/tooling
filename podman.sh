#!/bin/bash
set -e

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" |
  grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/'
}

REPO=containers/podman
VERSION=${1:-"$(get_latest_release ${REPO})"}
INSTALL_DIR=${2:-"$HOME/.local/bin"}
CMD=podman
NAME="podman"

curl -Ls "https://github.com/${REPO}/releases/download/v${VERSION}/podman-remote-static-linux_amd64.tar.gz" -o /tmp/podman.tar.gz
tar -xf /tmp/podman.tar.gz -C /tmp 
mv /tmp/bin/podman-remote-static-linux_amd64 $INSTALL_DIR/${CMD}
rm -rf /tmp/podman.tar.gz
rm -rf /tmp/bin

echo -e "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which $CMD)"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$($CMD --version)"
