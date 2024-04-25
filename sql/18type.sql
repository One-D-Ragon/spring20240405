# 18type.sql
USE w3schools;

# 문자열
# VARCHAR(길이)
CREATE TABLE my_table3
(
    name  VARCHAR(3),
    title VARCHAR(5),
    notes VARCHAR(1000)
);
DESC my_table3;
INSERT INTO my_table3
    (name, title, notes)
VALUES ('이강인', '축구선수', '파리생제르망');
INSERT INTO my_table3(name, title, notes)
VALUES ('네이마르', '야구선수', '사우디아라비아');

# todo ; my_table4
#  책 제목, 책 내용, 저자
#  테이블 만들고 데이터 추가, 조회
#  문자열 형식은 16383자가 최대
CREATE TABLE my_table4
(
    title  varchar(15),
    story  varchar(500),
    author varchar(10)
);
INSERT INTO my_table4(title, story, author)
VALUES ('이것이 자바다', '자바에 대한 기초 문법을 알려드립니다', '감자바');
INSERT INTO my_table4(title, story, author)
VALUES ('스프링부트', '스프링 서머 어텀 윈터 이대역 근처 정형외과에는 윈터를 닮은 물리치료사가 있다는 전설이 전해진다', '홍팍');

SELECT *
FROM my_table4;


# 수
# 정수 INT
# 실수 DECIMAL, DEC (총길이, 소수점이하길이)
# DEC(10,4) = 123456.6789
CREATE TABLE my_table5
(
    age    INT,
    height DEC(5, 2)
);
DESC my_table5;

INSERT INTO my_table5
    (age, height)
VALUES (10, 170.25);

SELECT *
FROM my_table5;

INSERT INTO my_table5
    (age, height)
VALUES (10, 1000.25);
INSERT INTO my_table5
    (age, height)
VALUES (10, 170.334);
INSERT INTO my_table5
    (age, height)
VALUES (10, 170.339);
# 소수점 이하는 반올림되어서 들어간다

# todo : 새 테이블 my_table6
#  한 개의 정수 타입 컬럼, 한 개의 실수 타입 컬럼
#  DESC 테이블, 레코드 추가, 조회,
CREATE TABLE my_table6
(
    name  varchar(10),
    price DEC(5, 2)
);
DESC my_table6;
INSERT INTO my_table6
    (name, price)
VALUES ('스위치', '12.34'); # ok
INSERT INTO my_table6
    (name, price)
VALUES ('one', 'two point three');
# x
# 수 타입에도 '' 사용 가능, 대신 변환할때 형식에 맞아야한다 ('one', 'two point three' 는 불가능)

SELECT *
FROM my_table6;


# 날짜시간
# DATE ; 날짜 (YYYY-MM-DD) 1000-01-01부터 9999-12-31까지 넣을 수 있다
# DATETIME ; 날짜시간 (YYYY-MM-DD HH:MM:SS)

CREATE TABLE my_table7
(
    col1 DATE,
    col2 DATETIME
);
DESC my_table7;
INSERT INTO my_table7(col1, col2)
VALUES ('2002-08-10', '1999-01-01 12:34:56');
SELECT *
FROM my_table7;

# todo; my_table8 에 두 컬럼(DATE, DATETIME) 정의하고
#  레코드 넣고, 조회
CREATE TABLE my_table8
(
    col1 DATE,
    col2 DATETIME
);
DESC my_table8;
INSERT INTO my_table8
    (col1, col2)
VALUES ('2024-04-24', '2020-02-02 12:34:56');
SELECT *
FROM my_table8;

CREATE TABLE my_table9
(
    string_col    VARCHAR(30),
    int_col       INT,
    dec_col       DEC(10, 2),
    date_col      DATE,
    date_time_col DATETIME
);
INSERT INTO my_table9
    (string_col, int_col, dec_col, date_col, date_time_col)
VALUES ('육수당', '12000', '54321.98', '2024-04-24', '2024-04-24 12:04:33');

DESC my_table9;
SELECT *
FROM my_table9;

CREATE TABLE my_table10
(
    title     VARCHAR(30),
    name      VARCHAR(30),
    age       INT,
    price     DEC(10, 3),
    published DATE,
    inserted  DATETIME
);
INSERT INTO my_table10
    (title, name, age, price, published, inserted)
VALUES ('이것이 자바다', '신용권', 40, 23422.223, '1999-09-09', '1999-10-10 12:33:12'),
       ('스프링 부트', '홍길동', 50, 2342.123, '2024-01-01', '2024-02-02 09:33:33');
SELECT *
FROM my_table10;
DESC my_table10;