#12page.sql

USE w3schools;

INSERT INTO Customers
    (CustomerName, ContactName, Address, City, PostalCode, Country)
SELECT CustomerName, ContactName, Address, City, PostalCode, Country
FROM Customers;

SELECT COUNT(*)
FROM Customers;

# 추가한 데이터 삭제
SELECT *
FROM Customers
LIMIT 364;

DELETE
FROM Customers
WHERE CustomerID > 400;
한
페이지에 10개씩 보여줄 때
# (n-1) / 10 + 1

# 직원 테이블 데이터 추가
INSERT INTO Employees
    (LastName, FirstName, BirthDate, Photo, Notes)
SELECT LastName, FirstName, BirthDate, Photo, Notes
FROM Employees;

SELECT EmployeeID
FROM Employees
LIMIT 368;

DELETE
FROM Employees
WHERE EmployeeID > 580;

SELECT COUNT(*)
FROM Employees;
