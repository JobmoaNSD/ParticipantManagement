package com.jobmoa.app.biz.login;

import lombok.Data;

@Data
public class MemberDTO {
    private int member_loginpk;
    private String member_branch;
    private String member_username;
    private String member_role;
    private String member_userid;
    private String member_userpw;
    private boolean member_ismanager;
    private String member_regdate;
    private String member_uniquenumber;

    private String member_condition; // 개발자 구분
}
