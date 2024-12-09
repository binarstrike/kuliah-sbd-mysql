USE rumah_sakit_gen_z;

INSERT INTO tbDokter (NamaDokter,Spesialisasi,Telepon) VALUES
	("Joko Wadidaw","THT","081804841249"),
	("Fufu Fafa","Jantung","081804841248"),
	("Dika Subardjo","Ginjal","081804841247"),
	("Alexander Ucup","Paru-paru","081804841246"),
	("John Doe","Saraf","081804841245");

SELECT * FROM tbDokter;

INSERT INTO tbPasien (NamaPasien,TanggalLahir,Alamat) VALUES
	("Ani Sabrina","2003-12-21","Cilongok"),
	("Budi Santoso","2004-11-12","Cikarang Utara"),
	("Kaesang Pangarep","2002-03-03","Cilacap"),
	("Firmansyah","2001-12-21","Denpasar"),
	("Agung Prasetyo","1997-03-24","Purwokerto");

SELECT * FROM tbPasien;

INSERT INTO tbPasien (NamaPasien,TanggalLahir,Alamat,Telepon) VALUES
	("Budi Sucipto","2003-11-28","Cirebon","08467639877"),
	("Fandi Subardjo","2003-06-12","Cikarang","08467631278");

INSERT INTO tbPendaftaran (IdPasien,IdDokter,Tanggal,Waktu) VALUES
	(1,5,"2024-09-12","07:34:01"),
	(2,2,"2024-05-27","20:56:20"),
	(3,1,"2024-10-10","18:37:19"),
	(4,4,"2024-09-18","14:43:10"),
	(5,3,"2024-09-20","12:50:23");

SELECT * FROM tbPendaftaran;

INSERT INTO tbPemeriksaan (IdPendaftaran,Diagnosa,Tindakan,Biaya) VALUES
(1,"Sakit perut","Minum obat sakit perut",120000),
(2,"Sakit jantung","Operasi jantung",11350000),
(3,"Diabetes","Diet mengurangi gula dan  minum obat",110000),
(4,"Batuk pilek","Minum obat paracetamol",100000),
(5,"Darah tinggi","Minum obat pereda darah tinggi",90000);

SELECT * FROM tbPemeriksaan;


INSERT INTO tbObat (NamaObat,Satuan,Harga,TglExpired) VALUES
	("Promag","Tablet",15000,"2025-10-02"),
	("Paracetamol","Tablet",25000,"2027-11-19"),
	("Sirup OBH","Botol",21000,"2025-05-17"),
	("Antibiotik","Tablet",11000,"2025-03-22"),
	("Tetes mata","Botol",17000,"2026-11-12");

SELECT * FROM tbObat;


INSERT INTO tbPembayaran (IdPemeriksaan,TglBayar,Jumlah) VALUES
	(1,"2024-10-22",2000000),
	(2,"2024-10-23",2430000),
	(3,"2024-10-28",320000),
	(4,"2024-10-26",1200000),
	(5,"2024-10-29",450000);

SELECT * FROM tbPembayaran;


INSERT INTO tbDetailBayar VALUES
	(1,5),
	(2,4),
	(3,3),
	(4,2),
	(5,2);

SELECT * FROM tbDetailBayar;

-- eksperimen perintah query SELECT, UPDATE dan DELETE

SELECT * FROM tbDokter;


UPDATE tbObat SET NamaObat = "Tetes mata Insto" WHERE IdObat = 5;


-- DELETE FROM tbObat WHERE IdObat = "OB000003";


SELECT * FROM tbObat WHERE Harga BETWEEN 15000 AND 20000;


SELECT * FROM tbPasien ORDER BY NamaPasien DESC;


SELECT * FROM tbPasien WHERE Alamat LIKE "Ci%";


SELECT * FROM tbObat WHERE Satuan IN ("Tablet");


SELECT * FROM tbPembayaran WHERE Jumlah >= 100000 AND Jumlah <= 500000;

