#!/usr/bin/env bash

set -ex

######################### General #########################

gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface clock-show-seconds true

######################### Background #########################

mkdir -p ~/Pictures/Wallpapers
cp wallpaper/image.jpg ~/Pictures/Wallpapers/image.jpg
gsettings set org.gnome.desktop.background picture-uri "file:$(eval echo '~')/Pictures/Wallpapers/image.jpg"

######################### Icon Style #########################

sudo add-apt-repository ppa:papirus/papirus -y
sudo apt update && sudo apt install papirus-icon-theme -y

gsettings set org.gnome.desktop.interface icon-theme 'Papirus'

######################### Dash #########################

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

######################### Unite Shell #########################

sudo apt update && sudo apt install -y x11-utils

mkdir -p ~/.local/share/gnome-shell/extensions
rm -rf ~/.local/share/gnome-shell/extensions/unite@hardpixel.eu

wget -O /tmp/unite-shell.zip https://github.com/hardpixel/unite-shell/releases/download/v41/unite-shell-v41.zip
unzip -q /tmp/unite-shell.zip -d ~/.local/share/gnome-shell/extensions
gnome-extensions enable unite@hardpixel.eu

sudo cp /home/rhoriguchi/.local/share/gnome-shell/extensions/unite@hardpixel.eu/schemas/org.gnome.shell.extensions.unite.gschema.xml /usr/share/glib-2.0/schemas
sudo glib-compile-schemas /usr/share/glib-2.0/schemas/

gsettings set org.gnome.shell.extensions.unite extend-left-box false
gsettings set org.gnome.shell.extensions.unite hide-activities-button 'always'
gsettings set org.gnome.shell.extensions.unite hide-aggregate-menu-arrow true
gsettings set org.gnome.shell.extensions.unite hide-app-menu-icon true
gsettings set org.gnome.shell.extensions.unite notifications-position 'center'
gsettings set org.gnome.shell.extensions.unite show-desktop-name false
gsettings set org.gnome.shell.extensions.unite show-window-buttons 'always'
gsettings set org.gnome.shell.extensions.unite show-window-title 'never'
gsettings set org.gnome.shell.extensions.unite window-buttons-placement 'left'

######################### Terminal #########################

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
light_white="#FFFFFF"

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
