#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
#

#xrandr --output DVI-0 --auto --output DVI-1 --auto --left-of DVI-0

# Use a "normal" cursor
xsetroot -cursor_name left_ptr

# Set wallpaper
eval $(cat ~/.fehbg) &

# Activate numlock
numlockx &

xmodmap ~/.Xmodmap &

# Start Xmonad
exec xmonad
