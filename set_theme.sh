#!/usr/bin/env bash

set -ex

######################### Gnome Settings #########################

gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 0.0
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize-or-previews'
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'previews'
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-customize-running-dots true
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-color '#D2D2D2'
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock multi-monitor true
gsettings set org.gnome.shell.extensions.dash-to-dock running-indicator-style 'DASHES'
gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top true
gsettings set org.gnome.shell.extensions.dash-to-dock show-favorites false
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false

######################### Background #########################

mkdir -p ~/Pictures/Wallpapers
cp wallpaper/image.jpg ~/Pictures/Wallpapers/image.jpg
gsettings set org.gnome.desktop.background picture-uri "file:$(eval echo '~')/Pictures/Wallpapers/image.jpg"

######################### Icon Theme #########################

sudo add-apt-repository ppa:papirus/papirus -y
sudo apt update && sudo apt install papirus-icon-theme -y

gsettings set org.gnome.desktop.interface icon-theme 'Papirus'

######################### Terminal Theme #########################

black="#000000"
red="#FF4136"
green="#2ECC40"
yellow="#FFDC00"
blue="#0074D9"
magenta="#B10DC9"
cyan="#7FDBFF"
white="#FFFFFF"
light_black="#323232"
light_red="#FF8D86"
light_green="#81E08C"
light_yellow="#FFEA66"
light_blue="#66ABE8"
light_magenta="#D06DDE"
light_cyan="#B2E9FF"
light_white="#FFFFFF)"

default_terminal_profile="$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d \')"

gsettings set org.gnome.Terminal.Legacy.Profile:/:$default_terminal_profile/ background-color '#303030'
gsettings set org.gnome.Terminal.Legacy.Profile:/:$default_terminal_profile/ background-transparency-percent 0
gsettings set org.gnome.Terminal.Legacy.Profile:/:$default_terminal_profile/ cursor-background-color "'$magenta'"
gsettings set org.gnome.Terminal.Legacy.Profile:/:$default_terminal_profile/ cursor-blink-mode 'on'
gsettings set org.gnome.Terminal.Legacy.Profile:/:$default_terminal_profile/ cursor-colors-set true
gsettings set org.gnome.Terminal.Legacy.Profile:/:$default_terminal_profile/ cursor-foreground-color "'$white'"
gsettings set org.gnome.Terminal.Legacy.Profile:/:$default_terminal_profile/ foreground-color "'$white'"
gsettings set org.gnome.Terminal.Legacy.Profile:/:$default_terminal_profile/ palette "['$black', '$red', '$green', '$yellow', '$blue', '$magenta', '$cyan', '$white', '$light_black', '$light_red', '$light_green', '$light_yellow', '$light_blue', '$light_magenta', '$light_cyan', '$light_white']"
gsettings set org.gnome.Terminal.Legacy.Profile:/:$default_terminal_profile/ use-theme-colors false
