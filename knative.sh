#!/bin/bash 
set -e

VERSION="latest"
INSTALL_DIR=${2:-"$HOME/.local/bin"}
CMD=kn
NAME="Knative"

echo -e "\e[34m»»» 📦 \e[32mInstalling \e[33m$NAME \e[35m$VERSION\e[0m ..."

curl -sSL https://storage.googleapis.com/knative-nightly/client/latest/kn-linux-amd64 -o /tmp/kn
mkdir -p $INSTALL_DIR
mv /tmp/kn $INSTALL_DIR
chmod 755 $INSTALL_DIR/kn

echo -e "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which $CMD)"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$($CMD version)"
