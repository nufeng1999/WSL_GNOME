#!/bin/bash
##update

. ./createln.sh

/opt/WSL/WSL_GNOME/cwinlnk.sh /usr/share/applications/org.gnome.gedit.desktop
/opt/WSL/WSL_GNOME/cwinlnk.sh /usr/share/applications/htop.desktop HTOP "dbus-launch gnome-terminal -- "
/opt/WSL/WSL_GNOME/cwinlnk.sh /usr/share/applications/org.gnome.Terminal.desktop Terminal dbus-launch
/opt/WSL/WSL_GNOME/cwinlnk.sh /usr/share/applications/thunar.desktop thunar dbus-launch

