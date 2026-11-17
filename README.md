# PasarKita Marketplace

Marketplace PHP + MySQL: katalog, pencarian, kategori, detail produk, keranjang,
checkout, pengurangan stok, login admin, CRUD produk, dan pengelolaan pesanan.

## Hosting InfinityFree
Ikuti `README-INFINITYFREE.txt`. Buat database melalui panel hosting, isi
kredensialnya di `config.php`, pilih database di phpMyAdmin lalu import
`database.sql`. Upload isi paket ke `htdocs`, jalankan `setup_admin.php` satu
kali, kemudian hapus file tersebut.

## Lokal XAMPP
Buat database `pasarkita` melalui phpMyAdmin, pilih database tersebut lalu
import `database.sql`. Isi `config.php` dengan host `localhost`, database
`pasarkita`, user `root`, dan password kosong. Letakkan folder di
`C:\xampp\htdocs\PasarKita`, lalu buka `/PasarKita/setup_admin.php`.

Akun admin awal: `admin@pasarkita.test` / `admin123`.

Catatan: status pesanan Dibatalkan tidak mengembalikan stok otomatis. Belum
termasuk payment gateway, ongkir otomatis, dan upload gambar lokal. Gunakan
HTTPS dan ubah password awal sebelum website dipublikasikan.
