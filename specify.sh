#!/bin/bash 
set -e

CMD=specify
NAME="Github Spec Kit"

echo -e "\e[34m»»» 📦 \e[32mInstalling \e[33m$NAME\e[0m ..."

uv tool install specify-cli --from git+https://github.com/github/spec-kit.git

echo -e "\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which $CMD)"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$($CMD version)"
