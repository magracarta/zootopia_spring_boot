package com.himedia.zoo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class ContestConroller {


    @GetMapping("/")
    public String home() {
        return "main";
    }

    @GetMapping("/contestlist")
    public String contestlist() {
        return "contest/contest_board";
    }

    @GetMapping("/contestdetail")
    public String contestdetail() {
        return "contest/contestDetail";
    }
}
