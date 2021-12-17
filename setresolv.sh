#!/bin/sh
echo "nameserver 192.168.0.2">/etc/resolv.conf
echo "nameserver 61.128.128.68">>/etc/resolv.conf
echo "nameserver 61.128.192.68">>/etc/resolv.conf
echo "nameserver 114.114.114.114">> /etc/resolv.conf
echo "nameserver 8.8.8.8">>/etc/resolv.conf
chmod 666 /etc/resolv.conf
