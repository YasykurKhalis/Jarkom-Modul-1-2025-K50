#!/bin/bash

# <----Eru----->
echo "apt update && apt install -y iptables" > /root/.bashrc
# Untuk Iptables kebetulan kami letakkan di network config GNS3 dengan perintah:
# up iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s 192.236.0.0/16

# <----Clients---->
echo 'echo "nameserver 192.168.122.1" > /etc/resolv.conf' > /root/.bashrc
