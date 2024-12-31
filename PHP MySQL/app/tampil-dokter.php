<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>DATA DOKTER</title>
</head>

<body>
  <br>
  <br>
  <br>
  <table border="1">
    <tr>
      <th>No</th>
      <th>Id Dokter</th>
      <th>Nama Dokter</th>
      <th>Spesialisasi</th>
      <th>Telepon</th>
    </tr>
    <?php
    include "koneksi.php";

    $no = 1;
    $query = $koneksi->query("SELECT * FROM tbDokter ORDER BY IdDokter");
    while ($row = $query->fetch_array()) {
    ?>
      <tr>
        <td><?= $no++ ?></td>
        <td><?= $row["IdDokter"] ?></td>
        <td><?= $row["NamaDokter"] ?></td>
        <td><?= $row["Spesialisasi"] ?></td>
        <td><?= $row["Telepon"] ?></td>
      </tr>
    <?php } ?>
  </table>
</body>

</html>