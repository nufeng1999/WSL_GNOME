#!/bin/bash
arg="0"
PROC_NAME=XWin
ProcNumber=`/mnt/c/WINDOWS/System32/cmd.exe /c tasklist  2>/dev/null |grep -w $PROC_NAME|grep -v grep|wc -l`
if [ $ProcNumber -le 0 ] || [ "x$1" = "xrestart" ];then
	if [ "x$2" = "x1" ];then
		arg="1"
	fi
	/usr/bin/cygXS -c "$CYGWINDIR" -i "$ISWITCHDIR" -n9 > /dev/null 2>&1 &
	/usr/bin/cygXS -c "$CYGWINDIR" -i "$ISWITCHDIR" -n$arg > /dev/null 2>&1 &
	#/usr/bin/sleep 6s
fi

