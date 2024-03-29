#!/bin/bash

function init_info(){
    echo "***************************************"
    echo    X environment initializing
}
function ready_info(){
    echo    X environment is ready
    echo "***************************************"
}

if [ -n "$WAYLAND_DISPLAY" ] ; then
    echo "***************************************"
    echo "Currently running in WAYLAND mode."
    echo "***************************************"
    . /usr/bin/setwslgenv
    return
fi

init_info
. /usr/bin/cygwinXenv
#mkdir -p "$HOME"/.local/share/keyrings
export DONT_PROMPT_WSL_INSTALL=1
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
export DISPLAY=$HOSTIP:0.0
export PULSE_SERVER=tcp:$HOSTIP
if [ $HOSTIPC -gt 0 ];then
    export HOSTIP=$local_ip
    export DISPLAY=127.0.0.1:0.0
    export PULSE_SERVER=tcp:127.0.0.1
fi

#. /usr/bin/setresolv.sh
cd ~
export DONT_PROMPT_WSL_INSTALL=1

export LIBGL_ALWAYS_INDIRECT=
export LIBGL_ALWAYS_SOFTWARE=1
#export GALLIUM_DRIVER=softpipe
#export GALLIUM_DRIVER=llvmpipe
#export GALLIUM_DRIVER=swr

#export GTK_THEME="WhiteSur-dark-solid"
#export GDK_THEME="WhiteSur-dark-solid"
export XDG_SESSION_TYPE="x11"

ProcNumber=`ps -ef|grep gnome-session-binary |grep -v grep|wc -l`
if [ $ProcNumber -gt 0 ]; then
    export GDK_DPI_SCALE=1.75
    export QT_SCALE_FACTOR=1.75
else
    export GDK_DPI_SCALE=1.75
    export QT_SCALE_FACTOR=1.75
fi

if [ "x$XDG_CURRENT_DESKTOP" != "x" ];then
    export GDK_DPI_SCALE=1
    export QT_SCALE_FACTOR=1
fi
#export GDK_SCALE=1
#export GDK_DPI_SCALE=1
#export ELM_SCALE=2
#export QT_SCALE_FACTOR=1
export QT_FONT_DPI=98
#export QT_STYLE_OVERRIDE=adwaita
export QT_QPA_PLATFORMTHEME=gtk2
export DESKTOP_SESSION=gnome

export XDG_RUNTIME_DIR=/run/user/`id -u`/
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

export NO_AT_BRIDGE=1
#export GTK_IM_MODULE=ibus
#export GTK_IM_MODULE_FILE
#export XMODIFIERS=@im=ibus
#export QT_IM_MODULE=ibus
#export XIM_PROGRAM="ibus-daemon"

export LC_CTYPE=zh_CN.UTF-8
export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx

#eval $(/usr/bin/gnome-keyring-daemon --start)
#export SSH_AUTH_SOCK
#mkdir -p "$HOME"/.local/share/keyrings
#update-binfmts --disable cli >  /dev/null 2>&1 &
######################################################
ProcNumber=`ps -ef|grep fcitx |grep -v grep|wc -l`
if [ $ProcNumber -gt 0 ]; then
    /usr/bin/wslfcitx reload
    ready_info
    return
fi
#echo  "----->$ProcNumber"
SYSTEMD_PID=$(ps -ef | grep '/lib/systemd/systemd --system-unit=basic.target' | grep -v unshare|grep -v grep | awk '{print $2}')
if [ -n "$SYSTEMD_PID" ] && [ "$SYSTEMD_PID" == "1" ]; then
    echo "SYSTEMD_PID = $SYSTEMD_PID"
    export GDK_SCALE=1
    export GDK_DPI_SCALE=1
    ready_info
    return
fi

local_hostname=`hostname`
/mnt/c/WINDOWS/System32/cmd.exe /C setx WSLHOSTIP $local_ip  >  /dev/null 2>&1 &


#update Windows C:\Windows\System32\drivers\etc\hosts hostname
#Modify permissions of hosts file runas /user:Administrator C:\WINDOWS\System32\cacls.exe C:\WINDOWS\System32\drivers\etc\hosts   /t /e /c /g users:f
/mnt/c/WINDOWS/System32/cacls.exe "C:\\WINDOWS\\System32\\drivers\\etc\\hosts"   /t /e /c /g users:f >  /dev/null 2>&1
cp "/mnt/c/WINDOWS/System32/drivers/etc/hosts" ~/hosts
sed -i "/ wslhost/d" ~/hosts >  /dev/null 2>&1
echo "$local_ip wslhost " >>~/hosts    2>/dev/null
cp ~/hosts /mnt/c/WINDOWS/System32/drivers/etc/hosts

# /usr/bin/wslfcitx

/usr/bin/startXServer
/usr/bin/wslfcitx reload
ready_info
