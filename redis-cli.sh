#!/bin/bash 
set -e

CMD=redis-cli
NAME=redis-tools 

echo -e "\e[34m»»» 📦 \e[32mInstalling \e[33m${NAME} \e[0m ..."

sudo apt-get update
sudo apt-get install ${NAME} -y

echo -e "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which $CMD)"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$($CMD version)"
