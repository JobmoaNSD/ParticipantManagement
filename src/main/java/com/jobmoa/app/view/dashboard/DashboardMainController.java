package com.jobmoa.app.view.dashboard;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jobmoa.app.biz.bean.LoginBean;
import com.jobmoa.app.biz.participant.ParticipantDTO;
import com.jobmoa.app.biz.participant.ParticipantServiceImpl;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;
import java.util.function.Function;

@Slf4j
@Controller
public class DashboardMainController {

    @Autowired
    private ParticipantServiceImpl participantService;

    @GetMapping("/dashboard.login")
    public String dashboardMain(Model model, HttpSession session, ParticipantDTO participantDTO, ObjectMapper objectMapper) throws JsonProcessingException {
        log.info("-----------------------------------");
        log.info("Start dashboardMain Controller(GetMapping)");
        //넘어갈 변수 선언
        //취업자 수
        int[][] resultCount = new int[10][3];

        //내 성과에 표기될 문자를 입력
        String[] dashBoardText = {"잡모아 평균","지점 평균","전담자"};
        //검색할 년도
        String dashBoardYear = "2024";

        //session 로그인 아이디 및 지점을 변수로 선언
        LoginBean loginBean = (LoginBean) session.getAttribute("JOBMOA_LOGIN_DATA");
        String userID = loginBean.getMemberUserID();
        String branch = loginBean.getMemberBranch();
        log.info("DashBoard login ID : [{}] / Branch : [{}]", userID, branch);

        //내 성과에 표시될 데이터를 출력
        //전담자 아이디
        participantDTO.setParticipantUserid(userID);
        //전담자 지점
        participantDTO.setParticipantBranch(branch);
        //대시보드 년도
        participantDTO.setDashBoardYear(dashBoardYear);;
        //실행될 쿼리
        participantDTO.setParticipantCondition("selectMyResultDashboard");
        ParticipantDTO myResultData = participantService.selectOne(participantDTO);
        log.info("myResultData : [{}]", myResultData);
        //전체 참여자 개수 실행 쿼리
        participantDTO.setParticipantCondition("selectCountParticipant");
        ParticipantDTO totalCountQurey = participantService.selectOne(participantDTO);

        //메모리 주소값이 아닌 배열을 문자형식으로 반환
        String dashBoardDataTitle = objectMapper.writeValueAsString(dashBoardText);
        model.addAttribute("dashBoardDataTitle", dashBoardDataTitle);

        //전체 지점 개수와 전담자 인원
        participantDTO.setParticipantCondition("selectBranchAndUser");
        ParticipantDTO branchAndUser = participantService.selectOne(participantDTO);
        log.info("branchAndUser : [{}]", branchAndUser);
        //지점 개수
        int branchCount = branchAndUser.getTotalCountBranch();
        //지점 전담자 인원
        int userCount = branchAndUser.getTotalCountUser();

        if(myResultData != null && totalCountQurey != null){
            //전체 참여자 개수
            int totalCount = totalCountQurey.getTotalCount();
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
            //고용 유지율
            //나의 KPI 달성률 끝

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
                "dashBoardBetterJobKPI"//KPI 나은 일자리
        };

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
