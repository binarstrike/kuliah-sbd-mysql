<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Edit data pasien</title>
</head>

<body>
  <h2>EDIT DATA PASIEN</h2>
  <br>
  <a href="home.php?page=pasien">KEMBALI</a>
  <br><br>
  <?php
  include "koneksi.php";
  $id = $_GET['id'];
  $query = $koneksi->query("SELECT * FROM tbPasien WHERE IdPasien='$id' LIMIT 1");
  $row = $query->fetch_assoc();
  ?>
  <form action="edit-pasien-aksi.php" method="post">
    <input type="hidden" name="id" value="<?= $row["IdPasien"] ?>">
    <table>
      <tr>
        <td>Nama pasien</td>
        <td><input type="text" name="nama_pasien" value="<?= $row["NamaPasien"] ?>"></td>
      </tr>
      <tr>
        <td>Tanggal lahir</td>
        <td><input type="date" name="lahir_kapan" value="<?= $row["TanggalLahir"] ?>"></td>
      </tr>
      <tr>
        <td>Alamat</td>
        <td><input type="text" name="alamat" value="<?= $row["Alamat"] ?>"></td>
      </tr>
      <tr>
        <td>Nomor telepon</td>
        <td><input type="number" name="nomor_telepon" value="<?= $row["Telepon"] ?>"></td>
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