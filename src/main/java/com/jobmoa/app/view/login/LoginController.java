package com.jobmoa.app.view.login;

import com.jobmoa.app.biz.login.MemberDTO;
import com.jobmoa.app.biz.login.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Slf4j
@Controller
public class LoginController {

    @Autowired
    private MemberService memberService;

    @GetMapping("/login.do")
    public String loginController(){

        return "views/SamplePage";
    }

    @PostMapping("/login.do")
    public String loginController(Model model, HttpSession session, MemberDTO memberDTO){

        log.info("loginDTO : [{}]",memberDTO);
        MemberDTO data = memberService.selectOne(memberDTO);

        // 사용자가 입력한 Data 가 Null 이 아니고
        // 검색된 Data 가 Null 이 아니면 Session 에 저장
        if(data != null){
            if(data.getLogin_id() != null){
                session.setAttribute("JOBMOA_LOGIN_NAME", data.getLogin_counselor());
                return "redirect:participant.do";
            }
        }

        log.info("로그인에 실패하였습니다.");

        return "redirect:login.do";
    }

    @GetMapping("/logout.do")
    public String logoutController(HttpSession session){
        session.removeAttribute("JOBMOA_LOGIN_NAME");
        return "redirect:index.jsp";
    }
}
