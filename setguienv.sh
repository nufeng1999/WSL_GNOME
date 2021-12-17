#!/bin/bash
. /usr/bin/setresolv.sh
alias code='echo "yes"|dbus-launch /usr/bin/code --user-data-dir  --no-sandbox'
cd ~
export DONT_PROMPT_WSL_INSTALL=1
export LANG=zh_CN.UTF-8
export LC_ALL=zh_CN.UTF-8
export LC_LANG=zh_CN.UTF-8
export LC_CTYPE=zh_CN.UTF-8
export NO_AT_BRIDGE=1
export LIBGL_ALWAYS_INDIRECT=
export GDK_THEME=
export XDG_SESSION_TYPE="x11"
export QT_QPA_PLATFORMTHEME=gtk2
export DESKTOP_SESSION=gnome
export HOSTIP=$(ip route | awk '/^default/{print $3; exit}')
export DISPLAY=$HOSTIP:0.0
export PULSE_SERVER=tcp:$HOSTIP
local_ip=`/sbin/ifconfig -a|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d "addr:"`
local_hostname=`hostname`
/mnt/c/WINDOWS/System32/cmd.exe /C setx WSLHOSTIP $local_ip  >  /dev/null 2>&1 
sed -i "/ $local_hostname/d" /mnt/c/WINDOWS/System32/drivers/etc/hosts
echo "$local_ip $local_hostname " >>/mnt/c/WINDOWS/System32/drivers/etc/hosts
export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export PATH=/opt/dart-sdk/bin:/opt/flutter/bin:$PATH
alias reboot='sudo /usr/bin/reboot'
ps -fe|grep fcitx |grep -v grep > /dev/null
if [ $? -eq 0 ]; then  
    return
fi
/usr/bin/wslfcitx
/usr/bin/startXServer
