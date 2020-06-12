#!/usr/bin/env bash

set -ex

######################### General #########################

gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.gedit.plugins.filebrowser filter-mode "['hide-binary']"

######################### Background #########################

mkdir -p ~/Pictures/Wallpapers
cp wallpaper/image.jpg ~/Pictures/Wallpapers/image.jpg
gsettings set org.gnome.desktop.background picture-uri "file:$(eval echo '~')/Pictures/Wallpapers/image.jpg"

######################### Icon Style #########################

sudo add-apt-repository ppa:papirus/papirus -y
sudo apt update && sudo apt install papirus-icon-theme -y

gsettings set org.gnome.desktop.interface icon-theme 'Papirus'

######################### Keybindings #########################

gsettings set org.freedesktop.ibus.general.hotkey next-engine '[]'
gsettings set org.freedesktop.ibus.general.hotkey next-engine-in-menu '[]'
gsettings set org.freedesktop.ibus.general.hotkey trigger '[]'
gsettings set org.freedesktop.ibus.general.hotkey triggers '[]'
gsettings set org.freedesktop.ibus.panel.emoji hotkey '[]'
gsettings set org.freedesktop.ibus.panel.emoji unicode-hotkey '[]'
gsettings set org.gnome.desktop.wm.keybindings activate-window-menu '[]'
gsettings set org.gnome.desktop.wm.keybindings begin-move '[]'
gsettings set org.gnome.desktop.wm.keybindings begin-resize '[]'
gsettings set org.gnome.desktop.wm.keybindings close "['<Alt>F4']"
gsettings set org.gnome.desktop.wm.keybindings cycle-group '[]'
gsettings set org.gnome.desktop.wm.keybindings cycle-group-backward '[]'
gsettings set org.gnome.desktop.wm.keybindings cycle-panels '[]'
gsettings set org.gnome.desktop.wm.keybindings cycle-panels-backward '[]'
gsettings set org.gnome.desktop.wm.keybindings cycle-windows '[]'
gsettings set org.gnome.desktop.wm.keybindings cycle-windows '[]'
gsettings set org.gnome.desktop.wm.keybindings cycle-windows-backward '[]'
gsettings set org.gnome.desktop.wm.keybindings cycle-windows-backward '[]'
gsettings set org.gnome.desktop.wm.keybindings minimize '[]'
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-down '[]'
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-left '[]'
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-right '[]'
gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-up '[]'
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-1 '[]'
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-down '[]'
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-last '[]'
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-left '[]'
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-right '[]'
gsettings set org.gnome.desktop.wm.keybindings move-to-workspace-up '[]'
gsettings set org.gnome.desktop.wm.keybindings panel-main-menu '[]'
gsettings set org.gnome.desktop.wm.keybindings show-desktop "['<Super>d']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward '[]'
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward '[]'
gsettings set org.gnome.desktop.wm.keybindings switch-group '[]'
gsettings set org.gnome.desktop.wm.keybindings switch-group-backward '[]'
gsettings set org.gnome.desktop.wm.keybindings switch-input-source '[]'
gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward '[]'
gsettings set org.gnome.desktop.wm.keybindings switch-panels '[]'
gsettings set org.gnome.desktop.wm.keybindings switch-panels-backward '[]'
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-1 '[]'
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-down '[]'
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-last '[]'
gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-up '[]'
gsettings set org.gnome.desktop.wm.keybindings switch-windows-backward '[]'
gsettings set org.gnome.desktop.wm.keybindings toggle-maximized "['<Super>Up']"
gsettings set org.gnome.desktop.wm.keybindings unmaximize '[]'
gsettings set org.gnome.mutter.keybindings rotate-monitor '[]'
gsettings set org.gnome.mutter.keybindings switch-monitor '[]'
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-1 '[]'
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-10 '[]'
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-11 '[]'
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-12 '[]'
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-2 '[]'
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-3 '[]'
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-4 '[]'
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-5 '[]'
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-6 '[]'
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-7 '[]'
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-8 '[]'
gsettings set org.gnome.mutter.wayland.keybindings switch-to-session-9 '[]'
gsettings set org.gnome.settings-daemon.plugins.media-keys area-screenshot '[]'
gsettings set org.gnome.settings-daemon.plugins.media-keys area-screenshot-clip '[]'
gsettings set org.gnome.settings-daemon.plugins.media-keys calculator-static '[]'
gsettings set org.gnome.settings-daemon.plugins.media-keys email '[]'
gsettings set org.gnome.settings-daemon.plugins.media-keys email-static '[]'
gsettings set org.gnome.settings-daemon.plugins.media-keys help '[]'
gsettings set org.gnome.settings-daemon.plugins.media-keys home '[]'
gsettings set org.gnome.settings-daemon.plugins.media-keys logout '[]'
gsettings set org.gnome.settings-daemon.plugins.media-keys magnifier '[]'
gsettings set org.gnome.settings-daemon.plugins.media-keys magnifier-zoom-in '[]'
gsettings set org.gnome.settings-daemon.plugins.media-keys magnifier-zoom-out '[]'
gsettings set org.gnome.settings-daemon.plugins.media-keys screencast "['<Ctrl><Shift><Alt>R']"
gsettings set org.gnome.settings-daemon.plugins.media-keys screenreader '[]'
gsettings set org.gnome.settings-daemon.plugins.media-keys screenshot '[]'
gsettings set org.gnome.settings-daemon.plugins.media-keys screenshot-clip '[]'
gsettings set org.gnome.settings-daemon.plugins.media-keys terminal "['<Alt>t']"
gsettings set org.gnome.settings-daemon.plugins.media-keys window-screenshot '[]'
gsettings set org.gnome.settings-daemon.plugins.media-keys window-screenshot-clip '[]'
gsettings set org.gnome.settings-daemon.plugins.media-keys www '[]'
gsettings set org.gnome.settings-daemon.plugins.media-keys www-static '[]'
gsettings set org.gnome.shell.keybindings focus-active-notification '[]'
gsettings set org.gnome.shell.keybindings switch-to-application-1 '[]'
gsettings set org.gnome.shell.keybindings switch-to-application-2 '[]'
gsettings set org.gnome.shell.keybindings switch-to-application-3 '[]'
gsettings set org.gnome.shell.keybindings switch-to-application-4 '[]'
gsettings set org.gnome.shell.keybindings switch-to-application-5 '[]'
gsettings set org.gnome.shell.keybindings switch-to-application-6 '[]'
gsettings set org.gnome.shell.keybindings switch-to-application-7 '[]'
gsettings set org.gnome.shell.keybindings switch-to-application-8 '[]'
gsettings set org.gnome.shell.keybindings switch-to-application-9 '[]'
gsettings set org.gnome.shell.keybindings toggle-application-view '[]'
gsettings set org.gnome.shell.keybindings toggle-message-tray '[]'
gsettings set org.gnome.shell.keybindings toggle-overview '[]'

