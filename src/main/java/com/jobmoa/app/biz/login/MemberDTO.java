package com.jobmoa.app.biz.login;

import lombok.Data;

@Data
public class MemberDTO {

    private int login_numPK; // PK
    private String login_id; // 아이디
    private String login_password; // 비밀번호
    private String login_spot; // 지점
    private String login_dedicatedPerson; // 전담자 (상담사 성명)
    private String login_position; // 직책
    private String login_registrationNumber; // 등록번호
    private boolean login_isAdmin; // 관리자 여부
    private String condition;
}
