package com.study.domain;

public class MyBean092 {
    private String name;
    private Integer age;
    // 필드명이 property명이 될 확률이 높다
    // 그러나 property는 필드명에 의해서 결정되는 것은 아니다

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }
}
