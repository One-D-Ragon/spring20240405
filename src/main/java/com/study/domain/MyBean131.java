package com.study.domain;

public class MyBean131 {
    private String address;
    private String city;
    private Integer age;

    // 필드에 의해서 get, set 메소드가 생성되지만 property는 필드와 관계가 없다
    // get, set 메소드가 있어야 property가 생긴다
    // 필드가 있다고 property도 있는게 아니다

    public MyBean131() {
    }

    public MyBean131(String address, String city, Integer age) {
        this.address = address;
        this.city = city;
        this.age = age;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }
}
