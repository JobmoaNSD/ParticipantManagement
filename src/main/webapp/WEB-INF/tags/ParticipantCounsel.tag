<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ attribute name="counsel" type="com.jobmoa.app.biz.participantCounsel.CounselDTO" %>

<%-- 상담정보 입력 폼 시작 --%>
<div class="row card mt-3">
    <div class="card-header">
        <h1 class="card-title">상담정보</h1>
        <div class="card-tools">
            <button type="button" class="btn btn-tool" data-lte-toggle="card-collapse" style="font-size: 1.5rem;">
                <i data-lte-icon="expand" class="bi bi-plus-lg"></i>
                <i data-lte-icon="collapse" class="bi bi-dash-lg"></i>
                <input type="hidden" id="counselJobNo" name="counselJobNo" value="${not empty param.counselJobNo ? param.counselJobNo : 0}">
            </button>
        </div>
    </div>
    <div class="card-body">
        <div class="row">
            <div class="pb-2 mb-1 w-auto">
                <label for="counselJobSkill" class="form-label">취업역량<span class="text-danger">*</span></label>
                <select class="form-select" aria-label="Default select example" id="counselJobSkill" name="counselJobSkill">
                    <option value=""></option>
                    <option value="A">A</option>
                    <option value="B">B</option>
                    <option value="C">C</option>
                    <option value="D">D</option>
                </select>
            </div>
            <div class="datepicker-div">
                <label for="counselLastCons" class="form-label" >최근상담일</label>
                <div class="input-group">
                    <i class="bi bi-calendar-date input-group-text"></i>
                    <input type="text" class="form-control datepicker_on" id="counselLastCons" name="counselLastCons" placeholder="yyyy-mm-dd" aria-label="최근상담일" value="${not empty counsel ? counsel.counselLastCons:""}"  autocomplete="off">
                </div>
            </div>
            <div class="w-auto">
                <label for="counselProgress" class="form-label">진행단계</label>
                <select class="form-select" aria-label="Default select example" id="counselProgress" name="counselProgress">
                    <option selected value="IAP 전">IAP 전</option>
                    <option value="IAP 후">IAP 후</option>
                    <option value="미고보">미고보</option>
                    <option value="고보일반">고보일반</option>
                    <option value="등록창업">등록창업</option>
                    <option value="미등록창업">미등록창업</option>
                    <option value="미취업사후관리">미취업사후관리</option>
                    <option value="미취업사후종료">미취업사후종료</option>
                    <option value="유예">유예</option>
                    <option value="취소">취소</option>
                    <option value="이관">이관</option>
                    <option value="중단">중단</option>
                </select>
            </div>
            <div class="datepicker-div">
                <label for="counselInItCons" class="form-label">초기상담일</label>
                <div class="input-group">
                    <i class="bi bi-calendar-date input-group-text"></i>
                    <input type="text" class="form-control datepicker_on" id="counselInItCons" name="counselInItCons" placeholder="yyyy-mm-dd" aria-label="초기상담일" value="${not empty counsel ? counsel.counselInItCons:""}" autocomplete="off">
                </div>
            </div>
            <div class="datepicker-div">
                <label for="counselJobEX" class="form-label">구직만료일</label>
                <div class="input-group">
                    <i class="bi bi-calendar-date input-group-text"></i>
                    <input type="text" class="form-control datepicker_on" id="counselJobEX" name="counselJobEX" placeholder="yyyy-mm-dd" aria-label="구직만료일" value="${not empty counsel ? counsel.counselJobEX:""}" autocomplete="off">
                </div>
            </div>
            <div class="datepicker-div">
                <label for="counselIAPDate" class="form-label">IAP수립일</label>
                <div class="input-group">
                    <i class="bi bi-calendar-date input-group-text"></i>
                    <input type="text" class="form-control datepicker_on" id="counselIAPDate" name="counselIAPDate" placeholder="yyyy-mm-dd" aria-label="IAP수립일" value="${not empty counsel ? counsel.counselIAPDate:""}" autocomplete="off">
                </div>
            </div>
            <div class="datepicker-div">
                <label for="counselStepPro" class="form-label">3단계진입일</label>
                <div class="input-group">
                    <i class="bi bi-calendar-date input-group-text"></i>
                    <input type="text" class="form-control datepicker_on" id="counselStepPro" name="counselStepPro" placeholder="yyyy-mm-dd" aria-label="3단계진입일" value="${not empty counsel ? counsel.counselStepPro:""}" autocomplete="off">
                </div>
            </div>
            <div class="datepicker-div">
                <label for="counselEXPDate" class="form-label">기간만료(예정)일<span class="text-danger">*</span></label>
                <div class="input-group">
                    <i class="bi bi-calendar-date input-group-text"></i>
                    <input type="text" class="form-control datepicker_on" id="counselEXPDate" name="counselEXPDate" placeholder="yyyy-mm-dd" aria-label="기간만료(예정)일" value="${not empty counsel ? counsel.counselEXPDate:""}" autocomplete="off">
                </div>
            </div>
            <div class="w-auto">
                <label for="counselJobWant" class="form-label">희망직무<span class="text-danger">*</span></label>
                <input type="text" class="form-control" id="counselJobWant" name="counselJobWant" value="${not empty counsel ? counsel.counselJobWant:""}">
            </div>
            <div class="w-auto">
                <label for="counselSalWant" class="form-label">희망급여(단위 만원)<span class="text-danger">*</span></label>
                <input type="number" class="form-control" id="counselSalWant" name="counselSalWant" min="0" max="1000" placeholder="단위 만원" value="${not empty counsel ? counsel.counselSalWant:""}">
            </div>
            <div class="col-md-1 w-auto">
                <label for="counselPlacement" class="form-label">알선요청</label>
                <select class="form-select" aria-label="Default select example" id="counselPlacement" name="counselPlacement">
                    <option value="미희망">미희망</option>
                    <option value="희망">희망</option>
                </select>
            </div>
            <div class="col-md-1 w-auto">
                <label for="counselEmploymentService" class="form-label">간접고용서비스</label>
                <select class="form-select" aria-label="Default select example" id="counselEmploymentService" name="counselEmploymentService">
                    <option value=""></option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                </select>
            </div>
            <%-- 교육내역 --%>
            <div class="row col-md-12 education-div mt-1">
                <div class="education-div-header">
                    <label for="education" class="form-label">
                        교육내역
                        <i class="bi bi-patch-plus-fill education-div-plus"></i>
                        <i class="bi bi-patch-minus education-div-minus" style="display: none"></i>
                    </label>
                </div>
                <div class="education-div-content d-flex" id="education">

                </div>
            </div>
        </div>
    </div>
</div>
<%-- 상담정보 입력 폼 끝 --%>