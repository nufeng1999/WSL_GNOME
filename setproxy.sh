#!/bin/sh
export HOSTIP=$(ip route | awk '/^default/{print $3; exit}')
local_ip=`/sbin/ifconfig -a|grep eth0 -A 1| grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d "addr:"`
HOSTIPC=`/mnt/c/Windows/System32/ipconfig.exe|iconv  -f gbk -t utf-8|grep $HOSTIP|wc -l`
if [ $HOSTIPC -gt 0 ];then
    export HOSTIP=$local_ip
fi
export DISPLAY=$HOSTIP:0.0
export PULSE_SERVER=tcp:$HOSTIP
export HTTPPROXY=http://$HOSTIP:1080
npm config set proxy $HTTPPROXY
npm config set https-proxy $HTTPPROXY
git config --global http.proxy $HTTPPROXY
git config --global https.proxy $HTTPPROXY
export https_proxy=$HTTPPROXY
export http_proxy=$HTTPPROXY
export ftp_proxy=$HTTPPROXY
export use_proxy=on

export HTTPS_PROXY=$HTTPPROXY
export HTTP_PROXY=$HTTPPROXY
export FTP_PROXY=$HTTPPROXY
export USE_PROXY=on

#export wait=15 
gsettings set org.gnome.system.proxy.http host http://$HOSTIP  >/dev/null 2>&1
gsettings set org.gnome.system.proxy.http port 1080 >/dev/null 2>&1
gsettings set org.gnome.system.proxy.https host http://$HOSTIP >/dev/null 2>&1
gsettings set org.gnome.system.proxy.https port 1080 >/dev/null 2>&1
gsettings set org.gnome.system.proxy.ftp host http://$HOSTIP >/dev/null 2>&1
gsettings set org.gnome.system.proxy.ftp port 1080 >/dev/null 2>&1
