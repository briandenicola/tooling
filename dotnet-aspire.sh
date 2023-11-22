#!/bin/bash 
set -e

VERSION=${1:-"8.0"}
CMD=dotnet
NAME="Dotnet Aspire"

echo -e "\e[34m»»» 📦 \e[32mInstalling \e[33m$NAME \e[35mv$VERSION\e[0m ..."
sudo ${CMD} workload install aspire

echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$($CMD workload list)"
