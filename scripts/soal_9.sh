#!/bin/bash

#<----Eru---->
apt update
apt install wget -y
apt install unzip -y
wget --no-check-certificate "https://drive.usercontent.google.com/u/0/uc?id=11ua2KgBu3MnHEIjhBnzqqv2RMEiJsILY&export=download" -O 9.zip && unzip 9.zip
cp kitab_penciptaan.txt /home/ainur
chmod 555 /home/ainur

#<----Manwe---->
# Melakukan koneksi ftp terlebih dahulu lalu:
get kitab_penciptaan.txt
put kitab_penciptaan.txt
delete kitab_penciptaan.txt

#Analisis di wireshark