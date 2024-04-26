# 21unique.sql

USE w3schools;

# UNIQUE : 다른 레코드의 컬럼 값이 중복되지 않음
CREATE TABLE my_table15
(
    col1 VARCHAR(3),
    col2 VARCHAR(3) UNIQUE
);

INSERT INTO my_table15
    (col1, col2)
VALUES ('abc', 'def');

SELECT *
FROM my_table15;

INSERT INTO my_table15
    (col1, col2)
VALUES ('qwe', 'qwe'); # 다른 컬럼에 중복되는 값은 가능하다
INSERT INTO my_table15
    (col1, col2)
VALUES ('abc', 'abc');
INSERT INTO my_table15
    (col1, col2)
VALUES ('def', 'def'); # 같은 컬럼에 이미 있는 값은 넣을 수 없다 (def, qwe, abc)
INSERT INTO my_table15
    (col1)
VALUES ('qwe'); # NULL은 값이 아니라 값이 없다(존재하지 않다)는 뜻이다.
INSERT INTO my_table15
    (col1)
VALUES ('asd'); # col2가 null인 레코드가 2개 존재할 수 있다
SELECT *
FROM my_table15;
DESC my_table15;
# KEY UNI에 UNIQUE 제약사항이 체크되어있다

# my_table16
#  제약사항없이
#  UNIQUE
#  NOT NULL UNIQUE
CREATE TABLE my_table16
(
    store VARCHAR(10) UNIQUE,
    food  VARCHAR(10) NOT NULL UNIQUE,
    price INT
);
DESC my_table16;
INSERT INTO my_table16
    (store, food, price)
VALUES ('육수당', '불뚝갈비찜', 12000);
INSERT INTO my_table16
    (food)
VALUES ('베이글');
INSERT INTO my_table16
    (food, price)
VALUES ('오뎅', '3000');

SELECT *
FROM my_table16;

# PRI = PRIMARY KEY = NOT NULL UNIQUE
