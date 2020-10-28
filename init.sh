#!/usr/bin/env bash

set -ex

bash install_packages.sh
bash init_dotfiles.sh
bash set_up_autostart.sh
bash set_up_power_management.sh
bash tweak_settings.sh
bash tweak_ui.sh
