<?php
include "koneksi.php";

$idPasien = $_POST["id"];
$namaPasien = $_POST["nama_pasien"];
$lahirKapan = $_POST["lahir_kapan"];
$alamat = $_POST["alamat"];
$nomorTelepon = $_POST["nomor_telepon"];

$query = $koneksi->query("UPDATE tbPasien SET NamaPasien='$namaPasien',TanggalLahir='$lahirKapan',Alamat='$alamat',Telepon='$nomorTelepon' WHERE IdPasien='$idPasien'");

header("location:home.php?page=pasien");
