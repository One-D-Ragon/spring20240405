package com.study.mapper;

import lombok.Data;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface Mapper05 {

    @Data
    static class EmployeeIncome {
        private Integer employeeId;
        private String lastName;
        private String firstName;
        private Double income;
    }

    @Select("""
            SELECT e.EmployeeID,
                   e.LastName,
                   e.FirstName,
                   SUM(od.Quantity * p.Price) AS income
            FROM Orders o JOIN Employees e ON o.EmployeeID = e.EmployeeID
                          JOIN OrderDetails od ON o.OrderID = od.OrderID
                          JOIN Products p ON od.ProductID = p.ProductID
            WHERE o.OrderDate BETWEEN #{from} AND #{to}
            GROUP BY e.EmployeeID
            ORDER BY income DESC
            """)
    List<EmployeeIncome> selectIncomeList(String from, String to);

    @Data
    public class customerAmount {
        private Integer customerId;
        private String customerName;
        private Double amount;
    }

    @Select("""
            SELECT c.CustomerID,
                   c.CustomerName,
                   SUM(od.Quantity * p.Price) AS amount
            FROM Orders o JOIN Customers c ON o.CustomerID = c.CustomerID
                          JOIN OrderDetails od ON o.OrderID = od.OrderID
                          JOIN Products p ON od.ProductID = p.ProductID
            WHERE o.OrderDate BETWEEN #{from} AND #{to}
            GROUP BY c.CustomerID
            ORDER BY amount DESC
            """)
    List<customerAmount> selectAmountList(String from, String to);
}
