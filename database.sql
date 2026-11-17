-- Pilih database yang telah dibuat di panel InfinityFree sebelum mengimpor file ini.
-- CREATE DATABASE dan USE sengaja tidak digunakan pada shared hosting.
CREATE TABLE IF NOT EXISTS admins (
 id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(100) NOT NULL, email VARCHAR(150) NOT NULL UNIQUE,
 password_hash VARCHAR(255) NOT NULL, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;
CREATE TABLE IF NOT EXISTS categories (
 id INT AUTO_INCREMENT PRIMARY KEY, name VARCHAR(100) NOT NULL UNIQUE
) ENGINE=InnoDB;
CREATE TABLE IF NOT EXISTS products (
 id INT AUTO_INCREMENT PRIMARY KEY, category_id INT NULL, name VARCHAR(180) NOT NULL,
 description TEXT, price DECIMAL(12,2) NOT NULL DEFAULT 0, stock INT NOT NULL DEFAULT 0,
 image_url VARCHAR(500), active TINYINT(1) NOT NULL DEFAULT 1,
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY(category_id) REFERENCES categories(id) ON DELETE SET NULL
) ENGINE=InnoDB;
CREATE TABLE IF NOT EXISTS orders (
 id INT AUTO_INCREMENT PRIMARY KEY, customer_name VARCHAR(150) NOT NULL, phone VARCHAR(50) NOT NULL,
 address TEXT NOT NULL, total DECIMAL(12,2) NOT NULL, status ENUM('Menunggu','Diproses','Dikirim','Selesai','Dibatalkan') DEFAULT 'Menunggu',
 created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB;
CREATE TABLE IF NOT EXISTS order_items (
 id INT AUTO_INCREMENT PRIMARY KEY, order_id INT NOT NULL, product_id INT NULL, product_name VARCHAR(180) NOT NULL,
 price DECIMAL(12,2) NOT NULL, quantity INT NOT NULL,
 FOREIGN KEY(order_id) REFERENCES orders(id) ON DELETE CASCADE,
 FOREIGN KEY(product_id) REFERENCES products(id) ON DELETE SET NULL
) ENGINE=InnoDB;
INSERT IGNORE INTO categories(name) VALUES ('Makanan & Minuman'),('Sayuran & Buah'),('Kerajinan'),('Kebutuhan Rumah');
INSERT INTO products(category_id,name,description,price,stock,image_url) 
SELECT c.id,'Keripik Pisang','Keripik pisang renyah produksi lokal.',18000,30,'' FROM categories c WHERE c.name='Makanan & Minuman'
AND NOT EXISTS(SELECT 1 FROM products WHERE name='Keripik Pisang');
INSERT INTO products(category_id,name,description,price,stock,image_url)
SELECT c.id,'Paket Sayur Segar','Aneka sayuran segar pilihan.',25000,20,'' FROM categories c WHERE c.name='Sayuran & Buah'
AND NOT EXISTS(SELECT 1 FROM products WHERE name='Paket Sayur Segar');
INSERT INTO products(category_id,name,description,price,stock,image_url)
SELECT c.id,'Tas Anyaman','Tas anyaman handmade untuk aktivitas harian.',65000,12,'' FROM categories c WHERE c.name='Kerajinan'
AND NOT EXISTS(SELECT 1 FROM products WHERE name='Tas Anyaman');
