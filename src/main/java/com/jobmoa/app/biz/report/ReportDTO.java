package com.jobmoa.app.biz.report;

import lombok.Data;

@Data
public class ReportDTO {

    // DB 변수(컬럼)
    private String counselorName;        // 이름
    private int registYear;              // 등록년도
    private String branch;               // 지점
    private int cancelCount;             // 취소자
    private int totalParticipants;       // 전체참여자
    private int currentProgress;         // 현진행자
    private int thirdStageCount;         // 3단계진행자
    private int completedCount;          // 종료자
    private int discontinuedCount;       // 중단자
    private int nonApprovedEmployment;   // 성과 불인정 취업
    private int approvedEmployment;      // 성과 인정 취업
    private int totalEmployment;         // 전체취업자
    private int referralEmployment;      // 알선취업
    private int betterJobCount;          // 나은일자리
    private int earlyEmployment;         // 조기취업자
    private int employmentRetention;     // 고용유지
    private int iapEstablishMonth;       // IAP수립1달
    private int incentiveOccurred;       // 인센발생
    private int incentiveNotOccurred;    // 인센미발생
    private int type1; // Ⅰ유형
    private int type2; // Ⅱ유형

    // 비율 관련 필드 (소수점 처리를 위해 double 타입 사용)
    private double employmentRate;           // 취업률
    private double evaluationEmploymentRate;      // 평가취업률
    private double referralEmploymentRate;        // 알선취업률
    private double betterJobRate;                 // 나은일자리비율
    private double retentionRate;                 // 고용유지율
    private double earlyEmploymentRate;           // 조기취업자비율
    private double incentiveOccurrenceRate;       // 취업인센티브발생율

    // DB 외 변수
    private String userIds[]; //사용자 계정
    private String year; // 등록년도
    private String reportCondition; //개발자 구분

}
