<?php
try {
  $koneksi = new mysqli("db-mysql-sbd:3306", "user_binar", "24SA11A057", "rumah_sakit_gen_z");
} catch (\Throwable $err) {
  die("koneksi ke basis data gagal woooyyyy!!: " . $err->getMessage() . "\n");
}
