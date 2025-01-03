#!/bin/bash 
set -e

get_latest_release() {
  curl --silent "https://api.github.com/repos/$1/releases/latest" |
  grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/'
}

REPO=AzureCosmosDB/data-migration-desktop-tool 
CMD=dmt
NAME="Azure Data Migration Tool"
OUT_FILE=/tmp/${CMD}

VERSION=${1:-"$(get_latest_release ${REPO})"}
INSTALL_DIR=${2:-"$HOME/.local/bin"}

echo -e "\e[34m»»» 📦 \e[32mInstalling \e[33m${NAME} v${VERSION}\e[0m ..."
curl -sSL https://github.com/${REPO}/releases/download/${VERSION}/dmt-${VERSION}-linux-x64.zip -o ${OUT_FILE}.zip

mkdir ${OUT_FILE}
unzip ${OUT_FILE}.zip -d ${OUT_FILE}

mv ${OUT_FILE}/linux-package/dmt ${INSTALL_DIR}
mv ${OUT_FILE}/linux-package/appsettings.json ${INSTALL_DIR}
mv ${OUT_FILE}/linux-package/migrationsettings.json ${INSTALL_DIR}
rm -rf ${OUT_FILE} ${OUT_FILE}.zip

chmod +x ${INSTALL_DIR}/${CMD}

echo -e "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which ${CMD})"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$(${CMD} --version)"
