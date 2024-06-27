package com.himedia.zoo.controller;

import com.himedia.zoo.dto.MemberVO;
import com.himedia.zoo.service.MemberService;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;

@Controller
public class MemberController {

    @Autowired
    MemberService ms;

    @GetMapping("/loginform")
    public String loginForm() {
        return "member/login";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute("dto") @Valid MemberVO membervo, BindingResult result, Model model,
                        HttpServletRequest request) {

        String url = "member/login";
        if(result.getFieldError("userid")!=null)
            model.addAttribute("message", result.getFieldError("userid").getDefaultMessage());
        else if( result.getFieldError("pwd")!=null)
            model.addAttribute("message", result.getFieldError("pwd").getDefaultMessage());
        else{
            MemberVO mvo = ms.getMember1( membervo.getUserid() );
            if( mvo == null )
                model.addAttribute("message", "아이디/비번을 확인하세요");
            else if( !mvo.getPwd().equals( membervo.getPwd() ) )
                model.addAttribute("message", "아이디/비번을 확인하세요");
            else if( mvo.getPwd().equals( membervo.getPwd() ) ){
                HttpSession session = request.getSession();
                session.setAttribute("loginUser", mvo);
                url = "redirect:/";
            }
        }
        return url;
    }

    @GetMapping("joinform")
    public String joinForm() {
        return "member/joinForm";
    }

    @Autowired
    ServletContext context;

    @PostMapping("/fileup")
    @ResponseBody   // 자신을 호출하는 곳으로 "리턴되는 데이터"를 갖고 이동하여 페이지에 표시하라는 뜻
    public HashMap<String, Object> fileup(
            @RequestParam("fileimage") MultipartFile file,
            HttpServletRequest request, Model model){
        String path = context.getRealPath("/images");
        Calendar today = Calendar.getInstance();
        long t = today.getTimeInMillis();
        String filename = file.getOriginalFilename();
        String fn1 = filename.substring(0, filename.indexOf("."));  // 파일이름과 확장장 분리
        String fn2 = filename.substring(filename.indexOf("."));
        String uploadPath = path + "/" + fn1 + t + fn2;
        System.out.println("파일 저장 경로 = " + uploadPath);
        HashMap<String, Object> result = new HashMap<String, Object>();
        try {
            file.transferTo(new File(uploadPath));  // 파일이 업로드 및 저장되는 명령
            result.put("STATUS", 1);    // 파일 전송 상태
            result.put("IMAGE", filename);
            result.put("SAVEIMAGE", fn1 + t + fn2);
        } catch (IllegalStateException e) {
            e.printStackTrace(); result.put("STATUS", 0);
        } catch (IOException e) {
            e.printStackTrace(); result.put("STATUS", 0);
        }
        return result;
    }


    @GetMapping("/idcheckform")
    public ModelAndView idcheckForm(@RequestParam("userid") String userid)  {
        ModelAndView mav = new ModelAndView();
        MemberVO mvo = ms.getMember1( userid );
        if( mvo == null)
            mav.addObject("result" , -1);
        else
            mav.addObject("result" , 1);
        mav.addObject("userid", userid);
        mav.setViewName("member/idcheck");
        return mav;
    }

    @GetMapping("/nicknamecheckform")
    public ModelAndView nicknamecheckForm(@RequestParam("nickname") String nickname)  {
        ModelAndView mav = new ModelAndView();
        MemberVO mvo = ms.getMember2( nickname );
        if( mvo == null)
            mav.addObject("result2" , -1);
        else
            mav.addObject("result2" , 1);
        mav.addObject("nickname", nickname);
        mav.setViewName("member/nicknamecheck");
        return mav;
    }

    @PostMapping("/join")
    public String join( @ModelAttribute("dto") @Valid MemberVO membervo, BindingResult result, @RequestParam(value="renickname", required = false) String renickname, @RequestParam(value="reid", required=false) String reid, @RequestParam(value="pwdCheck", required=false) String pwdCheck, Model model) {
        String url = "member/joinForm";
        model.addAttribute("reid" , reid);
        if( result.getFieldError("userid") != null)
            model.addAttribute("message", result.getFieldError("userid").getDefaultMessage());
        else if( result.getFieldError("pwd") != null)
            model.addAttribute("message", result.getFieldError("pwd").getDefaultMessage());
        else if( result.getFieldError("name") != null)
            model.addAttribute("message", result.getFieldError("name").getDefaultMessage());
        else if( result.getFieldError("phone") != null)
            model.addAttribute("message", result.getFieldError("phone").getDefaultMessage());
        else if( result.getFieldError("email") != null)
            model.addAttribute("message", result.getFieldError("email").getDefaultMessage());
        else if( reid == null || (  !reid.equals(membervo.getUserid() ) ) )
            model.addAttribute("message", "아이디 중복체크를 완료하세요");
        else if( renickname == null || (  !renickname.equals(membervo.getNickname() ) ) )
            model.addAttribute("message", "아이디 중복체크를 완료하세요");
        else if( pwdCheck == null || !pwdCheck.equals( membervo.getPwd() ) )
            model.addAttribute("message", "비밀번호 확인 일치하지 않습니다");
        else {
            url = "member/login";
            model.addAttribute("message", "회원가입이 완료되었습니다. 로그인하세요");
            ms.insertMember( membervo );
        }
        return url;
    }

    @GetMapping("/logout")
    public String logout(HttpSession session, HttpServletRequest request) {
        session = request.getSession();
        session.removeAttribute("loginUser");
        session.removeAttribute("message");
        return "/main";

    }
}
