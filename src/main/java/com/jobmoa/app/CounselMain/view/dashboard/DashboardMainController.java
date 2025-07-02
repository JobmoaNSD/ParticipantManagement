package com.jobmoa.app.CounselMain.view.dashboard;


import com.jobmoa.app.CounselMain.biz.bean.LoginBean;
import com.jobmoa.app.CounselMain.biz.dashboard.DashboardDTO;
import com.jobmoa.app.CounselMain.biz.dashboard.DashboardServiceImpl;
import com.jobmoa.app.CounselMain.view.function.ChangeJson;
import com.jobmoa.app.CounselMain.view.function.InfoBean;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Calendar;
import java.util.List;


@Slf4j
@Controller
public class DashboardMainController {
    @Autowired
    private DashboardServiceImpl dashboardService;

    @Autowired
    private ChangeJson changeJson;


    //내 성과에 표기될 문자를 입력
    private static final String[] DASHBOARD_TEXT = {"잡모아 평균","지점 평균","전담자"};
    //FIXME 평가 실적 시작 종료일
    private static final String FAILSTARTDATE = "2024-11-01";
    private static final String FAILENDDATE = "2025-10-31";

    @GetMapping("/dashboard.login")
    public String dashboardMain(Model model, HttpSession session, DashboardDTO dashboardDTO) {

//        long beforeTime = System.currentTimeMillis();

        log.info("Start dashboardMain Controller(GetMapping)");

        try {
            // 세션 정보 추출
            LoginBean loginBean = (LoginBean) session.getAttribute("JOBMOA_LOGIN_DATA");
            String userID = loginBean.getMemberUserID();
            String branch = loginBean.getMemberBranch();
            String dashBoardYear = dashboardDTO.getDashBoardYear() == null
                    ? String.valueOf(Calendar.getInstance().get(Calendar.YEAR))
                    : dashboardDTO.getDashBoardYear();

            log.info("DashBoard login ID : [{}] / Branch : [{}]", userID, branch);

            // DTO 설정
            setupDashboardDTO(dashboardDTO, userID, branch, dashBoardYear);

            // 데이터 조회 및 처리
            processDashboardData(model, dashboardDTO, dashBoardYear);

        } catch (Exception e) {
            log.error("Dashboard 데이터 로딩 실패", e);
            model.addAttribute("error", "데이터 로딩 중 오류가 발생했습니다.");
        }

//        long afterTime = System.currentTimeMillis();
//
//        log.info("End dashboardMain Controller(GetMapping) / beforeTime : [{}], afterTime : [{}]", beforeTime, afterTime);
//        log.info("End dashboardMain Controller(GetMapping) / Check Time : [{}]", (afterTime - beforeTime) / 1000);

        return "views/DashBoardPage";
    }

    private void setupDashboardDTO(DashboardDTO dto, String userID, String branch, String year) {
        dto.setDashboardUserID(userID);
        dto.setDashboardBranch(branch);
        dto.setDashBoardYear(year);
        dto.setDashBoardStartDate(FAILSTARTDATE);
        dto.setDashBoardEndDate(FAILENDDATE);
    }

    private void processDashboardData(Model model, DashboardDTO dashboardDTO, String dashBoardYear)
            throws Exception {

        // 기본 데이터
        model.addAttribute("dashBoardYear", dashBoardYear);
        model.addAttribute("dashBoardDataTitle", changeJson.toJson(DASHBOARD_TEXT));

        // 1. 지점 및 사용자 정보
        dashboardDTO.setDashboardCondition("selectBranchAndUser");
        DashboardDTO branchAndUser = dashboardService.selectOne(dashboardDTO);

        // 2. 성공금 정보
        dashboardDTO.setDashboardCondition("selectSuccessMoney");
        DashboardDTO successMoney = dashboardService.selectOne(dashboardDTO);

        if (branchAndUser != null && successMoney != null) {
            processSuccessMoneyData(model, branchAndUser, successMoney);
        }

        // 3. 일일 대시보드
        dashboardDTO.setDashboardCondition("selectDailyDashboard");
        DashboardDTO dailyParticipant = dashboardService.selectOne(dashboardDTO);
        model.addAttribute("dailyDashboard", dailyParticipant);

        // 4. 참여자 현황 - 기존 changeJson 활용
        processParticipantData(model, dashboardDTO);

        // 5. 성과 점수 현황 - 기존 changeJson 활용
        processScoreData(model, dashboardDTO);

        // 6. KPI 현황
        dashboardDTO.setDashboardCondition("myKPIDashboard");
        DashboardDTO myKPI = dashboardService.selectOne(dashboardDTO);
        model.addAttribute("myKPI", myKPI);
    }

