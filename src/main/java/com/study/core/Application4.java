package com.study.core;

import lombok.Getter;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Component;

@SpringBootApplication // 속해 있는 패키지와 하위 패키지를 전부 탐색해서 bean을 만듬
public class Application4 {
    public static void main(String[] args) {
        BeanFactory factory = SpringApplication.run(Application4.class, args);
        // BeanFactory를 리턴함
        MyClass41 b1 = factory.getBean(MyClass41.class);
        // getBean으로 객체를 확인할 수 있음
        MyClass42 b2 = factory.getBean(MyClass42.class);
        System.out.println("b1 = " + b1);
        System.out.println("b2 = " + b2);

        MyClass41 b3 = factory.getBean(MyClass41.class);
        System.out.println("b3 = " + b3); // 객체를 하나만 만듦(Singleton)

        MyClass41 obj = b2.getObj();
        System.out.println("obj = " + obj);
    }
}

@Component
class MyClass41 {
}

@Component
@Getter
class MyClass42 {
    // Dependency Injection (DI)
    @Autowired
    private MyClass41 obj;
    // MyClass42는 MyClass41을 의존한다(dependency)
}
