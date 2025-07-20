#!/usr/bin/env sh

# Make sure hyprpaper is running
pgrep hyprpaper || hyprctl dispatch exec hyprpaper

WALLPAPER_DIR="$HOME/Pictures/"
CURRENT_WALL=$(hyprctl hyprpaper listloaded)

# Get a random wallpaper that is not the current one
WALLPAPER=$(find "$WALLPAPER_DIR" -type f ! -name "$(basename "$CURRENT_WALL")" | shuf -n 1)

# Apply the selected wallpaper
hyprctl hyprpaper reload ,"$WALLPAPER"
