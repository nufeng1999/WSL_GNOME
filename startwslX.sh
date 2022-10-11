#!/bin/sh
arg='0'
if [ "x$1" = "x1" ];then
	arg='1'
fi
/usr/bin/cygXS -c "$CYGWINDIR" -i "$ISWITCHDIR" -p2 -n9 > /dev/null 2>&1 &
/usr/bin/cygXS -c "$CYGWINDIR" -i "$ISWITCHDIR" -p2 -n$arg > /dev/null 2>&1 &
/usr/bin/sleep 3
#/usr/bin/wslpanel
