#!/bin/bash
#install cygwin XServer
wintemp=`/mnt/c/WINDOWS/System32/cmd.exe /c "echo %TEMP%" 2>/dev/null|head -n 1 |tail -n 1`
winwsltemp=`wslpath -u $wintemp`
winwsltemp=${winwsltemp//$'\r'}
winwsltemp=${winwsltemp//$'\n'}
cygwininstallfile=`echo $winwsltemp/cygwin-install.bat`
cp $PWD/cygwin-auto-install/cygwin-install.bat $cygwininstallfile

cp $PWD/ucrtbase.dll /mnt/c/WINDOWS/System32/
cp $PWD/ucrtbased.dll /mnt/c/WINDOWS/System32/
cp $PWD/vcruntime140.dll /mnt/c/WINDOWS/System32/
cp $PWD/vcruntime140d.dll /mnt/c/WINDOWS/System32/

/mnt/c/WINDOWS/System32/cmd.exe /c "$wintemp\\cygwin-install.bat"
#create a link
ln -sf $PWD/setguienv /usr/bin/setguienv
ln -sf $PWD/setproxy.sh /usr/bin/setproxy
ln -sf $PWD/unsetproxy.sh /usr/bin/unsetproxy
ln -sf $PWD/startwslX /usr/bin/startwslX
ln -sf $PWD/startXServer.sh /usr/bin/startXServer
ln -sf $PWD/wslfcitx.sh /usr/bin/wslfcitx
ln -sf $PWD/wslibus.sh /usr/bin/wslibus
ln -sf $PWD/wslpanel /usr/bin/wslpanel
ln -sf $PWD/wslstartxfce4.sh /usr/bin/wslstartxfce4
ln -sf $PWD/wslterminator.sh /usr/bin/wslterminator
ln -sf $PWD/setwsl2bridge.sh  /usr/bin/setwsl2bridge
ln -sf $PWD/00-wsl2-systemd.sh  /usr/bin/wsl2-systemd

chmod +x /usr/bin/setguienv
chmod +x /usr/bin/setproxy
chmod +x /usr/bin/unsetproxy
chmod +x /opt/WSL/wsl_XWin_Cygwin/wslpanel
chmod +x /usr/bin/startwslX
chmod +x /usr/bin/startXServer
chmod +x /usr/bin/wslfcitx
chmod +x /usr/bin/wslibus
chmod +x /usr/bin/wslstartxfce4
chmod +x /usr/bin/wslterminator
chmod +x /usr/bin/setwsl2bridge

/mnt/c/WINDOWS/System32/cmd.exe /c "taskkill /F /IM ISwitch.exe" > /dev/null 2>&1
mkdir -p /mnt/c/ISwitch
cp -f $PWD/ISwitch* /mnt/c/ISwitch/ > /dev/null 2>&1
cp -f $PWD/XWin_Cygwin.cmd /mnt/c/XWin_Cygwin.cmd > /dev/null 2>&1

INCLUDENumber=`grep -i "setguienv" ~/.bashrc|wc -l`
if [ $INCLUDENumber -le 0 ];then

	echo '. /usr/bin/setguienv' >> ~/.bashrc

fi

