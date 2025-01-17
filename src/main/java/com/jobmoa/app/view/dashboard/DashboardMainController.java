package com.jobmoa.app.view.dashboard;


import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Slf4j
@Controller
public class DashboardMainController {

    @GetMapping("/dashboard.do")
    public String dashboardMain(){
        log.info("Start dashboardMain Controller(GetMapping)");
        return "views/DashBoardPage";
    }

}
