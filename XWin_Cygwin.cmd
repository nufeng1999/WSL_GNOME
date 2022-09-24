
echo off
cd C:\cygwin64

set FontPath=/usr/share/fonts/wqy-bitmap
set FontPath=%FontPath%,/usr/share/fonts/wqy-microhei
set FontPath=%FontPath%,/usr/share/fonts/wqy-unibit
set FontPath=%FontPath%,/usr/share/fonts/wqy-zenhei
set FontPath=%FontPath%,/usr/share/fonts/Chinese_misc
set FontPath=%FontPath%,/usr/share/fonts/zh_CN
set FontPath=%FontPath%,/usr/share/fonts/zh_TW
set FontPath=%FontPath%,/usr/share/fonts/MSFonts
set FontPath=%FontPath%,/usr/share/fonts/microsoft
set FontPath=%FontPath%,/usr/share/fonts/Misc
set FontPath=%FontPath%,/usr/share/fonts/misc

set FontPath=%FontPath%,/usr/share/fonts/75dpi
set FontPath=%FontPath%,/usr/share/fonts/100dpi

set FontPath=%FontPath%,/usr/share/fonts/HP
set FontPath=%FontPath%,/usr/share/fonts/IBM
set FontPath=%FontPath%,/usr/share/fonts/Korean
set FontPath=%FontPath%,/usr/share/fonts/Mathematica
set FontPath=%FontPath%,/usr/share/fonts/Mentor

set FontPath=%FontPath%,/usr/share/fonts/SGI
set FontPath=%FontPath%,/usr/share/fonts/Speedo
set FontPath=%FontPath%,/usr/share/fonts/Type1
set FontPath=%FontPath%,/usr/share/fonts/URW

set FontPath=%FontPath%,/usr/share/fonts/ISO8859-2
set FontPath=%FontPath%,/usr/share/fonts/ISO8859-3
set FontPath=%FontPath%,/usr/share/fonts/ISO8859-4
set FontPath=%FontPath%,/usr/share/fonts/ISO8859-5
set FontPath=%FontPath%,/usr/share/fonts/ISO8859-6
set FontPath=%FontPath%,/usr/share/fonts/ISO8859-7
set FontPath=%FontPath%,/usr/share/fonts/ISO8859-8
set FontPath=%FontPath%,/usr/share/fonts/ISO8859-9
set FontPath=%FontPath%,/usr/share/fonts/ISO8859-10
set FontPath=%FontPath%,/usr/share/fonts/ISO8859-13
set FontPath=%FontPath%,/usr/share/fonts/ISO8859-14
set FontPath=%FontPath%,/usr/share/fonts/ISO8859-15

set FontPath=%FontPath%,/usr/share/fonts/75dpi
set FontPath=%FontPath%,tcp/192.168.0.8:7100


rem -fp %FontPath%
rem kill XWin.exe

if '%1'=='0' (
  rem TASKKILL /F /IM  ISwitch.exe 
  rem TASKKILL /F /IM XWin.exe 
  rem multiwindow mode
  C:\cygwin64\bin\run.exe --quote /usr/bin/bash.exe -l -c  "killall -9 XWin;killall ISwitch"
  start C:\cygwin64\bin\run.exe --quote /usr/bin/bash.exe -l -c "killall ISwitch.exe;cd /cygdrive/c/ISwitch/;./ISwitch.exe -c & cd;export LIBGL_ALWAYS_SOFTWARE=1;XWin.exe -ac -terminate -lesspointer -multiwindow -compositewm -compositealpha -engine 1 -silent-dup-error -listen tcp -nolisten inet6 -hostintitle -clipboard +iglx -nowgl -noreset   :0;killall ISwitch.exe"

) else (
  rem TASKKILL /F /IM  ISwitch.exe 
  rem TASKKILL /F /IM XWin.exe 

  rem rootless mode
  C:\cygwin64\bin\run.exe --quote /usr/bin/bash.exe -l -c "killall -9 XWin;killall ISwitch"
  start C:\cygwin64\bin\run.exe --quote /usr/bin/bash.exe -l -c "killall ISwitch.exe;cd /cygdrive/c/ISwitch/;./ISwitch.exe -c & cd;export LIBGL_ALWAYS_SOFTWARE=1;XWin.exe -ac -terminate -lesspointer -rootless -notrayicon -compositewm -compositealpha -engine 4 -silent-dup-error -listen tcp -nolisten inet6 -hostintitle -clipboard +iglx -nowgl -noreset  -dpms  :0;killall ISwitch.exe"

)

exit
