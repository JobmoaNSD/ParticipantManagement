package com.jobmoa.app.biz.participant;

import lombok.Data;

@Data
public class ParticipantDTO {
    
    //Basic DB 컬럼
    private int participantJobNo; // PK(구직번호)
    private String participantRegDate; // 등록일
    private String participantBranch; // 지점
    private String participantUserid; // 전담자_계정
    private String participantPartic; // 참여자
    private String participantDob; // 생년월일
    private String participantGender; // 성별
    private String participantRecruit; // 모집경로
    private String participantPartType; // 참여유형
    private String participantSchool; // 학교명
    private String participantSpecialty; // 전공
    private String participantAddress; // 주소(시,구)
    private String participantAntecedents; // 경력
    private String participantSpecific; // 특정계층
    private String participantPlacement; // 알선요청
    private boolean participantClose; // 마감여부

    //Counsel DB 컬럼
    private String participantJobSkill; // 취업역량
    private String participantLastCons; // 최근상담일
    private String participantProgress; // 진행단계
    private String participantInItCons; // 초기상담일
    private String participantJobEX; // 구직만료일
    private String participantIAPDate; // IAP수료일
    private String participantStepPro; // 3단계진입일
    private String participantEXPDate; // 기간만료(예정)일
    private String participantClinic; // 클리닉실시일
    private String participantJobWant; // 희망직무
    private int participantSalWant; // 희망급여

    //Employment DB 컬럼
    private String participantStartDate; // 취창업일
    private String participantProcDate; // 취창업처리일
    private String participantEmpType; // 취업유형
    private String participantLoyer; // 취업처
    private int participantSalary; // 임금
    private String participantJobRole; // 직무
    private String participantIncentive; // 취업인센티브_구분
    private String participantJobcat; // 일경험분류
    private String participantMemo; // 메모
    private String participantOthers; // 기타정보
    private String participantQuit; // 기타정보

    //DB 외 정보
    private String participantCondition; // 개발자 구분

    //지점 전체 개수 및 인원
    private int totalCountBranch;
    private int totalCountUser;

    //페이지네이션 정보
    private int page;
    private int pageRows;
    private int totalCount;
    private int startPage;
    private int endPage;

    //검색 변수
    private String searchOption;
    private String search;
    private String searchFilter;

    private int participantCount;

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

}
