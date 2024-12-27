package com.jobmoa.app.biz.participant;

import lombok.Data;

@Data
public class ParticipantDTO {
    private int participant_serial_number; // 일련번호
    private String participant_registration_date; // 등록일
    private String participant_branch; // 지점
    private String participant_counselor; // 전담자
    private String participant_participant; // 참여자
    private String participant_recruitmentPath; // 모집경로
    private String participant_participationType; // 참여유형
    private boolean participant_groupParticipation; // 집단여부
    private String participant_groupStartDate; // 집단시작일
    private String participant_groupEndDate; // 집단종료일
    private String participant_schoolName; // 학교명
    private String participant_major; // 전공
    private String participant_ssn; // 주민등록번호
    private String participant_unemploymentBenefitEndDate; // 실업급여종료일
    private String participant_contact1; // 연락처_1
    private String participant_contact2; // 연락처_2
    private boolean participant_unemploymentBenefitTarget; // 실업급여대상
    private String participant_unemploymentBenefitStartDate; // 실업급여시작일
    private boolean participant_priorityTarget; // 가산점대상
    private String participant_jobCompetency; // 취업역량
    private String participant_jobSearchExpiryDate; // 구직만료일
    private String participant_currentStage; // 진행단계
    private String participant_initialCounselingElapsedMonths; // 초기상담경과개월_A
    private String participant_initialCounselingDate; // 초기상담일
    private String participant_recentCounselingDate; // 최근상담일
    private String participant_misaEndDate; // 미사종료일
    private String participant_cancelEndDate; // 취소종료일
    private String participant_transferEndDate; // 이관종료일
    private String participant_suspensionEndDate; // 중단종료일
    private String participant_iapEstablishmentDate; // IAP수립일
    private String participant_program; // 프로그램
    private String participant_step3EntryDate; // 3단계진입일
    private String participant_expiryDate; // 기간만료예정일
    private String participant_clinicDate; // 클리닉실시일
    private String participant_desiredJob; // 희망업무
    private String participant_employmentEntrepreneurshipDate; // 취창업일
    private String participant_employmentEntrepreneurshipProcessingDate; // 취창업처리일
    private String participant_employmentType; // 취업유형
    private String participant_resignationDate; // 퇴사일
    private String participant_companyEmployed; // 취업처
    private String participant_salary; // 임금
    private String participant_occupation; // 직무
    private Boolean participant_faceToFace3; // 3대면
    private int participant_closure; // 마감


    //DB 외 정보
    private String participant_condition; // 개발자 구분
    private String participant_login_id;
}
