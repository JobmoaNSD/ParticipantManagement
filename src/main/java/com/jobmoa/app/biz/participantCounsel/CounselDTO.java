package com.jobmoa.app.biz.participantCounsel;

import lombok.Data;

@Data
public class CounselDTO {

    // DB 변수(컬럼)
    private int counselJobNo; // 구직번호
    private String counselBranch; // 지점
    private String counselUserid; // 전담자_계정
    private String counselJobSkill; // 취업역량
    private String counselLastCons; // 최근상담일
    private String counselProgress; // 진행단계
    private String counselSUCU; // 성공금충족여부
    private String counselInItCons; // 초기상담일
    private String counselJobEX; // 구직만료일
    private String counselIAPDate; // IAP수료일
    private String counselStepPro; // 3단계진입일
    private String counselEXPDate; // 기간만료(예정)일
    private String counselEndDate; // 중단종료일
    private String counselClinic; // 클리닉실시일
    private String counselJobWant; // 희망직무
    private String counselSalWant; // 희망급여
    private String counselEducation; // 직업훈련
    private String counselPlacement; // 알선요청
    private String counselEmploymentService; // 간접고용서비스

    // DB 외 변수
    private String counselCondition; //개발자 구분

}
