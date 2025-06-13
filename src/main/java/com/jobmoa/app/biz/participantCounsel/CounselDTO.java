package com.jobmoa.app.biz.participantCounsel;

import lombok.Data;

@Data
public class CounselDTO {

    // DB 변수(컬럼)
    private int counselJobNo; // 구직번호
    private String counselPartic; // 참여자 성명
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
    private String counselClinic; // 클리닉실시일
    private String counselJobWant; // 희망직무
    private String counselSalWant; // 희망급여
    private String counselEducation; // 직업훈련
    private String counselPlacement; // 알선요청
    private String counselEmploymentService; // 간접고용서비스
    private String counselIAP3Month; // IAP수료일 3개월차
    private String counselIAP5Month; // IAP수료일 5개월차
    private boolean counselISIAP3Month; // IAP수료일 3개월 이후 여부
    private boolean counselISIAP5Month; // IAP수료일 5개월 이후 여부
    private String counselAllowancePayment; // 수당지급

    // DB 외 변수
    private String counselCondition; //개발자 구분

}
