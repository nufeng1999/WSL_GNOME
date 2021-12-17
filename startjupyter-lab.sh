#!/bin/bash
cd ~/Jupyter
PROC_NAME=jupyter-lab
ProcNumber=`ps -ef |grep -w $PROC_NAME|grep -v grep|wc -l`
#echo $ProcNumber
if [ $ProcNumber -le 0 ];then
	echo "--->run jupyter-lab<---"
	/usr/local/bin/jupyter-lab  --ip=0.0.0.0 --allow-root --autoreload > /dev/null 2>&1 &
fi
export localhost_ip=`ifconfig -a|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d addr:`
echo $localhost_ip
/mnt/c/WINDOWS/System32/cmd.exe /c "netsh interface portproxy add v4tov4 listenport=8888 listenaddress=0.0.0.0 connectport=8888 connectaddress=$localhost_ip" > /dev/null 2>&1 &
