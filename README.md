# Ecoist-App
PBP Gasal 2022 final project 

[![Build status](https://build.appcenter.ms/v0.1/apps/0a092e06-288f-4943-a0fb-478280ca4c72/branches/main/badge)](https://appcenter.ms)
[![Develop](https://github.com/bryan273/ecoist_flutter/actions/workflows/develop.yml/badge.svg)](https://github.com/bryan273/ecoist_flutter/actions/workflows/develop.yml)
[![Pre-Release](https://github.com/bryan273/ecoist_flutter/actions/workflows/pre-release.yml/badge.svg)](https://github.com/bryan273/ecoist_flutter/actions/workflows/pre-release.yml)
[![Release](https://github.com/bryan273/ecoist_flutter/actions/workflows/release.yml/badge.svg)](https://github.com/bryan273/ecoist_flutter/actions/workflows/release.yml)

(Note: apk kami deploy tidak dari repository ini, melainkan dari repository fork https://github.com/bryan273/Ecoist-App )

Link download apk: https://install.appcenter.ms/orgs/ecoist/apps/ecoist/distribution_groups/public

(Note: pastikan download versi terbaru)

# Ecoist

## Anggota

* Azmi Rahmadisha
* Bryan Tjandra
* Mazaya Nur Labiba
* Roy Maruli Tua Nababan
* Son Sulung Suryahatta Asnan

## Main Idea

Donasi dan kampanye penanaman pohon

## Deskripsi / Manfaat

Situs Ecoist adalah situs yang bertujuan untuk menyebarkan kesadaran kepada masyarakat tentang pentingnya penghijauan hutan di Indonesia. Situs Ecoist memberikan ruang bagi masyarakat untuk berpartisipasi dalam kegiatan donasi pohon dan menyebarluaskan campaign-campaign terkait penghijauan hutan yang tersedia. Melalui aplikasi ini, masyarakat dapat sadar dan turut prihatin tentang isu penghijauan hutan di Indonesia.

## Pages
1. Register

<img src="https://user-images.githubusercontent.com/88226713/211130673-41347e2e-606b-45f4-bd4d-8ecc2fa60741.jpg" width="200" height="400"/>

2. Log In & Log Out

<img src="https://user-images.githubusercontent.com/88226713/211130679-96e05d45-4c2c-4baa-9754-0d76aaea9654.jpg" width="200" height="400"/>

3. Home Page

<img src="https://user-images.githubusercontent.com/88226713/211130690-6c848914-8dc7-4809-99b5-20c110861a98.jpg" width="200" height="420"/>

4. Create Campaign

<img src="https://user-images.githubusercontent.com/88226713/211130702-c1a21483-503c-4abb-a7a1-6836a0b52bd5.jpg" width="200" height="418"/>

5. Campaign List

<img src="https://user-images.githubusercontent.com/88226713/211130707-c703edeb-6e21-432c-919b-97cdd01d3cd0.jpg" width="200" height="356"/>

6. Join Campaign

<img src="https://user-images.githubusercontent.com/88226713/211130716-24cb1bc5-dee6-4cdb-8e7b-4ea06a02d900.jpg" width="200" height="359"/>


7. Donate 
<img src="https://user-images.githubusercontent.com/88226713/210934143-5dd4f3f7-b90c-4cf1-9bd9-0244bf638157.png" width="200" height="100"/>
![donate](https://user-images.githubusercontent.com/88226713/211130764-fbd8322c-5965-469b-9332-910e9a7117fc.jpg)

8. Donate List
<img src="https://user-images.githubusercontent.com/88226713/210934143-5dd4f3f7-b90c-4cf1-9bd9-0244bf638157.png" width="400" height="200"/>
![donate list](https://user-images.githubusercontent.com/88226713/211130775-8379b660-bc14-4940-8703-c90f0ccd78ae.jpg)

9. Participant List
<img src="https://user-images.githubusercontent.com/88226713/210934143-5dd4f3f7-b90c-4cf1-9bd9-0244bf638157.png" width="400" height="200"/>
![daftar partisipasi](https://user-images.githubusercontent.com/88226713/211130728-01a7c67d-a0ad-48ea-a45d-df74cd6167b1.jpg)

10. Admin Features
<img src="https://user-images.githubusercontent.com/88226713/210934143-5dd4f3f7-b90c-4cf1-9bd9-0244bf638157.png" width="400" height="200"/>
![top 5 user](https://user-images.githubusercontent.com/88226713/211130788-5bc70040-e3dc-4022-8049-4e4f66ec78f7.jpg)
![add note](https://user-images.githubusercontent.com/88226713/211130796-c7526f6f-f4f9-4fcd-bfb8-1ac5008af390.jpg)
![admin 1](https://user-images.githubusercontent.com/88226713/211130800-ebb3e19c-d632-4159-ad67-2d3f70527f84.jpg)
![admin 2](https://user-images.githubusercontent.com/88226713/211130802-9669c19b-2ec2-4d07-82b4-64b6bb103abf.jpg)
![admin 3](https://user-images.githubusercontent.com/88226713/211130804-95a5e69b-81a8-4e2e-9ad8-d9c252e5586a.jpg)

## Deskripsi Modul
1. Register - Bryan
    
    Register berisi form untuk membuat akun agar user dapat melakukan kegiatan dalam website. 

2. Log In & Log Out - Bryan 
    
    Login dan logout berisi form untuk mengautentikasi dan membedakan antara user dan admin. Menggunakan method post. 

3. Home Page - Roy
    
    Merupakan page yang akan ditampilkan saat awal orang memasuki website. Melalui page ini orang dapat di-redirect menuju page lainnya sesuai kebutuhan. Dalam page ini berisi judul aplikasi, jumlah campaign yang telah dibuat (menggunakan method get), serta form FAQ (menggunakan method post) yang juga menampilkan pertanyaan-pertanyaan yang terakhir disumbit (menggunakan method get).

4. Create Campaign - Hatta

    Sebuah page yang berisi form untuk mendaftarkan campaign. Di sini akan dilakukan implementasi method post.

5. Campaign List - Hatta
    
    Berisi campaign-campaign yang dibuat oleh user. Di sini akan dilakukan implementasi method get. 

6. Join Campaign - Adish
    
    Fitur ini digunakan untuk user yang ingin mengikuti kampanye. User dapat mengisi form yang terdaftar untuk join campaign menanam/membersihkan hutan. Akan mengimplementasikan method post.

7. Donate - Maza 

   Page ini akan memfasilitasi user yang sudah login untuk berdonasi. Terdapat form untuk memasukkan input nominal donasi, jumlah pohon yang ingin didonasikan, dan catatan/pesan untuk kami serta tombol submit untuk menginput donasi. Akan mengimplementasikan method post untuk mengirim data yang dimasukkan user ke dalam database. Setelah user melakukan post, akan muncul modal yang berisi informasi donasi dan tombol ke halaman list donasi.

8. Donate list - Maza 

    Page ini akan menampilkan donasi yang telah dilakukan. Akan mengimplemntasikan method get.

9. Participant list - Adish 

    Page ini akan menampilkan participant yang telah dilakukan. Akan mengimplemntasikan method get.

10. Admin Features - Bryan

    Merupakan fitur / web yang khusus bisa diakses oleh admin. Fitur yang khusus ini dapat digunakan untuk melihat data tentang user. Misalnya, melihat dashboard top user, distribusi donasi dan kampanye, total donasi yang ada, dan total campaign yang telah diikuti. Fitur ini diimplementasikan dengan method get untuk mendapatkan data dari database serta method post untuk menambahkan note.



## Role Peran Pengguna
1. User

    User memiliki otoritas untuk mengakses welcome page, membuat dan berpartisipasi dalam campaign, serta melakukan donasi. 

2. Admin

    Admin atau administrator berperan sebagai pemegang kendali website dan memiliki akses penuh untuk melihat user database melalui dashboard admin. 
    
    
## Alur pengintegrasian dengan web service untuk terhubung dengan aplikasi web yang sudah dibuat saat Proyek Tengah Semester
1. Melengkapi end point pada web untuk tiap modul (baik untuk mengambil dan mengirim data).
2. Menambahkan middleware di django agar API dapat diakses dari luar website.
3. Membuat fungsi async untuk setiap proses yang berkaitan dengan mengambil, mengirim, dan mengubah data.
4. Untuk mengambil data akan digunakan HTTP GET dari end point data di web yang hasil pemanggilannya akan digunakan untuk ditampilkan pada widget yang digunakan.
5. Untuk mengirim data akan digunakan HTTP POST yang menuju ke end point untuk menyimpan data yang ada di database Django.
