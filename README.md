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


## Modul / Pages
1. Register - Bryan
    
    Register berisi form untuk membuat akun agar user dapat melakukan kegiatan dalam website. 

2. Log In & Log Out - Bryan 
    
    Login dan logout berisi form untuk mengautentikasi dan membedakan antara user dan admin. Menggunakan method post. 

3. Home Page - Roy
    
    Merupakan page yang akan ditampilkan saat awal orang memasuki website. Melalui page ini orang dapat di-redirect menuju page lainnya sesuai kebutuhan. Dalam page ini berisi judul aplikasi, jumlah campaign yang telah dibuat (menggunakan method get), serta form FAQ (menggunakan method post) yang juga menampilkan pertanyaan-pertanyaan yang terakhir disumbit (menggunakan method get).

4. Create Campaign - Hatta

    Sebuah page yang berisi form untuk mendaftarkan campaign. Di sini akan dilakukan implementasi method post.

5. Campaign list - Hatta
    
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
