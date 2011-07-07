#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# exec gnome-session
# exec startkde
# exec startxfce4
# ...or the Window Manager of your choice

# Use "normal" cursor
xsetroot -cursor_name left_ptr

# Set wallpaper with feh
sh ~/.fehbg &

#xcompmgr -c &

#wicd-client &
#gnome-power-manager &
#gnome-settings-daemon &

dzen2 -bg '#1a1a1a' -fg '#777777' -h 16 -w 550 -sa c -e '' -fn '-*-terminus-*-r-normal-*-*-120-*-*-*-*-iso8859-*' -ta &

exec ck-launch-session xmonad
