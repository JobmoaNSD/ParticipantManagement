package com.jobmoa.app.biz.participantEmployment;

import lombok.Data;

@Data
public class EmploymentDTO {

    // DB 변수(컬럼)
    private int employmentEnployNo; // 취업번호
    private int employmentJobNo; // 구직번호
    private String employmentStartDate; // 취창업일
    private String employmentProcDate; // 취창업처리일
    private String employmentEmpType; // 취업유형
    private String employmentLoyer; // 취업처
    private String employmentSalary; // 임금
    private String employmentJobRole; // 직무
    private String employmentIncentive; // 취업인센티브_구분
    private String employmentJobcat; // 일경험분류
    private String employmentMemo; // 메모
    private String employmentOthers; // 기타정보

    // DB 외 변수
    private String employmentCondition; // 개발자 구분
}
