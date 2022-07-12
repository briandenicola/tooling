#!/bin/bash 
set -e

CMD=azd
NAME="Azure Developer CLI"

echo -e "\e[34m»»» 📦 \e[32mInstalling \e[33m$NAME\e[0m ..."
curl -fsSL https://aka.ms/install-azd.sh | sudo bash


echo -e "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which $CMD)"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$($CMD version)"
