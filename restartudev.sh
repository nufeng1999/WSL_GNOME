#! /bin/bash
service udev restart
udevadm control --reload-rules
udevadm trigger
