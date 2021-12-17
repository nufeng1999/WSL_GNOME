#!/bin/sh
export HOSTIP=$(ip route | awk '/^default/{print $3; exit}')
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
#export wait=15
gsettings set org.gnome.system.proxy.http host http://$HOSTIP
gsettings set org.gnome.system.proxy.http port 1080
gsettings set org.gnome.system.proxy.https host http://$HOSTIP
gsettings set org.gnome.system.proxy.https port 1080
gsettings set org.gnome.system.proxy.ftp host http://$HOSTIP
gsettings set org.gnome.system.proxy.ftp port 1080
