#!/bin/bash 
set -e

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" |
  grep '"tag_name":' | sed -E 's/.*"v([^"]+)".*/\1/'
}

REPO=aquasecurity/trivy
VERSION=${1:-"$(get_latest_release ${REPO})"}
INSTALL_DIR=${2:-"$HOME/.local/bin"}
CMD=trivy
NAME=trivy

echo -e "\e[34m»»» 📦 \e[32mInstalling \e[33m$NAME v$VERSION\e[0m ..."

curl -sSL "https://github.com/${REPO}/releases/download/v${VERSION}/${CMD}_${VERSION}_Linux-64bit.tar.gz" -o /tmp/${CMD}.tar.gz
mkdir /tmp/${CMD}
tar -zxf /tmp/${CMD}.tar.gz -C /tmp/${CMD}
mv /tmp/${CMD}/${CMD} $INSTALL_DIR
rm -f /tmp/${CMD}.tar.gz
rm -rf /tmp/${CMD}

echo -e "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which $CMD)"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$($CMD --version)"
