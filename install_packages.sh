#!/bin/bash

set -x

# Blitz
# Snagit

######################### Generic Apt packages #########################

sudo apt update && sudo apt upgrade -y

sudo apt update && sudo apt install -y \
  filezilla \
  firefox \
  git \
  htop \
  k4dirstat \
  libreoffice \
  make \
  neofetch \
  steam \
  unzip \
  vlc \
  wget \
  zsh

######################### Snap packages #########################

sudo apt update && sudo apt install -y \
  snapd \
  snapd-xdg-open

sudo snap install leagueoflegends --edge --devmode
sudo snap refresh --candidate wine-platform-4-staging
sudo snap refresh --candidate wine-platform-runtime

######################### Java #########################

sudo apt purge -y \
  openjdk-8-jre \
  openjdk-8-jre-headless

sudo apt update && sudo apt install -y \
  maven \
  openjdk-11-jdk

######################### Node #########################

sudo apt update && sudo apt install npm -y
sudo npm cache clean -f
sudo npm install -g n
sudo n stable
sudo npm install -g npm

sudo npm install -g \
  prettier \
  typescript

######################### Python #########################

sudo apt update && sudo apt install -y \
  python3 \
  python3-pip
  
sudo pip3 install --upgrade --user \
  mypy \
  pylint \
  virtualenv

######################### Docker #########################

sudo apt remove -y \
  docker \
  docker-engine \
  docker.io \
  containerd \
  runc
  
sudo apt update && sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
    
curl -SL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update && sudo apt install -y \
  docker-ce \
  docker-ce-cli \
  containerd.io

######################### Docker Compose #########################

sudo curl -SL "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

######################### qBittorrent #########################

sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable -y
sudo apt update && sudo apt install qbittorrent -y

######################### GIMP #########################

sudo add-apt-repository ppa:otto-kesselgulasch/gimp -y
sudo apt update && sudo apt install gimp -y

######################### Spotify #########################

echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
curl -SL https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
sudo apt update && sudo apt install spotify-client -y

######################### Chrome #########################

echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
curl -SL https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo apt update && sudo apt install google-chrome-stable -y

######################### Manual downloads #########################

mkdir -p /tmp/setup

######################### Stack #########################

wget -O /tmp/setup/stack.sh https://get.haskellstack.org
sudo sh /tmp/setup/stack.sh
stack setup
stack install hindent stylish-haskell

######################### Visual Studio Code #########################

wget -O /tmp/setup/vscode.deb https://az764295.vo.msecnd.net/stable/c47d83b293181d9be64f27ff093689e8e7aed054/code_1.42.1-1581432938_amd64.deb
sudo dpkg -i /tmp/setup/vscode.deb
sudo apt update && sudo apt install -f -y

######################### QGIS #########################

echo "deb http://qgis.org/debian $(lsb_release -cs) main
deb-src http://qgis.org/debian $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/qgis.list
curl -SL https://qgis.org/downloads/qgis-2019.gpg.key | sudo apt-key add -
sudo apt update && sudo apt install -y \
  python-matplotlib \
  python-scipy \
  qgis

qgis --nologo --code "$(pwd)/scripts/qgis.py"
sudo mv /tmp/setup/pycharmqgis.sh /usr/local/pycharmqgis.sh

sudo cp icons/pycharmqgis.svg /usr/share/icons/pycharmqgis.svg

echo "[Desktop Entry]
Name=PyCharm Professional with QGIS
Exec=sh /usr/local/pycharmqgis.sh
StartupNotify=true
Terminal=false
Type=Application
Icon=/usr/share/icons/pycharmqgis.svg" | sudo tee /usr/share/applications/pyCharmQgis.desktop

######################### Resilio Sync #########################

echo "deb http://linux-packages.resilio.com/resilio-sync/deb resilio-sync non-free" | sudo tee /etc/apt/sources.list.d/resilio-sync.list
curl -SL http://linux-packages.resilio.com/resilio-sync/key.asc -o /tmp/setup/key.asc
sudo apt-key add /tmp/setup/key.asc
sudo apt update && sudo apt install resilio-sync -y
sudo systemctl enable resilio-sync && sudo systemctl start resilio-sync

######################### Discord #########################

