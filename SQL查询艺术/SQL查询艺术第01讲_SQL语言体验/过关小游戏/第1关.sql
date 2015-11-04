DECLARE @T TABLE (Y BIT , L BIT , C BIT , R BIT , PATH VARCHAR (8000 ))
INSERT INTO @T SELECT 0 , 0 , 0 , 0 , '' ;
WITH T 
AS 
(
    SELECT * , 0 AS CC FROM @T UNION ALL 
    SELECT ~ Y , L , C , ~ R , PATH + '人羊' + LTRIM (R )+ '→' , CC + 1 FROM T WHERE CC < 10 AND Y = R AND Y & L & C = 0 AND PATH NOT LIKE '%人羊_→' UNION ALL 
    SELECT Y , ~ L , C , ~ R , PATH + '人狼' + LTRIM (R )+ '→' , CC + 1 FROM T WHERE CC < 10 AND   L = R AND Y & L & C = 0 AND Y <> C AND PATH NOT LIKE '%人狼_→' UNION ALL 
    SELECT Y , L , ~ C , ~ R , PATH + '人草' + LTRIM (R )+ '→' , CC + 1 FROM T WHERE   CC < 10 AND C = R AND Y & L & C = 0 AND Y <> L AND PATH NOT LIKE '%人草_→' UNION ALL 
    SELECT Y , L , C , ~ R , PATH + '人' + LTRIM (R )+ '→' , CC + 1 FROM T WHERE CC < 10 AND   Y & L & C = 0 AND Y <> C AND Y <> L AND PATH NOT LIKE '%人_→' 
)
SELECT REPLACE (REPLACE (PATH , '0' , '过河' ), '1' , '返回' ) AS PATH FROM T WHERE Y & L & C = 1;