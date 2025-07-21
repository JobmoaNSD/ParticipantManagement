package com.jobmoa.app.CounselMain.biz.participantRandomAssignment;

import lombok.Data;

import java.util.List;

@Data
public class ParticipantRandomAssignmentDTO {
    private int pkNumber;
    private String counselor;
    private String participant;
    private String birthDate;
    private String gender;
    private String recruitmentPath;
    private String participationType;
    private String progressStage;
    private List<String> counselors;
    private List<String> participants;
    private List<String> birthDates;
    private List<String> genders;
    private List<String> recruitmentPaths;
    private List<String> participationTypes;
    private List<String> progressStages;

    //개발자 구분
    private String condition;
}
