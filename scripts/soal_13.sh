#!/bin/bash

#<---Eru--->
apt-get update
apt-get install -y openssh-server
systemctl start ssh # kalau wsl atau windows pake service start ssh
adduser eruadmin
passwd eruadmin # terus isi pass:admin1234

#<---Varda--->
ssh eruadmin@192.236.2.1 # yes aja kalau ditanya fingerprint etc.
# terus isi pass:admin1234