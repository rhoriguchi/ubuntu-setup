#!/usr/bin/env bash

set -ex

bash install_packages.sh
bash init_dotfiles.sh
bash tweak_gnome_settings.sh
bash set_up_autostart.sh
bash set_up_power_management.sh
bash run_gnome_tweaks.sh
