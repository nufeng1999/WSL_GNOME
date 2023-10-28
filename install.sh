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

#-------------------
chmod +x createln.sh
chmod +x wupdatee.sh
. ./createln.sh
#-------------------
/mnt/c/WINDOWS/System32/cmd.exe /c "taskkill /F /IM ISwitch.exe" > /dev/null 2>&1

INCLUDENumber=`grep -i "setguienv" ~/.bashrc|wc -l`
if [ $INCLUDENumber -le 0 ];then
echo 'if [ ! -n "$SSH_CLIENT" ];then' >> ~/.bashrc
echo 'if [ ! -n "$XRDP_SOCKET_PATH" ];then' >> ~/.bashrc
	echo '. /usr/bin/setguienv' >> ~/.bashrc
echo 'fi' >> ~/.bashrc
echo 'fi' >> ~/.bashrc
fi

#-------------------


