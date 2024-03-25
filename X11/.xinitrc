#!/usr/bin/env bash
set -euo pipefail

xrdb -merge ~/.config/X11/.Xresources
setxkbmap eu,ru -option grp:caps_toggle
udiskie -q &
exec i3
