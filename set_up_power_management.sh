#!/usr/bin/env bash

set -ex

ac_commands=(
    "echo 3 > /sys/devices/platform/asus-nb-wmi/leds/asus::kbd_backlight/brightness"
    "&&"
    "echo 24000 > /sys/class/backlight/intel_backlight/brightness"
)
battery_commands=(
    "echo 0 > /sys/devices/platform/asus-nb-wmi/leds/asus::kbd_backlight/brightness"
    "&&"
    "echo 16000 > /sys/class/backlight/intel_backlight/brightness"
)

sudo dd status=none of=/etc/udev/rules.d/99-powertrigger.rules << EOL
ACTION=="change", SUBSYSTEM=="power_supply", KERNEL=="AC0", ATTR{online}=="1", RUN+="/bin/sh -c '${ac_commands[@]}'"
ACTION=="change", SUBSYSTEM=="power_supply", KERNEL=="AC0", ATTR{online}=="0", RUN+="/bin/sh -c '${battery_commands[@]}'"
EOL

sudo udevadm control --reload-rules
