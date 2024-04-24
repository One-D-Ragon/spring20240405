package com.study.core;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Component;

@SpringBootApplication
public class Application16 {
    public static void main(String[] args) {
        BeanFactory factory = SpringApplication.run(Application16.class, args);
        MyClass161 bean = factory.getBean(MyClass161.class);
        bean.action();
    }
}

@Component
@RequiredArgsConstructor
class MyClass161 {
    private final MyInterface161 field;

    public void action() {
        field.someMethod();
    }
}

interface MyInterface161 {
    public void someMethod();
}
// 인터페이스를 통해 dependency만 잘 작성해주면 신경쓰지않고 bean 작성 가능
// 클래스를 바꿔서 주입할때 Component 어노테이션만 잘 바꿔주면 된다
// 어떤 클래스를 가지고 bean을 만들건지만
// 클래스 변경의 영향없이 인터페이스로 작성

@Component
class MyClass163 implements MyInterface161 {
    public void someMethod() {
        System.out.println("some action22222");
    }
}

//@Component
class MyClass162 implements MyInterface161 {
    public void someMethod() {
        System.out.println("some action11111111");
    }
}