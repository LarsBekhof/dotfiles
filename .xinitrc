#!/bin/sh

xrdb -merge ~/.Xresources

# xrandr --output eDP-1 --auto --primary

xrandr --output $D1 --left-of $D2 --auto
xrandr --output $D2 --auto --primary
xrandr --output eDP-1 --off

xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled" 1 # Enable tapping
xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Natural Scrolling Enabled" 1 # Enable natural scrolling

exec i3
