#!/bin/bash

# grimblast --notify copysave area ~/Pictures/Screenshots/$(date +'%s_screenshot.png') 
grim -g "$(slurp -o)" $(xdg-user-dir PICTURES)/Screenshots/$(date + '%s_screenshot.png')
