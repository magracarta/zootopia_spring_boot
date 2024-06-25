package com.himedia.zoo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {


    @GetMapping("/")
    public ModelAndView index() {
        ModelAndView mav = new ModelAndView();

        mav.setViewName("main");
        return mav;
    }

}
