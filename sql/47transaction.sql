# 47transaction

# TRANSACTION : 하나의 업무 단위
USE mydb2;
CREATE TABLE bank
(
    name  VARCHAR(3) PRIMARY KEY,
    money INT NOT NULL
);

INSERT INTO bank
VALUES ('흥민', 10000),
       ('강인', 10000);

SELECT *
FROM bank;

# 강인이 흥민에게 500원 송금
UPDATE bank
SET money = money - 500
WHERE name = '강인';
UPDATE bank
SET money = money + 500
WHERE name = '흥민';

# 여러 sql(하나의 transaction)이 한번에 모두 성공하거나 모두 실패하거나
# 트랜잭션 시작중에는 다른 연결에서 트랜잭션 이전의 값이 보인다
# Service에서 사용 (하나의 메소드 단위마다)

# Transaction(업무) 시작
START TRANSACTION;
# 모두 성공(반영)
COMMIT;

# Transaction(업무) 시작
START TRANSACTION;
# 모두 실패(반영하지 않음, 트랜잭션 시작 전으로 돌림)
ROLLBACK;