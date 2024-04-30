# 44subQuery.sql

USE w3schools;
# JOIN의 장점은 속도가 빠르고 SubQuery의 장점은 읽기가 쉽다

# 1행1열 결과 (scalar)
SELECT AVG(Price)
FROM Products;

SELECT *
FROM Products
WHERE Price >= 28.866364;

SELECT *
FROM Products
WHERE Price >= (SELECT AVG(Price)
                FROM Products);

# todo : 1번 카테고리 상품의 평균가격보다 높은 2번 카테고리 상품명 조회
SELECT ProductName
FROM Products
WHERE Price > (SELECT AVG(Price) FROM Products WHERE CategoryID = 1)
  AND CategoryID = 2;

# 여러행 1열 결과
SELECT CustomerID
FROM Customers
WHERE Country = 'mexico';

# mexico 고객이 주문한 건들 조회
SELECT *
FROM Orders
WHERE CustomerID IN (2, 3, 13, 58, 80);

SELECT *
FROM Orders
WHERE CustomerID IN (SELECT CustomerID
                     FROM Customers
                     WHERE Country = 'mexico');

SELECT *
FROM Orders o
         JOIN Customers c
              ON o.CustomerID = c.CustomerID
WHERE c.Country = 'mexico';

# todo : 1번 카테고리 상품들이 주문된 날짜들 조회
SELECT *
FROM Products
WHERE CategoryID = 1;

SELECT OrderID
FROM OrderDetails
WHERE ProductID IN (1, 2, 24);

SELECT OrderDate
FROM Orders
WHERE OrderID IN (10245, 10255);

SELECT OrderDate
FROM Orders
WHERE OrderID IN (SELECT OrderID
                  FROM OrderDetails
                  WHERE ProductID IN (SELECT ProductID
                                      FROM Products
                                      WHERE CategoryID = 1));

SELECT o.OrderDate, p.ProductName
FROM Orders o
         JOIN OrderDetails od
              ON o.OrderID = od.OrderID
         JOIN Products p
              ON od.ProductID = p.ProductID
WHERE p.CategoryID = 1;
# 조인하면서 카테시안곱이 일어나서 레코드가 더 많이 남아있다


# 여려행 여러열 결과
SELECT City, Country
FROM Customers
WHERE CustomerID IN (1, 2);

SELECT CustomerName
FROM Customers
WHERE (City, Country) IN (('berlin', 'germany'),
                          ('México D.F.', 'mexico'));

SELECT CustomerName
FROM Customers
WHERE (City, Country) IN (SELECT City, Country
                          FROM Customers
                          WHERE CustomerID IN (1, 2));

SELECT CustomerID, CustomerName, City, Country
FROM Customers;

SELECT CustomerName, City
FROM (SELECT CustomerID, CustomerName, City, Country
      FROM Customers) AS miniCustomers;
# 특정 테이블 결과를 FROM절에 쓸 수 있다, 별칭을 작성해줘야 한다


# 상관서브쿼리(속도가 좀 느린편, 조인으로 해결할 수 있는 지 고민)
# 외부쿼리의 값이 내부 쿼리에 사용될 때
# SELECT, WHERE, FROM 절에 사용될 수 있어서 위치가 중요한 것이 아니다

# 각 고객의 주문 횟수
SELECT CustomerName,
       Country,
       (SELECT COUNT(OrderID)
        FROM Orders o
        WHERE o.CustomerID = c.CustomerID)
FROM Customers c;

SELECT CustomerName, Country, COUNT(OrderID)
FROM Customers c
         LEFT JOIN Orders o
                   ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID;


SELECT COUNT(OrderID)
FROM Orders
WHERE CustomerID = 5;

# todo : 상품별 총 매출금액
SELECT ProductName,
       (SELECT SUM(p.Price * od.Quantity)
        FROM OrderDetails od
        WHERE od.ProductID = p.ProductID) AS 매출액
FROM Products p;

SELECT ProductName,
       (SELECT SUM(od.Quantity)
        FROM OrderDetails od
        WHERE od.ProductID = p.ProductID) * p.Price AS 매출액
FROM Products p;


