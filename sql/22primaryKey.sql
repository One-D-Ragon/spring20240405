# 22primaryKey.sql

USE w3schools;

# PRIMARY KEY : NOT NULL UNIQUE
CREATE TABLE my_table17
(
    col1 INT,
    col2 INT PRIMARY KEY -- NOT NULL UNIQUE
);
INSERT INTO my_table17
    (col1, col2)
VALUES (1, 1);
INSERT INTO my_table17
    (col1, col2)
VALUES (2, 2);
INSERT INTO my_table17
    (col1, col2)
VALUES (3, 2); # 실패
INSERT INTO my_table17
    (col1, col2)
VALUES (NULL, 3);
INSERT INTO my_table17
    (col1, col2)
VALUES (4, NULL); # 실패
DESC my_table17;

# PRIMARY KEY 제약사항은 한 테이블에 하나만 줄 수 있음
CREATE TABLE my_table18
(
    col1 INT PRIMARY KEY,
    col2 INT PRIMARY KEY
); # PRIMARY KEY 2개는 실패(PRIMARY KEY 한 개의 테이블에만 줄 수 있다)
CREATE TABLE my_table19
(
    col1 INT NOT NULL UNIQUE,
    col2 INT NOT NULL UNIQUE
); # NOT NULL UNIQUE는 된다
CREATE TABLE my_table20
(
    col1 INT PRIMARY KEY,
    col2 INT NOT NULL UNIQUE
); # 가능
DESC my_table19;
DESC my_table20;

# 여러 컬럼 조합으로 PRIMARY KEY 제약사항을 줄 수 있음
CREATE TABLE my_table21
(
    col1 INT,
    col2 INT,
    col3 INT,
    PRIMARY KEY (col1, col2)
); # 2개를 묶어서 중복이 안되면 된다
DESC my_table21;
INSERT INTO my_table21
    (col1, col2, col3)
VALUES (1, 1, 1);
INSERT INTO my_table21
    (col1, col2, col3)
VALUES (1, 2, 1);
INSERT INTO my_table21
    (col1, col2, col3)
VALUES (2, 2, 1);
INSERT INTO my_table21
    (col1, col2, col3)
VALUES (NULL, 2, 1); # 불가능

SELECT *
FROM my_table21;

# my_table22 만들기
#  PRIMARY KEY
#  NOT NULL UNIQUE
#  제약사항없이
CREATE TABLE my_table22
(
    col1 INT PRIMARY KEY,
    col2 INT NOT NULL UNIQUE,
    col3 INT
);
DESC my_table22;
#  여러 레코드 INSERT 해보기
INSERT INTO my_table22
    (col1, col2, col3)
VALUES (1, 1, 1);
INSERT INTO my_table22
    (col1, col2, col3)
VALUES (2, 2, 1);
INSERT INTO my_table22
    (col1, col2, col3)
VALUES (3, 7, 1);
INSERT INTO my_table22
    (col1, col2)
VALUES (4, 5);
SELECT *
FROM my_table22;

# CHECK, FOREIGN KEY
