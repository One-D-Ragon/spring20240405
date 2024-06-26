package com.study.mapper;

import com.study.domain.MyBean254Customer;
import com.study.domain.MyBean258Employee;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface Mapper03 {

    @Delete("""
            DELETE FROM Customers
            WHERE CustomerId = 1
            """)
    int deleteOneCustomer(); // 리턴이 필요없다

    @Delete("""
            DELETE FROM Customers
            WHERE CustomerId = #{id}
            """)
    int deleteOneCustomerById(int id);

    @Delete("""
            DELETE FROM Employees
            WHERE EmployeeId = #{id}
            """)
    int deleteOneEmployeeById(Integer id);

    @Insert("""
            INSERT INTO Customers
            (CustomerName, ContactName, Address, City, PostalCode, Country)
            VALUES 
            (#{name}, #{contactName}, #{address}, #{city}, #{postalCode}, #{country})
            """)
        // get 메소드를 이용해서 mybatist가 순서에 맞게 값을 넣어준다
    int insertCustomer(MyBean254Customer customer);

    @Insert("""
            INSERT INTO Employees
            (LastName, FirstName, BirthDate, Photo, Notes)
            VALUES
            (#{lastName}, #{firstName}, #{birthDate}, #{photo}, #{notes})
            """)
    int insertEmployee(MyBean258Employee employee);

    @Update("""
            UPDATE Employees
            SET
                LastName = #{lastName},
                FirstName = #{firstName},
                Photo = #{photo},
                Notes = #{notes},
                BirthDate = #{birthDate}
            WHERE
                EmployeeId = #{id}
            """)
    int updateEmployee(MyBean258Employee employee);

    @Update("""
            UPDATE Customers
            SET
                CustomerName = #{name},
                ContactName = #{contactName},
                Address = #{address},
                City = #{city},
                Country = #{country},
                PostalCode = #{postalCode}
            WHERE
                CustomerId = #{id}
            """)
    int updateCustomer(MyBean254Customer customer);
    // 프로퍼티를 이용해서 값을 셋팅해준다
}
