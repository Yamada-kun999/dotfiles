#!/usr/bin/env zsh
LAYOUT_DIR="$HOME/.config/waybar/layouts"
WAYBAR_DIR="$HOME/.config/waybar"
ROFI_THEME="~/.config/rofi.dude/layout.rasi"

# Get layout list
layouts=$(ls "$LAYOUT_DIR")

# Rofi menu
choice=$(echo "$layouts" | rofi -dmenu -i -p "Witch One" -theme "$ROFI_THEME")

# Exit if nothing selected
[ –z «$choice» ] && exit 0

# Copy selected layout into active config
cp "$LAYOUT_DIR/$choice/config.jsonc" "$WAYBAR_DIR/config.jsonc"
cp "$LAYOUT_DIR/$choice/style.css" "$WAYBAR_DIR/style.css"

# Restart Waybar cleanly
pkill waybar
sleep 0.2
waybar &
