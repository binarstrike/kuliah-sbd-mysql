<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>DATA OBAT</title>
</head>

<body>
  <br>
  <br>
  <br>
  <table border="1">
    <tr>
      <th>No</th>
      <th>Id Obat</th>
      <th>Nama Obat</th>
      <th>Satuan</th>
      <th>Harga</th>
      <th>Tanggal Expired</th>
      <th>Stok</th>
    </tr>
    <?php
    include "koneksi.php";

    $no = 1;
    $query = $koneksi->query("SELECT * FROM tbObat ORDER BY IdObat");
    while ($row = $query->fetch_array()) {
    ?>
      <tr>
        <td><?= $no++ ?></td>
        <td><?= $row["IdObat"] ?></td>
        <td><?= $row["NamaObat"] ?></td>
        <td><?= $row["Satuan"] ?></td>
        <td><?= $row["Harga"] ?></td>
        <td><?= $row["TglExpired"] ?></td>
        <td><?= $row["stok"] ?></td>
      </tr>
    <?php } ?>
  </table>
</body>

</html>