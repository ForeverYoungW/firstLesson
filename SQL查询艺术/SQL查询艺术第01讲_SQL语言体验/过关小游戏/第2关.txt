WITH T (PL , GL , PR , GR , BOAT , PATH )
AS 
(
    SELECT 0 , 0 , 3 , 3 , CAST (0 AS BIT ), CAST ('' AS VARCHAR (8000 )) UNION ALL 
    SELECT PL + 2 AS PL , GL , PR - 2 AS PR , GR , ~ BOAT , PATH + '2人过河→' 
        FROM T WHERE BOAT = 0 AND PR >= 2 AND (PR - 2 >= GR OR PR = 2 ) UNION ALL 
    SELECT PL + 1 , GL + 1 , PR - 1 , GR - 1 , ~ BOAT , PATH + '1人鬼过河→' 
        FROM T WHERE BOAT = 0 AND PR >= 1 AND GR >= 1 AND PL >= GL   UNION ALL 
    SELECT PL , GL + 2 , PR , GR - 2 , ~ BOAT , PATH + '2鬼过河→' 
        FROM T WHERE BOAT = 0 AND GR >= 2 AND (PL - 2 >= GL OR PL = 0 ) UNION ALL 
    SELECT PL - 1 , GL , PR + 1 , GR , ~ BOAT , PATH + '1人返回→' 
        FROM T WHERE BOAT = 1 AND PL >= 1 AND GR + PR > 0   AND (PL - 1 >= GL OR PL = 1 ) AND PR + 1 >= GR UNION ALL 
    SELECT PL , GL - 1 , PR , GR + 1 , ~ BOAT , PATH + '1鬼返回→' 
        FROM T WHERE BOAT = 1 AND GL >= 1 AND GR + PR > 0 AND (PR - 1 >= GR OR PR = 0 )  UNION ALL 
    SELECT PL - 1 , GL - 1 , PR + 1 , GR + 1 , ~ BOAT , PATH + '1人鬼返回→' 
        FROM T WHERE BOAT = 1 AND PL >= 1 AND GL >= 1 AND GR + PR > 0 AND PR >= GR AND PATH NOT LIKE '%1人鬼过河→' 
)
SELECT PATH FROM T WHERE PR = 0 AND GR = 0