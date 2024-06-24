package com.himedia.zoo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ContestConroller {
    @GetMapping("/")
    public String home() {
        return "index";
    }
}
