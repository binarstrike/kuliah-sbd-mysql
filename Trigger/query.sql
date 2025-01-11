USE rumah_sakit_gen_z;
-- Binar Nugroho - 24SA11A057
-- AFTER INSERT
DELIMITER //
DROP TRIGGER IF EXISTS tr_jumlahPembayaran //
CREATE TRIGGER tr_jumlahPembayaran
AFTER INSERT ON `tbPemeriksaan`
FOR EACH ROW BEGIN
	INSERT INTO tbPembayaran (IdPemeriksaan,TglBayar,Jumlah) VALUES
		(NEW.IdPemeriksaan, NOW(), NEW.Biaya);
END //
DELIMITER;

INSERT INTO tbPemeriksaan (IdPendaftaran,Diagnosa,Tindakan,Biaya) VALUES
	(2,"Flu","Minum obat paracetamol",1250000);

SELECT PM.IdPemeriksaan,PM.Diagnosa,PM.Biaya,PB.IdBayar,PB.TglBayar,PB.Jumlah
	FROM tbPemeriksaan AS PM INNER JOIN tbPembayaran AS PB ON PM.IdPemeriksaan = PB.IdPemeriksaan;


-- Binar Nugroho - 24SA11A057
-- BEFORE INSERT
DELIMITER !!
DROP TRIGGER IF EXISTS tr_cekHargaObat !!
CREATE TRIGGER tr_cekHargaObat
BEFORE INSERT ON tbObat
FOR EACH ROW BEGIN
	IF NEW.Harga <= 5000 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'harga terlalu murah!!';
	END IF;
END !!
DELIMITER;

INSERT INTO tbObat (NamaObat,Satuan,Harga,TglExpired) VALUES
	("Paracetamol","Tablet",2000,DATE_ADD(NOW(), INTERVAL 2 YEAR));




-- Binar Nugroho - 24SA11A057
-- BEFORE UPDATE
DELIMITER %%
DROP TRIGGER IF EXISTS tr_cekTglKadaluwarsa %%
CREATE TRIGGER tr_cekTglKadaluwarsa
BEFORE UPDATE ON `tbObat`
FOR EACH ROW BEGIN
	IF DATEDIFF(NOW(), NEW.TglExpired) >= 0 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Obat sudah kadaluwarsa!';
	END IF;
END %%
DELIMITER;

UPDATE `tbObat`
	SET `TglExpired` = DATE_ADD(NOW(), INTERVAL -1 YEAR)
	WHERE `IdObat` = 2;


CREATE TABLE IF NOT EXISTS tbLog_obat (
	id_log BIGINT UNSIGNED UNIQUE NOT NULL PRIMARY KEY AUTO_INCREMENT,
	id_obat BIGINT UNSIGNED,
	harga_lama DECIMAL(10, 2),
	harga_baru DECIMAL(10, 2),
	waktu DATETIME
);

-- Binar Nugroho - 24SA11A057
-- AFTER UPDATE
DELIMITER @@
DROP TRIGGER IF EXISTS tr_update_hargaObat @@
CREATE TRIGGER tr_update_hargaObat
AFTER UPDATE ON `tbObat`
FOR EACH ROW BEGIN
	INSERT INTO `tbLog_obat`
		SET id_obat = NEW.IdObat,harga_baru = NEW.harga,harga_lama = OLD.harga,waktu = NOW();
END @@
DELIMITER;

UPDATE `tbObat`
SET `Harga` = 144000
WHERE `IdObat` = 4; 

SELECT * FROM `tbLog_obat`;

-- Binar Nugroho - 24SA11A057
-- BEFORE DELETE
DELIMITER $$
DROP TRIGGER IF EXISTS tr_hapusPasien $$
CREATE TRIGGER tr_hapusPasien
BEFORE DELETE ON `tbPasien`
FOR EACH ROW BEGIN
	IF OLD.IdPasien = OLD.IdPasien THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'data pasien tidak dapat dihapus!';
	END IF;
END $$
DELIMITER;

DELETE FROM `tbPasien` WHERE `IdPasien` = 4;


-- Binar Nugroho - 24SA11A057
-- AFTER DELETE
DELIMITER &&
DROP TRIGGER IF EXISTS tr_hapusPasien &&
CREATE TRIGGER tr_hapusPasien
AFTER DELETE ON `tbPasien`
FOR EACH ROW BEGIN
	DELETE FROM `tbPendaftaran` WHERE `IdPasien` = OLD.IdPasien;
END &&
DELIMITER;

DELETE FROM `tbPasien` WHERE `IdPasien` = 1;

SELECT * FROM `tbPasien`;