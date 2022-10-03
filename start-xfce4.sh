#!/bin/sh
update-binfmts --disable cli
/mnt/c/WINDOWS/System32/cmd.exe /c "C:\\ISwitch\\XWin_Cygwin.cmd 1" > /dev/null 2>&1 &
sleep 5
/usr/bin/fcitx -d -r >/dev/null 2>&1 &
export GDK_SCALE=1
export GDK_DPI_SCALE=1
xfce4-session > /dev/null 2>1&

