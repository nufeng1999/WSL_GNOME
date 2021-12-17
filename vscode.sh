#! /bin/bash
dbus-launch /usr/bin/code --user-data-dir  --no-sandbox $1 >/dev/null 2>&1 &
