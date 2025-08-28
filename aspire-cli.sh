#!/bin/bash 
set -e

CMD=aspire
NAME="Aspire Developer CLI"
INSTALL_DIR=${2:-"$HOME/.local/bin"}

echo -e "\e[34m»»» 📦 \e[32mInstalling \e[33m$NAME\e[0m ..."
curl -sSL https://aspire.dev/install.sh | bash -s -- --install-path ${INSTALL_DIR}

echo -e "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which $CMD)"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$($CMD --version)"
