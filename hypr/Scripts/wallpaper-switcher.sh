#!/usr/bin/env zsh
#!/bin/bash

# Configuration
WALLPAPER_DIR="$HOME/Images"
# Choose a Rofi theme that supports icons/grid
ROFI_THEME="~/.config/rofi/wallpapers.rasi"

# Check if swww is running
if ! pgrep -x "swww-daemon" > /dev/null; then
    swww init
fi

selected_name=$(ls "$WALLPAPER_DIR" | while read -r file; do
    echo -en "$file\0icon\x1f$WALLPAPER_DIR/$file\n"
done | rofi -dmenu -i -p "Witch One" -theme "$ROFI_THEME")

if [ -n "$selected_name" ]; then
    FULL_PATH="$WALLPAPER_DIR/$selected_name"

    # Set wallpaper
    swww img "$FULL_PATH" --transition-type random --transition-step 90

    # Generate colors (quietly)
    wal -i "$FULL_PATH"  -q

fi
fi

