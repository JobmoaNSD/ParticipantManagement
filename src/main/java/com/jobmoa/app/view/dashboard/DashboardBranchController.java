package com.jobmoa.app.view.dashboard;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Slf4j
@Controller
public class DashboardBranchController {

    @GetMapping("/branchDashboard.login")
    public String dashboardBranchSuccessMoney(){
        return "views/DashBoardTotalManagement";
    }

}
