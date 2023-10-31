#!/bin/bash
#-------------------
sudo git config --global --add safe.directory $PWD
sudo git config --global --add safe.directory $PWD/cygwin-auto-install
cd cygwin-auto-install
sudo git pull
cd ../
sudo git pull
#-------------------
. ./wupdatee.sh
#-------------------

#-------------------

#-------------------
