<!DOCTYPE html>
<html>

<head>
  <title></title>
  <!-- menghubungkan dengan file css -->
  <link rel="stylesheet" type="text/css" href="style.css">
</head>

<body>
  <div class="content">
    <header>
      <h1 class="judul">Rumah Sakit Gen Z</h1>
      <h3 class="deskripsi">Jalan Pajak No. 12P Purwokerto Utara</h3>
    </header>
    <div class="menu">
      <ul>
        <li><a href="home.php?page=beranda">BERANDA</a></li>
        <li><a href="home.php?page=pasien">PASIEN</a></li>
        <li><a href="home.php?page=dokter">DOKTER</a></li>
        <li><a href="home.php?page=obat">OBAT</a></li>
        <li><a href="home.php?page=tentang">TENTANG</a></li>
      </ul>
    </div>
    <div class="badan">
      <?php
      if (isset($_GET['page'])) {
        $page = $_GET['page'];
        switch ($page) {
          case 'beranda':
            include "beranda.php";
            break;
          case 'dokter':
            include "tampil-dokter.php";
            break;
          case 'pasien':
            include "tampil-pasien.php";
            break;
          case 'obat':
            include "tampil-obat.php";
            break;
          case 'tentang':
            include "tentang.php";
            break;
          default:
            echo "<center><h3>Maaf. Halaman tidak di temukan !</h3></center>";
            break;
        }
      } else {
        include "beranda.php";
      }
      ?>
    </div>
  </div>
</body>

</html>