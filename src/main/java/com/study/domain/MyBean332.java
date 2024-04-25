package com.study.domain;

import lombok.Data;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
public class MyBean332 {
    private String stringCol; // VARCHAR
    private Integer intCol; // INT
    private Double decCol; // DEC
    // double은 우리가 사용하는 수를 근사값으로 저장한다
    // BigDecimal은 정확한 오류가 없는 수를 저장한다
    private LocalDate dateCol; // DATE
    private LocalDateTime dateTimeCol; // DATETIME
}
