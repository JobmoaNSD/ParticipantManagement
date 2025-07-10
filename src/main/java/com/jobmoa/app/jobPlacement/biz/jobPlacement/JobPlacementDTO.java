package com.jobmoa.app.jobPlacement.biz.jobPlacement;

import lombok.Data;

@Data
public class JobPlacementDTO {
    /**
     * 구직번호
     */
    private String jobNumber;

    /**
     * 상담사
     */
    private String counselor;

    /**
     * 상담사 아이디
     */
    private String counselorId;

    /**
     * 참여자
     */
    private String participant;

    /**
     * 성별
     */
    private String gender;

    /**
     * 생년월일
     */
    private String birthDate;

    /**
     * 주소
     */
    private String address;

    /**
     * 학교명
     */
    private String schoolName;

    /**
     * 전공
     */
    private String major;

    /**
     * 희망직무
     */
    private String desiredJob;

    /**
     * 경력
     */
    private String career;

    /**
     * 나이
     */
    private int age;

    /**
     * 자격증
     */
    private String certificate;

    /**
     * 희망연봉
     */
    private String desiredSalary;

    /**
     * 이메일
     */
    private String email;

    /**
     * 고유번호
     */
    private String uniqueNumber;

    /**
     * 알선 상세 정보
     */
    private String placementDetail;

    /**
     * 상담사 전화번호
     */
    private String counselorPhone;

    /**
     * 페이지네이션 현재 페이지 번호
     */
    private int page;
    
    /**
     * 페이지네이션 시작 번호
     */
    private int startPage;

    /**
     * 페이지네이션 끝 번호
     */
    private int endPage;

    /**
     * 페이지네이션 불러올 데이터 개수
     */
    private int pageRows;
    
    /**
     * 페이지네이션 전체 데이터 개수
     */
    private int totalCount;

    /**
     * 검색 옵션
     */
    private String[] searchOption;

    /**
     * 개발자 변수
     */
    private String condition;

    /**
     * 검색어
     */
    private String searchType;

    /**
     * 나이 필터 시작
     */
    private int ageStartFilter;

    /**
     * 나이 필터 끝
     */
    private int ageEndFilter;

    /**
     * 희망 연봉 필터 시작
     */
    private int desiredSalaryStartFilter;
    
    /**
     * 희망 연봉 필터 끝
     */
    private int desiredSalaryEndFilter;

    /**
     * 성별 필터
     */
    private String genderFilter;

    /**
     * 필터 사용 flag
     */
    private boolean filterFlag;

}
