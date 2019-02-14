#!/bin/sh

xrdb -merge ~/.Xresources

# Build-in display only
# xrandr --output eDP1 --auto --primary

# Home
xrandr --output DP1 --left-of HDMI1 --auto --output HDMI1 --auto --primary --output eDP1 --off

# Peakfijn
# xrandr --output HDMI1 --above eDP1 --auto --primary --output eDP1 --auto

xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled" 1 # Enable tapping
xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Natural Scrolling Enabled" 1 # Enable natural scrolling

exec i3
