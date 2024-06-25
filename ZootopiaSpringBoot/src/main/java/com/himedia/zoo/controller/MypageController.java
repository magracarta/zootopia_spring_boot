package com.himedia.zoo.controller;

import com.himedia.zoo.dto.*;
import com.himedia.zoo.service.MypageService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Controller
public class MypageController {
    @Autowired
    MypageService mps;

    @GetMapping("/mypage")
    public ModelAndView mypage(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        HttpSession session = request.getSession();
        MemberVO mvo = (MemberVO) session.getAttribute("loginUser");
        if(mvo == null) {
            mav.setViewName("member/loginForm");
        }else{
            mav.setViewName("mypage/mypage");
            mav.addObject("mvo", mvo);
        }
        return mav;
    }

    @GetMapping("/mycontest")
    public ModelAndView mycontest(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        HttpSession session = request.getSession();
        MemberVO mvo = (MemberVO) session.getAttribute("loginUser");
        String userid = mvo.getUserid();
        if(mvo == null) {
            mav.setViewName("member/loginForm");
        }else{
            List<ContestDto> contestList = mps.getMyContestList(userid); // 내가 개최한
            List<ContestDto> contestmypetList = new ArrayList<>(); // 내 펫이 참가한
            List<ContestPetDTO> contestPetList = mps.mypetList(userid); // 내가 참가한 콘테스트 조회

            for(ContestPetDTO list : contestPetList){
                contestmypetList.add(mps.getMypetContest(list.getCseq()));
            }

            List<ContestDto> contestClosedList = mps.getClosedContests(userid);

            int myContestCount = mps.getMyContestCount("contest", mvo.getUserid());
            int myJoinedContestCount = mps.getMyJoinedContestCount("contestpetiv_view" , mvo.getUserid());



            mav.addObject("contestList", contestList);
            mav.addObject("contestmypetList", contestmypetList);
            mav.addObject("contestClosedList", contestClosedList);
            mav.addObject("myContestCnt", myContestCount);
            mav.addObject("myJoinedContestCnt", myJoinedContestCount);

            mav.setViewName("mypage/mycontest");
        }
        return mav;
    }

    @GetMapping("/mywrite")
    public ModelAndView mywrite(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        HttpSession session = request.getSession();
        MemberVO mvo = (MemberVO) session.getAttribute("loginUser");
        if(mvo == null) {
            mav.setViewName("member/loginForm");
        }else {
            int limit = 10;
            int offset = 0;
            HashMap<String, Object> result = new HashMap<>();
            result.put("userid", mvo.getUserid());
            result.put("limit", limit);
            result.put("offset", offset);

            List<CommunityVO> communityList = mps.getMyCommunityList(result);
            mav.setViewName("mypage/mywrite");

            int myWriteAllCount = mps.getMyWriteAllCount("community", mvo.getUserid());


            mav.addObject("communityList", communityList);
            mav.addObject("allcnt", myWriteAllCount);
        }
        return mav;
    }

    @GetMapping("/myreply")
    public ModelAndView myreply(HttpServletRequest request) {
        HashMap<String, Object> result = new HashMap<>();
        ModelAndView mav = new ModelAndView();

        mav.setViewName("mypage/myreply");
        return mav;
    }

    @GetMapping("/modifyForm")
    public ModelAndView modifyForm(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("mypage/modify");
        return mav;
    }

    @PostMapping("/modify")
    public ModelAndView modify(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView();
        HttpSession session = request.getSession();
        MemberVO mvo = (MemberVO) session.getAttribute("loginUser");
        if(mvo == null) {
            mav.setViewName("member/loginForm");
        }else {
            mav.setViewName("mypage/mycontest");
        }
        return mav;
    }

}
