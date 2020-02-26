#!/bin/sh -x

# Blitz
# Snagit
# Mega
# JDownloader

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

sudo apt update && sudo apt install -y \
  maven \
  openjdk-11-jdk

######################### Node #########################

sudo apt update && sudo apt install npm -y
sudo npm cache clean -f
sudo npm install -g n
sudo n stable

sudo npm install -g typescript

######################### python #########################

sudo apt update && sudo apt install -y \
  python3 \
  python3-pip
  
sudo pip install -U --user pylint

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

######################### Tweak GNOME Shell #########################

sudo apt update && sudo apt install dconf-editor -y

gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface gtk-enable-primary-paste false
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.wm.preferences action-middle-click-titlebar 'none'
gsettings set org.gnome.desktop.wm.preferences num-workspaces 1
gsettings set org.gnome.login-screen enable-fingerprint-authentication false
gsettings set org.gnome.login-screen enable-smartcard-authentication false
gsettings set org.gnome.nautilus.preferences show-hidden-files true
gsettings set org.gnome.shell favorite-apps "['firefox.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Terminal.desktop', 'spotify.desktop', 'shift-application.desktop', 'gitkraken.desktop', 'code.desktop']"
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'previews'
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
gsettings set org.gnome.shell.extensions.dash-to-dock multi-monitor true
gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top true
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false
gsettings set org.gnome.shell.extensions.desktop-icons show-home false
gsettings set org.gnome.shell.extensions.desktop-icons show-trash false

######################### qBittorrent #########################

sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable -y
sudo apt update && sudo apt install qbittorrent -y

######################### GIMP #########################

sudo add-apt-repository ppa:otto-kesselgulasch/gimp -y
sudo apt update && sudo apt install gimp -y

######################### Spotify #########################

echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
curl -S https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
sudo apt update && sudo apt install spotify-client -y

######################### Etcher #########################

echo "deb https://deb.etcher.io stable etcher" | sudo tee /etc/apt/sources.list.d/balena-etcher.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61
sudo apt update && sudo apt install balena-etcher-electron -y

######################### Chrome #########################

echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
curl -S https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo apt update && sudo apt install google-chrome-stable -y

######################### Resilio Sync #########################

echo "deb http://linux-packages.resilio.com/resilio-sync/deb resilio-sync non-free" | sudo tee /etc/apt/sources.list.d/resilio-sync.list
curl -LO http://linux-packages.resilio.com/resilio-sync/key.asc && sudo apt-key add ./key.asc
sudo apt update && sudo apt install resilio-sync -y
sudo systemctl enable resilio-sync && sudo systemctl start resilio-sync

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

######################### Discord #########################

wget -O /tmp/setup/discord.deb https://dl.discordapp.net/apps/linux/0.0.9/discord-0.0.9.deb
sudo dpkg -i /tmp/setup/discord.deb
sudo apt update && sudo apt install -f -y

######################### TeamViewer #########################

wget -O /tmp/setup/teamviewer.deb https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
sudo dpkg -i /tmp/setup/teamviewer.deb
sudo apt update && sudo apt install -f -y

######################### NordVpn #########################

wget -O /tmp/setup/nordvpn.deb sudo dpkg -i /pathToFile/nordvpn-release_1.0.0_all.deb
sudo dpkg -i /tmp/setup/nordvpn.deb
sudo apt update && sudo apt install -f -y
nordvpn login
nordvpn set cybersec on

echo "[Desktop Entry]
Name=NordVPN connect
Exec=bash -c 'nordvpn connect'
StartupNotify=true
Terminal=true
Type=Application
Icon=utilities-terminal" | sudo tee /usr/share/applications/NordVPNConnect.desktop

echo "[Desktop Entry]
Name=NordVPN disconnect
Exec=bash -c 'nordvpn disconnect'
StartupNotify=true
Terminal=true
Type=Application
Icon=utilities-terminal" | sudo tee /usr/share/applications/NordVPNDisconnect.desktop

######################### GitKraken #########################

wget -O /tmp/setup/gitkraken.deb https://release.axocdn.com/linux/gitkraken-amd64.deb
sudo dpkg -i /tmp/setup/gitkraken.deb
sudo apt update && sudo apt install -f -y

######################### JetBrains Toolbox #########################

wget -O /tmp/setup/jetbrains-toolbox.tar.gz https://download-cf.jetbrains.com/toolbox/jetbrains-toolbox-1.16.6067.tar.gz
tar -C /tmp/setup -xzf /tmp/setup/jetbrains-toolbox.tar.gz
sudo mv /tmp/setup/jetbrains-toolbox-1.16.6067 /usr/local/jetbrains-toolbox
/usr/local/jetbrains-toolbox/jetbrains-toolbox

######################### Caffeine #########################

# TODO

# wget -O /tmp/setup/caffeine.tar.gz http://archive.ubuntu.com/ubuntu/pool/universe/c/caffeine/caffeine_2.9.4.orig.tar.gz
# tar -C /tmp/setup -xzf /tmp/setup/caffeine.tar.gz

# can't find package
# sudo add-apt-repository ppa:caffeine-developers/caffeine-dev -y
# sudo apt update && sudo apt install caffeine -y

######################### Postman #########################

wget -O /tmp/setup/postman.tar.gz https://dl.pstmn.io/download/latest/linux64
tar -C /tmp/setup -xzf /tmp/setup/postman.tar.gz
sudo mv /tmp/setup/Postman /usr/local/Postman

echo "[Desktop Entry]
Name=Postman
Exec=/usr/local/Postman/Postman
StartupNotify=true
Terminal=false
Type=Application
Icon=/usr/local/Postman/app/resources/app/assets/icon.png" | sudo tee /usr/share/applications/Postman.desktop

######################### Shift #########################

wget -O /tmp/setup/shift.zip https://update.tryshift.com/download/version/4.0.2/linux_32
unzip /tmp/setup/shift.zip -d /tmp/setup/shift
sudo mv /tmp/setup/shift/shift-linux-v4.0.2 /usr/local/Shift
/usr/local/Shift/Shift

######################### Cleanup manual downloads #########################

sudo rm -rf /tmp/setup
sudo apt update && sudo apt install -f -y
sudo apt autoremove -y
