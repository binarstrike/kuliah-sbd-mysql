<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>DATA PASIEN</title>
</head>

<body>
  <br>
  <a href="tambah-pasien.php">+ TAMBAH PASIEN</a>
  <br>
  <br>
  <table border="1">
    <tr>
      <th>No</th>
      <th>Id Pasien</th>
      <th>Nama Pasien</th>
      <th>Tangga Lahir</th>
      <th>Alamat</th>
      <th>Telepon</th>
      <th>Aksi</th>
    </tr>
    <?php
    include "koneksi.php";

    $no = 1;
    $query = $koneksi->query("SELECT * FROM tbPasien ORDER BY IdPasien");
    while ($row = $query->fetch_array()) {
    ?>
      <tr>
        <td><?= $no++ ?></td>
        <td><?= $row["IdPasien"] ?></td>
        <td><?= $row["NamaPasien"] ?></td>
        <td><?= $row["TanggalLahir"] ?></td>
        <td><?= $row["Alamat"] ?></td>
        <td><?= $row["Telepon"] ?></td>
        <td>
          <a style="margin-right: 10px;" href="edit-pasien.php?id=<?= $row["IdPasien"] ?>">Edit</a>
          <a href="hapus-pasien.php?id=<?= $row["IdPasien"] ?>">Hapus</a>
        </td>
      </tr>
    <?php } ?>
  </table>
</body>

</html>