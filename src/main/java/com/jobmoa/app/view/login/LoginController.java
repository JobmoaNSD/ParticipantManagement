package com.jobmoa.app.view.login;

import com.jobmoa.app.biz.common.LoginBean;
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

        return "views/login";
    }

    @PostMapping("/login.do")
    public String loginController(Model model, HttpSession session, MemberDTO memberDTO, LoginBean loginBean){

        String url = "login.do";
        String icon = "warning";
        String title = "로그인 실패";
        String message = "";


        log.info("loginDTO : [{}]",memberDTO);
        MemberDTO data = memberService.selectOne(memberDTO);

        // 사용자가 입력한 Data 가 Null 이 아니고
        // 검색된 Data 가 Null 이 아니면 Session 에 저장
        if(data != null){
            if(data.getMember_userid() != null){
                loginBean.setMember_userid(data.getMember_userid());
                loginBean.setMember_username(data.getMember_username());
                loginBean.setMember_branch(data.getMember_branch());
                loginBean.setMember_role(data.getMember_role());
                loginBean.setMember_uniquenumber(data.getMember_uniquenumber());
                session.setAttribute("JOBMOA_LOGIN_DATA", loginBean);
                url = "dashboard.do";
                icon = "success";
                title = "로그인 성공";
            }
        }

        model.addAttribute("url", url);
        model.addAttribute("icon", icon);
        model.addAttribute("title", title);
        model.addAttribute("message", message);
        log.info("로그인 여부 : [{}]",title);

        return "views/info";
    }

    @GetMapping("/logout.do")
    public String logoutController(HttpSession session){
        session.removeAttribute("JOBMOA_LOGIN_NAME");
        return "redirect:index.jsp";
    }
}
