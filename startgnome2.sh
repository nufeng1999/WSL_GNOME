#!/bin/sh
cd /mnt/c
#export WAYLAND_DISPLAY=wayland-0
#export DISPLAY=:0
#update-binfmts --disable cli
/usr/bin/cygXS -c "$CYGWINDIR" -i "$ISWITCHDIR" -p2 -n9 > /dev/null 2>&1 &
/usr/bin/cygXS -c "$CYGWINDIR" -i "$ISWITCHDIR" -p2 -n1 > /dev/null 2>&1 &
sleep 5
/usr/bin/fcitx -d -r >/dev/null 2>&1 &
export GDK_SCALE=1.75
export GDK_DPI_SCALE=1.75
/usr/bin/wslfcitx reload
#dbus-launch /usr/bin/gnome-session &
#>/dev/null 2>&1 &
#/usr/bin/gnome-session --debug &
#>/dev/null 2>&1 &
cd $HOME
sudo -E su $USER -c '/usr/bin/startgnome &'
#sudo -E su $USER -c '/usr/bin/gnome-session &'
sleep 2
#echo "--------gnome logout"
/usr/bin/gnomelogout >/dev/null 2>&1 &
