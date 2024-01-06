#!/bin/bash
dbus-launch /usr/bin/gnome-session
dbus-send --type=signal /org/gnome/SessionManager org.gnome.SessionManager.CustomSignal string:"gnomelogout"
echo "-------------GNOME Logout-----------------"
#/usr/bin/gnomelogout
