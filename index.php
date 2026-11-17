<?php
require 'config.php'; $page_title='PasarKita — Marketplace Lokal';
$q=trim($_GET['q']??''); $cat=(int)($_GET['category']??0);
$sql="SELECT p.*, c.name category_name FROM products p LEFT JOIN categories c ON c.id=p.category_id WHERE p.active=1";
$args=[]; if($q!==''){ $sql.=" AND (p.name LIKE ? OR p.description LIKE ?)"; $args[]="%$q%";$args[]="%$q%"; }
if($cat){$sql.=" AND p.category_id=?";$args[]=$cat;} $sql.=" ORDER BY p.created_at DESC";
$stmt=$pdo->prepare($sql);$stmt->execute($args);$products=$stmt->fetchAll();
$categories=$pdo->query("SELECT * FROM categories ORDER BY name")->fetchAll();
require 'header.php'; ?>
<section class="hero"><div><p class="eyebrow">PASAR LOKAL, PILIHAN TERBAIK</p><h1>Temukan kebutuhanmu<br>di <span>PasarKita.</span></h1><p>Belanja produk pilihan dari para penjual lokal.</p><a class="btn" href="#produk">Mulai belanja</a></div><div class="hero-art">🧺<span>🌱</span></div></section>
<section id="produk"><div class="section-head"><div><p class="eyebrow">JELAJAHI</p><h2>Produk pilihan</h2></div><form class="search"><input name="q" placeholder="Cari produk..." value="<?=e($q)?>"><select name="category"><option value="0">Semua kategori</option><?php foreach($categories as $c): ?><option value="<?=$c['id']?>" <?=$cat==$c['id']?'selected':''?>><?=e($c['name'])?></option><?php endforeach;?></select><button class="btn">Cari</button></form></div>
<div class="grid"><?php foreach($products as $p): ?><article class="product"><a href="product.php?id=<?=$p['id']?>"><div class="product-image"><?php if($p['image_url']): ?><img src="<?=e($p['image_url'])?>" alt="<?=e($p['name'])?>"><?php else: ?>🛍️<?php endif;?></div></a><div class="product-info"><small><?=e($p['category_name']??'Umum')?></small><h3><a href="product.php?id=<?=$p['id']?>"><?=e($p['name'])?></a></h3><b><?=rupiah($p['price'])?></b><p class="muted">Stok: <?=$p['stock']?></p></div></article><?php endforeach;?></div>
<?php if(!$products): ?><p class="empty">Produk belum ditemukan.</p><?php endif;?></section><?php require 'footer.php'; ?>