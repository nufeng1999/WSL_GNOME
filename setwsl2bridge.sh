#!/bin/sh
################################################
# 设置 WSL2 网络为桥接模式 (Default use host WLAN)
# Change WSL to bridge mode (Default use host WLAN)
################################################
#export PATH=$PATH:/mnt/c/Windows/System32
#export PATH=$PATH:/mnt/c/WINDOWS/System32/WindowsPowerShell/v1.0/
#让WSL改变为网桥模式
#Change WSL to bridge mode (Default use host WLAN)
/mnt/c/WINDOWS/System32/WindowsPowerShell/v1.0/powershell.exe -command "Set-VMSwitch WSL -NetAdapterName WLAN" >  /dev/null 2>&1 
#改变WSL默认IP地址 192.168.0.50
#Change WSL default IP address 192.168.0.50
/usr/bin/ip a flush dev eth0
/usr/bin/ip addr add 192.168.0.50/24 broadcast 192.168.0.255 dev eth0
#添加默认网关
#Add default gateway
/usr/bin/ip r add default via 192.168.0.2
