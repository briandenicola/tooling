#!/bin/bash
VERSION=${1:-"16"}
INSTALL_DIR=${2:-"$HOME/.local/bin"}
CMD=node
NAME="Node.js"

echo -e "\e[34m»»» 📦 \e[32mInstalling \e[33m$NAME \e[35mv$VERSION\e[0m ..."

#curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
#sudo apt install -y nodejs
#sudo npm install -g npm@latest

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.0/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

nvm install 22

echo -e "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which $CMD)"
echo -e "\e[34m»»» 💡 \e[32mNode version details: \e[39m$($CMD --version)"
echo -e "\e[34m»»» 💡 \e[32mNPM version details: \e[39m$(npm --version)"
