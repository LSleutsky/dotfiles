#!/bin/bash
CONFIG_DIR="$HOME/.config/waybar"
while true; do
    inotifywait -e modify,create "$CONFIG_DIR/config.jsonc" "$CONFIG_DIR/style.css" 2>/dev/null && pkill -SIGUSR2 waybar
    sleep 0.5
done
