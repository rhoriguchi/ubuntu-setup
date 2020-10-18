#!/usr/bin/env bash

set -ex

sudo mkdir -p ~/.config/autostart/
sudo rm -f ~/.config/autostart/*

ln -s /usr/share/applications/flameshot.desktop ~/.config/autostart/flameshot.desktop
ln -s /usr/share/applications/megasync.desktop ~/.config/autostart/megasync.desktop
ln -s ~/.local/share/applications/jetbrains-toolbox.desktop ~/.config/autostart/jetbrains-toolbox.desktop
