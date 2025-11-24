#!/bin/bash
CONFIG_DIR="$HOME/.config/waybar"

while true; do
    inotifywait -e modify,create,delete \
        "$CONFIG_DIR/config.jsonc" \
        "$CONFIG_DIR/style.css" \
        2>/dev/null
    
    echo "Config changed, reloading waybar..."
    pkill -SIGUSR2 waybar
    sleep 0.5
done
