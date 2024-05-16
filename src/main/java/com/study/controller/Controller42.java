package com.study.controller;

import com.study.domain.MyBean411;
import com.study.domain.MyBean412;
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

    @GetMapping("sub5")
    @ResponseBody
    public MyBean411 method5() {
        MyBean411 obj = new MyBean411();
        obj.setName("이강인");
        obj.setAge(55);

        // json으로 직렬화 할 때 프로퍼티는 get 메소드에 의해 결정된다
        return obj; // json으로 직렬화
    }

    @GetMapping("sub6")
    @ResponseBody
    public MyBean412 method6() {
        // 강사님 mybean 참고
        MyBean412 myBean412 = new MyBean412();
        myBean412.setPosition(List.of("감자", "고구마"));
        myBean412.setName("흥민");
        myBean412.setAge(177);
        myBean412.setMarried(false);
        MyBean411 myBean411 = new MyBean411();
        myBean411.setName("흥민");
        myBean411.setAge(55);

        return myBean412;
    }
}
