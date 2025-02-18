package com.jobmoa.app.view.dashboard;


import com.jobmoa.app.biz.participant.ParticipantDTO;
import com.jobmoa.app.biz.participant.ParticipantServiceImpl;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Slf4j
@Controller
public class DashboardMainController {

    @Autowired
    private ParticipantServiceImpl participantService;

    @GetMapping("/dashboard.login")
    public String dashboardMain(HttpSession session, ParticipantDTO participantDTO){
        log.info("-----------------------------------");
        log.info("Start dashboardMain Controller(GetMapping)");
        //TODO 대시보드 작업해야함
        participantService.selectAll(participantDTO);
        log.info("-----------------------------------");
        return "views/DashBoardPage";
    }

}
