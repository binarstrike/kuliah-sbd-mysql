USE rumah_sakit_gen_z;

ALTER TABLE tbObat ADD COLUMN stok INT NOT NULL DEFAULT 0;

-- Binar Nugroho 24SA11A057
SELECT NamaObat,stok,
	IF(stok <= 10, 'stok terbatas',
	IF(stok <= 50, 'stok cukup', 'stok berlebih')) AS 'keterangan'
FROM tbObat ORDER BY stok;

SELECT * FROM tbObat;

-- Binar Nugroho 24SA11A057
SELECT IdPasien,NamaPasien,Alamat,
	IF(Alamat != 'Cilacap', 'Luar Cilacap', '') AS 'keterangan'
FROM tbPasien;


-- Binar Nugroho 24SA11A057
SELECT IdObat,Harga,
CASE
	WHEN Harga >= 50000 THEN 'mahal'
	WHEN Harga BETWEEN 0 AND 49999 THEN 'murah'
	ELSE 'tidak diketahui'
END AS 'keterangan harga' FROM tbObat;


ALTER TABLE tbObat ADD COLUMN terjual INT NOT NULL DEFAULT 0;

-- Binar Nugroho 24SA11A057
DROP FUNCTION IF EXISTS f_cekPenjualan;
DELIMITER 🔥🔥
CREATE FUNCTION f_cekPenjualan(id CHAR(8))
RETURNS VARCHAR (128)
BEGIN
	DECLARE jumlahJual INT;
	SELECT terjual INTO jumlahJual FROM tbObat
		WHERE IdObat = id;
	
	IF (jumlahJual > 0) THEN
		RETURN CONCAT("Jumlah obat terjual ", jumlahJual, " kali");
	ELSE
		RETURN "Obat yang dimaksud belum pernah terjual";
	END IF;
END 🔥🔥
DELIMITER ;

-- Binar Nugroho 24SA11A057
SELECT f_cekPenjualan('OB000001');
SELECT f_cekPenjualan('OB000005');

-- Binar Nugroho 24SA11A057
DROP PROCEDURE IF EXISTS p_bilanganGanjil;
DELIMITER 😎😎
CREATE PROCEDURE p_bilanganGanjil(IN batas INT)
BEGIN
	DECLARE i INT;
	DECLARE hasil VARCHAR(512) DEFAULT '';
	SET i = 1;
	WHILE i < batas DO
		IF MOD(i,2) != 0 THEN
			SET hasil = CONCAT(hasil, i, ' ');
		END IF;
		SET i = i + 1;
	END WHILE;
	SELECT hasil;
END 😎😎
DELIMITER;


-- Binar Nugroho 24SA11A057
CALL p_bilanganGanjil(50);


