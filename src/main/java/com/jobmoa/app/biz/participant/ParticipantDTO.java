package com.jobmoa.app.biz.participant;

import lombok.Data;

@Data
public class ParticipantDTO {
    private int SERIAL_NUMBER; // 일련번호
    private String REGISTRATION_DATE; // 등록일
    private String branch; // 지점
    private String counselor; // 전담자
    private String participant; // 참여자
    private String recruitmentPath; // 모집경로
    private String participationType; // 참여유형
    private Boolean groupParticipation; // 집단여부
    private String groupStartDate; // 집단시작일
    private String groupEndDate; // 집단종료일
    private String schoolName; // 학교명
    private String major; // 전공
    private String ssn; // 주민등록번호
    private String unemploymentBenefitEndDate; // 실업급여종료일
    private String contact1; // 연락처_1
    private String contact2; // 연락처_2
    private Boolean unemploymentBenefitTarget; // 실업급여대상
    private String unemploymentBenefitStartDate; // 실업급여시작일
    private Boolean priorityTarget; // 가산점대상
    private String jobCompetency; // 취업역량
    private String jobSearchExpiryDate; // 구직만료일
    private String currentStage; // 진행단계
    private Integer initialCounselingElapsedMonths; // 초기상담경과개월_A
    private String initialCounselingDate; // 초기상담일
    private String recentCounselingDate; // 최근상담일
    private String misaEndDate; // 미사종료일
    private String cancelEndDate; // 취소종료일
    private String transferEndDate; // 이관종료일
    private String suspensionEndDate; // 중단종료일
    private String iapEstablishmentDate; // IAP수립일
    private String program; // 프로그램
    private String step3EntryDate; // 3단계진입일
    private String expiryDate; // 기간만료예정일
    private String clinicDate; // 클리닉실시일
    private String desiredJob; // 희망업무
    private String employmentEntrepreneurshipDate; // 취창업일
    private String employmentEntrepreneurshipProcessingDate; // 취창업처리일
    private String employmentType; // 취업유형
    private String resignationDate; // 퇴사일
    private String companyEmployed; // 취업처
    private String salary; // 임금
    private String occupation; // 직무
    private Boolean faceToFace3; // 3대면
    private Boolean above160k; // 160만원이상
    private Boolean excludeBonus; // 성공금제외
    private Boolean futureSavingPlan; // 내일채움공제
    private String bankName; // 은행명
    private String accountHolder; // 예금주
    private String accountNumber; // 계좌번호
    private String notes; // 메모
    private String exclusionReason; // 제유사유
    private Boolean closure; // 마감
    private String contact; // 연락처


    private String condition; // 개발자 구분
}
