#!/bin/bash

#<----Eru---->
apt update 
apt install wget -y
apt install unzip -y
wget --no-check-certificate "https://drive.usercontent.google.com/u/0/uc?id=11ra_yTV_adsPIXeIPMSt0vrxCBZu0r33&export=download" -O 8.zip
unzip 8.zip
#masuk ke ftp
ftp 192.236.2.1 21
put cuaca.txt
put mendung.jpg
ls