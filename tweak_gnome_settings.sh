
#!/bin/bash

set -x

######################### Settings #########################

sudo apt update && sudo apt install dconf-editor -y

gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface gtk-enable-primary-paste false
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.wm.preferences action-middle-click-titlebar "none"
gsettings set org.gnome.desktop.wm.preferences num-workspaces 1
gsettings set org.gnome.gedit.preferences.editor display-line-numbers true
gsettings set org.gnome.gedit.preferences.editor insert-spaces true
gsettings set org.gnome.gedit.preferences.editor tabs-size 4
gsettings set org.gnome.login-screen enable-fingerprint-authentication false
gsettings set org.gnome.login-screen enable-smartcard-authentication false
gsettings set org.gnome.nautilus.preferences show-hidden-files true
gsettings set org.gnome.shell favorite-apps "['firefox.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Terminal.desktop', 'spotify.desktop', 'shift-application.desktop', 'gitkraken.desktop', 'code.desktop']"
gsettings set org.gnome.shell.extensions.dash-to-dock click-action "previews"
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position "BOTTOM"
gsettings set org.gnome.shell.extensions.dash-to-dock multi-monitor true
gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top true
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false
gsettings set org.gnome.shell.extensions.desktop-icons show-home false
gsettings set org.gnome.shell.extensions.desktop-icons show-trash false

######################### Theme #########################

sudo apt update && sudo apt install -y \
  autoconf \
  automake \
  git \
  gtk2-engines-murrine \
  libgtk-3-dev \
  pkg-config

git clone https://github.com/horst3180/arc-theme --depth 1 /tmp/arc-theme
sh /tmp/arc-theme/autogen.sh --prefix=/usr --with-gnome=3.22
sudo make install /tmp/arc-theme

gsettings set org.gnome.desktop.interface cursor-theme 'Arc-Darker'
gsettings set org.gnome.desktop.interface gtk-theme 'Arc-Darker'

######################### Icon Theme #########################

sudo add-apt-repository ppa:papirus/papirus -y
sudo apt update && sudo apt install papirus-icon-theme -y

gsettings set org.gnome.desktop.interface icon-theme 'Papirus'
