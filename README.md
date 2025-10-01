# Jarkom-Modul-1-2025-K50
| Nama   | NRP  |
|--------|------|
| Rayka Dharma Pranandita | 5027241039 |
| Yasykur Khalis J M Y | 5027241112 |

## Soal 1
Buat Topologi

![1](/assets/1.PNG)

## Soal 2
Bikin Eru bisa connect internet. Tambahkan NAT1

![2](/assets/2.PNG)

Konfigurasi network

![2-1](/assets/2-1.png)

Coba ping google

![2-2](/assets/2-2.png)

## Soal 3
Pastikan client terhubung satu sama lain. Konfigurasi di Eru dan setiap client.

![3](/assets/3.png)

![3-1](/assets/3-1.png)

![3-2](/assets/3-2.png)

![3-3](/assets/3-3.png)

![3-4](/assets/3-4.png)

## Soal 4
Pastikan agar setiap Client dapat tersambung ke internet

![4-2](/assets/4-2.png)

Tambahkan: iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE -s [Prefix IP].0.0/16 pada router Eru (kami menaruhnya di network config)

![4-3](/assets/4-3.png)

Pasang di masing masing client dengan command (echo nameserver 192.168.122.1 > /etc/resolv.conf), maka nanti tiap client bisa connect ke internet:

![4-4](/assets/4-4.png)

![4-5](/assets/4-5.png)

![4](/assets/4.PNG)

![4-1](/assets/4-1.PNG)

## Soal 5
Pastikan config permanen

Di router: `nano /root/.bashrc` terus isi `apt update && apt-get update && apt-get install iptables -y`

Di client: `nano /root/.bashrc` terus isi `echo nameserver 192.168.122.1 > /etc/resolv.conf`

![5](/assets/5.png)

## Soal 6
Buka GNS3 Desktop dan klik kanan kabel yang menghubungkan Eru dengan Switch1 (yang terhubung ke Melkor dan Manwe) lalu klik “Start Capture” maka otomatis akan membuka Wireshark dengan packet capture langsung antara Eru dan Switch1.

![6](/assets/6.PNG)

Masuk ke client Malwe lalu jalankan command:
```sh
apt-get update

apt-get install wget

apt-get install unzip

wget --no-check-certificate "https://drive.usercontent.google.com/u/0/uc?id=1bE3kF1Nclw0VyKq4bL2VtOOt53IC7lG5&export=download" -O 6.zip

unzip 6.zip

chmod +x traffic.sh

./traffic.sh
```
Untuk menjalankan file traffic.sh lalu perhatikan Wireshark akan men-capture beberapa packet. Untuk memfilter packet yang berasal dari Manwe (ip: 192.236.1.3), ketik di display filter: `ip.addr == 192.236.1.3`

![6](/assets/6.PNG)

## Soal 7
Di Eru:
Install vsftpd:
```sh
apt-get update
apt-get install -y vsftpd
```

Lalu edit config:
```sh
nano /etc/vsftpd.conf
```

Config vsftpd.conf:
```
local_enable=YES
write_enable=YES
chroot_local_user=YES
tambahkan:
allow _writeable_chroot=YES
userlist_enable=YES
userlist_deny=YES
```

Buat user ainur dengan password `nomelkor`:
```sh
adduser ainur
passwd ainur
```

Siapkan direktori khusus FTP:
```sh
mkdir -p /home/ainur
chown ainur:ainur /home/ainu
chmod 755 /home/ainur
```

Buat user melkor:
```sh
adduser melkor
```

Tambahkan ke daftar blokir:
```sh
echo “melkor” >> /etc/vsftpd.user_list
```

Restart FTP:
```sh
service vsftpd restart
```

Uji coba:<\br>
Di Eru, tes apakah FTP Server berjalan:
```sh
ps aux | grep vsftpd
ss -tulnp | grep 21
```
Jika tidak ada maka start/restart FTP

![7](/assets/7.PNG)

Di Manwe:
```
apt-get update
apt-get install -y ftp
ftp 192.236.1.1 21
username: ainur password: nomelkor
get test.txt
put coba2.txt
ls
```
file `coba2.txt` harus berada di lokal Malwe terlebih dahulu.

![7-1](/assets/7-1.PNG)

Di Melkor:
```sh
apt update
apt install -y ftp
ftp 192.236.1.1 21
username: melkor
```
Maka akan me-return `530 Permission Denied`

![7-2](/assets/7-2.PNG)

## Soal 8
Masuk ke client Ulmo dan jalankan command:
```sh
apt-get update
apt-get install wget
apt-get install unzip
wget --no-check-certificate "https://drive.usercontent.google.com/u/0/uc?id=11ra_yTV_adsPIXeIPMSt0vrxCBZu0r33&export=download" -O 8.zip
unzip 8.zip
```

Lalu masuk ke ftp dengan command: `ftp 192.236.2.1 21` dan transfer file dari lokal ke FTP:
```sh
put cuaca.txt
put mendung.jpg
ls
```

![8](/assets/8.PNG)

Capture packet di Wireshark dengan filter `tfp && ip addr == 192.236.2.3 && ip.addr == 192.236.2.1`

![8-1](/assets/8-1.PNG)

## Soal 9
Download zip file dan unzip di Eru lalu copy file txt ke FTP:
```sh
cp kitab_penciptaan.txt /home/ainur
```

Ubah perm untuk ainur:
```sh
chmod 555 /home/ainur
```
Note: untuk command ini user ainur hanya bisa read-only tidak hanya untuk kitab_penciptaan.txt tapi untuk semua file juga

Coba request di Manwe:

![9](/assets/9-1.PNG)

Di Wireshark, gunakan display filter: `ftp.request.command && ip.addr == 192.236.1.3` untuk memonitor FTP request dari Manwe.

![9-1](/assets/9-1.PNG)

## Soal 10

## Soal 11

## Soal 12

## Soal 13

## Soal 14

## Soal 15

## Soal 16

## Soal 17

## Soal 18

## Soal 19

## Soal 20
