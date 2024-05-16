package com.study.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Arrays;

@Controller
public class Controller40 {

    @GetMapping("/api/someurl")
    public void method1() {
        System.out.println("Controller40.method1");
    }

    @PostMapping("/api/someurl")
    public void method2() {
        System.out.println("Controller40.method2");
    }

    // get/post /api/someurl2
    @GetMapping("/api/someurl2")
    public void method3() {
        System.out.println("Controller40.method3 연습");
    }

    @PostMapping("/api/someurl2")
    public void method4() {
        System.out.println("Controller40.method4 연습");
    }

    @GetMapping("/api/someurl3")
    public void method5(@RequestParam("id") Integer id,
                        @RequestParam("name") String name,
                        @RequestParam("email") String eamil) {
        System.out.println("id = " + id);
        System.out.println("name = " + name);
        System.out.println("eamil = " + eamil);
    }

    @PostMapping("/api/someurl3")
    public void method6(@RequestParam("id") Integer id,
                        @RequestParam("city") String city,
                        @RequestParam("country") String country) {
        System.out.println("id = " + id);
        System.out.println("city = " + city);
        System.out.println("country = " + country);
    }

    // /api/someurl4, get/post 요청처리메소드 작성
    @GetMapping("/api/someurl4")
    public void method7(@RequestParam("name") String name,
                        @RequestParam("menu") String menu,
                        @RequestParam("price") Integer price) {
        System.out.println("name = " + name);
        System.out.println("menu = " + menu);
        System.out.println("price = " + price);
    }

    @PostMapping("/api/someurl4")
    public void method8(@RequestParam("name") String name,
                        @RequestParam("menu") String[] menu,
                        @RequestParam("price") Integer price) {
        System.out.println("name = " + name);
        System.out.println("Arrays.toString(menu) = " + Arrays.toString(menu));
        System.out.println("price = " + price);
    }
}
