#!/bin/bash

# <----Melkor----->
apt install openbsd-inetd telnetd -y
nano /etc/inetd.conf # uncomment bagian telnet
systemctl restart inetd # gunakan service inetd restart jika windows (wsl)
adduser k-50jos #lanjutin isi password, disini pakai josjis

# <----Eru---->
telnet 192.236.1.2
# login dengan user k-50jos dan password josjis

# cek wireshark dan bisa dilihat kalau telnet bisa cek sesi login secara plaintext