# 13insert.sql

USE w3schools;

# INSERT INTO 테이블명 (컬럼명...)
# VALUES (데이터들..) # VALUE 하나의 행, VALUES 하나 또는 그 이상의 행

SELECT *
FROM Employees
ORDER BY EmployeeID DESC;

INSERT INTO Employees (LastName)
VALUES ('ironman');

INSERT INTO Employees(FirstName)
VALUES ('tony');

INSERT INTO Employees(LastName, FIrstName, BirthDate, Photo, Notes)
VALUES ('captain', 'steve', '1990-01-01', 'pic1', 'america');

INSERT INTO Employees(FirstName, LastName)
VALUES ('natasha', 'widow');

# todo : 새 고객을 2개 입력하세요.
DESC Customers;
INSERT INTO Customers(CustomerName, ContactName)
VALUES ('hi', 'bye');

INSERT INTO Customers(CustomerName, ContactName)
VALUES ('hello', 'buy');

SELECT *
FROM Customers
ORDER BY CustomerID DESC;

# null : 값이 없음


SELECT *
FROM Employees
ORDER BY EmployeeID DESC;