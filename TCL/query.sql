USE rumah_sakit_gen_z;

-- Binar Nugroho 24SA11A057
SET autocommit = 0;
START TRANSACTION;

UPDATE `tbObat` SET `NamaObat`= 'Sirup OBH Z' WHERE `IdObat` = 5;

INSERT INTO `tbObat`(`NamaObat`, `Harga`, `Satuan`, `TglExpired`, `stok`)
  VALUES ('Promag', 23000, 'Tablet', DATE_ADD(NOW(), INTERVAL 2 YEAR), 50);
COMMIT;


SELECT * FROM `tbObat`;




-- Binar Nugroho 24SA11A057
START TRANSACTION;
INSERT INTO `tbPendaftaran` (`IdDokter`, `IdPasien`, `Tanggal`, `Waktu`)
  VALUES (4, 2, NOW(), NOW());
ROLLBACK;

SELECT * FROM `tbPendaftaran`;




-- Binar Nugroho 24SA11A057
START TRANSACTION;
UPDATE `tbDokter` SET `Spesialisasi` = 'Mata' WHERE `IdDokter` = 4;
SAVEPOINT x;

INSERT INTO `tbPasien` (`NamaPasien`, `TanggalLahir`, `Alamat`)
  VALUES ("Andika", "2002-12-27", "Denpasar");
SAVEPOINT y;

INSERT INTO `tbDokter`(`NamaDokter`, `Spesialisasi`)
  VALUES ("Otong Surotong", "Tulang");

ROLLBACK TO y;
ROLLBACK TO x;

SELECT * FROM `tbDokter`;
SELECT * FROM `tbPasien`;

COMMIT;

SELECT * FROM `tbObat`;



-- Locking

-- Binar Nugroho 24SA11A057
-- User root
LOCK TABLE tbObat READ;


-- Mencoba untuk melakukan modifikasi baris data pada table tbObat
UPDATE `tbObat` SET `Harga` = 21000 WHERE `IdObat` = 1;

-- User root
UNLOCK TABLE;


-- Binar Nugroho 24SA11A057
-- User root
LOCK TABLE tbPasien WRITE;

-- Mencoba untuk membaca data dari tabel tbPasien;
SELECT * FROM `tbPasien`;

-- User root
UNLOCK TABLE;




START TRANSACTION;
SELECT * FROM `tbObat` WHERE `NamaObat` LIKE "Sirup%" LOCK IN SHARE MODE;


START TRANSACTION;
SELECT * FROM `tbPasien` WHERE `IdPasien` = 3 FOR UPDATE;