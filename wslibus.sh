#!/bin/sh
export DISPLAY=127.0.0.1:0.0
export NO_AT_BRIDGE=1
export LC_CTYPE=zh_CN.UTF-8
export XMODIFIERS=@im=ibus
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
cd /mnt/h/ISwitch
./ISwitch.exe &
cd
ibus-daemon  --address='tcp:host=localhost,port=0' -d -r -x -R 2>/dev/null &