wget -O /tmp/setup/discord.deb https://dl.discordapp.net/apps/linux/0.0.9/discord-0.0.9.deb
sudo dpkg -i /tmp/setup/discord.deb
sudo apt update && sudo apt install -f -y

######################### TeamViewer #########################

wget -O /tmp/setup/teamviewer.deb https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
sudo dpkg -i /tmp/setup/teamviewer.deb
sudo apt update && sudo apt install -f -y

######################### NordVPN #########################

wget -O /tmp/setup/nordvpn.deb https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb
sudo dpkg -i /tmp/setup/nordvpn.deb
sudo apt update && sudo apt install -f -y
nordvpn set cybersec on

sudo cp icons/nordvpn.svg /usr/share/icons/nordvpn.svg

echo "[Desktop Entry]
Name=NordVPN connect
Exec=bash -c 'nordvpn connect'
StartupNotify=true
Terminal=true
Type=Application
Icon=/usr/share/icons/nordvpn.svg" | sudo tee /usr/share/applications/nord-vpn-connect.desktop

echo "[Desktop Entry]
Name=NordVPN disconnect
Exec=bash -c 'nordvpn disconnect'
StartupNotify=true
Terminal=true
Type=Application
Icon=/usr/share/icons/nordvpn.svg" | sudo tee /usr/share/applications/nord-vpn-disconnect.desktop

######################### GitKraken #########################

wget -O /tmp/setup/gitkraken.deb https://release.axocdn.com/linux/gitkraken-amd64.deb
sudo dpkg -i /tmp/setup/gitkraken.deb
sudo apt update && sudo apt install -f -y

######################### Mega #########################

wget -O /tmp/setup/mega.deb https://mega.nz/linux/MEGAsync/Debian_10.0/amd64/megasync-Debian_10.0_amd64.deb
sudo dpkg -i /tmp/setup/mega.deb
sudo apt update && sudo apt install -f -y

######################### JetBrains Toolbox #########################

wget -O /tmp/setup/jetbrains-toolbox.tar.gz https://download-cf.jetbrains.com/toolbox/jetbrains-toolbox-1.16.6067.tar.gz
tar -C /tmp/setup -xzf /tmp/setup/jetbrains-toolbox.tar.gz
sudo rm -rf /usr/local/jetbrains-toolbox
sudo mv /tmp/setup/jetbrains-toolbox-1.16.6067 /usr/local/jetbrains-toolbox
/usr/local/jetbrains-toolbox/jetbrains-toolbox

######################### Postman #########################

wget -O /tmp/setup/postman.tar.gz https://dl.pstmn.io/download/latest/linux64
tar -C /tmp/setup -xzf /tmp/setup/postman.tar.gz
sudo rm -rf /usr/local/postman
sudo mv /tmp/setup/Postman /usr/local/postman

echo "[Desktop Entry]
Name=Postman
Exec=/usr/local/postman/Postman
StartupNotify=true
Terminal=false
Type=Application
Icon=/usr/local/postman/app/resources/app/assets/icon.png" | sudo tee /usr/share/applications/postman.desktop

######################### Shift #########################

wget -O /tmp/setup/shift.zip https://update.tryshift.com/download/version/4.0.2/linux_32
unzip /tmp/setup/shift.zip -d /tmp/setup/shift
sudo rm -rf /usr/local/shift
sudo mv /tmp/setup/shift/Shift-linux-x64 /usr/local/shift
/usr/local/shift/Shift &

######################### belenaEtcher #########################

wget -O /tmp/setup/etcher.zip https://github.com/balena-io/etcher/releases/download/v1.5.79/balena-etcher-electron-1.5.79-linux-x64.zip
unzip /tmp/setup/etcher.zip -d /tmp/setup/etcher
sudo mv /tmp/setup/etcher/balenaEtcher-1.5.79-x64.AppImage /usr/local/etcher.AppImage
sudo chmod +x /usr/local/etcher.AppImage

sudo cp icons/etcher.ico /usr/share/icons/etcher.ico

echo "[Desktop Entry]
Name=belenaEtcher
Exec=/usr/local/etcher.AppImage
StartupNotify=true
Terminal=false
Type=Application
Icon=/usr/share/icons/etcher.ico" | sudo tee /usr/share/applications/etcher.desktop

######################### Clean up manual downloads #########################

sudo rm -rf /tmp/setup
sudo apt update && sudo apt install -f -y
sudo apt autoremove -y