######################### GNOME Extension - Dash #########################

gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-1 '[]'
gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-10 '[]'
gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-2 '[]'
gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-3 '[]'
gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-4 '[]'
gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-5 '[]'
gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-6 '[]'
gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-7 '[]'
gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-8 '[]'
gsettings set org.gnome.shell.extensions.dash-to-dock app-ctrl-hotkey-9 '[]'
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-1 '[]'
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-10 '[]'
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-2 '[]'
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-3 '[]'
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-4 '[]'
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-5 '[]'
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-6 '[]'
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-7 '[]'
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-8 '[]'
gsettings set org.gnome.shell.extensions.dash-to-dock app-hotkey-9 '[]'
gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-1 '[]'
gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-10 '[]'
gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-2 '[]'
gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-3 '[]'
gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-4 '[]'
gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-5 '[]'
gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-6 '[]'
gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-7 '[]'
gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-8 '[]'
gsettings set org.gnome.shell.extensions.dash-to-dock app-shift-hotkey-9 '[]'
gsettings set org.gnome.shell.extensions.dash-to-dock background-opacity 0.0
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'focus-or-previews'
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-customize-running-dots true
gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-color '#D2D2D2'
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock hotkeys-overlay false
gsettings set org.gnome.shell.extensions.dash-to-dock hotkeys-show-dock false
gsettings set org.gnome.shell.extensions.dash-to-dock multi-monitor true
gsettings set org.gnome.shell.extensions.dash-to-dock running-indicator-style 'DASHES'
gsettings set org.gnome.shell.extensions.dash-to-dock shortcut '[]'
gsettings set org.gnome.shell.extensions.dash-to-dock shortcut-text '[]'
gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top true
gsettings set org.gnome.shell.extensions.dash-to-dock show-favorites false
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false

######################### GNOME Extension - Unite Shell #########################

sudo apt update && sudo apt install -y x11-utils

mkdir -p ~/.local/share/gnome-shell/extensions
rm -rf ~/.local/share/gnome-shell/extensions/unite@hardpixel.eu

wget -O /tmp/unite-shell.zip https://github.com/hardpixel/unite-shell/releases/download/v41/unite-shell-v41.zip
unzip -o /tmp/unite-shell.zip -d ~/.local/share/gnome-shell/extensions
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

######################### GNOME Terminal #########################

black="#000000"
red="#FF4136"
green="#2ECC40"
yellow="#FFDC00"
blue="#0074D9"
magenta="#B10DC9"
cyan="#7FDBFF"
white="#FFFFFF"
light_black="#8A8A8A"
light_red="#FF8D86"
light_green="#81E08C"
light_yellow="#FFEA66"
light_blue="#66ABE8"
light_magenta="#D06DDE"
light_cyan="#B2E9FF"
light_white="#FFFFFF"

profile="$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d \')"

gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" background-color '#303030'
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" background-transparency-percent 0
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" cursor-background-color "$magenta"
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" cursor-blink-mode 'on'
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" cursor-colors-set true
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" cursor-foreground-color "$white"
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" foreground-color "$white"
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" palette "['$black', '$red', '$green', '$yellow', '$blue', '$magenta', '$cyan', '$white', '$light_black', '$light_red', '$light_green', '$light_yellow', '$light_blue', '$light_magenta', '$light_cyan', '$light_white']"
gsettings set "org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$profile/" use-theme-colors false
