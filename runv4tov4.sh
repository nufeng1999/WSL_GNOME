#! /bin/bash
export localhost_ip=`ifconfig -a|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d addr:`
echo $localhost_ip
/mnt/c/WINDOWS/System32/cmd.exe /c "netsh interface portproxy add v4tov4 listenport=8888 listenaddress=0.0.0.0 connectport=8888 connectaddress=$localhost_ip" > /dev/null 2>&1 &
