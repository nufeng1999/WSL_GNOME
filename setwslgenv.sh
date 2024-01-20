#!/bin/sh
 
#export XMODIFIERS=@im=ibus
#export GTK_IM_MODULE=ibus
#export QT_IM_MODULE=ibus
#dbus-launch ibus-daemon -x -d -R

wslfcitx reload

	alias gedit='dbus-launch gedit'
	#alias docker='docker -H unix:///mnt/wsl/shared-docker/docker.sock'
	alias code='dbus-launch /usr/bin/code --user-data-dir=$HOME/.vscode  --no-sandbox'
	alias jupyter-lab='jupyter-lab --ip=0.0.0.0 --allow-root'
	alias reboot='sudo /usr/bin/reboot'

	export JAVA_HOME=/usr/lib/jvm/jdk

	LANG=zh_CN.UTF-8
	LANGUAGE=
	LC_CTYPE="zh_CN.UTF-8"
	LC_NUMERIC="zh_CN.UTF-8"
	LC_TIME="zh_CN.UTF-8"
	LC_COLLATE="zh_CN.UTF-8"
	LC_MONETARY="zh_CN.UTF-8"
	LC_MESSAGES="zh_CN.UTF-8"
	LC_PAPER="zh_CN.UTF-8"
	LC_NAME="zh_CN.UTF-8"
	LC_ADDRESS="zh_CN.UTF-8"
	LC_TELEPHONE="zh_CN.UTF-8"
	LC_MEASUREMENT="zh_CN.UTF-8"
	LC_IDENTIFICATION="zh_CN.UTF-8"
	LC_ALL="zh_CN.UTF-8"

	export HOSTIP=$(ip route | awk '/^default/{print $3; exit}')
	local_ip=`/sbin/ifconfig -a|grep eth0 -A 1| grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d "addr:"`
	HOSTIPC=`/mnt/c/Windows/System32/ipconfig.exe|iconv  -f gbk -t utf-8|grep -E "Default Gateway|默认网关"|grep $HOSTIP|wc -l`
                                                                                                                                           PULSE_SERVER=tcp:
	if [ $HOSTIPC -gt 0 ];then
		export HOSTIP=$local_ip
		export PULSE_SERVER=tcp:127.0.0.1
	fi
export QT_FONT_DPI=98
#export QT_STYLE_OVERRIDE=adwaita
export QT_QPA_PLATFORMTHEME=gtk2
export DESKTOP_SESSION=gnome
export XDG_RUNTIME_DIR=/run/user/`id -u`/

    export GDK_DPI_SCALE=1.75
    export QT_SCALE_FACTOR=1.75
    export GDK_SCALE=1.75
