<?php
require 'config.php';
$count = (int)$pdo->query("SELECT COUNT(*) FROM admins")->fetchColumn();
if ($count > 0) {
    exit('Akun admin sudah ada. Hapus file setup_admin.php dari hosting demi keamanan.');
}
$name = 'Administrator';
$email = 'admin@pasarkita.test';
$password = 'admin123';
$stmt = $pdo->prepare("INSERT INTO admins (name, email, password_hash) VALUES (?, ?, ?)");
$stmt->execute(array($name, $email, password_hash($password, PASSWORD_DEFAULT)));
echo '<h2>Akun admin berhasil dibuat.</h2>';
echo '<p>Email: <b>'.htmlspecialchars($email, ENT_QUOTES, 'UTF-8').'</b></p>';
echo '<p>Password: <b>'.htmlspecialchars($password, ENT_QUOTES, 'UTF-8').'</b></p>';
echo '<p><strong>Segera hapus file setup_admin.php dari hosting.</strong></p>';
