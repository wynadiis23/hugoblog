---
title: Membuat EC2 Instance
date: 2020-11-16T04:56:37+08:00
draft: false
tags:
    - aws
    - ec2
    - cloud
category: cloud
keywords:
    - elastic compute 
---
AWS EC2 atau Elastic Compute merupakan salah satu service dari AWS yang memberikan akses pengguna untuk membuat *virtual machine* pada *cloud*, pada service AWS ini disebut dengan *instance*. AWS memberikan banyak sekali opsi mulai dari yang gratis atau *free tier* hingga akses terhadap instance yang berbayar. AWS juga memberikan pilihan yang luas terkait jenis spek yang akan digunakan pada instance EC2.

## Prerequisite dan Tujuan
Oh iya tentu, pertama yang harus anda punya untuk akses ke AWS service ya ***AWS account***. Buat saja dengan mendaftarkan kartu kredit anda, kemudian akses service yang *free tier* sehingga anda tidak dikenakan charge karena *free tier*. 

Yang harus anda punya:
*   Akses internet
*   AWS Account baik itu AWS Educate atau AWS yang anda bikin pakai kartu kredit tadi.

Yang ingin kita capai di artikel ini adalah:
*   Bikin EC2 Instance dengan Linux Based (AWS AMI, Ubuntu server, atau CentOS) yang free tier ehe.
*   Bisa manage lewat remote SSH

