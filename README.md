# Ecoist-flutter
PBP Gasal 2022 final project 

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
    
    Login dan logout berisi form untuk mengautentikasi dan membedakan antara user dan admin. Menggunakan modal untuk regist , kemudian menggunakan AJAX  POST & GET. 

3. Home Page - Roy
    
    Merupakan page yang akan ditampilkan saat awal orang memasuki website. Melalui page ini orang dapat di-redirect menuju page lainnya sesuai kebutuhan. Dalam page ini berisi deskripsi website, perkenalan tim pembuat web, serta form FAQ (menggunakan AJAX POST) jika pengunjung ingin memberikan masukan. Dalam laman ini, akan ditampilkan jumlah kampanye yang telah dibuat, bagian ini akan menggunakan AJAX GET.

4. Create Campaign - Hatta

    Sebuah modal yang berisi form untuk mendaftarkan campaign. Di sini akan dilakukan implementasi AJAX GET

5. Campaign list - Hatta
    
    Berisi campaign-campaign yang dibuat oleh user. Di sini akan dilakukan implementasi AJAX POST dan AJAX GET

6. Join Campaign - Adish
    
    Fitur ini digunakan untuk user yang ingin mengikuti kampanye. User dapat mengisi form yang terdaftar untuk join campaign menanam/membersihkan hutan. Ketika user submit, akan dilakukan AJAX post berupa kampanye berhasil diikuti dan detail kampanye.

7. Donate - Maza 

    Ini adalah fitur donasi untuk memfasilitasi user yang sudah login untuk berdonasi. Terdapat form untuk memasukkan input nominal donasi, jumlah pohon yang ingin didonasikan, dan catatan/pesan untuk kami serta tombol submit untuk menginput donasi. Ketika user ingin men-submit donasi, maka tombol submit tersebut akan menggunakan AJAX POST untuk menginput data yang dimasukkan user ke dalam database. Jika user belum login, maka akan di redirect ke halaman login terlebih dahulu.

8. Admin Features - Bryan

    Merupakan fitur / web yang khusus bisa diakses oleh admin. Fitur yang khusus ini dapat digunakan untuk melihat data tentang user. Misalnya, melihat dashboard pageview dan click, total donasi yang ada, dan total campaign yang telah diikuti.



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
