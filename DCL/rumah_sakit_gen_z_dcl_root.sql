USE rumah_sakit_gen_z;

USE mysql;
SELECT USER,HOST FROM USER;

CREATE USER user_binar@localhost IDENTIFIED BY '24SA11A057';

GRANT UPDATE ON rumah_sakit_gen_z.tbPasien TO user_binar@localhost;

GRANT SELECT ON rumah_sakit_gen_z.tbPasien TO user_binar@localhost;