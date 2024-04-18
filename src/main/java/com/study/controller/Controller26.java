package com.study.controller;

import com.study.domain.MyBean254Customer;
import com.study.domain.MyBean256Product;
import com.study.domain.MyBean261Order;
import com.study.domain.MyBean263Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;

@Controller
@RequestMapping("main26")
public class Controller26 {

    @Autowired
    private DataSource dataSource;

    @GetMapping("sub1")
    public String sub1(String start, String end, Model model) throws SQLException {
        var list = new ArrayList<MyBean261Order>();
        String sql = """
                SELECT *
                FROM Orders
                WHERE OrderDate BETWEEN ? AND ?
                """;


        Connection conn = dataSource.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, start);
        pstmt.setString(2, end);
        ResultSet rs = pstmt.executeQuery();

        try (conn; pstmt; rs) {
            while (rs.next()) {
                MyBean261Order data = new MyBean261Order();

                data.setId(rs.getInt(1));
                data.setCustomerId(rs.getInt(2));
                data.setEmployeeId(rs.getInt(3));
                data.setDate(rs.getString(4));
                data.setShipperId(rs.getInt(5));

                list.add(data);
            }
        }
        model.addAttribute("orderList", list);
        model.addAttribute("prevStart", start);
        model.addAttribute("prevEnd", end);

        return "main26/sub1OrderList";
    }

    @GetMapping("sub2")
    public String method2(String[] country, Model model) throws Exception {
        Connection conn = dataSource.getConnection();

        if (country != null && country.length > 0) {
            String questionMarks = "";
            for (int i = 0; i < country.length; i++) {
                questionMarks = questionMarks + "?";
                if (i != country.length - 1) {
                    questionMarks = questionMarks + ",";
                }
            }
            String customerSql = STR."""
                SELECT *
                FROM Customers
                WHERE Country IN (\{questionMarks})
                """;

            var customerList = new ArrayList<MyBean254Customer>();
            PreparedStatement pstmt = conn.prepareStatement(customerSql);
            for (int i = 0; i < country.length; i++) {
                pstmt.setString((i + 1), country[i]);
            }
            ResultSet resultSet = pstmt.executeQuery();
            try (pstmt; resultSet) {

                while (resultSet.next()) {
                    MyBean254Customer data = new MyBean254Customer();
                    data.setId(resultSet.getInt(1));
                    data.setName(resultSet.getString(2));
                    data.setContactName(resultSet.getString(3));
                    data.setAddress(resultSet.getString(4));
                    data.setCity(resultSet.getString(5));
                    data.setPostalCode(resultSet.getString(6));
                    data.setCountry(resultSet.getString(7));
                    customerList.add(data);
                }
                model.addAttribute("customerList", customerList);
            }
        }

        String sql = """
                SELECT DISTINCT Country
                FROM Customers
                """;
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        var countryList = new ArrayList<String>();

        try (stmt; rs) {
            while (rs.next()) {
                countryList.add(rs.getString(1));
            }
            model.addAttribute("countryList", countryList);
        }

        return "/main25/sub4CustomerList";
    }

    // todo : 상품 조회 결과가 카테고리, 가격순으로 조회 되도록 코드 수정
    @GetMapping("sub3")
    public String method3(@RequestParam(value = "category", required = false) String[] categorySelect, Model model) throws Exception {
        Connection conn = dataSource.getConnection();

        if (categorySelect != null && categorySelect.length > 0) {
            String questionMarks = "";
            for (int i = 0; i < categorySelect.length; i++) {
                questionMarks = questionMarks + "?";
                if (i != categorySelect.length - 1) {
                    questionMarks = questionMarks + ",";
                }
            }

            String productSql = STR."""
                    SELECT *
                    FROM Products
                    WHERE CategoryID IN (\{questionMarks})
                    ORDER BY CategoryID, Price
                    """;

            PreparedStatement pstmt = conn.prepareStatement(productSql);
//            pstmt.setString(1, categorySelect[0]);
//            pstmt.setString(2, categorySelect[1]);
//            pstmt.setString(3, categorySelect[2]); // 배열의 길이에 따라 달라진다
            for (int i = 0; i < categorySelect.length; i++) {
                pstmt.setString((i + 1), categorySelect[i]);
            }

            ResultSet resultSet = pstmt.executeQuery();

            var productList = new ArrayList<MyBean256Product>();
            try (pstmt; resultSet) {
                while (resultSet.next()) {
                    MyBean256Product data = new MyBean256Product();
                    data.setId(resultSet.getInt(1));
                    data.setName(resultSet.getString(2));
                    data.setSupplierId(resultSet.getInt(3));
                    data.setCategoryId(resultSet.getInt(4));
                    data.setUnit(resultSet.getString(5));
                    data.setPrice(resultSet.getDouble(6));
                    productList.add(data);
                }
                model.addAttribute("prevCategorySelect", categorySelect);
                model.addAttribute("products", productList);
            }
        }

        String categorySql = """
                SELECT *
                FROM Categories
                """;

        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(categorySql);
        var categoryList = new ArrayList<MyBean263Category>();
        try (rs; stmt;) {
            while (rs.next()) {
                MyBean263Category category = new MyBean263Category();
                category.setId(rs.getInt(1));
                category.setName(rs.getString(2));

                categoryList.add(category);
            }
            model.addAttribute("categoryList", categoryList);
        }


        return "main25/sub6ProductList";
    }

}
