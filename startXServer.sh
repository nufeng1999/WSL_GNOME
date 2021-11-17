#!/bin/bash

PROC_NAME=XWin
ProcNumber=`/mnt/c/WINDOWS/System32/cmd.exe /c tasklist  2>/dev/null |grep -w $PROC_NAME|grep -v grep|wc -l`
if [ $ProcNumber -le 0 ];then

	/mnt/c/WINDOWS/System32/cmd.exe /c "C:\\XWin_Cygwin.cmd 0" > /dev/null 2>&1 &
	/usr/bin/sleep 6s
fi