    private void processSuccessMoneyData(Model model, DashboardDTO branchAndUser,
                                         DashboardDTO successMoney) {
        int branchCount = branchAndUser.getDashboardCountBranch();
        int userCount = branchAndUser.getDashboardCountUser();

        // 성공금 데이터
        int[] successMoneyArray = {
                successMoney.getDashBoardSuccessMoneyTotal() / branchCount,
                successMoney.getDashBoardSuccessMoneyBranch() / userCount,
                successMoney.getDashBoardSuccessMoneyUser()
        };

        // 인센티브 데이터
        int[] incentiveArray = {
                successMoney.getDashBoardSuccessMoneyTotalIncentive() / branchCount,
                successMoney.getDashBoardSuccessMoneyBranchIncentive() / userCount,
                successMoney.getDashBoardSuccessMoneyUserIncentive()
        };

        model.addAttribute("dashBoardSuccessMoney", changeJson.arrayToJson(successMoneyArray));
        model.addAttribute("dashBoardSuccessMoneyIncentive", changeJson.arrayToJson(incentiveArray));
    }

    private void processParticipantData(Model model, DashboardDTO dashboardDTO) {
        // 전체 참여자
        dashboardDTO.setDashboardCondition("selectTotalParticipant");
        List<DashboardDTO> totalParticipant = dashboardService.selectAll(dashboardDTO);

        String totalParticipantJsonData = changeJson.convertListToJsonArray(totalParticipant,
                item -> {
                    DashboardDTO dto = (DashboardDTO) item;
                    return "{\"year\":\"" + dto.getDashBoardParticipatedYear() + "\"," +
                            "\"data\":\"" + dto.getDashBoardParticipatedCountOne() + "\"}";
                });

        // 현재 참여자
        dashboardDTO.setDashboardCondition("selectCurrentParticipant");
        List<DashboardDTO> currentParticipant = dashboardService.selectAll(dashboardDTO);

        String currentParticipantJsonData = changeJson.convertListToJsonArray(currentParticipant,
                item -> {
                    DashboardDTO dto = (DashboardDTO) item;
                    return "{\"year\":\"" + dto.getDashBoardParticipatedYear() + "\"," +
                            "\"data\":\"" + dto.getDashBoardParticipatedCountOne() + "\"}";
                });

        // 현재 년도 참여자
        dashboardDTO.setDashboardCondition("selectNowParticipant");
        DashboardDTO nowParticipant = dashboardService.selectOne(dashboardDTO);

        String nowParticipantJsonData = "[]";
        if (nowParticipant != null) {
            nowParticipantJsonData = "[" +
                    "{\"year\":\"\",\"data\":\"" + nowParticipant.getDashBoardParticipatedCountOne() + "\"}," +
                    "{\"year\":\"\",\"data\":\"" + nowParticipant.getDashBoardParticipatedCountTwo() + "\"}" +
                    "]";
        }

        model.addAttribute("totalParticipantJsonData", totalParticipantJsonData);
        model.addAttribute("currentParticipantJsonData", currentParticipantJsonData);
        model.addAttribute("nowParticipantJsonData", nowParticipantJsonData);

        log.info("totalParticipantJsonData : [{}]", totalParticipantJsonData);
        log.info("currentParticipantJsonData : [{}]", currentParticipantJsonData);
        log.info("nowParticipantJsonData : [{}]", nowParticipantJsonData);
    }

    private void processScoreData(Model model, DashboardDTO dashboardDTO) {
        dashboardDTO.setDashboardCondition("selectRankAndScore");
        List<DashboardDTO> testDatas = dashboardService.selectAll(dashboardDTO);

        String scoreJson = changeJson.convertListToJsonArray(testDatas, item -> {
            DashboardDTO dto = (DashboardDTO) item;
            return "{\"myRanking\":\"" + dto.getMyRanking() + "\"," +
                    "\"myTotalRanking\":\"" + dto.getMyTotalRanking() + "\"," +
                    "\"myScore\":\"" + dto.getMyScore() + "\"," +
                    "\"data\":[\"" + dto.getTotalBranchScoreAVG() + "\",\"" +
                    dto.getMyBranchScoreAVG() + "\",\"" + dto.getMyScore() + "\"]," +
                    "\"totalTopScore\":\"" + dto.getTotalTopScore() + "\"," +
                    "\"pointsToNextGrade\":\"" + dto.getPointsToNextGrade() + "\"," +
                    "\"nextGrade\":\"" + dto.getNextGrade() + "\"" +
                    "}";
        });

        log.info("scoreJson : [{}]", scoreJson);
        model.addAttribute("scoreJson", scoreJson);
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
        dashboardDTO.setDashBoardStartDate(FAILSTARTDATE);
        dashboardDTO.setDashBoardEndDate(FAILENDDATE);
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
        dashboardDTO.setDashBoardStartDate(FAILSTARTDATE);
        dashboardDTO.setDashBoardEndDate(FAILENDDATE);
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
        //내 지점 평균 그래프 클릭하면 DB에 사용자의 각 평가 현황별 % 점수를 반환
        dashboardDTO.setDashBoardStartDate(FAILSTARTDATE);
        dashboardDTO.setDashBoardEndDate(FAILENDDATE);
        //처음 접속하면 1년 미만 근무자로 검색해서 가져올 예정이기 때문에 false를 지정
        dashboardDTO.setDashboardFlagCondition(false);
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
