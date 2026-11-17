PANDUAN INSTALASI PASARKITA DI INFINITYFREE
===========================================

1. BUAT DATABASE
- Login ke InfinityFree Client Area dan buka Control Panel.
- Buka MySQL Databases, buat database, lalu catat MySQL Hostname,
  Database Name lengkap, Username, dan Password.

2. UPLOAD FILE
- Buka File Manager atau FTP, masuk ke folder htdocs.
- Upload ZIP ini dan ekstrak.
- Pastikan index.php langsung berada di htdocs.
  Jika ingin di subfolder htdocs/PasarKita, ekstrak seluruh isi paket ke sana.

3. ATUR KONEKSI DATABASE
- Edit config.php.
- Ganti nilai DB_HOST, DB_NAME, DB_USER, DB_PASS dengan data dari
  MySQL Databases di panel InfinityFree.
- Host database bukan selalu localhost. Jangan mengubah bagian kode lain.

4. IMPORT DATABASE
- Dari menu MySQL Databases, buka phpMyAdmin untuk database yang dibuat.
- Klik nama database di panel kiri sampai terpilih.
- Buka tab Import, pilih database.sql, lalu klik Go/Import.
- SQL paket ini tidak membuat database atau menjalankan USE; database
  harus dibuat dan dipilih terlebih dahulu di phpMyAdmin.

5. BUAT ADMIN
- Buka https://DOMAINANDA/setup_admin.php
  (atau https://DOMAINANDA/PasarKita/setup_admin.php jika memakai subfolder).
- Akun awal: admin@pasarkita.test
- Password awal: admin123
- Setelah akun berhasil dibuat, HAPUS setup_admin.php dari hosting.
- Login melalui menu Admin.

TROUBLESHOOTING
- Koneksi database gagal: cek kembali empat nilai di config.php; pastikan
  database sudah dibuat dan hostname benar.
- Table doesn't exist: database.sql belum diimpor ke database yang benar.
- HTTP 500/halaman putih: periksa apakah file ter-upload lengkap dan versi
  PHP yang dipilih di panel hosting.
- Pastikan index.php berada di direktori website yang sedang dibuka.

CATATAN
Paket memakai PHP PDO MySQL. Pastikan PDO MySQL aktif pada hosting.
Ganti password admin awal. Belum tersedia payment gateway, ongkir otomatis,
atau upload gambar lokal; gambar produk masih menggunakan URL gambar.
