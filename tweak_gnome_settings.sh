
#!/bin/sh -x

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
gsettings set org.gnome.shell favorite-apps "["firefox.desktop", "org.gnome.Nautilus.desktop", "org.gnome.Terminal.desktop", "spotify.desktop", "shift-application.desktop", "gitkraken.desktop", "code.desktop"]"
gsettings set org.gnome.shell.extensions.dash-to-dock click-action "previews"
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position "BOTTOM"
gsettings set org.gnome.shell.extensions.dash-to-dock multi-monitor true
gsettings set org.gnome.shell.extensions.dash-to-dock show-apps-at-top true
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false
gsettings set org.gnome.shell.extensions.desktop-icons show-home false
gsettings set org.gnome.shell.extensions.desktop-icons show-trash false
