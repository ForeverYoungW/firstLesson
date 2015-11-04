SELECT 'INSERT INTO DEPT_TEST(DEPTNO, DNAME, LOC) VALUES(' + '''' + CAST(DEPTNO AS VARCHAR(50)) + '''' + ', ' + '''' + DNAME + '''' + ', ' + '''' + LOC + ''');' AS INSERTS
  FROM DEPT