<?php
// koneksi database
include 'koneksi.php';
$username = $_GET['username'];
$password = $_GET['password'];

$query = $koneksi->query("SELECT username,`password` FROM tbUser WHERE username='$username' AND `password`='$password'");
$row = $query->fetch_assoc();

if ($username == $row['username'] && $password == $row['password']) {
  header("Location: home.php");
} else {
  echo "Gagal Login";
}
