#!/bin/bash 
set -e

VERSION=${1}
CMD=pool
NAME="Poolside Pool"

echo -e "\e[34m»»» 📦 \e[32mInstalling \e[33m$NAME \e[35mv$VERSION\e[0m ..."
curl -fsSL https://downloads.poolside.ai/pool/install.sh | sh
echo -e "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which $CMD)"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$($CMD --version)"
