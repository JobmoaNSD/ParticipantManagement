package com.jobmoa.app.view.ajaxPackage;

import com.jobmoa.app.biz.bean.LoginBean;
import com.jobmoa.app.biz.dashboard.DashboardDTO;
import com.jobmoa.app.biz.dashboard.DashboardServiceImpl;
import com.jobmoa.app.biz.participant.ParticipantDTO;
import com.jobmoa.app.biz.participant.ParticipantServiceImpl;
import com.jobmoa.app.view.function.ChangeJson;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
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
    private ParticipantServiceImpl participantService;

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

    @PostMapping("dashBoardAjaxBranchScore.login")
    public String consolScore(@RequestBody DashboardDTO dashboardDTO, HttpSession session){
        log.info("consolScore Start Ajax");
        log.info("consolScore Session select Start");
        LoginBean loginBean = (LoginBean)session.getAttribute("JOBMOA_LOGIN_DATA");
        log.error("consolScore session.getAttribute(\"IS_MANAGER\") : [{}]",session.getAttribute("IS_MANAGER"));
        boolean isManager = (boolean)session.getAttribute("IS_MANAGER");
        String sessionBranch = loginBean.getMemberBranch();
        log.info("consolScore Session select End");
        String branch = dashboardDTO.getDashboardBranch();

        boolean branchFlag = branch.equals(sessionBranch);
        if(!branchFlag && !isManager){
                log.info("consolScore Fail:");
                log.info("consolScore branch != sessionBranch : [{}]", branchFlag);
                return "Fail: 다른지점은 확인 할 수 없습니다.";
        }

        log.info("consolScore branchUserScore ChangeJson Start");
        dashboardDTO.setDashboardCondition("selectBranchConsolScore");
        List<DashboardDTO> dashboardDatas = dashboardService.selectAll(dashboardDTO);
        String branchUserScore = changeJson.convertListToJsonArray(dashboardDatas , item ->{
            DashboardDTO dto = (DashboardDTO) item;
            return String.format(
                    "{\"username\":\"%s\"," +
                            "\"branch\":\"%s\"," +
                            "\"userID\":\"%s\"," +
//                            "\"score\":[%.2f,%.2f,%.2f,%.2f,%.2f,%.2f]," +
                            "\"totalScore\":%.2f," +
                            "\"employmentScore\":%.2f," +
                            "\"placementScore\":%.2f," +
                            "\"earlyEmploymentScore\":%.2f," +
                            "\"retentionScore\":%.2f," +
                            "\"betterJobScore\":%.2f," +
                            "\"myBranchScore\":%.2f}",
                    dto.getDashBoardUserName(),
                    dto.getDashboardBranch(),
                    dto.getDashboardUserID(),
                    dto.getTotalScore(),
                    dto.getEmploymentLastScore(),
                    dto.getPlacementLastScore(),
                    dto.getEarlyEmploymentLastScore(),
                    dto.getRetentionLastScore(),
                    dto.getBetterJobLastScore(),
                    dto.getMyBranchScoreAVG()
            );
        });
        log.info("consolScore branchUserScore ChangeJson End");

        log.info("consolScore branchScore ChangeJson Start");
        dashboardDTO.setDashboardCondition("selectTopConsolScore");
        dashboardDatas = dashboardService.selectAll(dashboardDTO);
        String branchScore = changeJson.convertListToJsonArray(dashboardDatas , item ->{
            DashboardDTO dto = (DashboardDTO) item;
            return String.format(
                    "{\"totalStandardScore\":%.2f," +
                            "\"employmentTopScore\":%.2f," +
                            "\"placementTopScore\":%.2f," +
                            "\"earlyEmploymentTopScore\":%.2f," +
                            "\"retentionTopScore\":%.2f," +
                            "\"betterJobTopScore\":%.2f}",
                    dto.getTotalStandardScore(),dto.getEmploymentTopScore(), dto.getPlacementTopScore(), dto.getEarlyEmploymentTopScore(),
                    dto.getRetentionTopScore(), dto.getBetterJobTopScore()
            );
        });
        log.info("consolScore branchScore ChangeJson End");

        return String.format(
                "{\"branchUserScore\":%s,\"branchScore\":%s}",
                branchUserScore,branchScore
        );
    }

    @PostMapping("noServiceAjax.login")
    public List<ParticipantDTO> noServiceSearchAjax(@RequestBody ParticipantDTO participantDTO, HttpSession session){
        log.info("noServiceSearchAjax Start noService.login");
        // 세션에 저장되어 있는 로그인 정보를 확인한다.
        LoginBean loginBean = (LoginBean)session.getAttribute("JOBMOA_LOGIN_DATA");
        // 세션에 저장된 관리자 여부를 가져온다.
        boolean isManager = (boolean)session.getAttribute("IS_MANAGER");
        // 세션에 저장된 지점관리자 여부를 가져온다.
        boolean isBranchManager = (boolean)session.getAttribute("IS_BRANCH_MANAGER");
        String branch = participantDTO.getParticipantBranch();
        // 세션 로그인 정보에 있는 지점을 가져온다.
        String sessionBranch = loginBean.getMemberBranch();
        // 관리자 여부를 확인하고 관리자가 아니라면 null을 반환하고
        if(!isManager){
            log.info("noServiceSearchAjax Fail: isManager == false");
            return null;
        }
        //지점이 틀리고 지점 관리자가 아니라면 null을 반환한다.
        else if(!branch.equals(sessionBranch) && !isBranchManager){
            log.info("noServiceSearchAjax Fail: isBranchManager == false");
            return null;
        }
        participantDTO.setParticipantCondition("selectNoService");
        List<ParticipantDTO> datas = participantService.selectAll(participantDTO);
        return datas;
    }

    @PostMapping("scoreBranchPerformanceAjax.login")
    public String scoreBranchPerformanceAjax(@RequestBody DashboardDTO dashboardDTO){
        boolean conditionFlag = Boolean.parseBoolean(dashboardDTO.getDashboardCondition());

        if(!conditionFlag){
            // 1년 미만 상담사 미포함
            dashboardDTO.setDashboardCondition("selectBranchAvg");
            log.info("selectBranchAvg (1년 미만 상담사 미포함) : [{}]", false);
        }
        else{
            //1년 미만 상담사 포함
            dashboardDTO.setDashboardCondition("scoreBranchPerformanceAjax");
            log.info("scoreBranchPerformanceAjax (1년 미만 상담사 포함) : [{}]", true);
        }

        List<DashboardDTO> datas = dashboardService.selectAll(dashboardDTO);
        if(datas.isEmpty() || datas.size() == 0){
            return null;
        }
        // 반환된 data를 가지고 json 형식으로 그래프를 그릴 수 있도록 반환한다.
        String responseJson = changeJson.convertListToJsonArray(datas,item ->{
            DashboardDTO dto = (DashboardDTO)item;
            return String.format("{\"name\":\"%s\", \"data\":\"%.2f\"}",
                    dto.getDashboardBranch(),dto.getTotalBranchScoreAVG()
            );
        });

        log.info("scoreBranchDashboard responseJson : [{}]",responseJson);


        return responseJson;
    }

}
