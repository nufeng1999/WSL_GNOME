#!/bin/sh
cd /mnt/c
#export WAYLAND_DISPLAY=wayland-0
#export DISPLAY=:0
#update-binfmts --disable cli
/usr/bin/cygXS -c "$CYGWINDIR" -i "$ISWITCHDIR" -n9 > /dev/null 2>&1 &
/usr/bin/cygXS -c "$CYGWINDIR" -i "$ISWITCHDIR" -n1 > /dev/null 2>&1 &
sleep 5
/usr/bin/fcitx -d -r >/dev/null 2>&1 &
export GDK_SCALE=1
export GDK_DPI_SCALE=1
/usr/bin/gnome-session >/dev/null 2>&1 &
cd $HOME
