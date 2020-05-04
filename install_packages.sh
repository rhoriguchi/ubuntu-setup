#!/usr/bin/env bash

set -ex

######################### Generic Apt packages #########################

sudo apt update && sudo apt upgrade -y

sudo apt update && sudo apt install -y \
  baobab \
  dconf-editor \
  firefox \
  flameshot \
  gimp \
  git \
  htop \
  libreoffice \
  make \
  neofetch \
  postgresql-client \
  qbittorrent \
  steam \
  unzip \
  vlc \
  wget \
  wireguard \
  zsh

######################### Snap packages #########################

sudo apt update && sudo apt install -y \
  snapd \
  snapd-xdg-open

sudo snap install leagueoflegends --edge --devmode
sudo snap refresh --candidate wine-platform-5-staging
sudo snap refresh --candidate wine-platform-runtime

######################### Java #########################

sudo apt update && sudo apt install -y \
  maven \
  openjdk-11-doc \
  openjdk-11-jdk

# TODO improve this
grep -qxF "export JAVA_HOME=/usr/lib/jvm/default-java" ~/.profile || echo "export JAVA_HOME=/usr/lib/jvm/default-java" >> ~/.profile
grep -qxF "export PATH=\"\$PATH:\$JAVA_HOME/bin\"" ~/.profile || echo "export PATH=\"\$PATH:\$JAVA_HOME/bin\"" >> ~/.profile

######################### Node #########################

sudo apt update && sudo apt install -y \
  node-typescript \
  npm

sudo npm cache clean -f
sudo npm install -g n
sudo n stable
sudo npm install -g npm

######################### Python #########################

sudo apt update && sudo apt install -y \
  flake8 \
  mypy \
  pylint \
  python3 \
  python3-pip \
  python3-pytest \
  python3-pytest-xdist \
  virtualenv

######################### Docker #########################

sudo apt purge -y \
  docker \
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
# TODO remove this as soon focal relase exists
# echo "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list
echo "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/ubuntu bionic stable" | sudo tee /etc/apt/sources.list.d/docker.list

sudo apt update && sudo apt install -y \
  docker-ce \
  docker-ce-cli \
  containerd.io

sudo systemctl enable docker
sudo systemctl start docker

sudo cp icons/docker.png /usr/share/icons/docker.png

echo "[Desktop Entry]
Name=Docker stats
Exec=bash -c 'docker stats \$(docker ps -q)'
StartupNotify=true
Terminal=true
Type=Application
Icon=/usr/share/icons/docker.png" | sudo tee /usr/share/applications/dockerStats.desktop

######################### Docker Compose #########################

sudo curl -SL "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

######################### Spotify #########################

echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
curl -SL https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
sudo apt update && sudo apt install -y spotify-client

######################### Chrome #########################

echo "deb [arch=$(dpkg --print-architecture)] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
curl -SL https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo apt update && sudo apt install -y google-chrome-stable

######################### QGIS #########################

echo "deb http://qgis.org/debian $(lsb_release -cs) main
deb-src http://qgis.org/debian $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/qgis.list
curl -SL https://qgis.org/downloads/qgis-2019.gpg.key | sudo apt-key add -
sudo apt update && sudo apt install -y \
  python3-matplotlib \
  python3-scipy \
  qgis

qgis --nologo --code "$(pwd)/scripts/pycharmqgis.py"
sudo mv pycharmqgis.sh /usr/local/pycharmqgis.sh

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
curl -SL http://linux-packages.resilio.com/resilio-sync/key.asc | sudo apt-key add -
sudo apt update && sudo apt install -y resilio-sync
sudo systemctl enable --now resilio-sync

######################### Visual Studio Code #########################

echo "deb [arch=$(dpkg --print-architecture)] http://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list
curl -SL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo apt update && sudo apt install -y \
  apt-transport-https \
  code

######################### Microsoft Teams #########################

echo "deb [arch=$(dpkg --print-architecture)] https://packages.microsoft.com/repos/ms-teams stable main" | sudo tee /etc/apt/sources.list.d/teams.list
curl -SL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo apt update && sudo apt install -y teams

######################### TeamViewer #########################

echo "deb http://linux.teamviewer.com/deb stable main" | sudo tee /etc/apt/sources.list.d/teamviewer.list
curl -SL https://download.teamviewer.com/download/linux/signature/TeamViewer2017.asc | sudo apt-key add -
sudo apt update && sudo apt install -y teamviewer

