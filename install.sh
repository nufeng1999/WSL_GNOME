#!/bin/bash
CYGWINDIR='C:\\cygwin64'
ISWITCHDIR='C:\\ISwitch'
. ./argenv.sh "$@"
echo "cygwin install_dir: $CYGWINDIR"
echo "iswitchdir install_dir: $ISWITCHDIR"
#echo $CYGWINDIR
#echo $ISWITCHDIR
#Generate file cygwinXenv.sh
cat << EOF > $PWD/cygwinXenv.sh
#!/bin/sh
export CYGWINDIR="$CYGWINDIR"
export ISWITCHDIR="$ISWITCHDIR"
EOF
#Generate file XWin_Cygwin.sh
cat << EOF > $PWD/XWin_Cygwin.cmd
echo off
cd $CYGWINDIR

if '%1'=='0' (
  rem TASKKILL /F /IM  ISwitch.exe 
  rem TASKKILL /F /IM XWin.exe 
  rem multiwindow mode
  $CYGWINDIR\bin\run.exe --quote /usr/bin/bash.exe -l -c  "killall -9 XWin;killall ISwitch"
  start $CYGWINDIR\bin\run.exe --quote /usr/bin/bash.exe -l -c  "killall ISwitch;cd cd \`cygpath -u "$ISWITCHDIR"\`;./ISwitch.exe -c & cd;export LIBGL_ALWAYS_SOFTWARE=1;XWin.exe -ac -terminate -lesspointer -multiwindow -compositewm -compositealpha -engine 1 -silent-dup-error -listen tcp -nolisten inet6 -hostintitle -clipboard +iglx -wgl -noreset   :0;killall ISwitch"

) else (
  rem TASKKILL /F /IM  ISwitch.exe 
  rem TASKKILL /F /IM XWin.exe 

  rem rootless mode
  $CYGWINDIR\bin\run.exe --quote /usr/bin/bash.exe -l -c "killall -9 XWin;killall ISwitch"
  start $CYGWINDIR\bin\run.exe --quote /usr/bin/bash.exe -l -c "sleep 2;killall ISwitch;cd \`cygpath -u "$ISWITCHDIR"\`;./ISwitch.exe -c & cd;export LIBGL_ALWAYS_SOFTWARE=1;XWin.exe -ac -terminate -lesspointer -rootless -notrayicon -compositewm -compositealpha -engine 1 -silent-dup-error -listen tcp -nolisten inet6 -hostintitle -clipboard +iglx -wgl -noreset  -dpms  :0;killall ISwitch"

)

exit

EOF
/mnt/c/WINDOWS/System32/cmd.exe /c "taskkill /F /IM ISwitch.exe" > /dev/null 2>&1

wintemp=`/mnt/c/WINDOWS/System32/cmd.exe /c "echo %TEMP%" 2>/dev/null|head -n 1 |tail -n 1`
winwsltemp=`wslpath -u $wintemp`
winwsltemp=${winwsltemp//$'\r'}
winwsltemp=${winwsltemp//$'\n'}
cygwininstallfile=`echo $winwsltemp/cygwin-install.bat`
ISwitchinstallfile=`echo $winwsltemp/ISwitch.msi`

cp $PWD/cygwin-auto-install/cygwin-install.bat $cygwininstallfile
cp $PWD/ISwitch.msi $ISwitchinstallfile
#cp $PWD/ucrtbase.dll /mnt/c/WINDOWS/System32/
#cp $PWD/ucrtbased.dll /mnt/c/WINDOWS/System32/
#cp $PWD/vcruntime140.dll /mnt/c/WINDOWS/System32/
#cp $PWD/vcruntime140d.dll /mnt/c/WINDOWS/System32/

/mnt/c/WINDOWS/System32/cmd.exe /c msiexec /quiet /x "{C22F729F-7FBB-4556-B706-359E1D890722}"
sleep 1
/mnt/c/WINDOWS/System32/cmd.exe /c "cd $wintemp & $wintemp\\ISwitch.msi" TARGETDIR="$ISWITCHDIR"
/mnt/c/WINDOWS/System32/cmd.exe /c "cd $wintemp & $wintemp\\cygwin-install.bat" "$CYGWINDIR"

ln -sf $PWD/cygwinXenv.sh /usr/bin/cygwinXenv
ln -sf $PWD/setguienv.sh /usr/bin/setguienv
ln -sf $PWD/setproxy.sh /usr/bin/setproxy
ln -sf $PWD/unsetproxy.sh /usr/bin/unsetproxy
ln -sf $PWD/startwslX.sh /usr/bin/startwslX
ln -sf $PWD/startXServer.sh /usr/bin/startXServer
ln -sf $PWD/wslfcitx.sh /usr/bin/wslfcitx
ln -sf $PWD/wslibus.sh /usr/bin/wslibus
ln -sf $PWD/wslpanel.sh /usr/bin/wslpanel
ln -sf $PWD/wslstartxfce4.sh /usr/bin/wslstartxfce4
ln -sf $PWD/wslterminator.sh /usr/bin/wslterminator
ln -sf $PWD/setwsl2bridge.sh  /usr/bin/setwsl2bridge
ln -sf $PWD/00-wsl2-systemd.sh  /usr/bin/wsl2-systemd
ln -sf $PWD/setresolv.sh /usr/bin/setresolv.sh 
ln -sf $PWD/restartudev.sh /usr/bin/restartudev
ln -sf $PWD/start-xfce4-panel.sh /usr/bin/start-xfce4-panel
ln -sf $PWD/start-xfce4.sh /usr/bin/start-xfce4
ln -sf $PWD/startgnome2.sh /usr/bin/startgnome2

chmod +x /usr/bin/cygwinXenv
chmod +x /usr/bin/setguienv
chmod +x /usr/bin/setproxy
chmod +x /usr/bin/unsetproxy
chmod +x /usr/bin/startwslX
chmod +x /usr/bin/startXServer
chmod +x /usr/bin/wslfcitx
chmod +x /usr/bin/wslibus
chmod +x /usr/bin/wslpanel
chmod +x /usr/bin/wslstartxfce4
chmod +x /usr/bin/wslterminator
chmod +x /usr/bin/setwsl2bridge
chmod +x /usr/bin/wsl2-systemd
chmod +x /usr/bin/setresolv.sh 
chmod +x /usr/bin/restartudev
#-------------------

#-------------------
/mnt/c/WINDOWS/System32/cmd.exe /c "taskkill /F /IM ISwitch.exe" > /dev/null 2>&1
#mkdir -p /mnt/c/ISwitch
#cp -f $PWD/ISwitch* /mnt/c/ISwitch/ > /dev/null 2>&1
#cp -f $PWD/XWin_Cygwin.cmd /mnt/c/ISwitch/XWin_Cygwin.cmd > /dev/null 2>&1


cp -f $PWD/XWin_Cygwin.cmd `wslpath $ISWITCHDIR/XWin_Cygwin.cmd` > /dev/null 2>&1

INCLUDENumber=`grep -i "setguienv" ~/.bashrc|wc -l`
if [ $INCLUDENumber -le 0 ];then
	echo '. /usr/bin/setguienv' >> ~/.bashrc
fi

#-------------------


