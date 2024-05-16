package com.study.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/api/main42")
public class Controller42 {

    @GetMapping("sub1")
    @ResponseBody // return을 view로 해석하지 않음
    public String method1() {

        return "어떤 데이터";
        // 요청 본문을 payload에서 봤듯이 응답 본문은 response에서 볼 수 있다
    }

    @GetMapping("sub2")
    @ResponseBody
    public String method2() {

        double random = Math.random();
        String result = "";
        if (random < 1.0 / 3) {
            return "가위";
        } else if (random < 2.0 / 3) {
            return "바위";
        }
        return "보";
    }

    @GetMapping("sub3")
    @ResponseBody
    public Map<String, Object> method3() {

        // console과 network에서 확인
        return Map.of("name", "흥민",
                "age", 35,
                "married", true,
                "info", Map.of("team", "토트넘",
                        "location", "런던"),
                "item", List.of("축구공", "운동화", "유니폼"));
    }

    @GetMapping("sub4")
    @ResponseBody
    public Map<String, Object> method4() {

        return Map.of("name", "뚝배기불고기",
                "price", 10000,
                "taste", true,
                "info", Map.of("food1", "버섯",
                        "food2", "불고기"),
                "item", List.of("소세지", "깍두기", "쌈장"));

    }
}
