#!/bin/sh

xrandr --output eDP1 --auto --primary

xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled" 1 # Enable tapping
xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Natural Scrolling Enabled" 1 # Enable natural scrolling

exec i3
