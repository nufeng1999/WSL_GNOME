#!/bin/sh
#/mnt/c/WINDOWS/System32/cmd.exe /c "C:\\XWin_Cygwin.cmd 1" > /dev/null 2>&1 &
#/usr/bin/sleep 6s

export DONT_PROMPT_WSL_INSTALL=1
export LANG=zh_CN.UTF-8
export LC_ALL=zh_CN.UTF-8
export LC_LANG=zh_CN.UTF-8

export LIBGL_ALWAYS_INDIRECT=
export GDK_THEME=
export XDG_SESSION_TYPE="x11"
export GDK_SCALE=
export GDK_DPI_SCALE=
export ELM_SCALE=
export QT_SCALE_FACTOR=1.2
export QT_FONT_DPI=144
#export QT_STYLE_OVERRIDE=adwaita
export QT_QPA_PLATFORMTHEME=gtk4
export DESKTOP_SESSION=gnome

/usr/bin/gnome-session >/dev/null 2>&1 &
