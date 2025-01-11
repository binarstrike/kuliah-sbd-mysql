-- 1.a
DELIMITER //
CREATE OR REPLACE PROCEDURE tampilDataPajak()
BEGIN
  SELECT * FROM Tbl_pajak WHERE nominal > 275000 AND tipe IN ('Mobil', "Motor");
END //

DELIMITER ;

-- 1.b
DELIMITER //
CREATE OR REPLACE FUNCTION totalNominal()
BEGIN
  DECLARE total INT;
    SELECT SUM(nominal) FROM Tbl_pajak GROUP BY tipe;
END //

DELIMITER ;

DELIMITER //
CREATE PROCEDURE blah (IN batas INT)
BEGIN
  DECLARE i INT;
  DECLARE hasil VARCHAR (20) DEFAULT '';
  SET i = 1;
  REPEAT
    SET i = i * 2;
    SET hasil = CONCAT (hasil, i, ' ');
    IF i > 7 THEN
      SET i = i - 1;
      SET hasil = CONCAT (hasil, i, ' ');
    END IF;
  UNTIL i > batas;
  END REPEAT;
  SELECT hasil;
END //

CREATE TABLE tbUser (
  IdUser SERIAL,
  username VARCHAR(128),
  password VARCHAR(64)
)

INSERT INTO tbUser (username,password) VALUES ("binar128","binar128");

