# Jarkom-Modul-1-2025-K50
| Nama   | NRP  |
|--------|------|
| Rayka Dharma Pranandita | 5027241039 |
| Yasykur Khalis J M Y | 5027241112 |   

# Prefix IP    
|Kelompok | Prefix IP |    
|---------|-----------|     
|K-50 | 192.236 |


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
![10](/assets/10.png)

Hasil menunjukkan kalau pengiriman 100 packet ping tidak begitu membebani router(Eru).

## Soal 11
Cek wireshark antara Eru dan Melkor untuk menguji kerentanan Telnet:
Setting config: `nano /etc/inetd.conf` (hapus # pada bagian service)
Nyalakan terlebih dahulu: `service openbsd-inetd start`

Pertama buat akun di Melkor terlebih dahulu:

![11](/assets/11.png)

Credential: k50-jos (username) josjis (password)

![11-1](/assets/11-1.png)

Tangkapan traffic telnet menunjukkan bahwa kredensial dapat dilihat secara plainsight: (menggunakan Wireshark TCP Stream agar mudah dibaca)

![11-2](/assets/11-2.png)

## Soal 12
Pastikan netcat ada untuk Eru dengan: `which nc`
Jika tidak ada maka install:
```sh
apt-get update
apt-get install -y netcat-openbsd
```

Lalu jalankan netcat untuk port 21 dan 80:
```sh
nc -l 21 >/dev/null 2>&1 &
nc -l 80 >/dev/null 2>&1 &
```

![12](/assets/12.PNG)

Lalu di Eru, jalankan: `nc -zv -w2 192.236.1.2 21 80 666 2>&1` untuk langsung mendapatkan ketiga port

![12](/assets/12-1.PNG)

## Soal 13
Install SSH Server di Eru:
```sh
apt-get update
apt-get install -y openssh-server
```

Pastikan sshd berjalan (kalau systemctl tidak ada, jalankan manual):
```sh
service ssh start
```
atau
```sh
/etc/init.d/ssh start
```

Buat user admin(password: admin1234):
```sh
adduser eruadmin
passwd eruadmin
```

Mulai capture packet di Wireshark seperti no.6 lalu lakukan koneksi sshd ke Eru:
```sh
ssh eruadmin@192.236.2.1
```

![13](/assets/13.PNG)   
Tangkapan Wireshark:
![13-1](/assets/13-1.PNG)    

Hasil capture wireshark menunjukkan bahwa data login yang tercatat di jaringan telah terenkripsi (berbeda dengan Telnet yang bisa dilihat username dan password secara plaintext). Hal ini karena SSH atau __Secure Shell__ merupakan protokol administrasi remote yang memperbolehkan pengguna untuk mengakses dan mengontrol server mereka dalam jaringan secara aman. Jadi dipastikan datanya terenkripsi berbeda dengan Telnet yang plain text
## Soal 14
```sh
nc 10.15.43.32 3401
```

Pertama kita coba cari ujung file dan lihat no packet terakhir, ternyata packet 500358

![14](/assets/14.png)

Setelah itu coba mencari http yang ada "login" dengan display filter:

![14-1](/assets/14-1.png)

Selanjutnya kita lakukan follow stream, yang menghasilkan stream di bawah:

![14-2](/assets/14-2.png)

Dari situ kita dapat info credential, alat yang digunakan sama stream berapa

![14-3](/assets/14-3.png)

## Soal 15

## Soal 16
Pertama coba cek file pcap dan follow stream:

![16](/assets/16.png)

Disana kita dapat banyak hal kayak credential dan beberapa .exe (yang sepertinya malware) ada 5 q,w,e,r,t. Selanjutnya diminta sha256sum untuk tiap tiap file exe malware. Hal ini bisa didapatkan dengan melakukan:

Display filter: `ftp-data`, mengambil protokol file transfer yang ada data:

![16-1](/assets/16-1.png)

Setelah itu klik packet yang mengandung nama program yang kita cari, contohnya ini `q.exe`, lalu lakukan follow stream dan pilih `show as raw`:

![16-2](/assets/16-2.png)

Klik tombol save as terus dinamai sesuai nama program (disini `q.exe`), setelah file exe jadi, masuk ke tools yang bisa memberikan sha256 suatu file, disini kami menggunakan sha256 file checksum online yang bisa kita copy untuk menjawab pertanyaan pertanyaan sha256 file.

![16-3](/assets/16-3.png)

Lakukan langkah langkah tersebut sesuai dengan program yang ditanyakan dan nanti soal akan bisa terselesaikan:

![16-4](/assets/16-4.png)

## Soal 17
Pertama kita coba cari file apa saja yang bisa diexport dengan mengecek satu satu File > Export Objects > untuk tiap protokol, dimana di HTTP ada file yang mencurigakan:

![17](/assets/17.png)

Selanjutnya tinggal download (save) atau export file tersebut dan check sha256 secara online:

![17-1](/assets/17-1.png)

![17-2](/assets/17-2.png)

## Soal 18
Pertama kita coba cari file apa saja yang bisa diexport dengan mengecek satu satu File > Export Objects > untuk tiap protokol, dimana di SMB ada file yang mencurigakan:

![18](/assets/18.png)

Dari situ kita dapat dua file yang suspicious, dari situ kita lanjutkan save dan check 256sum masing-masing file:

![18-1](/assets/18-1.png)

Hal ini lakukan untuk kedua file dan soal akan solve:

![18-2](/assets/18-2.png)

## Soal 19
Pertama tama kita coba tcp stream dan ternyata ada satu pesan email panjang yang mengandung semua pertanyaan:

![19](/assets/19.png)

![19-1](/assets/19-1.png)

## Soal 20
Pertama diberikan dua file, pcap dan txt. Dimana txt ini merupakan kunci untuk dekripsi protokol TLS yang telah tercapture, caranya adalah dengan memencet:
Edit > Preference > Protocols > TLS.

![20](/assets/20.png)

Setelah itu kita mulai cari apa yang ditanyakan soal, seperti:

![20-1](/assets/20-1.png)

Setelah dapat nama file, kita coba dapatkan file asli `invest_20.dll` dengan cara:
File > Export Objects > HTTP

![20-2](/assets/20-2.png)

Lalu dapatkan SHA256nya:

![20-3](/assets/20-3.png)

Soal dapat dikerjakan dan flag didapatkan:

![20-4](/assets/20-4.png)
