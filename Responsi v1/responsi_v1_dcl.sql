USE responsi_binarnugroho;

-- 5
SELECT norek,nama,saldo FROM tbnasabah WHERE saldo > 8000000;

-- 6
SELECT SUM(nominal) AS total_nominal_transakasi FROM tbtransaksi;

-- 7
SELECT tanggal,SUM(nominal) AS jumlah_transaksi FROM tbtransaksi
	GROUP BY tanggal;

-- 8
SELECT C.idcabang, C.namacabang, N.nama FROM tbcabang AS C
	LEFT JOIN tbnasabah AS N ON C.idcabang = N.idcabang;

-- 9
SELECT T.idtransaksi,T.tanggal,N.nama,T.jenis,T.nominal
	FROM tbtransaksi AS T INNER JOIN tbnasabah AS N
		ON T.norek = N.norek;
		
-- 10
DROP DATABASE responsi_binarnugroho;