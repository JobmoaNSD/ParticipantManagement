package com.jobmoa.app.view.participant;

import com.jobmoa.app.biz.login.MemberDTO;
import com.jobmoa.app.biz.participant.ParticipantDTO;
import com.jobmoa.app.biz.participant.ParticipantService;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Slf4j
@Controller
public class ParticipantController {

    @Autowired
    private ParticipantService participantService;

    //Page 이동
    @GetMapping("participant.do")
    public String participantPageController(Model model, HttpSession session, ParticipantDTO participantDTO){

/*        //로그인 여부를 확인하기 위해 정보를 입력
        String user_name = (String)session.getAttribute("JOBMOA_LOGIN_NAME");
        log.info("participantPageController");

        if(user_name == null){
            log.info("participantPageController login flag 로그인");
            return "redirect:login.do";
        }

        participantDTO.setParticipant_counselor(user_name);
        List<ParticipantDTO> datas = participantService.selectAll(participantDTO);

        model.addAttribute("datas", datas);*/
        return "views/participantMain";
    }

    @GetMapping("testparticipants.do")
    public String newParticipantsController(){
        return "views/NewParticipantsPage";
    }

}
