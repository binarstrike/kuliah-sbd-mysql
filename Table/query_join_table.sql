USE rumah_sakit_gen_z;

-- 1
SELECT PA.NamaPasien,PE.IdDokter,PE.Tanggal
	FROM tbPendaftaran AS PE LEFT JOIN tbPasien AS PA
		ON PE.IdPasien = PA.IdPasien;

-- 2
SELECT PE.IdPasien,PE.Tanggal AS TanggalDaftar,
	D.NamaDokter,D.Spesialisasi
	FROM tbPendaftaran AS PE RIGHT JOIN tbDokter AS D
		ON PE.IdDokter = D.IdDokter;

-- 3
SELECT PEME.Diagnosa,PEMB.TglBayar,PEMB.Jumlah
	FROM tbPemeriksaan AS PEME
		CROSS JOIN tbPembayaran AS PEMB;

-- 4
SELECT de.IdBayar,de.IdObat,ob.NamaObat
	FROM tbObat AS ob INNER JOIN tbDetailBayar AS de
		ON de.IdObat = ob.IdObat;

-- 5
SELECT PA.NamaPasien,PA.Telepon,PE.Tanggal,PE.Waktu
	FROM tbPasien AS PA LEFT JOIN tbPendaftaran AS PE
		ON PA.IdPasien = PE.IdPasien;