## Login ke AWS
Sebagai pengguna AWS Educate, saya login lewat [sini](https://www.awseducate.com/signin/SiteLogin). Jika anda bukan pengguna service AWS Educate dan baru buat akun AWS, kemungkinan anda harus login lewat [sini](https://aws.amazon.com/console/).
Setelah anda login, anda akan masuk ke bagian ***management console***. Dari sini kita bisa mulai untuk menggunakan service-service yang disediakan oleh AWS.

{{< figure src="/post_images/aws_educatelogin.png" title="AWS Educate login page" >}}

atau

{{< figure src="/post_images/aws_managementconsolebayarlogin.png" title="AWS Management Console Login IAM atau Root Account" >}}

## AWS Management Console
AWS Management Console ini merupakan inti dari AWS Services. Dari sini kita bisa akses ke hampir semua service AWS. Kita bisa cari dengan memasukan kata kunci service pada kolom *find service* atau kita *expand* bagian ***All Service*** untuk melihat semua service yang ada.

Jika kita lihat pada pojok kanan atas, disana tertulis informasi dari akun kita, region yang sedang kita gunakan, dan bagian support. Jika kita ingin berpindah ke region lain, maka *expand* dropdown region diatas, kemudian ganti ke region yang kita inginkan. 

***Ingat*** setiap region mempunyai harga atau tarif yang berbeda untuk setiap service yang digunakan.

{{< figure src="/post_images/aws_mconsole.png" title="AWS Management Console" >}}

Dari sini kita bisa mulai capai tujuan kita pada artikel ini. Pada bagian *find service* kalian ketik `EC2` atau expand dan cari EC2, EC2 akan berada pada section ***Compute***.

{{< figure src="/post_images/aws_computesection.png" title="Compute Section" >}}

### EC2 Dashboard
Dashboard ini memberikan informasi terkait EC2 pada akun dan region AWS kita. Memperlihatkan jumlah instance yang berjalan, jumlah *key pair*, *load balancer, security group* dan lain-lain.
Karena tujuan kita kali ini hanya membuat EC2 instance, jadi langsung saja klik **Launch Instance**.

{{< figure src="/post_images/aws_ec2dashboard.png" title="AWS EC2 Dashboard" >}}

### Pilih OS
Pilih OS atau sistem operasi yang akan kita gunakan pada instance. Kita pilih **Ubuntu Server 20.04** ya. Penjelasan jenis os lain kali mungkin akan saya buat.
Oh iya, jangan lupa centang check box ***free tier*** yang ada disebelah kiri ya. Agar OS yang muncul yang gratis-gratis. Kalau sudah klik **Select**.

Lanjooot

{{< figure src="/post_images/aws_ec2chooseami.png" title="OS EC2 Instance" >}}

### Konfigurasi Tipe Instance
Konfigurasi instance tipe ini meliputi jumlah virtual CPU, ukuran memory, jenis instance storage, dan jaringan. Tipe instance ini juga sudah dikelompokan oleh AWS untuk tujuan-tujuan tertentu misalnya ketika keperluan memerlukan kebutuhan komputasi yang tinggi, maka jenis instance tipe yang digunakan pun sudah ada rekomendasi dari AWS. Mungkin akan dijelaskan di artikel terpisah saja ya.

Lanjooot

{{< figure src="/post_images/aws_ec2instancetype.png" title="Tipe Instance" >}}

### Konfigurasi Detail Instance
Konfigurasi detail instance ini meliputi berapa julmah instance yang akan dibuat, topologi network atau VPC yang digunakan, subnet dan lainnya. Hal menarik lainnya adalah kita bisa menginisialisasikan **User Data**.

{{< figure src="/post_images/aws_ec2coninstdet.png" title="Konfigurasi Instance Detail" >}}

User data ini merupakan script kode yang dapat disertakan pada proses pembuatan instance yang akan dijalankan ketika pertama kali instance dihidupkan atau ketika proses launch. Misalnya kita ingin membuat instance untuk web server, maka bisa kita inisialisasikan script untuk instalasi dan konfigurasi web server pada bagian user data ini, sehingga ketika instance sudah dijadi, akan langsung terinstall web server. Akan dibuat di artikel tersendiri saja mungkin.

Lanjooot

{{< figure src="/post_images/aws_ec2usrdata.png" title="User data instance" >}}

### Konfigurasi Storage
Ini meliputi ukuran dan jenis dari storage yang akan digunakan pada instance. SSD ataupun HDD pada *volume types*.

Lanjooot saja ke ***Tags***.

{{< figure src="/post_images/aws_ec2addstorage.png" title="Konfigurasi Storage EC2" >}}

### Tags
Tags memberikan kemudahan pada kita untuk menandai instance EC2 kita. Misalnya untuk kebutuhan proyek a kita bisa inisialisasikan tags proyek ke a, maka semuainstance yang menggunakan tags a akan dengan mudah kita temukan nantinya. 

Pada artikel ini isikan Tags `Name` dengan `ec2_belajar`.

Lanjooot bosku

{{< figure src="/post_images/aws_ec2tags.png" title="Tags" >}}

### Konfigurasi Security Group
Salah satu elemen terpenting dari servicenya AWS. ***Security Group*** berperan kayak ***firewall***, disini kita akan mendeklarasikan koneksi apa saja yang bisa masuk (*inbound*) dan keluar (*outbound*) dari instance EC2 kita. 
Karena kebutuhan pada artikel ini hanya untuk remote SSH, jadi isikan `Type` `SSH` aja pada kemudian source `custom` dari ip mana saja. Penjelasan mengenai security group mungkin akan perlu artikel tersendri ya.

Lanjoot mang.

{{< figure src="/post_images/aws_ec2confsecgr.png" title="Konfigurasi EC2 Security Group" >}}

### Review and Launch
Nah jika sudah sampai sini, instance yang tadi kita siapkan artinya sudah tinggal dilaunch aja. Klik **View Instances** lanjoooooot.

{{< figure src="/post_images/aws_ec2launchstatus.png" title="Launch Status" >}}
#### Key Pair
Bagian penting agar kita bisa remote SSH atau RDP ke instance yang kita bikin adalah ini, **Key Pair**. Key Pair ini fungsinya mirip password atau key exchange antara instance kita dengan remote device kita. Ini sangat penting, pastikan instance yang kita bikin sudah terikat dengan salah satu Key Pair ya.

Karena ini instance baru, jadi kita create Key Pair, kemudian jangan lupa download ya Key Pair-nya bentukannya **.pem**. Kemudian ***Launch INstance***.

{{< figure src="/post_images/aws_ec2keypair.png" title="EC2 instance Key Pair" >}}

## Remote SSH ke Instance
Hal yang perlu dilakukan sebelum kita remote SSH atau RDP ke instance yang kita buat tadi.
*   pastikan, pastikan kita sudah download key pair dari instance yang kita buat tadi, kalau belum atuh modyar.
*   SSH atau RDP client. Kita bisa gunakan Putty untuk windows, atau saya di Linux lewat terminal saja.
*   IP Publik dari instance kita. ini bisa kita dapat lewat instance detail seperti dibawah sini. atau di baris instance yang akan kita remote.
{{< figure src="/post_images/aws_ec2publicIP.png" title="EC2 IP Publik" >}}

Oke kalau sudah kita tinggal remote saja. berikut commandnya untuk di terminal Linux.

```bash
ssh -i <path dari file .pem> <username instance>@<ip publik instance>
```
*   username dari instance adalah `ubuntu`.

Kemudian ketika command berhasil dijalankan maka kita akan masuk ke terminal dari instance kita. Berikut contohnya.

{{< figure src="/post_images/aws_remotesshberhasil.png" title="AWS remote SSH" >}}

Jika sudah maka silahkan lakukan eksperimen pada instance yang telah kita bangun. Selanjutnya mungkin kita akan coba konfigurasi instance tersebut jadi Web Server kali ya. 

***Oh iya jangan lupa, kalau instancenya sudah tidak digunakan, dimatikan ya, agar tidak makan charge atau kredit. Ini yang terjadi di akun educate sih, saya belum coba di akun IAM atau Root.***

**Cara matiinnya klik kanan instance > instance state > stop**

Okay Dada.

### Jika error SSH
Jika error seperti ini terjadi

```bash
The authenticity of host '3.93.185.159 (3.93.185.159)' can't be established.
ECDSA key fingerprint is SHA256:vwJdjbAfXXTvU+crF/pk//XmT48WGoNFg+UXwWZX99g.
Are you sure you want to continue connecting (yes/no)? yes
Warning: Permanently added '3.93.185.159' (ECDSA) to the list of known hosts.
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
@         WARNING: UNPROTECTED PRIVATE KEY FILE!          @
@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
Permissions 0664 for 'ec2_belajar.pem' are too open.
It is required that your private key files are NOT accessible by others.
This private key will be ignored.
Load key "ec2_belajar.pem": bad permissions
ubuntu@3.93.185.159: Permission denied (publickey).
```

Maka bisa kalian coba untuk ubah permission untuk file **.pem**-nya.
```bash
sudo chmod 600 ec2_belajar.pem
```

