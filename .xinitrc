#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# key mappings
xmodmap ~/.xmodmaprc &

# key bindings
xbindkeys &

# hide cursor when idle
# unclutter &

# background image
eval $(cat ~/.fehbg) &

# activate numlock
numlockx &

# statusbar
while true; do
    xsetroot -name "$(statusline)"
    sleep 1
done &

xrandr --output LVDS --auto --output VGA-0 --auto --pos 1368x0

# start window manager
while true; do
    dwm
done
