#!/bin/bash

# <----Eru----->
apt update && apt install -y iptables
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 192.236.0.0/16
cat /etc/resolv.conf

# <----Clients---->
echo "nameserver 192.168.122.1" > /etc/resolv.conf
#Coba ping ke internet
ping google.com -c 5