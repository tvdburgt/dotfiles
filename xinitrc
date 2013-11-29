#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# key remappings
xmodmap ~/.xmodmaprc &

# key bindings
#xbindkeys &

# hide cursor when idle
unclutter &

# background image
eval $(cat ~/.fehbg) &

# activate numlock
numlockx &

# statusbar
while true; do
    xsetroot -name "`date` `uptime | sed 's/.*,//'`"
    sleep 1
done &

# start window manager
exec dwm
