CREATE DATABASE IF NOT EXISTS rumah_sakit_gen_z;

USE rumah_sakit_gen_z;

-- set FOREIGN_KEY_CHECKS menjadi 0 agar tabel dapat dihapus tanpa error
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS tbPasien,
tbDokter,
tbPendaftaran,
tbPemeriksaan,
tbPembayaran,
tbDetailBayar,
tbObat;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE IF NOT EXISTS tbPasien (
    IdPasien SERIAL,
    NamaPasien VARCHAR(128) NOT NULL,
    TanggalLahir DATE NOT NULL,
    Alamat VARCHAR(200) NOT NULL,
    Telepon CHAR(15)
);

CREATE TABLE IF NOT EXISTS tbDokter (
    IdDokter SERIAL,
    NamaDokter VARCHAR(128) NOT NULL,
    Spesialisasi VARCHAR(64) NOT NULL,
    Telepon CHAR(15)
);

CREATE TABLE IF NOT EXISTS tbPendaftaran (
    IdPendaftaran SERIAL,
    IdPasien BIGINT UNSIGNED,
    IdDokter BIGINT UNSIGNED,
    Tanggal DATE NOT NULL,
    Waktu DATETIME NOT NULL,
    FOREIGN KEY (IdPasien) REFERENCES tbPasien (IdPasien), -- ON DELETE CASCADE
    FOREIGN KEY (IdDokter) REFERENCES tbDokter (IdDokter) -- ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS tbPemeriksaan (
    IdPemeriksaan SERIAL,
    IdPendaftaran BIGINT UNSIGNED,
    Diagnosa TEXT NOT NULL,
    Tindakan TEXT NOT NULL,
    Biaya DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (IdPendaftaran) REFERENCES tbPendaftaran (IdPendaftaran) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS tbPembayaran (
    IdBayar SERIAL,
    IdPemeriksaan BIGINT UNSIGNED,
    TglBayar DATE NOT NULL,
    Jumlah DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (IdPemeriksaan) REFERENCES tbPemeriksaan (IdPemeriksaan) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS tbObat (
    IdObat SERIAL,
    NamaObat VARCHAR(128) NOT NULL,
    Satuan VARCHAR(16) NOT NULL,
    Harga DECIMAL(10, 2) NOT NULL
    -- TglExpired DATE NOT NULL
);

CREATE TABLE IF NOT EXISTS tbDetailBayar (
    IdBayar BIGINT UNSIGNED,
    IdObat BIGINT UNSIGNED,
    FOREIGN KEY (IdBayar) REFERENCES tbPembayaran (IdBayar) ON DELETE CASCADE,
    FOREIGN KEY (IdObat) REFERENCES tbObat (Idobat) ON DELETE CASCADE
);

ALTER TABLE tbPendaftaran MODIFY COLUMN Waktu TIME;

ALTER TABLE tbObat ADD COLUMN TglExpired DATE NOT NULL;
-- DROP TABLE IF EXISTS tbDetailBayar;