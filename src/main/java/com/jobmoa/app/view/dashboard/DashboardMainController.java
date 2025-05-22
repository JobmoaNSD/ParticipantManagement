package com.jobmoa.app.view.dashboard;


import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.jobmoa.app.biz.bean.LoginBean;
import com.jobmoa.app.biz.dashboard.DashboardDTO;
import com.jobmoa.app.biz.dashboard.DashboardService;
import com.jobmoa.app.biz.dashboard.DashboardServiceImpl;
import com.jobmoa.app.view.function.ChangeJson;
import com.jobmoa.app.view.function.InfoBean;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
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
    private DashboardServiceImpl dashboardService;

    @Autowired
    private ChangeJson changeJson;


    //FIXME 평가 실적 시작 종료일
    String FAILSTARTDATE = "2024-11-01";
    String FAILENDDATE = "2025-10-31";

    @GetMapping("/dashboard.login")
    public String dashboardMain(Model model, HttpSession session, DashboardDTO dashboardDTO, ObjectMapper objectMapper) throws JsonProcessingException {
        log.info("-----------------------------------");
        log.info("Start dashboardMain Controller(GetMapping)");
        //넘어갈 변수 선언
        //취업자 수
        int[][] resultCount = new int[2][3];

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

        //실행될 쿼리 FIXME TODO 확인해 봐야함
//        dashboardDTO.setDashboardCondition("selectMyResultDashboard");
//        DashboardDTO myResultData = dashboardService.selectOne(dashboardDTO);

        //전체 참여자 개수 실행 쿼리 FIXME TODO 확인해 봐야함
//        dashboardDTO.setDashboardCondition("selectCountDashboard");
//        DashboardDTO totalCountData = dashboardService.selectOne(dashboardDTO);

        //메모리 주소값이 아닌 배열을 문자형식으로 반환
        String dashBoardDataTitle = objectMapper.writeValueAsString(dashBoardText);
        model.addAttribute("dashBoardDataTitle", dashBoardDataTitle);

        //전체 지점 개수와 전담자 인원
        dashboardDTO.setDashboardCondition("selectBranchAndUser");
        DashboardDTO branchAndUser = dashboardService.selectOne(dashboardDTO);

        //성공금 & 인센트브 현황 시작
        //성공금 & 인센티브 전체,지점,개인 금액 전달용 Query Condition
        dashboardDTO.setDashboardCondition("selectSuccessMoney");
        DashboardDTO successMoney = dashboardService.selectOne(dashboardDTO);

        if(/*myResultData != null && totalCountData != null &&*/ branchAndUser != null){
            //지점 개수
            int branchCount = branchAndUser.getDashboardCountBranch();
            //지점 전담자 인원
            int userCount = branchAndUser.getDashboardCountUser();

            //성공금 현황 시작
            //성공금 데이터
            resultCount[0] = this.changingArray(
                    successMoney.getDashBoardSuccessMoneyTotal() / branchCount,
                    successMoney.getDashBoardSuccessMoneyBranch() / userCount,
                    successMoney.getDashBoardSuccessMoneyUser());
            //성공금 데이터
            resultCount[1] = this.changingArray(
                    successMoney.getDashBoardSuccessMoneyTotalIncentive() / branchCount,
                    successMoney.getDashBoardSuccessMoneyBranchIncentive() / userCount,
                    successMoney.getDashBoardSuccessMoneyUserIncentive());
            //성공금 현황 끝
        }

        String[] myDashBoardName = {
                "dashBoardSuccessMoney",//성공금 전체,지점,개인
                "dashBoardSuccessMoneyIncentive"//성공금 인센티브 전체,지점,개인
        };

        model.addAttribute("dashBoardYear", dashBoardYear);
        this.resultModel(model, objectMapper, resultCount, myDashBoardName);
        //성공금 & 인센트브 현황 끝


        //금일 업무 현황 시작
        //참여자 금일 업무현황
        dashboardDTO.setDashboardCondition("selectDailyDashboard");
        DashboardDTO dailyParticipant = dashboardService.selectOne(dashboardDTO);
        model.addAttribute("dailyDashboard",dailyParticipant);
        //금일 업무 현황 끝


        // 참여자 현황 시작
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

        //성과 점수 현황 시작
        dashboardDTO.setDashboardCondition("selectRankAndScore");
        dashboardDTO.setDashBoardStartDate(this.FAILSTARTDATE);
        dashboardDTO.setDashBoardEndDate(this.FAILENDDATE);
        List<DashboardDTO> testDatas = dashboardService.selectAll(dashboardDTO);

        String scoreJson = changeJson.convertListToJsonArray(testDatas,item -> {
            DashboardDTO dto = (DashboardDTO)item;
            return "{\"myRanking\":\"" + dto.getMyRanking() + "\"," +
                    "\"myTotalRanking\":\"" + dto.getMyTotalRanking() + "\"," +
                    "\"myScore\":\"" + dto.getMyScore() + "\"," +
                    "\"data\":[\"" + dto.getTotalBranchScoreAVG() + "\",\"" + dto.getMyBranchScoreAVG() + "\",\"" + dto.getMyScore() + "\"]," +
                    "\"totalTopScore\":\"" + dto.getTotalTopScore() + "\"," +
                    "\"pointsToNextGrade\":\"" + dto.getPointsToNextGrade() + "\"," +
                    "\"nextGrade\":\"" + dto.getNextGrade() + "\"" +
                    "}";
        });

        log.info("scoreJson : [{}]",scoreJson);

        model.addAttribute("scoreJson",scoreJson);
        //성과 점수 현황 끝


        //내 실적 현황 시작
        dashboardDTO.setDashboardCondition("myKPIDashboard");
        DashboardDTO myKPI = dashboardService.selectOne(dashboardDTO);
        model.addAttribute("myKPI",myKPI);

        //내 KPI 현황 끝

        log.info("-----------------------------------");
        return "views/DashBoardPage";
    }

    private int[] changingArray(int number1, int number2, int number3){
        int[] result = {number1,number2,number3};
        return result;
    }

    private void resultModel(Model model,ObjectMapper objectMapper, int[][] array, String[] myDashBoardName) throws JsonProcessingException {
        for(int i = 0; i < array.length; i++){
            model.addAttribute(myDashBoardName[i],objectMapper.writeValueAsString(array[i]));
        }
    }

    @GetMapping("/successMoney.login")
    public String successMoney(Model model, HttpSession session, DashboardDTO dashboardDTO) {
        //session 값에 저장된 login Data를 Bean class에 저장
        LoginBean loginBean = (LoginBean) session.getAttribute("JOBMOA_LOGIN_DATA");
        //login ID, 지점 변수를 생성
        String userID = loginBean.getMemberUserID();
        String branch = loginBean.getMemberBranch();
        //생성된 ID, 지점 변수를 DashboardDTO에 저장
        dashboardDTO.setDashboardUserID(userID);
        dashboardDTO.setDashBoardUserBranch(branch);
        dashboardDTO.setDashBoardStartDate(this.FAILSTARTDATE);
        dashboardDTO.setDashBoardEndDate(this.FAILENDDATE);
        //dashboard selectAll을 진행
        //selectSuccessMoneyDetails condition을 추가
        dashboardDTO.setDashboardCondition("selectSuccessMoneyDetails");
        List<DashboardDTO> datas = dashboardService.selectAll(dashboardDTO);
        if(datas == null || datas.size() == 0){
            log.info("successMoney datas is null or datas size is 0");
            String url="dashboard.login";
            String icon="back";
            String title="발생한 성공금이 없습니다.";
            String message="성공금 추가 후 진행해주세요.";
            InfoBean.info(model, url, icon, title, message);
            return "views/info";
        }

        String successMoneyJson = changeJson.convertListToJsonArray(datas, item -> {
            DashboardDTO dto = (DashboardDTO) item;  // 객체 캐스팅
            return "{\"date\":\"" + dto.getDashBoardDate() + "\","
                    + "\"data\":\"" + dto.getDashBoardSuccessMoney() + "\"}";
        });

        String incentiveJson = changeJson.convertListToJsonArray(datas, item -> {
            DashboardDTO dto = (DashboardDTO) item;  // 객체 캐스팅
            return "{\"date\":\"" + dto.getDashBoardDate() + "\","
                    + "\"data\":\"" + dto.getDashBoardIncentive() + "\"}";
        });

        log.info("successMoney successMoneyJson : [{}]", successMoneyJson);
        log.info("successMoney incentiveJson : [{}]", incentiveJson);
        log.info("successMoney datas : [{}]", datas);
        model.addAttribute("successMoneyDetails", datas);
        model.addAttribute("successMoneyJson", successMoneyJson);
        model.addAttribute("incentiveJson", incentiveJson);

        return "views/DashBoardSuccessMoneyPage";
    }

    @GetMapping("scoreDashboard.login")
    public String scoreDashboard(Model model, HttpSession session, DashboardDTO dashboardDTO){
        LoginBean loginBean = (LoginBean)session.getAttribute("JOBMOA_LOGIN_DATA");
//        boolean isBranchManager = (Boolean)session.getAttribute("IS_BRANCH_MANAGER");
        boolean isManager = (Boolean)session.getAttribute("IS_MANAGER");
        String userID = loginBean.getMemberUserID();
        String branch = loginBean.getMemberBranch();

        //관리자가 아니라면 지점, 사용자아이디를 추가하고 진행한다.
        if(!isManager){
            dashboardDTO.setDashboardUserID(userID);
            dashboardDTO.setDashBoardUserBranch(branch);
        }
//        //지점 관리자라면 아이디는 추가하지 않고 진행한다.
//        else if(isBranchManager){
//            dashboardDTO.setDashBoardUserBranch(branch);
//        }
        //상세보기를 클릭하면 DB에 사용자의 각 평가 현황별 % 점수를 반환해준다.
        dashboardDTO.setDashBoardStartDate(this.FAILSTARTDATE);
        dashboardDTO.setDashBoardEndDate(this.FAILENDDATE);
        dashboardDTO.setDashboardCondition("selectScoreAndAvg");
        List<DashboardDTO> datas = dashboardService.selectAll(dashboardDTO);
        // 반환된 data를 가지고 json 형식으로 그래프를 그릴 수 있도록 반환한다.
        String responseJson = changeJson.convertListToJsonArray(datas,item ->{
            DashboardDTO dto = (DashboardDTO)item;
            return String.format("{\"completedCount\":{" +
                            "\"name\":\"종료자수\"," +
                            "\"data\":\"%d\"" +
                            "}," +
                            "\"myScore\": {" +
                            "    \"name\": \"개인 점수\"," +
                            "    \"data\": [%.2f,%.2f,%.2f,%.2f,%.2f,%.2f]," +  // %d를 %.2f로 변경
                            "    \"oneData\": [%.2f,%.2f,%.2f,%.2f,%.2f]" +
                            "  }," +
                            "  \"myCount\": {" +
                            "    \"name\": \"점수 분포\"," +
                            "    \"data\": [%d,%d,%d,%d,%d]," +
                            "    \"avgData\": [%.2f,%.2f,%.2f,%.2f,%.2f]" +
                            "  }}",
                    dto.getTotalCompleted(),
                    dto.getTotalScore(),dto.getEmploymentLastScore(),dto.getPlacementLastScore(),dto.getEarlyEmploymentLastScore(),dto.getRetentionLastScore(),dto.getBetterJobLastScore(),
                    dto.getEmploymentOneScore(),dto.getPlacementOneScore(),dto.getEarlyEmploymentOneScore(),dto.getRetentionOneScore(),dto.getBetterJobOneScore(),
                    dto.getTotalEmployed(),dto.getReferredEmploymentCount(),dto.getEarlyEmploymentCount(),dto.getRetentionCount(),dto.getBetterJobCount(),
                    dto.getEmploymentRate(),dto.getPlacementRate(),dto.getEarlyEmploymentRate(),dto.getRetentionRate(),dto.getBetterJobRate()
            );
        });

        log.info("scoreDashboard responseJson : [{}]",responseJson);

        model.addAttribute("scoreAndAvg",responseJson);

        return "views/DashBoardScoreAndSituation";
    }

    @GetMapping("scoreBranchDashboard.login")
    public String scoreBranchDashboard(Model model, DashboardDTO dashboardDTO){
        //내 지점 평균 그래프 클릭하면 DB에 사용자의 각 평가 현황별 % 점수를 반환해준다.
        dashboardDTO.setDashBoardStartDate(this.FAILSTARTDATE);
        dashboardDTO.setDashBoardEndDate(this.FAILENDDATE);
        dashboardDTO.setDashboardCondition("selectBranchAvg");
        List<DashboardDTO> datas = dashboardService.selectAll(dashboardDTO);
        // 반환된 data를 가지고 json 형식으로 그래프를 그릴 수 있도록 반환한다.
        String responseJson = changeJson.convertListToJsonArray(datas,item ->{
            DashboardDTO dto = (DashboardDTO)item;
            return String.format("{\"name\":\"%s\", \"data\":\"%.2f\"}",
                    dto.getDashboardBranch(),dto.getTotalBranchScoreAVG()
            );
        });

        log.info("scoreBranchDashboard responseJson : [{}]",responseJson);

        model.addAttribute("branchAvg",responseJson);

        return "views/DashBoardBranchScoreAndSituation";
    }
}
