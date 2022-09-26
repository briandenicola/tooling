#!/bin/bash 

while (( "$#" )); do
  case "$1" in
    -s|--skip)
      skipDownload=$2
      shift 2
      ;;
    -h|--help)
      echo "Usage: ./powershell.sh --skip
      	--skip(s)  - Skip over downloading Microsoft packages deb file
      "
      exit 0
      ;;
    --)
      shift
      break
      ;;
    -*|--*=)
      echo "Error: Unsupported flag $1" >&2
      exit 1
      ;;
  esac
done

set -e

CMD=pwsh
NAME="PowerShell"

echo -e "\e[34m»»» 📦 \e[32mInstalling \e[33m$NAME\e[0m ..."

if [[ -z "${skipDownload}" ]]; then
  wget -q https://packages.microsoft.com/config/ubuntu/$(lsb_release -rs)/packages-microsoft-prod.deb -O /tmp/packages-microsoft-prod.deb
  sudo dpkg -i /tmp/packages-microsoft-prod.deb 
  rm -f /tmp/packages-microsoft-prod.deb
fi

sudo apt-get update -y -qq
sudo apt-get install -y powershell

echo -e "\n\e[34m»»» 💾 \e[32mInstalled to: \e[33m$(which $CMD)"
echo -e "\e[34m»»» 💡 \e[32mVersion details: \e[39m$($CMD --version)"
