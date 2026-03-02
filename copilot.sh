#!/bin/bash 
set -e

CMD=copilot
NAME="Github Copilot Cli"

echo -e "\e[34m»»» 📦 \e[32mInstalling \e[33m$NAME\e[0m ..."

wget -qO- https://gh.io/copilot-install | bash

echo -e "\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which $CMD)"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$($CMD --version)"
