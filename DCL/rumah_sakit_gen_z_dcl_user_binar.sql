USE rumah_sakit_gen_z;


-- Tuliskan query untuk menampilkan data pembayaran di bawah 2 juta
SELECT * FROM tbPembayaran WHERE Jumlah < 2000000;

-- Tuliskan queri untuk menghitung total pembayaran dikelompokkan
-- per tanggal bayar
SELECT TglBayar,SUM(Jumlah) AS TotalPembayaran FROM tbPembayaran
	GROUP BY TglBayar;


SELECT IdPemeriksaan,AVG(Jumlah) AS rata_rata_pembayaran 
	FROM tbPembayaran GROUP BY IdPemeriksaan;

ALTER TABLE tbObat ADD COLUMN terjual INT NOT NULL;

SELECT * FROM tbObat WHERE terjual >= 2;