######################### NordVPN #########################

echo "deb https://repo.nordvpn.com/deb/nordvpn/debian stable main" | sudo tee /etc/apt/sources.list.d/nordvpn.list
curl -SL https://repo.nordvpn.com/gpg/nordvpn_public.asc | sudo apt-key add -
sudo apt update && sudo apt install -y nordvpn

nordvpn set cybersec on
nordvpn set technology nordlynx

sudo cp icons/nordvpn.svg /usr/share/icons/nordvpn.svg

echo "[Desktop Entry]
Name=NordVPN connect
Exec=bash -c 'nordvpn connect'
StartupNotify=true
Terminal=true
Type=Application
Icon=/usr/share/icons/nordvpn.svg" | sudo tee /usr/share/applications/nordvpnConnect.desktop

echo "[Desktop Entry]
Name=NordVPN disconnect
Exec=bash -c 'nordvpn disconnect'
StartupNotify=true
Terminal=true
Type=Application
Icon=/usr/share/icons/nordvpn.svg" | sudo tee /usr/share/applications/nordvpnDisconnect.desktop

######################### Mega #########################

echo "deb https://mega.nz/linux/MEGAsync/xUbuntu_$(lsb_release -rs)/ ./" | sudo tee /etc/apt/sources.list.d/megasync.list
echo "-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: GnuPG v2

mI0EVj3AgQEEAO2XyJgpvE5HDRVsggcrMhf5+KpQepl7m7OyrPSgxLi72Wuy5GWp
hO64BX1UzmdUirIEOc13YxdeuhwJ3YP0wnKUyUrdWA0r2HjOz555vN6ldrPlSCBI
RxKBWRMQaR4cwNKQ8V4xV9tVdPGgrQ9L/4H3fM9fYqCwEMKBxxLZsF3PABEBAAG0
IE1lZ2FMaW1pdGVkIDxzdXBwb3J0QG1lZ2EuY28ubno+iL8EEwECACkFAlY9wIEC
GwMFCRLMAwAHCwkIBwMCAQYVCAIJCgsEFgIDAQIeAQIXgAAKCRADw606fwaOXfOS
A/998rh6f0wsrHmX2LTw2qmrWzwPj4m+vp0m3w5swPZw1x4qSNsmNsIXX8J0ZcSE
qymOwHZ0B9imBS3iz+U496NSfPNWABbIBnUAu8zq0IR28Q9pUcLe5MWFsw9NO+w2
5dByoN9JKeUftZt1x76NHn5wmxB9fv7WVlCnZJ+T16+nh7iNBFY9wIEBBADHpopM
oXNkrGZLI6Ok1F5N7+bSgiyZwkvBMAqCkPawUgwJztFKGf8F/sSbydsKRC2aQcuJ
eOj0ZPUtJ80+o3w8MsHRtZDSxDIxqqiHeupoDRI3Be9S544vI5/UmiiygTuhmNTT
NWgStoZz7hEK4IsELAG1EFodIMtBSkptDL92HwARAQABiKUEGAECAA8FAlY9wIEC
GwwFCRLMAwAACgkQA8OtOn8Gjl3HlAQAoOckF5JBJWekmlX+k2RYwtgfszk31Gq+
Jjiho4rUEW8c1EUPvK8v1jRGwjYED3ihJ6510eblYFPl+6k91OWlScnxuVVAmSn4
35RW3vR+nYUvf3s8rctbw97gJJZAA7p5oAowTux3oHotKSYhhxKcz15goMXzSb5G
/h7fJRhMnw4=
=fp/e
-----END PGP PUBLIC KEY BLOCK-----" | sudo apt-key add -
sudo apt update && sudo apt install -y megasync

######################### Manual downloads #########################

mkdir -p /tmp/setup

######################### Discord #########################

wget -O /tmp/setup/discord.deb https://dl.discordapp.net/apps/linux/0.0.10/discord-0.0.10.deb
sudo dpkg -i /tmp/setup/discord.deb
sudo apt update && sudo apt install -y -f

######################### ytop #########################

wget -O /tmp/setup/ytop.tar.gz "https://github.com/cjbassi/ytop/releases/download/0.6.0/ytop-0.6.0-$(uname -m)-unknown-linux-gnu.tar.gz"
tar -C /tmp/setup -xzf /tmp/setup/ytop.tar.gz
sudo rm -rf /usr/local/bin/ytop
sudo mv /tmp/setup/ytop /usr/local/bin/ytop
sudo chmod +x /usr/local/bin/ytop

