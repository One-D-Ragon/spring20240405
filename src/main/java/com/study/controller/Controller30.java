package com.study.controller;

import com.study.domain.MyBean254Customer;
import com.study.domain.MyBean258Employee;
import com.study.mapper.Mapper01;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@Controller // @Controller 안에 @Component가 포함된다
@RequestMapping("main30")
public class Controller30 {

    @Autowired
    private DataSource dataSource;

    // 직접 만든 객체(dependency)
//    private Mapper01 mapper = new Mapper01();

    // Inversion Of Control (IOC) -> 제어를 스프링에게 넘김
    // Dependency Injection (DI)
    @Autowired
    private Mapper01 mapper;


    @GetMapping("sub1")
    public void method1(Integer id, Model model) throws Exception {
        MyBean254Customer c = mapper.getCustomerById(id);
        model.addAttribute("customer", c);

/*        if (id != null) {
            String sql = """
                    SELECT *
                    FROM Customers
                    WHERE CustomerId = ?
                    """;
            Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            try (rs; pstmt; conn) {
                if (rs.next()) {
                    // id는 하나 밖에 없어서 while이 아니라 if로 해도 된다
                    MyBean254Customer c = new MyBean254Customer();
                    c.setId(rs.getInt(1)); // 첫번째 컬럼에 있는것
                    c.setName(rs.getString(2));
                    c.setContactName(rs.getString(3));
                    c.setAddress(rs.getString(4));
                    c.setCity(rs.getString(5));
                    c.setPostalCode(rs.getString(6));
                    c.setCountry(rs.getString(7));

                    model.addAttribute("customer", c);
                }
            }

        }*/
    }

    @PostMapping("sub1/update")
    public String update1(MyBean254Customer customer, RedirectAttributes rttr) throws SQLException {
        System.out.println(customer);
        String sql = """
                UPDATE Customers
                SET CustomerName = ?,
                    ContactName = ?,
                    Address = ?,
                    City = ?,
                    PostalCode = ?,
                    Country = ?
                WHERE CustomerID = ?
                """;

        Connection conn = dataSource.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);
        try (conn; pstmt) {

            pstmt.setString(1, customer.getName());
            pstmt.setString(2, customer.getContactName());
            pstmt.setString(3, customer.getAddress());
            pstmt.setString(4, customer.getCity());
            pstmt.setString(5, customer.getPostalCode());
            pstmt.setString(6, customer.getCountry());
            pstmt.setInt(7, customer.getId());

            int rowCount = pstmt.executeUpdate();
            if (rowCount > 0) {
                rttr.addFlashAttribute("message", customer.getId() + "번 고객이 수정되었습니다.");
            } else {
                rttr.addFlashAttribute("message", "수정되지 않았습니다.");
            }
        }

        rttr.addAttribute("id", customer.getId());
        return "redirect:/main30/sub1";
//        return "redirect:/main30/sub1?id=" + customer.getId();
    }

    // todo : 직원 조회 및 수정
    @GetMapping("sub2")
    public void method3(Integer id, Model model) throws SQLException {
        if (id != null) {
            String sql = """
                    SELECT *
                    FROM Employees
                    WHERE EmployeeId = ?
                    """;

            Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();

            try (conn; pstmt; rs) {
                if (rs.next()) {
                    MyBean258Employee e = new MyBean258Employee();
                    e.setId(rs.getInt(1));
                    e.setLastName(rs.getString(2));
                    e.setFirstName(rs.getString(3));
                    e.setBirthDate(rs.getString(4));
                    e.setPhoto(rs.getString(5));
                    e.setNotes(rs.getString(6));

                    model.addAttribute("employee", e);
                }
            }

        }

    }

    @PostMapping("sub2/update")
    public String update2(MyBean258Employee employee, RedirectAttributes rttr) throws SQLException {
        String sql = """
                UPDATE Employees
                SET LastName = ?,
                    FirstName = ?,
                    BirthDate = ?,
                    Photo = ?,
                    Notes = ?
                WHERE EmployeeId = ?
                """;
        Connection conn = dataSource.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(sql);

        try (conn; pstmt) {
            pstmt.setString(1, employee.getLastName());
            pstmt.setString(2, employee.getFirstName());
            pstmt.setString(3, employee.getBirthDate());
            pstmt.setString(4, employee.getPhoto());
            pstmt.setString(5, employee.getNotes());
            pstmt.setInt(6, employee.getId());

            int rowCount = pstmt.executeUpdate();
            if (rowCount > 0) {
                rttr.addFlashAttribute("message", employee.getId() + "번의 직원 정보가 수정되었습니다.");
            } else {
                rttr.addFlashAttribute("message", "수정되지 않았습니다.");
            }
        }

        rttr.addAttribute("id", employee.getId());
        return "redirect:/main30/sub2";
    }

}
