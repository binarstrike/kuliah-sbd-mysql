<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Tambah Data Pasien</title>
</head>

<body>
  <h2>TAMBAH DATA PASIEN</h2>
  <br>
  <a href="home.php?page=pasien">KEMBALI</a>
  <br>
  <br>
  <form action="tambah-pasien-aksi.php" method="post">
    <table>
      <tr>
        <td>Nama pasien</td>
        <td><input type="text" name="nama_pasien"></td>
      </tr>
      <tr>
        <td>Tanggal lahir</td>
        <td><input type="date" name="lahir_kapan"></td>
      </tr>
      <tr>
        <td>Alamat</td>
        <td><input type="text" name="alamat"></td>
      </tr>
      <tr>
        <td>Telepon</td>
        <td><input type="number" name="nomor_telepon"></td>
      </tr>
      <tr>
        <td></td>
        <td><input type="submit" value="SIMPAN"></td>
      </tr>
    </table>
  </form>
  <?php
  if (isset($_GET['page'])) {
    $page = $_GET['page'];

    if ($page == 'pasien') {
      include "tampil-pasien.php";
    } else {
      echo "<center><h3>Maaf. Halaman tidak di temukan!</h3></center>";
    }
  }
  ?>
</body>

</html>