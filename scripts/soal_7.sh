#!/bin/bash

#<--Eru--->
apt-get update
apt-get install -y vsftpd

#config vsftpd (manual ye)
nano /etc/vsftpd.conf
local_enable=YES
write_enable=YES
chroot_local_user=YES
allow_writeable_chroot=YES
userlist_enable=YES
usrerlist_deny=YES

#siapkan user
adduser ainur
passwd ainur # (pass: nomelkor)

# siapkan direktori khusus ftp:
mkdir -p /home/ainur
chown ainur:ainur /home/ainur
chmod 755 /home/ainu

# buat user melkor
adduser melkor
passwd melkor # (pass: melkor)

# tambahkan ke daftar blokir
echo “melkor” >> /etc/vsftpd.user_list

# restart ftp
service vsftpd restart

#tes apakah ftp berjalan (jika tidak ada maka start/restart ftp)
ps aux | grep vsftpd
ss -tulnp | grep 21

#<--Manwe--->
apt-get update
apt-get install -y ftp
ftp 192.236.1.1 21
# username: ainur password: nomelkor
get test.txt
put coba2.txt (coba2.txt harus berada di lokal Malwe terlebih dulu)
ls

#<---Melkor--->
apt update
apt install -y ftp
ftp 192.236.1.1 21
# username: melkor password: melkor

