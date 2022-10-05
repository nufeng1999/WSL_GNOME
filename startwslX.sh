#!/bin/sh
arg='0'
if [ "x$1" = "x1" ];then
	arg='1'
fi
/mnt/c/WINDOWS/System32/cmd.exe /c "C:\\ISwitch\\XWin_Cygwin.cmd $arg" > /dev/null 2>&1 &
/usr/bin/sleep 3
#/usr/bin/wslpanel
