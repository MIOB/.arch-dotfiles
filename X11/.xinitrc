#!/usr/bin/env bash
set -euo pipefail

xrdb -merge ~/.config/X11/.Xresources
udiskie -q &
exec i3
