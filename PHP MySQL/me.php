<?php
try {
    $conn = new mysqli("db-mysql-sbd", "rize", "rize123", "rumah_sakit_gen_z");
} catch (\Throwable) {
    echo "<h1>Gak bisa konek DB wooiii!!!</h1><br>";
    die("koneksi ke basis data gagal: " . mysqli_connect_error());
}

echo "Koneksi ke basis data berhasil!<br><br>";

$result = $conn->query("SELECT * FROM tbPasien");

echo "<br>Tabel Dokter<br>";

$rows_ = array();

while ($row = $result->fetch_assoc()) {
    array_push($rows_, $row);
}

echo "<table>";

echo "<tr>";
for ($i = 0; $i < count($rows_); $i++) {
    // FIXME: array index out of bound   ⬇️
    echo "<th>" . array_keys($rows_[$i])[$i] . "</th>";
}
echo "</tr>";

foreach ($rows_ as $row) {
    echo "<tr>";
    foreach ($row as $data) {
        echo "<td>" . $data . "</td>";
    }
    echo "</tr>";
}

echo "</table>";
