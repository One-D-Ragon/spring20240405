package com.study.controller;

import com.study.domain.MyBean254Customer;
import com.study.domain.MyBean258Employee;
import com.study.mapper.Mapper02;
import com.study.mapper.Mapper03;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequiredArgsConstructor
@RequestMapping("main32")
public class Controller32 {

    private final Mapper03 mapper;
    private final Mapper02 mapper02;

    @RequestMapping("sub1")
    public void method1() {
        int rowCount = mapper.deleteOneCustomer();
        System.out.println(rowCount + "명 고객 삭제됨");
    }

    // main32/sub2?cid=5
    @RequestMapping("sub2")
    public void method2(Integer cid) {
        int rowCount = mapper.deleteOneCustomerById(cid);
        System.out.println(rowCount + "명 고객 삭제됨");
    }
    /* @RequestMapping("sub2")
    public void method2() {
        int rowCount = mapper.deleteOneCustomerById(4);
        System.out.println(rowCount + "명 고객 삭제됨");
    } */

    // todo ;
    //  /main32/sub3?eid=2
    //  2번 직원 삭제하는 메소드와 mapper에 메소드 작성하기
    @GetMapping("sub3")
    public void method3(Integer eid) {
        int rowCount = mapper.deleteOneEmployeeById(eid);
        System.out.println(rowCount + "명 직원 삭제됨");
    }

    // name=흥민&contactName=캡틴&city=런던&country=한국&address=토트넘
    // /main32/sub4?name=흥민&contactName=캡틴&city=런던&country=한국&address=토트넘
    @GetMapping("sub4")
    public void method4(MyBean254Customer customer) {
        mapper.insertCustomer(customer);
    }

    // todo : 직원 입력 코드 작성해보기
    // /main32/sub5?lastName=김&firstName=민재&birthDate=19960305&photo=aasd.jpeg&notes=bayen munchen
    @GetMapping("sub5")
    public void method5(MyBean258Employee employee) {
        mapper.insertEmployee(employee);
    }

/*    @PostMapping("sub5")
    public String method6(MyBean258Employee employee, RedirectAttributes rttr) {
        int rows = mapper.insertEmployee(employee);

        if (rows > 0) {
            rttr.addFlashAttribute("message", rows + "명 직원이 입력되었습니다");
        } else {
            rttr.addFlashAttribute("message", "입력되지 않았습니다.");
        }
        return "redirect:/main32/sub5";
    }
*/

    @GetMapping("sub6")
    public void method6(@RequestParam(value = "id", required = false) Integer eid, Model model) {
        if (eid != null) {
            MyBean258Employee e = mapper02.selectOneEmployee2(eid);
            model.addAttribute("employee", e);
        }
    }

    @PostMapping("sub6/update")
    public String method7(MyBean258Employee employee, RedirectAttributes rttr) {
        int i = mapper.updateEmployee(employee);

        if (i > 0) {
            rttr.addFlashAttribute("message", i + "명 직원이 입력되었습니다");
        } else {
            rttr.addFlashAttribute("message", "입력되지 않았습니다.");
        }

        rttr.addAttribute("id", employee.getId());
        return "redirect:/main32/sub6";
    }

    // todo; 고객 조회 후 수정
    // /main32/sub7
    // /main32/sub7?id=3
    @GetMapping("sub7")
    public void method8(@RequestParam(value = "id", required = false) Integer cid, Model model) {
        if (cid != null) {
            MyBean254Customer c = mapper02.selectOneCustomer4(cid);
            // 이전에는 직접 작성했지만 mybatis를 배운후에는 mybatis에게 일을 시킴

            model.addAttribute("customer", c);
        }
    }

    @PostMapping("sub7/update")
    public String method9(MyBean254Customer customer, RedirectAttributes rttr) {
        int c = mapper.updateCustomer(customer);
        if (c > 0) {
//            rttr.addFlashAttribute("message", customer.getId() + "번 고객이 수정되었습니다.");
            rttr.addFlashAttribute("message", c + "명 직원이 입력되었습니다");
        } else {
            rttr.addFlashAttribute("message", "수정되지 않았습니다.");
        }

        rttr.addAttribute("id", customer.getId()); // 2번째 요청에 쿼리스트링이 붙음
        return "redirect:/main32/sub7"; // 브라우저의 f12에서 update의 Response Header의 302응답은 리다이렉트 응답
    }
}
