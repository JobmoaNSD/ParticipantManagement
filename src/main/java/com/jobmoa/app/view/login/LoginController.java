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
    public String loginController(HttpSession session, LoginBean loginBean){
        log.info("-----------------------------------");
        //Session에 저장되어 있는 Login DATA
        loginBean = (LoginBean)session.getAttribute("JOBMOA_LOGIN_DATA");
        String page = "views/login";

        //Session이 비어있지 않다면 dashboard.do 페이지로 이동
        if (loginBean != null) {
            page = "redirect:dashboard.do";
        }

        log.info("login DATA : [{}]", loginBean);
        log.info("login Controller page : [{}]", page);
        log.info("-----------------------------------");
        return page;
    }

    @PostMapping("/login.do")
    public String loginController(Model model, HttpSession session, MemberDTO memberDTO, LoginBean loginBean){
        log.info("-----------------------------------");
        log.info("Start loginController");
        String url = "login.do";
        String icon = "error";
        String title = "로그인 실패";
        String message = "";

        memberDTO = memberService.selectOne(memberDTO);
        log.info("loginDTO : [{}]",memberDTO);

        // 사용자가 입력한 Data 가 Null 이 아니고
        // 검색된 Data 가 Null 이 아니면 Session 에 저장
        if(memberDTO != null){
            if(memberDTO.getMemberUserID() != null){
                log.info("loginController login Success user ID : [{}]",memberDTO.getMemberUserID());

                //로그인 정보를 Bean 객체에 담고
                loginBean.setMemberUserID(memberDTO.getMemberUserID());
                loginBean.setMemberUserName(memberDTO.getMemberUserName());
                loginBean.setMemberBranch(memberDTO.getMemberBranch());
                loginBean.setMemberRole(memberDTO.getMemberRole());
                loginBean.setMemberUniqueNumber(memberDTO.getMemberUniqueNumber());

                //Session에 저장해 사용
                session.setAttribute("JOBMOA_LOGIN_DATA", loginBean);
                url = "dashboard.do";
                icon = "success";
                title = "로그인 성공";
            }
        }

        //info.jsp 페이지로 넘어갈때 활용
        //로그인 성공 : dashboard.do 페이지로 이동
        //로그인 실패 : login.do 페이지로 이동
        model.addAttribute("url", url);
        //SweetAlert 사용중 아이콘 선택
        //성공 : success
        //실패 : error
        model.addAttribute("icon", icon);
        model.addAttribute("title", title);
        model.addAttribute("message", message);
        log.info("로그인 여부 : [{}]",title);

        //info 페이지로 이동
        log.info("-----------------------------------");
        return "views/info";
    }

    @GetMapping("/logout.do")
    public String logoutController(HttpSession session){
        log.info("-----------------------------------");
        session.removeAttribute("JOBMOA_LOGIN_DATA");
        log.info("session remove : [{}]", session.getAttribute("JOBMOA_LOGIN_DATA"));
        log.info("-----------------------------------");
        return "redirect:login.do";
    }
}
