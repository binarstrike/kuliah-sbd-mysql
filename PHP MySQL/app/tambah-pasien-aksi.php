<?php
// koneksi database
include 'koneksi.php';

// menangkap data yang di kirim dari form tambah pasien
$namaPasien = $_POST['nama_pasien'];
$tanggalLahir = $_POST['lahir_kapan'];
$alamatPasien = $_POST['alamat'];
$nomorTelepon = $_POST['nomor_telepon'];

// menginput data ke database
$koneksi->query("INSERT INTO tbPasien (NamaPasien,TanggalLahir,Alamat,Telepon) VALUES ('$namaPasien','$tanggalLahir','$alamatPasien','$nomorTelepon')");

header("location:home.php?page=pasien");
