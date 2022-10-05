#!/bin/bash

PROC_NAME=fcitx
ProcNumber=`ps -ef |grep -w $PROC_NAME|grep -v grep|wc -l`
if [ $ProcNumber -le 0 ] || [ "x$1" = "xreload" ];then
	#echo "start fcitx..."
	export NO_AT_BRIDGE=1
	export LC_CTYPE=zh_CN.UTF-8
	export XMODIFIERS=@im=fcitx
	export GTK_IM_MODULE=fcitx
	export QT_IM_MODULE=fcitx
	cd ~
	/usr/bin/fcitx -d -r >/dev/null 2>&1 &
fi
