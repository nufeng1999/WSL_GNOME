#!/bin/sh
update-binfmts --disable cli
/usr/bin/cygXS -c "$CYGWINDIR" -i "$ISWITCHDIR" -n9 > /dev/null 2>&1 &
/usr/bin/cygXS -c "$CYGWINDIR" -i "$ISWITCHDIR" -n1 > /dev/null 2>&1 &
sleep 5
/usr/bin/fcitx -d -r >/dev/null 2>&1 &
export GDK_SCALE=1
export GDK_DPI_SCALE=1
xfce4-session > /dev/null 2>1&

