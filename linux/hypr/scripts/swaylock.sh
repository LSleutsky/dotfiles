#!/bin/sh

IMAGE="$HOME/.config/hypr/wallpapers/CartoonSpace.png"

bg='1e1e2e'	  	bgl='181825'  		fg='f5e0dc'
red='f38ba8'		green='a6e3a1'		yellow='f9e2af'
blue='89b4fa'		magenta='eba0ac'	cyan='94e2d5'
alpha='11111b'

swaylock -f \
	\
	`# General` \
	--show-failed-attempts \
	--hide-keyboard-layout \
	--indicator-caps-lock \
	\
	`# Appearance` \
	--color ${bg} \
	--image ${IMAGE} --scaling 'fill' \
	--font 'ComicShannsMono Nerd Font' --font-size 18 \
	\
	`# Backspace` \
	--key-hl-color ${green} \
	--caps-lock-key-hl-color ${blue} \
	--bs-hl-color ${red} \
	--caps-lock-bs-hl-color ${red} \
	\
	`# Indicator` \
	--indicator-radius 120 \
	--indicator-thickness 10 \
	\
	`# Inside Circle` \
	--inside-color ${alpha} \
	--inside-clear-color ${alpha} \
	--inside-caps-lock-color ${alpha} \
	--inside-ver-color ${blue} \
	--inside-wrong-color ${red} \
	\
	`# Layout` \
	--layout-bg-color ${cyan} \
	--layout-border-color ${cyan} \
	--layout-text-color ${bg} \
	\
	`# Line` \
	--line-color ${bg} \
	--line-clear-color ${red} \
	--line-caps-lock-color ${bg} \
	--line-ver-color ${bg} \
	--line-wrong-color ${bg} \
	\
	`# Ring` \
	--ring-color ${cyan} \
	--ring-clear-color ${bg} \
	--ring-caps-lock-color ${magenta} \
	--ring-ver-color ${blue} \
	--ring-wrong-color ${red} \
	\
	`# Separator` \
	--separator-color ${bg} \
	\
	`# Text` \
	--text-color ${fg} \
	--text-clear-color ${fg} \
	--text-caps-lock-color ${fg} \
	--text-ver-color ${bg} \
	--text-wrong-color ${bg}
