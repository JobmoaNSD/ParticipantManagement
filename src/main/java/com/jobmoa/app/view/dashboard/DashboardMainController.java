package com.jobmoa.app.view.dashboard;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jobmoa.app.biz.bean.LoginBean;
import com.jobmoa.app.biz.dashboard.DashboardDTO;
import com.jobmoa.app.biz.dashboard.DashboardService;
import com.jobmoa.app.view.function.ChangeJson;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.jdbc.Null;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.time.Year;
import java.util.List;


@Slf4j
@Controller
public class DashboardMainController {
    @Autowired
    private DashboardService dashboardService;

    @GetMapping("/dashboard.login")
    public String dashboardMain(Model model, HttpSession session, DashboardDTO dashboardDTO, ObjectMapper objectMapper, ChangeJson changeJson) throws JsonProcessingException {
        log.info("-----------------------------------");
        log.info("Start dashboardMain Controller(GetMapping)");
        //넘어갈 변수 선언
        //취업자 수
        int[][] resultCount = new int[13][3];

        //내 성과에 표기될 문자를 입력
        String[] dashBoardText = {"잡모아 평균","지점 평균","전담자"};
        //검색할 년도
        String dashBoardYear = dashboardDTO.getDashBoardYear() == null ? Year.now().getValue()+"": dashboardDTO.getDashBoardYear();

        //session 로그인 아이디 및 지점을 변수로 선언
        LoginBean loginBean = (LoginBean) session.getAttribute("JOBMOA_LOGIN_DATA");
        String userID = loginBean.getMemberUserID();
        String branch = loginBean.getMemberBranch();
        log.info("DashBoard login ID : [{}] / Branch : [{}]", userID, branch);

        //내 성과에 표시될 데이터를 출력
        //전담자 아이디
        dashboardDTO.setDashboardUserID(userID);
        //전담자 지점
        dashboardDTO.setDashboardBranch(branch);
        //대시보드 년도
        dashboardDTO.setDashBoardYear(dashBoardYear);
        //실행될 쿼리
        dashboardDTO.setDashboardCondition("selectMyResultDashboard");
        DashboardDTO myResultData = dashboardService.selectOne(dashboardDTO);

        //전체 참여자 개수 실행 쿼리
        dashboardDTO.setDashboardCondition("selectCountDashboard");
        DashboardDTO totalCountData = dashboardService.selectOne(dashboardDTO);

        //전체 참여자 개수 실행 쿼리
        dashboardDTO.setDashboardCondition("selectCountCloseDashboard");
        DashboardDTO totalCloseCountData = dashboardService.selectOne(dashboardDTO);

        //메모리 주소값이 아닌 배열을 문자형식으로 반환
        String dashBoardDataTitle = objectMapper.writeValueAsString(dashBoardText);
        model.addAttribute("dashBoardDataTitle", dashBoardDataTitle);

        //전체 지점 개수와 전담자 인원
        dashboardDTO.setDashboardCondition("selectBranchAndUser");
        DashboardDTO branchAndUser = dashboardService.selectOne(dashboardDTO);

        //성공금 & 인센티브 전체,지점,개인 금액 전달용 Query Condition
        dashboardDTO.setDashboardCondition("selectSuccessMoney");
        DashboardDTO successMoney = dashboardService.selectOne(dashboardDTO);

        //참여자 통계 전달용 데이터
        //참여자 통계 현재 진행자 수
        dashboardDTO.setDashboardCondition("selectTotalParticipant");
        List<DashboardDTO> totalParticipant = dashboardService.selectAll(dashboardDTO);

        //참여자 통계 현재 참여자 수
        dashboardDTO.setDashboardCondition("selectCurrentParticipant");
        List<DashboardDTO> currentParticipant = dashboardService.selectAll(dashboardDTO);

        //참여자 통계 현재 년도 참여자 수
        dashboardDTO.setDashboardCondition("selectNowParticipant");
        DashboardDTO nowParticipant = dashboardService.selectOne(dashboardDTO);

        //참여자 금일 업무현황
        dashboardDTO.setDashboardCondition("selectDailyDashboard");
        DashboardDTO dailyParticipant = dashboardService.selectOne(dashboardDTO);


        if(myResultData != null && totalCountData != null && branchAndUser != null){
            //지점 개수
            int branchCount = branchAndUser.getDashboardCountBranch();
            //지점 전담자 인원
            int userCount = branchAndUser.getDashboardCountUser();
            //전체 참여자 개수
            int totalCount = totalCountData.getDashboardTotalCount();
            //전체 마감 참여자 개수
            int totalCloseCount = totalCloseCountData.getDashboardCloseCount();

            //나의 성과 현황 시작
            //취업자 수
            int userEmployed = myResultData.getDashBoardEmployedCountUser();
            int userEmployedTotal = myResultData.getDashBoardEmployedCountTotal() / branchCount;
            int userEmployedBranch = myResultData.getDashBoardEmployedCountBranch() / userCount;
            resultCount[0] = this.changingArray(userEmployedTotal,userEmployedBranch,userEmployed);

            //알선 취업자 수
            int userReferredEmployed = myResultData.getDashBoardReferredEmployedCountUser();
            int userReferredTotal = myResultData.getDashBoardReferredEmployedCountTotal() / branchCount;
            int userReferredBranch = myResultData.getDashBoardReferredEmployedCountBranch() / userCount;
            resultCount[1] =  this.changingArray(userReferredTotal,userReferredBranch,userReferredEmployed);

            //조기 취업자 수
            int userEarlyEmployed = myResultData.getDashBoardEarlyEmployedCountUser();
            int userEarlyTotal = myResultData.getDashBoardEarlyEmployedCountTotal() / branchCount;
            int userEarlyBranch = myResultData.getDashBoardEarlyEmployedCountBranch() / userCount;
            resultCount[2] =  this.changingArray(userEarlyTotal,userEarlyBranch,userEarlyEmployed);

            //나은일자리 수
            int userBetterJob = myResultData.getDashBoardBetterJobCountUser();
            int userBetterTotal = myResultData.getDashBoardBetterJobCountTotal() / branchCount;
            int userBetterBranch = myResultData.getDashBoardBetterJobCountBranch() / userCount;
            resultCount[3] =  this.changingArray(userBetterTotal,userBetterBranch,userBetterJob);

            //고용유지 6개월 수
            int userSixMonthRetention = myResultData.getDashBoardSixMonthRetentionCountUser();
            int userBetterTotalTotal = myResultData.getDashBoardBetterJobCountTotal() / branchCount;
            int userBetterTotalBranch = myResultData.getDashBoardBetterJobCountBranch() / userCount;
            resultCount[4] =  this.changingArray(userBetterTotalTotal,userBetterTotalBranch,userSixMonthRetention);

            //고용유지 12개월 수
            int userTwelveMonthRetention = myResultData.getDashBoardTwelveMonthRetentionCountUser();
            int userTwelveTotal = myResultData.getDashBoardTwelveMonthRetentionCountTotal() / branchCount;
            int userTwelveBranch = myResultData.getDashBoardTwelveMonthRetentionCountBranch() / userCount;
            resultCount[5] =  this.changingArray(userTwelveTotal,userTwelveBranch,userTwelveMonthRetention);
            //나의 성과 현황 끝

            //나의 KPI 달성률 시작
            //취업자 수
            resultCount[6] = this.changingArray(totalCount-userEmployed,userEmployed);
            //알선 취업자 수
            resultCount[7] = this.changingArray(userEmployed-userReferredEmployed,userReferredEmployed);
            //조기 취업자 수
            resultCount[8] = this.changingArray(userEmployed-userEarlyEmployed,userEarlyEmployed);
            //나은 일자리
            resultCount[9] = this.changingArray(userEmployed-userBetterJob,userBetterJob);
            //마감 인원 비율
            resultCount[10] = this.changingArray(totalCount-totalCloseCount,totalCloseCount);
            //나의 KPI 달성률 끝

            //성공금 현황 시작
            //성공금 데이터
            resultCount[11] = this.changingArray(
                    successMoney.getDashBoardSuccessMoneyTotal() / branchCount,
                    successMoney.getDashBoardSuccessMoneyBranch() / userCount,
                    successMoney.getDashBoardSuccessMoneyUser());
            //성공금 데이터
            resultCount[12] = this.changingArray(
                    successMoney.getDashBoardSuccessMoneyTotalIncentive() / branchCount,
                    successMoney.getDashBoardSuccessMoneyBranchIncentive() / userCount,
                    successMoney.getDashBoardSuccessMoneyUserIncentive());
            //성공금 현황 끝


            // 참여자 현황 시작
            String totalParticipantJsonData = "";
            String currentParticipantJsonData = "";
            String nowParticipantJsonData = "";


            totalParticipantJsonData = changeJson.convertListToJsonArray(totalParticipant,
                    item -> { DashboardDTO dto = (DashboardDTO) item;// 객체 캐스팅
                        return "{\"year\":\"" + dto.getDashBoardParticipatedYear() + "\"," +
                                "\"data\":\"" + dto.getDashBoardParticipatedCountOne() + "\"}";});

            currentParticipantJsonData = changeJson.convertListToJsonArray(currentParticipant,
                    item -> { DashboardDTO dto = (DashboardDTO) item;// 객체 캐스팅
                        return "{\"year\":\"" + dto.getDashBoardParticipatedYear() + "\"," +
                                "\"data\":\"" + dto.getDashBoardParticipatedCountOne() + "\"}";});
            nowParticipantJsonData = "[]";
            if(nowParticipant != null){
                nowParticipantJsonData = "[" +
                        "{\"year\":" + "\"\"" +
                        ",\"data\":\"" + nowParticipant.getDashBoardParticipatedCountOne() + "\"},"+
                        "{\"year\":" + "\"\"" +
                        ",\"data\":\"" + nowParticipant.getDashBoardParticipatedCountTwo() + "\"}"+
                        "]";
            }


            log.info("totalParticipantJsonData : [{}]",totalParticipantJsonData);
            log.info("currentParticipantJsonData : [{}]",currentParticipantJsonData);
            log.info("nowParticipantJsonData : [{}]",nowParticipantJsonData);

            model.addAttribute("totalParticipantJsonData",totalParticipantJsonData);
            model.addAttribute("currentParticipantJsonData",currentParticipantJsonData);
            model.addAttribute("nowParticipantJsonData",nowParticipantJsonData);
            //참여자 현황 끝
            
            //금일 업무 현황 시작
            model.addAttribute("dailyDashboard",dailyParticipant);
            //금일 업무 현황 끝
            
        }

        String[] myDashBoardName = {
                "dashBoardEmployedCount",//취업자 수
                "dashBoardReferredEmployedCount",//알선 취업자 수
                "dashBoardEarlyEmployedCount",//조기 취업자 수
                "dashBoardBetterJobCount",//나은일자리 수
                "dashBoardSixMonthRetentionCount",//고용유지 6개월 수
                "dashBoardTwelveMonthRetentionCount",//고용유지 12개월 수
                "dashBoardEmployedKPI",//KPI 취업자
                "dashBoardReferredEmployedKPI",//KPI 알선 취업자
                "dashBoardEarlyEmployedKPI",//KPI 조기 취업자
                "dashBoardBetterJobKPI",//KPI 나은 일자리
                "dashBoardCloseKPI",//KPI 마감 인원
                "dashBoardSuccessMoney",//성공금 전체,지점,개인
                "dashBoardSuccessMoneyIncentive"//성공금 인센티브 전체,지점,개인
        };

        model.addAttribute("dashBoardYear", dashBoardYear);
        this.resultModel(model, objectMapper, resultCount, myDashBoardName);

        log.info("-----------------------------------");
        return "views/DashBoardPage";
    }

    private int[] changingArray(int number1, int number2, int number3){
        int[] result = {number1,number2,number3};
        return result;
    }

    private int[] changingArray(int number1, int number2){
        int[] result = {number1,number2};
        return result;
    }

    private void resultModel(Model model,ObjectMapper objectMapper, int[][] array, String[] myDashBoardName) throws JsonProcessingException {
        for(int i = 0; i < array.length; i++){
            model.addAttribute(myDashBoardName[i],objectMapper.writeValueAsString(array[i]));
        }
    }
}
