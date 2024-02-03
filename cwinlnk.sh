#!/bin/sh

Icon=`cat $1|grep Icon=| head -n 1| cut -c6-`

Exec=`cat $1|grep TryExec=| head -n 1| cut -c9-| sed 's/ \+.*$//'`
if [ "1$Exec" = "1" ];then
    Exec=`cat $1|grep Exec=| head -n 1| cut -c6-| sed 's/ \+.*$//'`
fi
# echo $Icon
# echo $Exec

Iconfile=`find /usr/share -name "*$Icon*"|grep 128|grep .png| head -n 1`
if [ "1$Iconfile" = "1" ];then
Iconfile=`find /usr/share -name "*$Icon*"|grep .svg| head -n 1`
fi
# echo "$Iconfile"
WSLApps_path="/mnt/c/ProgramData/Microsoft/Windows/Start\ Menu/Programs/WSLApps"
WSLApps_icopath="/mnt/c/Program\ Files/wslapps/icons/$Icon.ico"

WSLApps_icopath="/mnt/c/ISwitch/icons"
mkdir -p $WSLApps_icopath/usr/share/applications/org.gnome.Terminal.desktop
# echo "convert \"$Iconfile\" \"$WSLApps_icopath/$Icon.ico\""
convert  $Iconfile "$WSLApps_icopath/$Icon.ico"

Execlnk=$Exec
if [ "1$2" != "1" ];then
    Execlnk=$2
fi
cd /mnt/c
folder="/mnt/c/ProgramData/Microsoft/Windows/Start Menu/Programs/WSLApps"
if [ ! -d "$folder" ]; then
    /mnt/c/WINDOWS/System32/cmd.exe /C MKDIR "C:\\ProgramData\\Microsoft\\Windows\\Start Menu\\Programs\\WSLApps" 2>&1 >/dev/null
fi

/mnt/c/WINDOWS/System32/cmd.exe /C c:\\ISwitch\\mklnk.exe -n "C:\\ProgramData\\Microsoft\\Windows\\Start Menu\\Programs\\WSLApps\\$Execlnk.lnk" -r "C:\\cygwin64\\bin\\run.exe" -w "C:\\Program Files\\wslapps" -c "--quote C:\\Windows\\System32\\wsl.exe -u nufeng -d Ubuntu bash -l -c '. /usr/bin/setguienv;$3 $Exec'"  -i "c:\\ISwitch\\icons\\$Icon.ico"  2>&1 >/dev/null
cd /opt/WSL/WSL_GNOME
cd ~
