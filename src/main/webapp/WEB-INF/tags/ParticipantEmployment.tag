<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ attribute name="employment" type="com.jobmoa.app.biz.participantEmployment.EmploymentDTO" %>

<%-- 취업정보 입력 폼 시작 --%>
<div class="row card mt-3">
    <div class="card-header">
        <h1 class="card-title">취업정보</h1>
        <div class="card-tools">
            <button type="button" class="btn btn-tool" data-lte-toggle="card-collapse" style="font-size: 1.5rem;">
                <i data-lte-icon="expand" class="bi bi-plus-lg"></i>
                <i data-lte-icon="collapse" class="bi bi-dash-lg"></i>
                <input type="hidden" id="employmentJobNo" name="employmentJobNo" value="${not empty param.employmentJobNo ? param.employmentJobNo : 0}">
            </button>
        </div>
    </div>
    <div class="card-body">
        <div class="row">
            <div class="pb-2 mb-1 datepicker-div">
                <label for="employmentStartDate" class="form-label">취창업일<span class="text-danger">*</span></label>
                <div class="input-group">
                    <i class="bi bi-calendar-date input-group-text"></i>
                    <input type="text" class="form-control datepicker_on" id="employmentStartDate" name="employmentStartDate" placeholder="yyyy-mm-dd" aria-label="취창업일" value="${not empty employment ? employment.employmentStartDate:""}" autocomplete="off">
                </div>
            </div>
            <div class="datepicker-div">
                <label for="employmentProcDate" class="form-label" >취창업처리일</label>
                <div class="input-group">
                    <i class="bi bi-calendar-date input-group-text"></i>
                    <input type="text" class="form-control datepicker_on" id="employmentProcDate" name="employmentProcDate" placeholder="yyyy-mm-dd" aria-label="취창업처리일" value="${not empty employment ? employment.employmentProcDate:""}" autocomplete="off">
                </div>
            </div>
            <div class="pb-2 mb-1 datepicker-div">
                <label for="employmentQuit" class="form-label">퇴사일</label>
                <div class="input-group">
                    <i class="bi bi-calendar-date input-group-text"></i>
                    <input type="text" class="form-control datepicker_on" id="employmentQuit" name="employmentQuit" placeholder="yyyy-mm-dd" aria-label="퇴사일" value="${not empty employment ? employment.employmentQuit:""}" autocomplete="off">
                </div>
            </div>
            <div class="w-auto">
                <label for="employmentEmpType" class="form-label">취업유형<span class="text-danger">*</span></label>
                <select class="form-select" aria-label="Default select example" id="employmentEmpType" name="employmentEmpType">

                </select>
            </div>
            <div class="w-auto">
                <label for="employmentLoyer" class="form-label">취업처</label>
                <input type="text" class="form-control" id="employmentLoyer" name="employmentLoyer" value="${not empty employment ? employment.employmentLoyer:""}">
            </div>
            <div class="w-auto">
                <label for="employmentSalary" class="form-label">임금(단위 만원)<span class="text-danger">*</span></label>
                <input type="number" class="form-control" id="employmentSalary" name="employmentSalary" min="0" max="1000" placeholder="단위 만원" value="${not empty employment ? employment.employmentSalary:""}">

            </div>
            <div class="w-auto">
                <label for="employmentJobRole" class="form-label">직무</label>
                <input type="text" class="form-control" id="employmentJobRole" name="employmentJobRole" value="${not empty employment ? employment.employmentJobRole:""}">
            </div>
            <div class="w-auto">
                <label for="employmentIncentive" class="form-label">취업인센티브_구분<span class="text-danger">*</span></label>
                <select class="form-select" aria-label="Default select example" id="employmentIncentive" name="employmentIncentive">
                    <option value=""></option>
                    <option value="해당[컨설팅 알선 - 120%]">해당[컨설팅 알선 - 120%]</option>
                    <option value="해당[알선취업(외부소개) - 100%]">해당[알선취업(외부소개) - 100%]</option>
                    <option value="해당[대면상담 6회(알선3회) - 100%]">해당[대면상담 6회(알선3회) - 100%]</option>
                    <option value="해당[간접고용서비스 4회 - 50%]">해당[간접고용서비스 4회 - 50%]</option>
                    <option value="미해당[서비스 미제공]">미해당[서비스 미제공]</option>
                    <option value="미해당[1개월 미만 퇴사]">미해당[1개월 미만 퇴사]</option>
                    <option value="미해당[파견업체]">미해당[파견업체]</option>
                </select>
            </div>
            <div class="w-auto">
                <label for="employmentJobcat" class="form-label">일경험분류</label>
                <select class="form-select" aria-label="Default select example" id="employmentJobcat" name="employmentJobcat">
                    <option value=""></option>
                    <option value="신규진입">신규진입</option>
                    <option value="장기미취업">장기미취업</option>
                    <option value="경력자">경력자</option>
                    <option value="미경력중장년">미경력중장년</option>
                </select>
            </div>
            <div class="w-auto">
                <label for="employmentOthers" class="form-label">기타</label>
                <input type="text" class="form-control" id="employmentOthers" name="employmentOthers" value="${not empty employment ? employment.employmentOthers:""}">

            </div>
            <div class="" style="width: 100%;">
                <label for="employmentMemo" class="form-label">메모</label>
                <textarea class="form-control" id="employmentMemo" name="employmentMemo" rows="3" cols="10" placeholder="메모를 입력하세요.">${not empty employment ? employment.employmentMemo:""}</textarea>
            </div>
        </div>
    </div>
</div>
<%-- 취업정보 입력 폼 끝 --%>
