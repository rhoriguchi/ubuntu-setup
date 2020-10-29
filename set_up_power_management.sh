#!/usr/bin/env bash

set -ex

ac_command=(
    "echo 3 > /sys/devices/platform/asus-nb-wmi/leds/asus::kbd_backlight/brightness &&"
    "echo 24000 > /sys/class/backlight/intel_backlight/brightness &&"
    "service bluetooth start"
)
battery_command=(
    "echo 0 > /sys/devices/platform/asus-nb-wmi/leds/asus::kbd_backlight/brightness &&"
    "echo 16000 > /sys/class/backlight/intel_backlight/brightness &&"
    "service bluetooth stop"
)

sudo dd status=none of=/etc/udev/rules.d/99-powertrigger.rules << EOL
ACTION=="change", SUBSYSTEM=="power_supply", KERNEL=="AC0", ATTR{online}=="1", RUN+="/bin/sh -c '${ac_command[@]}'"
ACTION=="change", SUBSYSTEM=="power_supply", KERNEL=="AC0", ATTR{online}=="0", RUN+="/bin/sh -c '${battery_command[@]}'"
EOL

sudo udevadm control --reload-rules
