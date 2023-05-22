#!/bin/sh

IMAGE="$HOME/.config/hypr/wallpapers/CartoonAstronaut.png"

swaylock \
	--image ${IMAGE} --scaling 'fill' \
	--effect-blur 35x20 \
  --hide-keyboard-layout \
  --indicator-radius 220 \
  --indicator-thickness 7 \
  --indicator-caps-lock \
  --ring-color cba6f7 \
  --ring-ver-color 89b4fa \
  --ring-wrong-color f38ba8 \
  --ring-clear-color a6e3a1 \
  --key-hl-color 1e1e2e \
  --bs-hl-color eba0ac \
  --text-color 11111b \
  --text-caps-lock-color 11111b \
  --line-color 1e1e2e \
  --line-ver-color 1e1e2e \
  --line-wrong-color f38ba8 \
  --line-clear-color a6e3a1 \
  --separator-color 1e1e2e \
  --inside-color cba6f7 \
  --inside-ver-color 89b4fa\
  --inside-wrong-color f38ba8 \
  --inside-clear-color a6e3a1 \
  --inside-caps-lock-color fab387 \
  --color 1e1e2e80 \
  --clock \
  --indicator
