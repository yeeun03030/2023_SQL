DECLARE
  MYBOOKID NUMBER;
  MYBOOKNAME VARCHAR2(200);
  MYPUBLISHER VARCHAR2(200);
  MYPRICE NUMBER;
BEGIN
  MYBOOKID := NULL;
  MYBOOKNAME := NULL;
  MYPUBLISHER := NULL;
  MYPRICE := NULL;

  INSERTORUPDATE(
    MYBOOKID => MYBOOKID,
    MYBOOKNAME => MYBOOKNAME,
    MYPUBLISHER => MYPUBLISHER,
    MYPRICE => MYPRICE
  );
--rollback; 
END;
