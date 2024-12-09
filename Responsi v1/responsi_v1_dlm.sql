USE responsi_binarnugroho;

-- 3
INSERT INTO tbcabang VALUES
	("C1","Kanca Purwokerto","Ananda Syifa"),
	("C2","Kanca Banyumas","Rafif Ahmad"),
	("C3","Kanca Purbalingga","Wulandari"),
	("C4","Kanca Banjarnegara","Anugerah");

INSERT INTO tbnasabah VALUES
	("123456",'C2','Abdurrahman', 'Banyumas', 10000000),
	("745689",'C2','Retno Ambarwati', 'Banyumas', 5000000),
	("336688",'C1','Salman Alfarizi', 'Purwokerto', 7000000),
	("909023",'C4','Rika Suryani', 'Banjarnegara', 8500000),
	("775959",'C1','Sulaiman', 'Purwokerto', 12000000);

INSERT INTO tbtransaksi VALUES
	("t1","745689","2024-11-11","Simpan",500000),
	("t2","909023","2024-11-11","Penarikan",2000000),
	("t3","123456","2024-11-12","Simpan",1000000),
	("t4","775959","2024-11-12","Simpan",750000);
	

-- 4
UPDATE tbnasabah SET saldo = 123000000 WHERE norek = "909023";

SELECT * FROM tbnasabah;