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
  git-crypt \
  htop \
  keepass2 \
  libreoffice \
  make \
  mono-complete \
  neofetch \
  network-manager-openconnect-gnome \
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
sudo npm install -g \
  n \
  npm

sudo n stable

######################### Python #########################

sudo apt update && sudo apt install -y \
  flake8 \
  mypy \
  pylint \
  python3 \
  python3-pip \
  python3-pytest \
  python3-pytest-xdist \
  python3-venv

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
echo "deb [arch=$(dpkg --print-architecture)] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list

sudo apt update && sudo apt install -y \
  docker-ce \
  docker-ce-cli \
  containerd.io

sudo systemctl enable docker
sudo systemctl start docker

sudo cp icons/docker.png /usr/share/icons/docker.png

sudo bash -c "cat > /usr/share/applications/dockerStats.desktop" << EOL
[Desktop Entry]
Name=Docker stats
Exec=bash -c "docker stats \$(docker ps -q)"
StartupNotify=true
Terminal=true
Type=Application
Icon=/usr/share/icons/docker.png
EOL

######################### Docker Compose #########################

sudo curl -SL "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

######################### Terraform #########################

curl -SL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
echo "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install -y terraform

terraform -install-autocomplete

######################### Terragrunt #########################

sudo curl -SL https://github.com/gruntwork-io/terragrunt/releases/download/v0.25.1/terragrunt_linux_amd64 -o /usr/local/bin/terragrunt
sudo chmod +x /usr/local/bin/terragrunt

######################### Spotify #########################

echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
curl -SL https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
sudo apt update && sudo apt install -y spotify-client

######################### Chrome #########################

echo "deb [arch=$(dpkg --print-architecture)] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
curl -SL https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo apt update && sudo apt install -y google-chrome-stable

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

######################### .NET Core SDK #########################

echo "deb [arch=$(dpkg --print-architecture)] https://packages.microsoft.com/ubuntu/$(lsb_release -rs)/prod $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/microsoft-prod.list
curl -SL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo apt update && sudo apt install -y \
  apt-transport-https \
  dotnet-sdk-3.1

######################### TeamViewer #########################

echo "deb http://linux.teamviewer.com/deb stable main" | sudo tee /etc/apt/sources.list.d/teamviewer.list
curl -SL https://download.teamviewer.com/download/linux/signature/TeamViewer2017.asc | sudo apt-key add -
sudo apt update && sudo apt install -y teamviewer

######################### ProtonVPN #########################

sudo apt update && sudo apt install -y \
  dialog \
  openvpn \
  python3-pip \
  python3-setuptools

sudo pip install protonvpn-cli --upgrade

sudo cp icons/protonvpn.png /usr/share/icons/protonvpn.png

sudo bash -c "cat > /usr/share/applications/protonvpnConnect.desktop" << EOL
[Desktop Entry]
Name=ProtonVPN connect
Exec=bash -c "sudo protonvpn connect --fastest"
StartupNotify=true
Terminal=true
Type=Application
Icon=/usr/share/icons/protonvpn.png
EOL

sudo bash -c "cat > /usr/share/applications/protonvpnDisconnect.desktop" << EOL
[Desktop Entry]
Name=ProtonVPN disconnect
Exec=bash -c "sudo protonvpn disconnect"
StartupNotify=true
Terminal=true
Type=Application
Icon=/usr/share/icons/protonvpn.png
EOL

######################### Mega #########################

echo "deb https://mega.nz/linux/MEGAsync/xUbuntu_$(lsb_release -rs)/ ./" | sudo tee /etc/apt/sources.list.d/megasync.list
sudo apt-key add << EOL
-----BEGIN PGP PUBLIC KEY BLOCK-----
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
-----END PGP PUBLIC KEY BLOCK-----
EOL
sudo apt update && sudo apt install -y megasync

######################### Manual downloads #########################

workdir="$(mktemp -d)"

######################### Discord #########################

wget -O "$workdir/discord.deb" https://dl.discordapp.net/apps/linux/0.0.12/discord-0.0.12.deb
sudo dpkg -i "$workdir/discord.deb"
sudo apt update && sudo apt install -y -f

######################### ytop #########################

wget -O "$workdir/ytop.tar.gz" "https://github.com/cjbassi/ytop/releases/download/0.6.2/ytop-0.6.2-$(uname -m)-unknown-linux-gnu.tar.gz"
tar -C "$workdir" -xzf "$workdir/ytop.tar.gz"
sudo rm -rf /usr/local/bin/ytop
sudo mv "$workdir/ytop" /usr/local/bin/ytop
sudo chmod +x /usr/local/bin/ytop

sudo bash -c "cat > /usr/share/applications/ytop.desktop" << EOL
[Desktop Entry]
Name=ytop
Exec=bash -c "ytop --per-cpu"
StartupNotify=true
Terminal=true
Type=Application
Icon=org.gnome.SystemMonitor
EOL

######################### GitKraken #########################

wget -O "$workdir/gitkraken.deb" https://release.axocdn.com/linux/gitkraken-$(dpkg --print-architecture).deb
sudo dpkg -i "$workdir/gitkraken.deb"
sudo apt update && sudo apt install -y -f

######################### JetBrains Toolbox #########################

wget -O "$workdir/jetbrains-toolbox.tar.gz" https://download-cf.jetbrains.com/toolbox/jetbrains-toolbox-1.17.7391.tar.gz
tar -C "$workdir" -xzf "$workdir/jetbrains-toolbox.tar.gz"
sudo mv -f "$workdir/jetbrains-toolbox-1.17.7391" "/usr/local/jetbrains-toolbox"
/usr/local/jetbrains-toolbox/jetbrains-toolbox

######################### Postman #########################

wget -O "$workdir/postman.tar.gz" https://dl.pstmn.io/download/latest/linux64
tar -C "$workdir" -xzf "$workdir/postman.tar.gz"
sudo rm -rf /usr/local/postman
sudo mv "$workdir/Postman" /usr/local/postman

sudo bash -c "cat > /usr/share/applications/postman.desktop" << EOL
[Desktop Entry]
Name=Postman
Exec=/usr/local/postman/Postman
StartupNotify=true
Terminal=false
Type=Application
Icon=/usr/local/postman/app/resources/app/assets/icon.png
EOL

######################### belenaEtcher #########################

wget -O "$workdir/belenaEtcher.zip" https://github.com/balena-io/etcher/releases/download/v1.5.109/balena-etcher-electron-1.5.109-linux-x64.zip
unzip -o "$workdir/belenaEtcher.zip" -d "$workdir/belenaEtcher"
sudo mv "$workdir/belenaEtcher/balenaEtcher-1.5.109-x64.AppImage" /usr/local/belenaEtcher.AppImage
sudo chmod +x /usr/local/belenaEtcher.AppImage

sudo cp icons/belenaEtcher.ico /usr/share/icons/belenaEtcher.ico

sudo bash -c "cat > /usr/share/applications/belenaEtcher.desktop" << EOL
[Desktop Entry]
Name=belenaEtcher
Exec=/usr/local/belenaEtcher.AppImage
StartupNotify=true
Terminal=false
Type=Application
Icon=/usr/share/icons/belenaEtcher.ico
EOL

######################### Clean up manual downloads #########################

sudo rm -rf "$workdir"
sudo apt update && sudo apt install -y -f
sudo apt autoremove -y