echo "[Desktop Entry]
Name=ytop
Exec=bash -c 'ytop --per-cpu'
StartupNotify=true
Terminal=true
Type=Application
Icon=org.gnome.SystemMonitor" | sudo tee /usr/share/applications/ytop.desktop

######################### GitKraken #########################

wget -O /tmp/setup/gitkraken.deb https://release.axocdn.com/linux/gitkraken-$(dpkg --print-architecture).deb
sudo dpkg -i /tmp/setup/gitkraken.deb
sudo apt update && sudo apt install -y -f

######################### JetBrains Toolbox #########################

wget -O /tmp/setup/jetbrains-toolbox.tar.gz https://download-cf.jetbrains.com/toolbox/jetbrains-toolbox-1.17.6802.tar.gz
tar -C /tmp/setup -xzf /tmp/setup/jetbrains-toolbox.tar.gz
sudo rm -rf /usr/local/jetbrains-toolbox
sudo mv /tmp/setup/jetbrains-toolbox-1.17.6802 /usr/local/jetbrains-toolbox
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
unzip -o /tmp/setup/shift.zip -d /tmp/setup/shift
sudo rm -rf /usr/local/shift
sudo mv /tmp/setup/shift/Shift-linux-x64 /usr/local/shift
/usr/local/shift/Shift &

######################### belenaEtcher #########################

wget -O /tmp/setup/belenaEtcher.zip https://github.com/balena-io/etcher/releases/download/v1.5.81/balena-etcher-electron-1.5.81-linux-x64.zip
unzip -o /tmp/setup/belenaEtcher.zip -d /tmp/setup/belenaEtcher
sudo mv /tmp/setup/belenaEtcher/balenaEtcher-1.5.81-x64.AppImage /usr/local/belenaEtcher.AppImage
sudo chmod +x /usr/local/belenaEtcher.AppImage

sudo cp icons/belenaEtcher.ico /usr/share/icons/belenaEtcher.ico

echo "[Desktop Entry]
Name=belenaEtcher
Exec=/usr/local/belenaEtcher.AppImage
StartupNotify=true
Terminal=false
Type=Application
Icon=/usr/share/icons/belenaEtcher.ico" | sudo tee /usr/share/applications/belenaEtcher.desktop

######################### Android development #########################

sudo apt update && sudo apt install -y \
  android-file-transfer \
  android-sdk

# TODO improve this
grep -qxF "export ANDROID_HOME=/usr/lib/android-sdk" ~/.profile || echo "export ANDROID_HOME=/usr/lib/android-sdk" >> ~/.profile
grep -qxF "export PATH=\"\$PATH:\$ANDROID_HOME\"" ~/.profile || echo "export PATH=\"\$PATH:\$ANDROID_HOME\"" >> ~/.profile
grep -qxF "export PATH=\"\$PATH:\$ANDROID_HOME/build-tools\"" ~/.profile || echo "export PATH=\"\$PATH:\$ANDROID_HOME/build-tools\"" >> ~/.profile
grep -qxF "export PATH=\"\$PATH:\$ANDROID_HOME/platform-tools\"" ~/.profile || echo "export PATH=\"\$PATH:\$ANDROID_HOME/platform-tools\"" >> ~/.profile
grep -qxF "export PATH=\"\$PATH:\$ANDROID_HOME/tools\"" ~/.profile || echo "export PATH=\"\$PATH:\$ANDROID_HOME/tools\"" >> ~/.profile

wget -O /tmp/setup/Appium.AppImage https://github.com/appium/appium-desktop/releases/download/v1.15.1/Appium-linux-1.15.1.AppImage
sudo mv /tmp/setup/Appium.AppImage /usr/local/Appium.AppImage
sudo chmod +x /usr/local/Appium.AppImage

sudo cp icons/appium.png /usr/share/icons/appium.png

echo "[Desktop Entry]
Name=Appium
Exec=/usr/local/Appium.AppImage
StartupNotify=true
Terminal=false
Type=Application
Icon=/usr/share/icons/appium.png
X-AppImage-Version=1.15.1" | sudo tee /usr/share/applications/appium.desktop

######################### Clean up manual downloads #########################

sudo rm -rf /tmp/setup
sudo apt update && sudo apt install -y -f
sudo apt autoremove -y
