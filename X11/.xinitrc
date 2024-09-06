#!/usr/bin/env bash
set -euo pipefail
export VK_DRIVER_FILES=
xrandr --auto
xrdb -merge ~/.config/X11/.Xresources
setxkbmap eu,ru -option grp:caps_toggle -option grp_led:caps
udiskie -q &
exec i3
