#!/bin/sh
#export WAYLAND_DISPLAY=wayland-0
#export DISPLAY=:0
update-binfmts --disable cli
/mnt/c/WINDOWS/System32/cmd.exe /c "$ISWITCHDIR\\XWin_Cygwin.cmd 1" > /dev/null 2>&1 &
sleep 5
/usr/bin/fcitx -d -r >/dev/null 2>&1 &
export GDK_SCALE=1
export GDK_DPI_SCALE=1
/usr/bin/gnome-session >/dev/null 2>&1 &
