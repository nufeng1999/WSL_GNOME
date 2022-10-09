#! /bin/bash
#export WAYLAND_DISPLAY=wayland-0
#export DISPLAY=:0

SYSTEMD_PID=$(ps -ef | grep '/lib/systemd/systemd --unit=multi-user.target$' | grep -v unshare | awk '{print $2}')
if [ -z "$SYSTEMD_PID" ]; then
   #sudo /usr/bin/daemonize env -i /usr/bin/unshare --fork --pid --mount-proc /lib/systemd/systemd --unit=multi-user.target
   sudo env -i /usr/bin/unshare --fork --mount-proc --pid --propagation unchanged -- sh -c "exec /lib/systemd/systemd --unit=multi-user.target" &
   sleep 3
   SYSTEMD_PID=$(ps -ef | grep '/lib/systemd/systemd --unit=multi-user.target$' | grep -v unshare | awk '{print $2}')
fi
if [ -n "$SYSTEMD_PID" ] && [ "$SYSTEMD_PID" != "1" ]; then
    exec sudo /usr/bin/nsenter -t $SYSTEMD_PID -m -p su - $LOGNAME
    sleep 2
fi
