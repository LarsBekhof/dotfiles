#!/bin/sh

xrandr --output eDP-1 --primary --auto

xinput set-prop "DELL08AF:00 06CB:76AF Touchpad" "libinput Tapping Enabled" 1 # Enable tapping
xinput set-prop "DELL08AF:00 06CB:76AF Touchpad" "libinput Natural Scrolling Enabled" 1 # Enable natural scrolling
xinput set-prop "DELL08AF:00 06CB:76AF Touchpad" "libinput Disable While Typing Enabled" 0 # Enable touchpad while typing

exec i3
