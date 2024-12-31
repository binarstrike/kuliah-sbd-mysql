<?php
try {
    $conn = new mysqli("db-mysql-sbd:3306", "rize", "rize123", "rumah_sakit_gen_z");
} catch (\Throwable) {
    die("gak bisa konek ke server mysql: " . mysqli_connect_error() . "\n");
    exit(1);
}

$rows = $conn->query("SELECT * FROM tbObat");

while ($row = $rows->fetch_assoc()) {
    echo implode(",", $row) . "\n";
}
?>

<a href="https://blogger-gabut.site">Blogger Gabut</a><?php echo"\n" ?>
