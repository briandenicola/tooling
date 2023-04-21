#!/bin/bash 
set -e

VERSION=${1:-"6.0"}
NAME="Sysinternals"

echo -e "\e[34m»»» 📦 \e[32mInstalling \e[33m$NAME \e[35mv$VERSION\e[0m ..."

wget -q https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb -O /tmp/packages-microsoft-prod.deb
sudo dpkg -i /tmp/packages-microsoft-prod.deb
rm -f /tmp/packages-microsoft-prod.deb

sudo apt-get update -qq
sudo apt-get install -y -qq procdump sysinternalsebpf sysmonforlinux procmon

echo -e "\n\e[34m»»» 💾 \e[32mSysmon Installed to: \e[33m$(which sysmon)"
echo -e "\n\e[34m»»» 💾 \e[32mProcmon Installed to: \e[33m$(which procmon)"
