# 20default.sql

USE w3schools;

# DEFAULT : 값을 주지 않을 때의 기본값을 정의
CREATE TABLE my_table13
(
    col1 VARCHAR(10),
    col2 VARCHAR(10) DEFAULT 'abc'
);
DESC my_table13;
INSERT INTO my_table13
    (col1, col2)
VALUES ('qwe', 'zxc');
SELECT *
FROM my_table13;
INSERT INTO my_table13
    (col2)
VALUES ('iop');
SELECT *
FROM my_table13;
INSERT INTO my_table13
    (col1)
VALUES ('bnm');

# NULL을 의도적으로 넣을 수 있다
INSERT INTO my_table13
    (col1, col2)
VALUES ('jkl', NULL);
SELECT *
FROM my_table13;
DESC my_table13;

# my_table14 테이블 만들기
# 4개의 컬럼 정의
# 하나는 제약사항없이
# 하나는 NOT NULL 만
# 하나는 DEFAULT만
# 하나는 NOT NULL DEFAULT
CREATE TABLE my_table14
(
    name  VARCHAR(10),
    price INT         NOT NULL,
    taste VARCHAR(20)          DEFAULT '보통',
    place VARCHAR(20) NOT NULL DEFAULT '이대역'
);
DESC my_table14;

INSERT INTO my_table14
    (name, price, taste, place)
VALUES ('불뚝갈비찜', 12000, '3점', '이대역');
INSERT INTO my_table14
    (name, price)
VALUES ('베이글', 5000);
INSERT INTO my_table14
    (name, price, place)
VALUES ('분짜', 12000, '신촌역');
INSERT INTO my_table14
    (name, price, taste, place)
VALUES (NULL, 3000, NULL, '횡단보도 앞');

SELECT *
FROM my_table14;
DESC my_table14;
