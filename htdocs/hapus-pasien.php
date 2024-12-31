<?php
// koneksi database
include 'koneksi.php';

// id pasien
$id = $_GET['id'];

// menghapus data dari database
$koneksi->query("DELETE FROM tbPasien WHERE IdPasien='$id'");

// mengalihkan halaman kembali ke home.php
header("location:home.php?page=pasien");
