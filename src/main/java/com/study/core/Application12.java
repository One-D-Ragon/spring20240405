package com.study.core;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Component;

@SpringBootApplication
public class Application12 {
    public static void main(String[] args) {
        BeanFactory bf = SpringApplication.run(Application12.class, args);
        MyClass122 bean = bf.getBean(MyClass122.class);
        MyClass121 field = bean.getField();
        System.out.println("field = " + field);
    }
}

@Component
class MyClass121 {
}

@Component
@Getter
@RequiredArgsConstructor // final 필드를 파라미터로 받는 생성자를 만들어준다.
class MyClass122 {
    private final MyClass121 field;
    // final이 붙으면 기본 생성자 생성 불가

    // @Autowired
/*  // final이 붙으면 생성자를 꼭 만들어줘야한다
    MyClass122(MyClass121 field) {
      this.field = field;
    }*/
}