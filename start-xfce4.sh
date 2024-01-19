#!/bin/sh
update-binfmts --disable cli
/usr/bin/cygXS -c "$CYGWINDIR" -i "$ISWITCHDIR" -p2 -n9 > /dev/null 2>&1 &
/usr/bin/cygXS -c "$CYGWINDIR" -i "$ISWITCHDIR" -p2 -n1 > /dev/null 2>&1 &
sleep 5
/usr/bin/fcitx -d -r >/dev/null 2>&1 &
export GDK_SCALE=1
export GDK_DPI_SCALE=1
/usr/bin/start-xfce4-2 > /dev/null 2>&1 &
sleep 2
#echo "--------gnome logout"
/usr/bin/gnomelogout >/dev/null 2>&1 &
