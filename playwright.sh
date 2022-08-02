#!/bin/bash

VERSION=${1:-"14"}
INSTALL_DIR=${2:-"$HOME/.local/bin"}
CMD=playwright
NAME="playwright"

echo -e "\e[34m»»» 📦 \e[32mInstalling \e[33m$NAME \e[35mv$VERSION\e[0m ..."

sudo npx playwright install-deps

echo -e "\e[34m»»» 💡 \e[32m$CMD version details: \e[39m$(npx $CMD --version)"
