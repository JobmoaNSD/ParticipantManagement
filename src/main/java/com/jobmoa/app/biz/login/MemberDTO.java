package com.jobmoa.app.biz.login;

import lombok.Data;

@Data
public class MemberDTO {
    // DB 변수(컬럼)
    private int memberLoginPK;
    private String memberBranch;
    private String memberUserName;
    private String memberRole;
    private String memberUserID;
    private String memberUserPW;
    private boolean memberISManager;
    private String memberRegDate;
    private String memberUniqueNumber;

    private String memberCondition; // 개발자 구분
}
