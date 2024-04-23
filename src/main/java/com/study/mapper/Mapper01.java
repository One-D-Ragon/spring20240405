package com.study.mapper;

import com.study.domain.MyBean254Customer;
import org.springframework.stereotype.Component;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

// Inversion Of Control (IOC)
@Component
public class Mapper01 {

    public MyBean254Customer getCustomerById(Integer id) throws Exception {
        // connection
        // preparedStatement
        // resultSet
        // 객체 만들고
        // 리턴

        if (id != null) {
            String sql = """
                    SELECT *
                    FROM Customers
                    WHERE CustomerId = ?
                    """;
            Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/w3schools", "root", "1234");
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

                    return c;
                }
            }

        }
        return null;
    }
}
