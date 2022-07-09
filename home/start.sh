#! /bin/sh
startx
picom &
dbus-run-session bspwm -c ~/.config/bspwm/bspwmrc
