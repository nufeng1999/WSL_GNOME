#!/bin/bash

#mkdir -p "$HOME"/.local/share/keyrings
alias docker='docker -H unix:///mnt/wsl/shared-docker/docker.sock'
alias code='dbus-launch /usr/bin/code --user-data-dir  --no-sandbox'
alias jupyter-lab='jupyter-lab --ip=0.0.0.0 --allow-root'
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
export DISPLAY=$HOSTIP:0.0
export PULSE_SERVER=tcp:$HOSTIP

#. /usr/bin/setresolv.sh
cd ~
export DONT_PROMPT_WSL_INSTALL=1

export LIBGL_ALWAYS_INDIRECT=
export GTK_THEME="WhiteSur-dark-solid"
export GDK_THEME="WhiteSur-dark-solid"
export XDG_SESSION_TYPE="x11"
export GDK_SCALE=1
export GDK_DPI_SCALE=1.75
#export ELM_SCALE=2
export QT_SCALE_FACTOR=1.75
export QT_FONT_DPI=98
#export QT_STYLE_OVERRIDE=adwaita
export QT_QPA_PLATFORMTHEME=gtk2
export DESKTOP_SESSION=gnome

export XDG_RUNTIME_DIR=/usr/lib/
export RUNLEVEL=3

#GDK_SYNCHRONIZE
#GDK_CORE_DEVICE_EVENTS

#GTK_PATH
#GDK_DEBUG
#GTK_EXE_PREFIX
#GTK_DATA_PREFIX
#export GTK_THEME=Adwaita-dark
#export GTK_CURSOR_SIZE=48
#export GTK_THEME=Greybird-dark
#export HOSTIP=`nslookup w541|sed -n "1, 1p"|awk '{print $2}'`

#DESKTOP_STARTUP_ID
#XDG_DATA_HOME
#XDG_DATA_DIRS
#GTK_OVERLAY_SCROLLING
#GTK_CSD
#GDK_BACKEND
#GDK_RENDERING
#GDK_PIXBUF_MODULE_FILE
#export GTK_IM_MODULE=ibus
#export GTK_IM_MODULE_FILE
#export XMODIFIERS=@im=ibus
#export QT_IM_MODULE=ibus
#export XIM_PROGRAM="ibus-daemon"
export NO_AT_BRIDGE=1
export LC_CTYPE=zh_CN.UTF-8
export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx

#eval $(/usr/bin/gnome-keyring-daemon --start)
#export SSH_AUTH_SOCK
#mkdir -p "$HOME"/.local/share/keyrings

alias reboot='sudo /usr/bin/reboot'
######################################################
ps -fe|grep fcitx |grep -v grep > /dev/null
if [ $? -eq 0 ]; then  
    return
fi


local_ip=`/sbin/ifconfig -a|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d "addr:"`
local_hostname=`hostname`
/mnt/c/WINDOWS/System32/cmd.exe /C setx WSLHOSTIP $local_ip  >  /dev/null 2>&1 
#update Windows C:\Windows\System32\drivers\etc\hosts hostname 
sed -i "/ $local_hostname/d" /mnt/c/WINDOWS/System32/drivers/etc/hosts
echo "$local_ip $local_hostname " >>/mnt/c/WINDOWS/System32/drivers/etc/hosts


/usr/bin/wslfcitx

/usr/bin/startXServer
export PATH=/opt/dart-sdk/bin:/opt/flutter/bin:$PATH

