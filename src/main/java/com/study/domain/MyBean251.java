package com.study.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class MyBean251 {
    private String id;
    private String lastName;
    private String firstName;
    private String birthDate;
    private String photo;
    private String notes;

//    public MyBean251(String id, String lastName, String firstName, String birthData, String photo, String notes) {
//        this.id = id;
//        this.lastName = lastName;
//        this.firstName = firstName;
//        this.birthData = birthData;
//        this.photo = photo;
//        this.notes = notes;
//    }
}
