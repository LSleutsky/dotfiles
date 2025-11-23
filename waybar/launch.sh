#!/bin/bash
pkill waybar
pkill -f waybar-reload
waybar &
~/.config/waybar/scripts/waybar-reload.sh &
