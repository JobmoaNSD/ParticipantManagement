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
    private String participantEndDate; // 중단종료일
    private String participantJobWant; // 희망직무
    private int participantSalWant; // 희망급여
    private String participantEmploymentService; // 간접고용서비스
    
    //Counsel DB 외 컬럼
    private String participantAdventCons; // 상담도래자

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

    private String certificationName; //자격증 명칭
    private String participantUserName; // 상담사 이름
    private String participantEmail; // 이메일
    private String participantPhoneNumber; // 전화 번호
    private String participantCode; // 고유 번호

    //DB 외 정보
    private String participantCondition; // 개발자 구분

    //페이지네이션 정보
    private int page;
    private int pageRows;
    private int totalCount;
    private int startPage;
    private int endPage;

    //검색 변수
    private String endDateOption;
    private String searchOption;
    private String search;
    private String searchType;
    private String searchFilter;

    private int participantCount;

}
