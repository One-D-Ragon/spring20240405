package com.study.domain;

import lombok.Data;

import java.util.List;
import java.util.Map;

@Data
public class MyBean412 {
    private String name;
    private Integer age;
    private Boolean married;
    //    private String[] position;
    private List<String> position;
    //    private Object team;
//    private MyBean411 team;
    private Map<String, Object> team;
    private Integer price;
}
