#09orderBy.sql
USE w3schools;

# order by : 조회 순서 결정
# order by 컬럼명
SELECT *
FROM Products
ORDER BY ProductID;

# ASC (기본값) 오름차순
SELECT *
FROM Products
ORDER BY price ASC;

# DESC : 내림 차순
SELECT *
FROM Products
ORDER BY Price DESC;

# 여러 컬럼 기준
SELECT *
FROM Products
ORDER BY CategoryID, Price, ProductName;

SELECT *
FROM Products
ORDER BY CategoryID ASC, Price DESC;

# 컬럼명 대신 컬럼 index
SELECT *
FROM Products
ORDER BY 4, 6;
#CategoryID가 4번째 열

# SELECT 에 명시한 컬럼명의 순서를 따라야 함
SELECT ProductName, CategoryID, Price, Unit
FROM Products
ORDER BY 2, 3;
-- ORDER BY CategoryID, Price;

# todo : 나이가 많은 직원부터 나이가 적은 직원순으로 직원 조회
SELECT *
FROM Employees
ORDER BY BirthDate ASC;

# todo : 국가명, 도시명 순으로 고객 조회
SELECT *
FROM Customers
ORDER BY Country, City;

# todo : 도시명 순으로 공급자 조회
SELECT *
FROM Suppliers
ORDER BY City;

# todo : First Name의 역순으로 직원 조회
SELECT *
FROM Employees
ORDER BY FirstName DESC;
