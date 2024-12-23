USE rumah_sakit_gen_z;

DELIMITER $$

DROP PROCEDURE IF EXISTS `p_listAlamatPasien` $$

CREATE PROCEDURE p_listAlamatPasien()
BEGIN
  DECLARE nama_pasien VARCHAR(128);
  DECLARE exit_loop BOOLEAN;
  DECLARE cursor1 CURSOR FOR
    SELECT NamaPasien
    FROM `tbPasien`
    WHERE `Alamat` = 'Cilacap';
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET exit_loop = TRUE;

  OPEN cursor1;

  ulang: LOOP
    FETCH cursor1 INTO nama_pasien;
    SELECT NamaPasien AS 'Daftar Pasien yang berdomisili di Cilacap'
    FROM `tbPasien`
    WHERE `Alamat` = 'Cilacap';
    -- SELECT nama_pasien AS 'Daftar Pasien yang berdomisili di Cilacap';
    
    IF exit_loop THEN
      CLOSE cursor1;
      LEAVE ulang;
    END IF;
  END LOOP ulang;
END $$

DELIMITER;

CALL `p_listAlamatPasien`;

DELIMITER $$

DROP PROCEDURE IF EXISTS p_cariNamaPasien $$

CREATE PROCEDURE p_cariNamaPasien(id_pasien BIGINT UNSIGNED)
BEGIN
  DECLARE nama_pasien VARCHAR(128);
  DECLARE cursor1 CURSOR FOR
    SELECT NamaPasien FROM `tbPasien` WHERE `IdPasien` = id_pasien;
  
  DECLARE EXIT HANDLER FOR 1329
  BEGIN
    SELECT CONCAT("Data pasien dengan id ", id_pasien, " tidak ditemukan")
      AS 'message';
  END;

  OPEN cursor1;
  FETCH cursor1 INTO nama_pasien;
  SELECT nama_pasien;
  CLOSE cursor1;
END $$

DELIMITER;

CALL `p_cariNamaPasien` (20);

CALL `p_cariNamaPasien` (5);

DELIMITER $$

DROP PROCEDURE IF EXISTS p_pasienCount $$

CREATE PROCEDURE p_pasienCount()
BEGIN
  DECLARE alamat_pasien VARCHAR(200);
  DECLARE pasien_count INT(10) UNSIGNED;
  DECLARE cur_jumlah_pasien CURSOR FOR
    SELECT Alamat,COUNT(*) FROM `tbPasien` GROUP BY `Alamat`;

  OPEN cur_jumlah_pasien;
  FETCH cur_jumlah_pasien INTO alamat_pasien, pasien_count;

  SELECT Alamat,COUNT(*) AS 'jumlah pasien' FROM `tbPasien` GROUP BY `Alamat`;
  CLOSE cur_jumlah_pasien;
END $$

DELIMITER;

CALL `p_pasienCount`;

DELIMITER $$

DROP PROCEDURE IF EXISTS p_hargaObat $$

CREATE PROCEDURE p_hargaObat() BEGIN
  DECLARE nama_obat VARCHAR(128);
  DECLARE exit_loop BOOLEAN;
  DECLARE cur_harga_obat CURSOR FOR
    SELECT NamaObat FROM `tbObat` WHERE `Harga` >= 15000;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET exit_loop = TRUE;
  DECLARE EXIT HANDLER FOR 1329
  BEGIN
    SELECT 'Data obat tidak ditemukan' AS pesan;
  END;

  OPEN cur_harga_obat;
  loop1: LOOP
    FETCH cur_harga_obat INTO nama_obat;
    SELECT NamaObat AS 'Daftar obat dengan harga >= 15000'
    FROM `tbObat`
    WHERE `Harga` >= 15000;

    IF exit_loop THEN
      CLOSE cur_harga_obat;
      LEAVE loop1;
    END IF;
  END LOOP loop1;  

END $$

CALL `p_hargaObat`;

DELIMITER $$

DROP PROCEDURE IF EXISTS p_stokObat $$

CREATE PROCEDURE p_stokObat() BEGIN
  DECLARE nama_obat VARCHAR(128);
  DECLARE stok_obat INT(8) UNSIGNED;
  DECLARE exit_loop BOOLEAN;
  DECLARE cur_stok_obat CURSOR FOR
    SELECT NamaObat,stok FROM `tbObat` ORDER BY stok;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET exit_loop = TRUE;

  OPEN cur_stok_obat;
  loop1: LOOP
    FETCH cur_stok_obat INTO nama_obat, stok_obat;
    SELECT NamaObat, stok AS 'daftar 3 obat dengan stok terendah'
    FROM `tbObat`
    ORDER BY stok LIMIT 3;

    IF exit_loop THEN
      CLOSE cur_stok_obat;
      LEAVE loop1;
    END IF;

  END LOOP loop1;
END $$

DELIMITER;

CALL `p_stokObat`;

ALTER TABLE `tbObat`
ADD COLUMN `stok` INT(8) UNSIGNED NOT NULL DEFAULT 0;

UPDATE `tbObat` SET stok = 21 WHERE `IdObat` = 1;

UPDATE `tbObat` SET stok = 9 WHERE `IdObat` = 2;

UPDATE `tbObat` SET stok = 30 WHERE `IdObat` = 3;

UPDATE `tbObat` SET stok = 5 WHERE `IdObat` = 4;

UPDATE `tbObat` SET stok = 25 WHERE `IdObat` = 5;

DELIMITER $$

DROP PROCEDURE IF EXISTS p_pp1 $$

CREATE PROCEDURE p_pp1() BEGIN
  DECLARE nama_pasien VARCHAR(128);
  DECLARE exit_loop BOOLEAN;
  DECLARE cur_name CURSOR FOR SELECT NamaPasien FROM `tbPasien`;
  DECLARE CONTINUE HANDLER FOR NOT FOUND SET exit_loop = TRUE;

  OPEN cur_name;
  loop1: LOOP
    FETCH cur_name INTO nama_pasien;
    SELECT nama_pasien;
    
    IF exit_loop THEN
      CLOSE cur_name;
      LEAVE loop1;
    END IF;
  END LOOP loop1;
END $$

DELIMITER;

CALL p_pp1 ();