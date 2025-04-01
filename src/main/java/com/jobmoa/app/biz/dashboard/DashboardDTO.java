package com.jobmoa.app.biz.dashboard;

import lombok.Data;

@Data
public class DashboardDTO {
    private String dashboardUserID; //전담자 아이디
    private String dashboardBranch; //지점
    private int dashboardTotalCount; //참여자 수

    //DB 외 정보
    private String dashboardCondition; // 개발자 구분

    //지점 전체 개수 및 인원
    private int dashboardCountBranch;
    private int dashboardCountUser;
    private int dashboardCloseCount;

    //Query 조건용 변수 선언
    private String dashBoardYear;
//    private String dashBoardEndDate;

    //DashBoard에 전달해줄 변수 선언
    // 취업자 수
    private int dashBoardEmployedCountTotal;
    private int dashBoardEmployedCountBranch;
    private int dashBoardEmployedCountUser;

    // 알선 취업자 수
    private int dashBoardReferredEmployedCountTotal;
    private int dashBoardReferredEmployedCountBranch;
    private int dashBoardReferredEmployedCountUser;

    // 조기 취업자 수
    private int dashBoardEarlyEmployedCountTotal;
    private int dashBoardEarlyEmployedCountBranch;
    private int dashBoardEarlyEmployedCountUser;

    // 나은 일자리 수
    private int dashBoardBetterJobCountTotal;
    private int dashBoardBetterJobCountBranch;
    private int dashBoardBetterJobCountUser;

    // 고용유지 6개월
    private int dashBoardSixMonthRetentionCountTotal;
    private int dashBoardSixMonthRetentionCountBranch;
    private int dashBoardSixMonthRetentionCountUser;

    //고용유지 12개월
    private int dashBoardTwelveMonthRetentionCountTotal;
    private int dashBoardTwelveMonthRetentionCountBranch;
    private int dashBoardTwelveMonthRetentionCountUser;

    //성공금 금액 전달용 변수 전체,지점,개인 성공금
    private int dashBoardSuccessMoneyTotal;
    private int dashBoardSuccessMoneyBranch;
    private int dashBoardSuccessMoneyUser;
    //성공금 인센티브 금액 전달용 변수 전체,지점,개인 인센티브
    private int dashBoardSuccessMoneyTotalIncentive;
    private int dashBoardSuccessMoneyBranchIncentive;
    private int dashBoardSuccessMoneyUserIncentive;

    //참여자 현황 전달용 변수
    private int dashBoardParticipatedYearCount;
    private int dashBoardParticipatedCountOne;
    private int dashBoardParticipatedCountTwo;
    private int dashBoardParticipatedCountTotal;
    private int dashBoardParticipatedYear;
    private int dashBoardParticipatedInitiator;

    //긍일 업무 현황 변수
    private int dashBoardLastCons; // 최근상담일 15일 도래자
    private int dashBoardJobEX; // 구직만료일 15일 도래자
    private int dashBoardEXPDate; // 기간만료일 15일 도래자
    private int dashBoardInItCons; // 초기상담일 미실시자

    //성공금 상세 현황 변수
    private int dashBoardJobNo; // 성공금 상세 현황 구직번호
    private String dashBoardDate; // 성공금 상세 현황 날짜
    private String dashBoardUserName; // 성공금 상세 현황 전담자_이름
    private String dashBoardPartic; // 성공금 상세 현황 참여자_성명
    private int dashBoardSuccessMoney; // 성공금 상세 현황 성공금
    private int dashBoardIncentive; // 성공금 상세 현황 인센티브
    private String dashBoardUserBranch; // dashBoardBranch 오류발생으로 새로운 지점 변수 생성

}
