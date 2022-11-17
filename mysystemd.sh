#! /bin/bash
#export WAYLAND_DISPLAY=wayland-0
#export DISPLAY=:0

SYSTEMD_PID=$(ps -ef | grep '/lib/systemd/systemd --unit=basic.target' | grep -v unshare|grep -v grep | awk '{print $2}')
if [ -z "$SYSTEMD_PID" ]; then
   #sudo /usr/bin/daemonize env -i /usr/bin/unshare --fork --pid --mount-proc /lib/systemd/systemd --unit=multi-user.target  /lib/systemd/systemd --user
   sudo env -i /usr/bin/unshare --fork --mount-proc --pid --propagation unchanged -- sh -c "exec /lib/systemd/systemd --unit=basic.target" &
   sleep 3
   SYSTEMD_PID=$(ps -ef | grep '/lib/systemd/systemd --unit=basic.target' | grep -v unshare|grep -v grep | awk '{print $2}')
fi
if [ -n "$SYSTEMD_PID" ] && [ "$SYSTEMD_PID" != "1" ]; then
    sudo /usr/bin/nsenter -t $SYSTEMD_PID -m -p su - $LOGNAME
    sleep 2
fi
