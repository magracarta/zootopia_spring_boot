package com.himedia.zoo.webcontroller;

import com.himedia.zoo.service.ContestService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;

@RestController
public class ContestWebController {
    @Autowired
    ContestService cs;

    @GetMapping("/contestBoard") // URL 경로명이 contestBoard로 수정됨
    public HashMap<String, Object> contestBoard(@RequestParam("category") String ctg,
            @RequestParam("pagenum") int pagenum , @RequestParam("search") String search
            , HttpServletRequest request) {
        HttpSession session = request.getSession();
        String category = "all" ;
        if(ctg!= null) {
            category = ctg;
            session.setAttribute("category", category);
        }else if ( session.getAttribute("category") != null ) {
            category = (String) session.getAttribute("category");
        }else if(ctg == null && session.getAttribute("category") == null) category = "all" ;


        HashMap<String, Object> list = cs.listBoard(ctg, pagenum , search);


        list.put("text", "text");
        list.put("category", category);
        return list;
    }

}
