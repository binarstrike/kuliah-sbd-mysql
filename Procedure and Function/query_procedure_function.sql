USE rumah_sakit_gen_z;

DELIMITER @@
CREATE OR REPLACE PROCEDURE p_tambahPasien
(id CHAR(8), nama VARCHAR(128), tgl DATE, alamat VARCHAR(200))
BEGIN
	INSERT INTO tbPasien (IdPasien, NamaPasien, TanggalLahir, Alamat)
		VALUES (id, nama, tgl, alamat);
END;@@
DELIMITER;


-- CALL p_tambahPasien('P0000010', "Ucup", "2001-12-27","Ohio");


DELIMITER @@
CREATE PROCEDURE p_updateAlamatPasien
(id CHAR(8),alamat VARCHAR(128)) BEGIN
	UPDATE tbPasien
	SET Alamat = alamat
	WHERE IdPasien = id;
END;@@
DELIMITER;

-- CALL p_updateAlamatPasien("P0000003", "Ciamis");

DELIMITER ^^
CREATE PROCEDURE p_deleteDokter(id CHAR(8)) BEGIN
	DELETE FROM tbDokter WHERE IdDokter = id;
END;^^

-- CALL p_deleteDokter("D0000006");

DROP PROCEDURE IF EXISTS p_hitungJumlahPasien;
DELIMITER @@
CREATE PROCEDURE p_hitungJumlahPasien(OUT jumlah INT) BEGIN
	SELECT COUNT(*) INTO jumlah FROM tbPasien;
END@@


CALL p_hitungJumlahPasien(@jumlah);
SELECT @jumlah AS jumlah_pasien;



SELECT NamaDokter,LEFT(NamaDokter, 4), RIGHT(NamaDokter, 4)
	FROM tbDokter;



SELECT TglBayar,MONTHNAME(TglBayar),DATEDIFF(NOW(),TglBayar)
	FROM tbPembayaran;

DROP FUNCTION IF EXISTS f_hargaObat;
DELIMITER //
CREATE FUNCTION f_hargaObat(id CHAR(8))
RETURNS DECIMAL(10,2)
BEGIN
	DECLARE _harga DECIMAL(10,2);
	SELECT Harga INTO _harga FROM tbObat WHERE IdObat = id;
	RETURN _harga;
END//

SELECT f_hargaObat("OB000004") AS harga_obat;




DELIMITER //
CREATE PROCEDURE p_hapusDokter(id CHAR(8)) BEGIN
	DELETE FROM tbDokter WHERE IdDokter = id;
END //

CALL p_hapusDokter("D0000006");



SELECT UPPER(NamaDokter) FROM tbDokter;

DROP FUNCTION IF EXISTS f_totalPembayaran;
DELIMITER 😎
CREATE FUNCTION f_totalPembayaran(tanggal DATE)
RETURNS DECIMAL(10, 2)
BEGIN
	DECLARE total DECIMAL(10,2);
	SELECT SUM(Jumlah) INTO total
	FROM tbPembayaran WHERE TglBayar = tanggal;
	RETURN total;
END 😎

SELECT * FROM tbPembayaran;
SELECT f_totalPembayaran("2024-10-23") AS total_bayar;