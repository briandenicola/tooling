#!/bin/bash 
set -e

VERSION=${1:-"latest"}
INSTALL_DIR=${2:-"$HOME/.local/bin"}
CMD=porter
NAME=porter

echo -e "\e[34m»»» 📦 \e[32mInstalling \e[33m$NAME $VERSION\e[0m ..."
curl -L https://cdn.porter.sh/latest/install-linux.sh | bash
~/.porter/porter mixin install helm
~/.porter/porter mixin install az
~/.porter/porter mixin install terraform
~/.porter/porter mixin install kubernetes 
~/.porter/porter plugin install azure

echo -e "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m~/.porter"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$(~/.porter/$CMD --version)"
