package com.study.domain;

import lombok.Data;

// getter, setter, toString, equals, hashCode 메소드 재정의해줌
// 필수 필드를 세팅하는 생성자
@Data
public class MyBean142 {
    private String id;
    private String name;
    private Integer age;
}

// final 필드를 생성하면 생성자에서 꼭 한번 값을 입력해야한다
