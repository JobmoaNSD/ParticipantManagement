package com.jobmoa.app.view.login;

import com.jobmoa.app.biz.login.MemberDTO;
import com.jobmoa.app.biz.login.MemberService;
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
    private MemberService loginService;

    @GetMapping("/login.do")
    public String loginController(){

        return "views/login";
    }

    @PostMapping("/login.do")
    public String loginController(Model model, MemberDTO loginDTO){

        log.info("loginDTO : [{}]",loginDTO.toString());
        MemberDTO data = loginService.selectOne(loginDTO);

        if(loginDTO != null){
            List<MemberDTO> datas = loginService.selectAll(loginDTO);
            model.addAttribute("datas", datas);
        }
        else{
            log.info("로그인에 실패하였습니다.");
            return "redirect:index.jsp";
        }

        return "views/main";
    }
}
