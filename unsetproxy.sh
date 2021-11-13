#!/bin/sh
git config --global --unset http.proxy 
git config --global --unset https.proxy
npm config delete proxy
npm config delete https-proxy

export use_proxy=off
export https_proxy=
export http_proxy=
export ftp_proxy=

