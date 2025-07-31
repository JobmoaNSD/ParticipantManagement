package com.jobmoa.app.CounselMain.biz.participantRandomAssignment;

import lombok.Data;

import java.util.List;

@Data
public class ParticipantRandomAssignmentDTO {
    private int pkNumber; // PK 번호
    private String counselor; // 상담사
    private String counselorID; // 상담사 ID
    private String branch; // 지점
    private String participant; // 참여자
    private String birthDate; // 생년월일
    private String gender; // 성별
    private String recruitmentPath; // 모집경로
    private String participationType; // 참여유형
    private String progressStage; // 진행단계
    private String specificClass; // 특정계층
    private List<String> counselors;
    private List<String> participants;
    private List<String> birthDates;
    private List<String> genders;
    private List<String> recruitmentPaths;
    private List<String> participationTypes;
    private List<String> progressStages;

    //조회할 데이터 DTO
    private int assignmentTotal;
    private int assignmentYear;
    private int assignmentYouth;
    private int assignmentMiddleAged;
    private int assignmentSpecialGroup;
    private int assignmentCurrent;
    private int assignmentMax;

    //개발자 구분
    private String condition;
}
