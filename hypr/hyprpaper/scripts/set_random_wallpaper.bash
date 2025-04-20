#!/usr/bin/env bash
set -euo pipefail
WALLPAPER_DIR="$XDG_CONFIG_HOME/hypr/hyprpaper/wallpapers/"
CURRENT_WALLPAPER=$(hyprctl hyprpaper listloaded)

WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$(basename "$CURRENT_WALLPAPER")" | shuf -n 1)

hyprctl hyprpaper reload ,"$WALLPAPER"
