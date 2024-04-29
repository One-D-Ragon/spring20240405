# 39union.sql

# (INNER) JOIN
# LEFT (OUTER) JOIN
# RIGHT (OUTER) JOIN
# FULL (OUTER) JOIN -> mariadb 에는 없다, union으로 대체 가능

# UNION : 합집합
USE mydb2;

CREATE TABLE table10
(
    col1 INT
);
CREATE TABLE table11
(
    col_a INT
);

INSERT INTO table10
VALUES (3),
       (4),
       (4),
       (5);
INSERT INTO table11
VALUES (3),
       (4),
       (7);

SELECT *
FROM table10

UNION

SELECT *
FROM table11;
# 두 조희 결과를 합한 값이 나온다. (합집합) 컬럼이 하나.

# LEFT JOIN
SELECT *
FROM table10
         LEFT JOIN table11
                   ON col1 = col_a
UNION

# RIGHT JOIN
SELECT *
FROM table10
         RIGHT JOIN table11
                    ON col1 = col_a;

# INNER JOIN
SELECT *
FROM table10
         JOIN table11
              ON col1 = col_a;

# UNION ALL
# 중복이 제거되지 않음 (LEFT JOIN과 RIGHT JOIN의 결과가 포함됨)
SELECT *
FROM table10
         LEFT JOIN table11
                   ON col1 = col_a
UNION ALL

SELECT *
FROM table10
         RIGHT JOIN table11
                    ON col1 = col_a;