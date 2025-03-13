package com.jobmoa.app.view.report;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Slf4j
@Controller
public class DailyWorkReport {

    @GetMapping("report.login")
    public String reportPage(){
        return "views/DailyWorkReportPage";
    }

}
