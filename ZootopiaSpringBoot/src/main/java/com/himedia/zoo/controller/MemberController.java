package com.himedia.zoo.controller;

import com.himedia.zoo.dto.MemberVO;
import com.himedia.zoo.service.MemberService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MemberController {
    @Autowired
    MemberService ms;

    @GetMapping("/loginForm")
    public String loginForm() {
        return "member/loginForm";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute("dto") MemberVO membervo,
                        HttpServletRequest request,
                        Model model) {
        String url ="member/loginForm";

        MemberVO mvo = ms.getMember(membervo.getUserid());
        System.out.println("membervo.getUserid() = "+ membervo.getUserid());
        System.out.println("membervo.getName() = "+ membervo.getName());
        if(mvo==null)
            model.addAttribute("message","아이디/비밀번호를 확인하세요");
        else if(!mvo.getPwd().equals(membervo.getPwd()))
            model.addAttribute("message", "아이디/비밀번호를 확인하세요");
        else if(mvo.getPwd().equals(membervo.getPwd())){
            HttpSession session = request.getSession();
            session.setAttribute("loginUser", mvo);
            url = "redirect:/";
        }
        return url;
    }


}
