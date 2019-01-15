#!/bin/sh

# /etc/X11/xinit/xinitrc
#
# global xinitrc file, used by all X sessions started by xinit (startx)

# invoke global X session script
#. /etc/X11/Xsession

D1=DP-1
D2=HDMI-1

D1C="$(xrandr | grep "$D1 connected")"
D2C="$(xrandr | grep "$D2 connected")"

# if [[ -z "D1C" && -z "D2C" ]]; then
#     xrandr --output eDP-1 --auto --primary
# else
#     xrandr --output $D1 --left-of $D2 --auto
#     xrandr --output $D2 --auto --primary
#     xrandr --output eDP-1 --off
# fi

# xrandr --output eDP-1 --auto --primary

xrandr --output $D1 --left-of $D2 --auto
xrandr --output $D2 --auto --primary
xrandr --output eDP-1 --off

xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Tapping Enabled" 1 # Enable tapping
xinput set-prop "SynPS/2 Synaptics TouchPad" "libinput Natural Scrolling Enabled" 1 # Enable natural scrolling

exec i3
