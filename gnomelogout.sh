#!/bin/bash

PROC_NAME="type=signal,sender=org.gnome.SessionManager,interface=org.gnome.SessionManager,member=SessionOver"
ProcNumber=`ps -ef |grep -w "$PROC_NAME"|grep -v grep|wc -l`
if [ $ProcNumber -gt 0 ];then
	exit

fi
logout() {
  echo $1
  if echo "$1" | grep -q "interface=org.freedesktop.DBus.Local; member=Disconnected"; then
  #if echo "$1" | grep -q "interface=org.freedesktop.PackageKit.Transaction; member=Destroy"; then
  #if [[ $1 == *"org.freedesktop.DBus.Local; member=Disconnected"* ]]; then
  #if [ "$1" = "Logout" ]; then
	sleep 1
    	echo "清理并重新启动 XServer."
	
    	/usr/bin/startXServer restart 0
	/usr/bin/wslfcitx reload
	pn=`ps -ef|grep -w "$PROC_NAME"|grep -v grep|awk '{print $2}'`
	if [ "A$pn" != "A" ] ;then
		if [ $pn -gt 0 ];then
			kill -9 $pn >/dev/null
			exit
		fi
	fi
  elif [ "$1" = "Shutdown" ]; then
    echo "Shutdown"
  fi

}


/usr/bin/dbus-monitor "type=signal,sender=org.gnome.SessionManager,interface=org.gnome.SessionManager,member=SessionOver" | while read line; do
#/usr/bin/dbus-monitor --system interface=org.freedesktop.PackageKit.Transaction | while read line; do
	logout "$line"
done
