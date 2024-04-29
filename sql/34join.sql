# 34join.sql

USE mydb2;
CREATE TABLE table5
(
    col1 INT,
    col2 VARCHAR(3)
);
CREATE TABLE table6
(
    col_a INT,
    col_b VARCHAR(3),
    col_c VARCHAR(3)
);

INSERT INTO table5
VALUES (1, 'abc'),
       (2, 'def'),
       (3, 'ghi');
# 모든 컬럼에 값을 넣을 때는 컬럼명을 생략 가능
INSERT INTO table6
VALUES (2, 'jkl', 'mno'),
       (3, 'pqr', 'stu'),
       (4, 'vwx', 'yza'),
       (5, 'bcd', 'efg');

# cartesian product
SELECT *
FROM table5
         JOIN table6;
# table5 컬럼부터 나오고 table6 컬럼이 나온다
# 컬럼 5개 (2 + 3), 레코드는 12개 (3 * 4)

# INNER JOIN
SELECT *
FROM table5
         JOIN table6 ON col1 = col_a;
# 어떤 컬럼을 기준으로 JOIN을 줄 것이냐
# 5개의 컬럼이 다 나온다

# LEFT JOIN
SELECT *
FROM table5
         LEFT JOIN table6 ON col1 = col_a;
# RIGHT JOIN
SELECT *
FROM table5
         RIGHT JOIN table6 ON col1 = col_a;
# 레코드가 없는 null로 나온다