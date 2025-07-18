package com.jobmoa.app.CounselMain.view.participantRandomAssignment;

import com.jobmoa.app.CounselMain.biz.participantRandomAssignment.ParticipantRandomAssignmentService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Slf4j
@Controller
public class praPageController {

    @Autowired
    private ParticipantRandomAssignmentService praService;

    @GetMapping("/pra.login")
    public String praMainPage(){
        log.info("praMainPage");
        return "views/participantRandomAssignmentMain";
    }


}
