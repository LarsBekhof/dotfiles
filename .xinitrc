#!/bin/sh

xrandr --output DP1 --left-of HDMI1 --auto --output HDMI1 --auto --primary --output eDP1 --off

xinput set-prop "DELL08AF:00 06CB:76AF Touchpad" "libinput Tapping Enabled" 1 # Enable tapping
xinput set-prop "DELL08AF:00 06CB:76AF Touchpad" "libinput Natural Scrolling Enabled" 1 # Enable natural scrolling

exec i3
