-- 1
CREATE DATABASE IF NOT EXISTS responsi_binarnugroho;
USE responsi_binarnugroho;

-- 2
CREATE TABLE tbcabang (
	idcabang CHAR(2) PRIMARY KEY,
	namacabang VARCHAR(30),
	pimpinan VARCHAR(30)
);

CREATE TABLE tbnasabah (
	norek VARCHAR(15) PRIMARY KEY,
	idcabang CHAR(2),
	nama VARCHAR(30),
	alamat VARCHAR(35),
	saldo INT,
	FOREIGN KEY (idcabang) REFERENCES tbcabang(idcabang)
);

CREATE TABLE tbtransaksi (
	idtransaksi VARCHAR(10) PRIMARY KEY,
	norek VARCHAR(15),
	tanggal DATE,
	jenis ENUM('simpan','penarikan'),
	nominal INT,
	FOREIGN KEY (norek) REFERENCES tbnasabah(norek)
);