#!/bin/sh

exec swayidle -w \
  timeout 900 "~/.config/hypr/scripts/swaylock.sh" \
  timeout 1200 'swaymsg "hyprctl dispatch dpms off"' \
  resume 'swaymsg "hyprctl dispatch dpms on"' \
  before-sleep 'mpc pause' \
  before-sleep "~/.config/hypr/scripts/swaylock.sh"
