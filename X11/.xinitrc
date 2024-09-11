#!/usr/bin/env bash
set -euo pipefail
export VK_DRIVER_FILES=
xrandr --auto
xrdb -merge ~/.config/X11/.Xresources
udiskie -q &
exec i3
