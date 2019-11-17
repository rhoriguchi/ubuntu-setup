#!/bin/sh -x

# Blitz
# Snagit
# Mega
# JDownloader

######################### Gnome tweak #########################

gsettings set org.gnome.desktop.interface gtk-enable-primary-paste false

######################### Apt packages #########################

sudo apt update && sudo apt upgrade -y

sudo apt install -y \
  chrome \
  filezilla \
  firefox \
  git \
  htop \
  k4dirstat \
  maven \
  npm \
  openjdk-8-jdk \
  python3 \
  python3-pip
  thunderbird \
  thunderbird-gnome-support \
  thunderbird-locale-de-ch \
  thunderbird-locale-en-us \
  unzip \
  vlc \
  wget \
  zsh

######################### Snap packages #########################

sudo apt install -y \
  snapd \
  snapd-xdg-open

sudo snap install leagueoflegends --edge --devmode
sudo snap refresh --candidate wine-platform-4-staging
sudo snap refresh --candidate wine-platform-runtime

######################### Stack #########################

wget -O /tmp/setup/stack.sh https://get.haskellstack.org
sudo sh /tmp/setup/stack.sh
stack setup
stack install hindent stylish-haskell

######################### Node #########################

sudo npm cache clean -f
sudo npm install -g n
sudo n stable

######################### Docker #########################

sudo apt remove \
  docker \
  docker-engine \
  docker.io \
  containerd \
  runc
sudo apt install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -sSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update && sudo apt install -y \
  docker-ce \
  docker-ce-cli \
  containerd.io

######################### Docker Compose #########################

sudo curl -sSL "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

######################### qBittorrent #########################

sudo add-apt-repository ppa:qbittorrent-team/qbittorrent-stable -y
sudo apt-get update && sudo apt install qbittorrent -y

######################### GIMP #########################

sudo add-apt-repository ppa:otto-kesselgulasch/gimp -y
sudo apt-get update && sudo apt-get install gimp -y

######################### Spotify #########################

echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
sudo apt-get update && sudo apt-get install spotify-client -y

######################### Atom #########################

echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" | sudo tee //etc/apt/sources.list.d/atom.list
wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
sudo apt-get update && sudo apt-get install atom -y

######################### Etcher #########################

echo "deb https://deb.etcher.io stable etcher" | sudo tee /etc/apt/sources.list.d/balena-etcher.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61
sudo apt update && sudo apt install balena-etcher-electron -y

######################### Resilio Sync #########################

echo "deb http://linux-packages.resilio.com/resilio-sync/deb resilio-sync non-free" | sudo tee /etc/apt/sources.list.d/resilio-sync.list
curl -LO http://linux-packages.resilio.com/resilio-sync/key.asc && sudo apt-key add ./key.asc
sudo apt update && sudo apt install resilio-sync -y
sudo systemctl enable resilio-sync && sudo systemctl start resilio-sync

######################### Manual downloads #########################

mkdir -p /tmp/setup

######################### Chrome #########################

echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
curl -sS https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo apt-get update && sudo apt-get install google-chrome-stable -y

######################### TeamViewer #########################

wget -O /tmp/setup/teamviewer.deb https://download.teamviewer.com/download/linux/teamviewer_amd64.deb
sudo dpkg -i /tmp/setup/teamviewer.deb
sudo apt update && sudo apt install teamviewer -y

######################### NordVpn #########################

wget -O /tmp/setup/nordvpn.deb sudo dpkg -i /pathToFile/nordvpn-release_1.0.0_all.deb
sudo dpkg -i /tmp/setup/nordvpn.deb
sudo apt update && sudo apt install nordvpn -y
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
sudo apt update && sudo apt install gitkraken -y

######################### JetBrains Toolbox #########################

wget -O /tmp/setup/jetbrains-toolbox.tar.gz https://download-cf.jetbrains.com/toolbox/jetbrains-toolbox-1.16.6067.tar.gz
tar -C /tmp/setup -xzf /tmp/setup/jetbrains-toolbox.tar.gz
sudo mv /tmp/setup/jetbrains-toolbox-1.16.6067 /usr/local/jetbrains-toolbox
/usr/local/jetbrains-toolbox/jetbrains-toolbox

######################### Foxit #########################

wget -O /tmp/setup/foxitReader.tar.gz http://cdn01.foxitsoftware.com/pub/foxit/reader/desktop/linux/2.x/2.4/en_us/FoxitReader.enu.setup.2.4.4.0911.x64.run.tar.gz
tar -C /tmp/setup -xzf /tmp/setup/foxitReader.tar.gz
/tmp/setup/FoxitReader.enu.setup.2.4.4.0911(r057d814).x64.run

######################### caffeine #########################

# TODO

# wget -O /tmp/setup/caffeine.tar.gz http://archive.ubuntu.com/ubuntu/pool/universe/c/caffeine/caffeine_2.9.4.orig.tar.gz
# tar -C /tmp/setup -xzf /tmp/setup/caffeine.tar.gz

# can't find package
# sudo add-apt-repository ppa:caffeine-developers/caffeine-dev -y
# sudo apt-get update && sudo apt-get install caffeine -y

######################### postman #########################

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
sudo apt install -f
sudo apt autoremove -y
