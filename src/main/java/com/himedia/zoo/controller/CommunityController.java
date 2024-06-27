package com.himedia.zoo.controller;

import com.himedia.zoo.dto.CommunityVO;
import com.himedia.zoo.service.CommunityService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
 
@Controller
public class CommunityController {

    @Autowired
    CommunityService cs;

    @GetMapping("/communityBoard")
    public String communityBoard(HttpServletRequest request, HttpSession session, CommunityVO vo, Model model) {
        HashMap<String, Object> result = cs.getcommunityBoard(request);
        List<CommunityVO> list = (List<CommunityVO>) result.get("communityList");
        System.out.println(list.size());
        model.addAttribute("communityList", result.get("communityList"));
        model.addAttribute("paging", result.get("paging"));
        model.addAttribute("key", result.get("key"));

        return "community/community_board";
    }

    @GetMapping("/writeCommunityForm")
    public String writeCommunityForm( HttpServletRequest request, Model model) {
        String kindList[] = { "고민", "자랑", "잡담" };
        model.addAttribute("kindList", kindList);
        return "community/community_write";
    }

    /*@PostMapping("/writeCommunity")
    public String writeCommunity(@ModelAttribute("dto") @Valid CommunityVO communityvo,
                                 BindingResult result, Model model, HttpServletRequest request ){
        String url = "community/community_write";
        String kindList[] = { "고민", "자랑", "잡담"};
        HttpSession session = request.getSession();
        CommunityVO loginUser = (MemberVO) session.getAttribute("loginUser");
        if( loginUser == null ) {
            return "redirect:/login";
        }else
            model.addAttribute("kindList", kindList);
        if( result.getFieldError("subject") != null)
            model.addAttribute("message", "제목을 입력하세요");
        else if( result.getFieldError("kind") != null)
            model.addAttribute("message", "주제를 선택하세요");
        else if( result.getFieldError("content") != null)
            model.addAttribute("message", "내용을 입력하세요");
        else{
            cs.insertCommunity(communityvo);
            url = "redirect:/communityBoard";
        }
        return url;
    }*/ //membervo 없어서 닫아둠

    @GetMapping("/communityDetail")
    public ModelAndView communityDetail( @RequestParam("gseq") int gseq ) {
        ModelAndView mav = new ModelAndView();
        mav.addObject( "communityVO", cs.getCommunity(gseq) );
        mav.setViewName("community/community_detail");
        return mav;
    }

    @PostMapping("/deleteCommunity")
    public String deleteCommunity(HttpServletRequest request, Model model, @RequestParam("gseq") int gseq) {
        HttpSession session = request.getSession();
        if(session.getAttribute("loginUser") == null) {
            return "member/loginForm";
        }else
            cs.deleteBoard(gseq);
        return "redirect:/community_board;";
    }

    @PostMapping("/communityViewCount")
    @ResponseBody
    public String increaseViewCount(@RequestParam("gseq") int gseq) {
        cs.increaseViewCount(gseq);
        return "View count increased successfully for post with gseq: " + gseq;
    }

    @PostMapping("/updateCommunityForm")
    public ModelAndView updateCommunityForm(@RequestParam("gseq") int gseq) {
        ModelAndView mav = new ModelAndView();
        mav.addObject("communityVO", cs.getCommunity(gseq)); // communityService에서 게시글 정보 가져오기
        mav.setViewName("community/community_update"); // 수정 폼의 JSP 페이지 이름
        return mav;
    }

    @PostMapping("/updateCommunity")
    public String updateCommunity(@RequestParam("gseq") int gseq) {
        cs.updateCommunity(gseq); // 게시글 업데이트 서비스 호출
        return "redirect:/communityBoard"; // 수정 완료 후 상세 페이지로 리다이렉션
    }

    @PostMapping("/recommendation")
    @ResponseBody
    public String updateRecommendations(@RequestParam("gseq") int gseq) {
        int newRecommends = cs.updateRecommendations(gseq);

        // 직접 문자열로 JSON 형식을 생성하여 반환
        return "{\"recommends\": " + newRecommends + "}";
    }
}
