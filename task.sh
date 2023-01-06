#!/bin/bash 
set -e

INSTALL_DIR=${2:-"$HOME/.local/bin"}
CMD=task
NAME=Task

echo "\e[34m»»» 📦 \e[32mInstalling \e[33m$NAME \e[0m ..."
sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b ${INSTALL_DIR}

echo "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which $CMD)"
echo "\e[34m»»» 💡 \e[32mVersion details: \e[39m$($CMD --version)"
