#! /bin/bash
#export WAYLAND_DISPLAY=wayland-0
#export DISPLAY=:0
/usr/bin/cygXS -c "$CYGWINDIR" -i "$ISWITCHDIR" -n9 > /dev/null 2>&1 &
/usr/bin/cygXS -c "$CYGWINDIR" -i "$ISWITCHDIR" -n1 > /dev/null 2>&1 &
SYSTEMD_PID=$(ps -ef | grep '/lib/systemd/systemd --system-unit=basic.target' | grep -v unshare|grep -v grep | awk '{print $2}')
if [ -z "$SYSTEMD_PID" ]; then
   sudo /usr/bin/daemonize /usr/bin/unshare --fork --pid --mount-proc /lib/systemd/systemd --system-unit=basic.target
   sleep 3
   SYSTEMD_PID=$(ps -ef | grep '/lib/systemd/systemd --system-unit=basic.target' | grep -v unshare|grep -v grep | awk '{print $2}')
fi
if [ -n "$SYSTEMD_PID" ] && [ "$SYSTEMD_PID" != "1" ]; then
    exec sudo /usr/bin/nsenter -t $SYSTEMD_PID -m -p su - $LOGNAME
    sleep 3
fi
