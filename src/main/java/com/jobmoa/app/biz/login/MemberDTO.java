package com.jobmoa.app.biz.login;

import lombok.Data;

import java.util.List;

@Data
public class MemberDTO {
    // DB 변수(컬럼)
    private int memberLoginPK; //전담자 PK 번호
    private String memberBranch; //전담자 지점
    private String memberUserName; //전담자 이름
    private String memberRole; //전담자 권한
    private String memberUserID; //전담자 아이디
    private String memberUserPW; //전담자 비밀번호
    private boolean memberISManager; //전담자 관리자 권한
    private String memberRegDate; //전담자 동록일
    private String memberUniqueNumber; //전담자 고유번호
    private int memberTodayEmployment;// 금일 누적 실적 일반 취업
    private int memberTodayPlacement;// 금일 누적 실적 알선 취업
    private int memberToWeekEmployment;// 주간 누적 실적 일반 취업
    private int memberToWeekPlacement;// 주간 누적 실적 알선 취업
    private int memberToMonthEmployment;// 월간 누적 실적 일반 취업
    private int memberToMonthPlacement;// 월간 누적 실적 알선 취업
    private int memberToYearEmployment;// 연간 누적 실적 일반 취업
    private int memberToYearPlacement;// 연간 누적 실적 알선 취업
    private String endUpdateStatus; // 실적 마지막 저장일

    //누적실적 데이터를 위한 DB 변수(컬럼)
    private List<Integer> memberTodayEmployments;// 금일 누적 실적 일반 취업
    private List<Integer> memberTodayPlacements;// 금일 누적 실적 알선 취업
    private List<Integer> memberToWeekEmployments;// 주간 누적 실적 일반 취업
    private List<Integer> memberToWeekPlacements;// 주간 누적 실적 알선 취업
    private List<Integer> memberToMonthEmployments;// 월간 누적 실적 일반 취업
    private List<Integer> memberToMonthPlacements;// 월간 누적 실적 알선 취업
    private List<Integer> memberToYearEmployments;// 연간 누적 실적 일반 취업
    private List<Integer> memberToYearPlacements;// 연간 누적 실적 알선 취업

    private String[] userIds; //사용자 계정

    private int memberType1; // Ⅰ유형
    private int memberType2; // Ⅱ유형

    private String memberCondition; // 개발자 구분
}
