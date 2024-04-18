package com.study.controller;

import com.study.domain.*;
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
@RequestMapping("main25")
public class Controller25 {

    @Autowired
    private DataSource dataSource;

    @RequestMapping("sub1")
    public void method1(@RequestParam(value = "name", required = false) String searchName, Model model) throws SQLException {
        var list = new ArrayList<MyBean251>();
        String sql = STR."""
                SELECT * 
                FROM Employees 
                WHERE LastName = '\{searchName}'
                """;

        Connection conn = dataSource.getConnection();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);

        try (conn; stmt; rs) {
            while (rs.next()) {
                String id = rs.getString(1);
                String lastName = rs.getString(2);
                String firstName = rs.getString(3);
                String birthDate = rs.getString(4);
                String photo = rs.getString(5);
                String notes = rs.getString(6);

                MyBean251 obj =
                        new MyBean251(id, lastName, firstName, birthDate, photo, notes);
                list.add(obj);
            }
        }
        model.addAttribute("employees", list);
    }

    @GetMapping("sub2")
    public void method2(@RequestParam(value = "name", required = false) String search, Model model) throws SQLException {
        // todo : name 요청 파라미터와 일치하는 상품명으로 상품(Products) 조회
        //  예) SELECT * FROM Products WHERE ProductName = 'Chais'
        var list = new ArrayList<MyBean252>();
        String sql = STR."""
                SELECT *
                FROM Products
                WHERE ProductName = '\{search}'
                """;
        Connection con = dataSource.getConnection();
        Statement stmt = con.createStatement(); // 사용자의 입력이 쿼리의 일부분으로 포함되면 사용하면 안된다
        // prepared statement : 사용자로부터 받은 입력을 set 메소드를 사용해서 넣어준다
        ResultSet rs = stmt.executeQuery(sql); // jdbc에서 데이터를 조회하면 결과값을 resulset에 저장한다?

        try (con; stmt; rs) {
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String unit = rs.getString(5);
                double price = rs.getDouble(6);
                // 데이터 타입에 맞게 get메소드 사용 가능

                MyBean252 obj = new MyBean252(id, name, unit, price);
                list.add(obj);
            }
        }
        model.addAttribute("products", list);
    }

    @GetMapping("sub3")
    public void method3(String search, Model model) throws SQLException {
        String sql = """
                SELECT *
                FROM Products
                WHERE ProductName = ?
                """;

        var list = new ArrayList<MyBean252>();
        Connection conn = dataSource.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        // 첫번째 파라미터: 물음표 위치
        // 두번째 파라미터: 넣을 값
        pstmt.setString(1, search); // ?에 들어가는 타입 String

        ResultSet rs = pstmt.executeQuery();
        while (rs.next()) {
            MyBean252 row = new MyBean252(rs.getInt(1), rs.getString(2), rs.getString(5), rs.getDouble(6));

            list.add(row);
        }
        model.addAttribute("products", list);
    }

    // todo : 고객 이름을 입력 받아서 고객 정보 조회
    //  sub4 메소드와 sub4.jsp 작성
    //  예) SELECT * FROM Customers WHERE CustomerName = ?
