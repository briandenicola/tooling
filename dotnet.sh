#!/bin/bash 
set -e

VERSION=${1:-"8.0"}
CMD=dotnet
NAME="Dotnet Core SDK"

echo -e "\e[34m»»» 📦 \e[32mInstalling \e[33m$NAME \e[35mv$VERSION\e[0m ..."
wget https://dot.net/v1/dotnet-install.sh -O /tmp/dotnet-install.sh
bash /tmp/dotnet-install.sh --version latest

# Download the Microsoft repository GPG keys
#wget -q https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb -O /tmp/packages-microsoft-prod.deb
# Register the Microsoft repository GPG keys
#sudo dpkg -i /tmp/packages-microsoft-prod.deb
#rm -f /tmp/packages-microsoft-prod.deb

#sudo apt-get update -qq
#sudo apt-get install -y -qq dotnet-sdk-$VERSION

echo -e "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which $CMD)"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$($CMD --info)"
