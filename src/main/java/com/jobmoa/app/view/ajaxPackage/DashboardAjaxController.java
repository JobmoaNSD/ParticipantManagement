package com.jobmoa.app.view.ajaxPackage;

import com.jobmoa.app.biz.dashboard.DashboardDTO;
import com.jobmoa.app.biz.dashboard.DashboardServiceImpl;
import com.jobmoa.app.view.function.ChangeJson;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Slf4j
@RestController
public class DashboardAjaxController {

    @Autowired
    private DashboardServiceImpl dashboardService;

    @Autowired
    private ChangeJson changeJson;

    @PostMapping("/dashBoardSuccess.login")
    public String dashBoardAjaxSuccess(@RequestBody DashboardDTO dashboardDTO){
        String branch = dashboardDTO.getDashboardBranch();
        String startDate = dashboardDTO.getDashBoardStartDate();
        String endDate = dashboardDTO.getDashBoardEndDate();
        log.info("dashBoardAjaxSuccess branch : [{}]",branch);
        log.info("dashBoardAjaxSuccess startDate : [{}]",startDate);
        log.info("dashBoardAjaxSuccess endDate : [{}]",endDate);

        if(branch == null){
            return "fail: 지점 확인이 불가능합니다.";
        }
        else if(startDate == null && endDate == null){
            return "fail: 시작 날짜 혹은 마지막 날짜가 없습니다.";
        }
        dashboardDTO.setDashboardCondition("selectCounselSuccessMoney");
        List<DashboardDTO> branchData = dashboardService.selectAll(dashboardDTO);
        log.info("branchData branchData : [{}]",branchData);

//        String branchDataChangeJson = changeJson.convertListToJsonArray(branchData, item -> {
//            DashboardDTO dto = (DashboardDTO) item;
//                  return "{\"consultants\":\"" + dto.getDashBoardUserName() + "\","
//                          + "\"amounts\":\"" + dto.getDashBoardSuccessMoney() + "\"}";
//        });

        String branchDataChangeJson = changeJson.convertListToJsonArray(branchData, item -> {
            DashboardDTO dto = (DashboardDTO) item;
            return String.format(
                    "{\"consultants\":\"%s\",\"amounts\":%s}",
                    dto.getDashBoardUserName(),
                    dto.getDashBoardSuccessMoney()
            );
        });

        log.info("branchDataChangeJson branchDataChangeJson : [{}]",branchDataChangeJson);

        return branchDataChangeJson;
    }

    @PostMapping("/dashBoardInventive.login")
    public String dashBoardAjaxInventive(@RequestBody DashboardDTO dashboardDTO){
        String startDate = dashboardDTO.getDashBoardStartDate();
        String endDate = dashboardDTO.getDashBoardEndDate();
        log.info("dashBoardAjaxInventive startDate : [{}]",startDate);
        log.info("dashBoardAjaxInventive endDate : [{}]",endDate);

        if(startDate == null && endDate == null){
            return "fail: 시작 날짜 혹은 마지막 날짜가 없습니다.";
        }
        dashboardDTO.setDashboardCondition("selectAjaxBranchInventiveFalseStatus");
        List<DashboardDTO> branchData = dashboardService.selectAll(dashboardDTO);
        log.info("dashBoardAjaxInventive branchData : [{}]",branchData);

        String branchDataChangeJson = changeJson.convertListToJsonArray(branchData, item -> {
            DashboardDTO dto = (DashboardDTO) item;
            return String.format(
                    "{\"branch\":\"%s\"," +
                            "\"noService\":%d," +
                            "\"lessThanOneMonth\":%d," +
                            "\"dispatchCompany\":%d," +
                            "\"iapSevenDays\":%d," +
                            "\"underThirtyHours\":%d," +
                            "\"underMinWage\":%d," +
                            "\"etc\":%d}",
                    dto.getDashboardBranch(),
                    dto.getNoServiceCount(),
                    dto.getLessThanOneMonthCount(),
                    dto.getDispatchCompanyCount(),
                    dto.getIapSevenDaysCount(),
                    dto.getUnderThirtyHoursCount(),
                    dto.getUnderMinWageCount(),
                    dto.getEtcCount()
            );
        });

        log.info("dashBoardAjaxInventive branchDataChangeJson : [{}]",branchDataChangeJson);

        return branchDataChangeJson;
    }


}
