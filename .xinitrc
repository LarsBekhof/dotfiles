#!/bin/sh

case "$1" in
	"build-in")
		xrandr --output eDP1 --auto --primary
	;;
	"home")
		xrandr --output DP1 --left-of HDMI1 --auto --output HDMI1 --auto --primary --output eDP1 --off
	;;
	"peakfijn")
		xrandr --output HDMI1 --above eDP1 --auto --primary --output eDP1 --auto
	;;
esac

xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled" 1 # Enable tapping
xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Natural Scrolling Enabled" 1 # Enable natural scrolling

exec i3
