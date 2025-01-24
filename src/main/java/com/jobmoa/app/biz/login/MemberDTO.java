package com.jobmoa.app.biz.login;

import lombok.Data;

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

    private String memberCondition; // 개발자 구분
}
