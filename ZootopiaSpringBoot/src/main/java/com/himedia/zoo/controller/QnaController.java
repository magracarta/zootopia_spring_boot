package com.himedia.zoo.controller;

import com.himedia.zoo.dto.QnaDto;
import com.himedia.zoo.service.QnaService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;


@Controller
public class QnaController {


    @Autowired
    QnaService qs;

    @GetMapping("/QnaList")
    public ModelAndView QnaList(HttpServletRequest request ) {
        ModelAndView mav = new ModelAndView();
        HttpSession session = request.getSession();
            HashMap<String, Object> result = qs.getQnaList( request );
            List<QnaDto> list = (List<QnaDto>) result.get("QnaList");
            System.out.println(list.size());
            mav.addObject( "QnaList", result.get("QnaList") );
            mav.addObject( "paging", result.get("paging") );
            mav.addObject( "key", result.get("key") );
            mav.setViewName("qna/qnaList");

        return mav;
    }


}
