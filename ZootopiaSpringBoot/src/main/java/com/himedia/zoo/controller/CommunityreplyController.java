package com.himedia.zoo.controller;

import com.himedia.zoo.dto.CommunityreplyVO;
import com.himedia.zoo.service.CommunityreplyService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CommunityreplyController {

    @Autowired
    CommunityreplyService crs;

    /*@PostMapping("/writeCommunityReply")
    public String writeCommunityReply(@ModelAttribute("dto")@Valid CommunityreplyVO crvo, HttpServletRequest request, BindingResult result, Model model)
        throws Exception {
        HttpSession session = request.getSession();
        MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");
        String url = "community/community_detail";
        if (loginUser == null) {
            return "redirect:/login";
        } else if (result.getFieldError("subject") != null)
            model.addAttribute("message", "제목을 입력하세요");
        else if (result.getFieldError("kind") != null)
            model.addAttribute("message", "주제를 선택하세요");
        else if (result.getFieldError("content") != null)
            model.addAttribute("message", "내용을 입력하세요");
        else {
            crs.writeCommunityReply(crvo);
            url = "redirect:/communityBoard";
        }
        return url;
    }*/

    @PostMapping("/viewCommunityReply")
    public String viewCommunityReply(ModelAndView mav, @Valid CommunityreplyVO vo, BindingResult result, HttpSession session) {}

}
