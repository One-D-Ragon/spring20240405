# 29nton.sql

# n to n : 다 대 다 관계
USE mydb1;
CREATE TABLE board
(
    id      INT PRIMARY KEY AUTO_INCREMENT,
    title   VARCHAR(20),
    content VARCHAR(20)
);
CREATE TABLE member
(
    id    INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(20),
    info  VARCHAR(20)
);

# 다대다 관계의 테이블의 중간테이블 생성
CREATE TABLE board_like
(
#     id INT PRIMARY KEY AUTO_INCREMENT
    board_id  INT REFERENCES board (id),  # 타입을 일치시켜야 한다
    member_id INT REFERENCES member (id), # 타입을 일치시켜야 한다
    PRIMARY KEY (board_id, member_id)
);
DROP TABLE board_like;
# 최소 2개의 컬럼이 있어야 한다
# 2개의 방법중 하나의 방법으로 PRIMARY KEY를 준다