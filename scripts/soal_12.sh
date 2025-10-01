#!/bin/bash

#<---Melkor--->
apt-get update
apt-get install -y netcat-openbsd
nc -l 80 >/dev/null 2>&1 &
nc -l 21 >/dev/null 2>&1 &


#<---Eru--->
apt-get update
apt-get install -y netcat-openbsd
nc -zv -w2 192.236.1.2 21 80 666 2>&1