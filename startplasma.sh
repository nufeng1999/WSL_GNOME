#!/bin/sh
update-binfmts --disable cli
/usr/bin/cygXS -c "$CYGWINDIR" -i "$ISWITCHDIR" -n9 > /dev/null 2>&1 &
/usr/bin/cygXS -c "$CYGWINDIR" -i "$ISWITCHDIR" -n1 > /dev/null 2>&1 &
sleep 5

export DONT_PROMPT_WSL_INSTALL=1
export LANG=zh_CN.UTF-8
export LC_ALL=zh_CN.UTF-8
export LC_LANG=zh_CN.UTF-8

export LIBGL_ALWAYS_INDIRECT=
export GDK_THEME=
export XDG_SESSION_TYPE="x11"
export GDK_SCALE=1
export GDK_DPI_SCALE=1
export ELM_SCALE=1
export QT_SCALE_FACTOR=1.2
export QT_FONT_DPI=144
#export QT_STYLE_OVERRIDE=adwaita
export QT_QPA_PLATFORMTHEME=gtk4
export DESKTOP_SESSION=gnome

/usr/bin/plasma_session >/dev/null 2>&1 &
