#!/bin/sh
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

