#!/bin/bash

VERSION=${1:-"14"}
INSTALL_DIR=${2:-"$HOME/.local/bin"}
CMD=acme.sh
NAME="Let's Encrypt Acme.sh"

echo -e "\e[34m»»» 📦 \e[32mInstalling \e[33m$NAME \e[35mv$VERSION\e[0m ..."

curl https://get.acme.sh | sh -s email=brian@bjdazure.tech

echo -e "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which $CMD)"
echo -e "\e[34m»»» 💡 \e[32m${CMD} version details: \e[39m$($CMD --version)"
