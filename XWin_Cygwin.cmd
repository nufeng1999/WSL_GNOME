echo off
cd F:\Cygwin_MSys2\cygwin64

if '%1'=='0' (
  rem TASKKILL /F /IM  ISwitch.exe 
  rem TASKKILL /F /IM XWin.exe 
  rem multiwindow mode
  F:\Cygwin_MSys2\cygwin64\bin\run.exe --quote /usr/bin/bash.exe -l -c  "killall -9 XWin;killall ISwitch"
  start F:\Cygwin_MSys2\cygwin64\bin\run.exe --quote /usr/bin/bash.exe -l -c  "killall ISwitch;cd cd `cygpath -u "C:\ISwitch"`;./ISwitch.exe -c & cd;export LIBGL_ALWAYS_SOFTWARE=1;XWin.exe -ac -terminate -lesspointer -multiwindow -compositewm -compositealpha -engine 1 -silent-dup-error -listen tcp -nolisten inet6 -hostintitle -clipboard +iglx -wgl -noreset   :0;killall ISwitch"

) else (
  rem TASKKILL /F /IM  ISwitch.exe 
  rem TASKKILL /F /IM XWin.exe 

  rem rootless mode
  F:\Cygwin_MSys2\cygwin64\bin\run.exe --quote /usr/bin/bash.exe -l -c "killall -9 XWin;killall ISwitch"
  start F:\Cygwin_MSys2\cygwin64\bin\run.exe --quote /usr/bin/bash.exe -l -c "sleep 2;killall ISwitch;cd `cygpath -u "C:\ISwitch"`;./ISwitch.exe -c & cd;export LIBGL_ALWAYS_SOFTWARE=1;XWin.exe -ac -terminate -lesspointer -rootless -notrayicon -compositewm -compositealpha -engine 1 -silent-dup-error -listen tcp -nolisten inet6 -hostintitle -clipboard +iglx -wgl -noreset  -dpms  :0;killall ISwitch"

)

exit