/*  내가 작성한 sub4, 수업을 위해 같은 내용 사용하기 위해서 주석 처리
    @GetMapping("sub4")
    public void method4(String name, Model model) throws SQLException {
        String sql = """
                SELECT *
                FROM Customers
                WHERE CustomerName = ?
                """;

        Connection conn = dataSource.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, name);
        ResultSet rs = pstmt.executeQuery();

        var list = new ArrayList<MyBean253>();

        try (conn; pstmt; rs) {
            while (rs.next()) {
                MyBean253 row = new MyBean253(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
                list.add(row);
            }
        }

        model.addAttribute("customers", list);

    }*/

    @GetMapping("sub4")
    public String method4(String search, Model model) throws SQLException {
        String sql = "SELECT * FROM Customers WHERE CustomerName = ?";
        var list = new ArrayList<MyBean254Customer>();

        Connection conn = dataSource.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, search);

        ResultSet rs = pstmt.executeQuery();

        try (rs; conn; pstmt) {

            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                String contactName = rs.getString(3);
                String address = rs.getString(4);
                String city = rs.getString(5);
                String postalCode = rs.getString(6);
                String country = rs.getString(7);

                MyBean254Customer obj = new MyBean254Customer();
                obj.setId(id);
                obj.setName(name);
                obj.setContactName(contactName);
                obj.setAddress(address);
                obj.setCity(city);
                obj.setPostalCode(postalCode);
                obj.setCountry(country);

                list.add(obj);
            }
        }
        model.addAttribute("customerList", list);
        model.addAttribute("prevSearch", search); // 인풋 요소에 작성한 내용 남기기(request param, model, session)

        return "main25/sub4CustomerList";
    }

    @GetMapping("sub5")
    public String method5(String search, Model model) throws SQLException {
        var list = new ArrayList<MyBean254Customer>();
        String sql = """
                SELECT * FROM Customers
                WHERE CustomerName LIKE ?
                """;
        String keyword = "%" + search + "%";

        Connection conn = dataSource.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, keyword);
        ResultSet rs = pstmt.executeQuery();

        while (rs.next()) {
            int id = rs.getInt(1);
            String name = rs.getString(2);
            String contactName = rs.getString(3);
            String address = rs.getString(4);
            String city = rs.getString(5);
            String postalCode = rs.getString(6);
            String country = rs.getString(7);

            MyBean254Customer obj = new MyBean254Customer();
            obj.setId(id);
            obj.setName(name);
            obj.setContactName(contactName);
            obj.setAddress(address);
            obj.setCity(city);
            obj.setPostalCode(postalCode);
            obj.setCountry(country);

            list.add(obj);
        }
        model.addAttribute("customerList", list);
        model.addAttribute("prevSearch", search);

        return "main25/sub4CustomerList";
    }

    // todo : 상품명으로 상품들 조회 메소드 작성
    @GetMapping("sub6")
    public void method6(String search, Model model) throws SQLException {
        var list = new ArrayList<MyBean256Product>();
        String sql = """
                SELECT * FROM Products
                WHERE ProductName LIKE ?
                """;

        String keyword = "%" + search + "%";

        Connection conn = dataSource.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, keyword);
        ResultSet rs = pstmt.executeQuery();

        try (conn; pstmt; rs) {
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2);
                int supplierId = rs.getInt(3);
                int categoryId = rs.getInt(4);
                String unit = rs.getString(5);
                double price = rs.getDouble(6);

                MyBean256Product row = new MyBean256Product();
                row.setId(id);
                row.setName(name);
                row.setSupplierId(supplierId);
                row.setCategoryId(categoryId);
                row.setUnit(unit);
                row.setPrice(price);
                list.add(row);
            }
        }
        model.addAttribute("products", list);
        model.addAttribute("prevSearch", search);
    }

    // 조회 문자열이 contactName 또는 customerName에 포함된 고객들 조회
    @GetMapping("sub7")
    public String method7(String search, Model model) throws SQLException {
        var list = new ArrayList<MyBean254Customer>();
        String sql = """
                SELECT *
                FROM Customers
                WHERE CustomerName LIKE ?
                OR ContactName LIKE ?
                """;
        String keyword = "%" + search + "%";
        Connection conn = dataSource.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, keyword);
        pstmt.setString(2, keyword);
        ResultSet rs = pstmt.executeQuery();
        try (rs; conn; pstmt; rs) {
            while (rs.next()) {
                MyBean254Customer row = new MyBean254Customer();
                row.setId(rs.getInt(1));
                row.setName(rs.getString(2));
                row.setContactName(rs.getString(3));
                row.setAddress(rs.getString(4));
                row.setCity(rs.getString(5));
                row.setPostalCode(rs.getString(6));
                row.setCountry(rs.getString(7));
                list.add(row);
            }
        }
        model.addAttribute("customerList", list);
        model.addAttribute("prevSearch", search);
        return "main25/sub4CustomerList";
    }

    // todo :
    //  조회 문자열이 last name 또는 first name에 포함된 직원들 조회 메소드 작성
    @GetMapping("sub8")
    public String method8(String search, Model model) throws SQLException {
        var list = new ArrayList<MyBean258Employee>();
        String sql = """
                SELECT *
                FROM Employees
                WHERE LastName LIKE ?
                OR FirstName LIKE ?
                """;

        String keyword = "%" + search + "%";
        Connection conn = dataSource.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        // pstmt.setString(1, keyword);
        pstmt.setString(1, "%" + search + "%");
        pstmt.setString(2, keyword);
        ResultSet rs = pstmt.executeQuery();

        try (conn; pstmt; rs) {
            while (rs.next()) {
                MyBean258Employee data = new MyBean258Employee();
                data.setId(rs.getInt(1));
                data.setLastName(rs.getString(2));
                data.setFirstName(rs.getString(3));
                data.setBirthDate(rs.getString(4));
                data.setPhoto(rs.getString(5));
                data.setNotes(rs.getString(6));

                list.add(data);
            }
        }
        model.addAttribute("employees", list);
        model.addAttribute("prevSearch", search); // 조회 창에 입력한 내용이 남음

        return "/main25/sub8EmployeeList";

    }

}
