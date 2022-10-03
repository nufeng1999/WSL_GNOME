#! /bin/sh
#/usr/bin/wslfcitx
export PULSE_SERVER=tcp:$HOSTIP
export NO_AT_BRIDGE=1
export LC_CTYPE=zh_CN.UTF-8
#设置输入法
export XMODIFIERS=@im=fcitx
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx

export LIBGL_ALWAYS_SOFTWARE=1
export LIBGL_ALWAYS_INDIRECT=1
#cd /mnt/h/ISwitch
#./ISwitch.exe  -c -w &
cd
#启动输入法
#/usr/bin/fcitx -d -r 2>/dev/null &
#启动桌面环境
/usr/bin/startxfce4 >/dev/null 2>&1 &
