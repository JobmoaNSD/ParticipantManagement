<%--
  Created by IntelliJ IDEA.
  User: no1fc
  Date: 24. 12. 30.
  Time: 오후 5:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag" %>
<html>
<head>
    <title>Title</title>
    <!--begin::Primary Meta Tags-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="title" content="AdminLTE v4 | Dashboard" />
    <meta name="author" content="ColorlibHQ" />
    <meta
            name="description"
            content="AdminLTE is a Free Bootstrap 5 Admin Dashboard, 30 example pages using Vanilla JS."
    />
    <meta
            name="keywords"
            content="bootstrap 5, bootstrap, bootstrap 5 admin dashboard, bootstrap 5 dashboard, bootstrap 5 charts, bootstrap 5 calendar, bootstrap 5 datepicker, bootstrap 5 tables, bootstrap 5 datatable, vanilla js datatable, colorlibhq, colorlibhq dashboard, colorlibhq admin dashboard"
    />
    <!--end::Primary Meta Tags-->
    <!-- jQuery JS -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

    <!--begin::Fonts-->
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/@fontsource/source-sans-3@5.0.12/index.css"
            integrity="sha256-tXJfXfp6Ewt1ilPzLDtQnJV4hclT9XuaZUKyUvmyr+Q="
            crossorigin="anonymous"
    />
    <!--end::Fonts-->
    <!--begin::Third Party Plugin(OverlayScrollbars)-->
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/overlayscrollbars@2.10.1/styles/overlayscrollbars.min.css"
            integrity="sha256-tZHrRjVqNSRyWg2wbppGnT833E/Ys0DHWGwT04GiqQg="
            crossorigin="anonymous"
    />
    <!--end::Third Party Plugin(OverlayScrollbars)-->
    <!--begin::Third Party Plugin(Bootstrap Icons)-->
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
            integrity="sha256-9kPW/n5nn53j4WMRYAxe9c1rCY96Oogo/MKSVdKzPmI="
            crossorigin="anonymous"
    />
    <!--end::Third Party Plugin(Bootstrap Icons)-->
    <!--begin::Required Plugin(AdminLTE)-->
    <link rel="stylesheet" href="css/adminlte.css" />
    <!--end::Required Plugin(AdminLTE)-->
    <!-- apexcharts -->
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/apexcharts@3.37.1/dist/apexcharts.css"
            integrity="sha256-4MX+61mt9NVvvuPjUWdUdyfZfxSB1/Rf9WtqRHgG5S0="
            crossorigin="anonymous"
    />
    <!-- jsvectormap -->
    <link
            rel="stylesheet"
            href="https://cdn.jsdelivr.net/npm/jsvectormap@1.5.3/dist/css/jsvectormap.min.css"
            integrity="sha256-+uGLJmmTKOqBr+2E6KDYs/NRsHxSkONXFHUL0fy2O/4="
            crossorigin="anonymous"
    />
    <!-- apexcharts -->
    <script
            src="https://cdn.jsdelivr.net/npm/apexcharts@3.37.1/dist/apexcharts.min.js"
            integrity="sha256-+vh8GkaU7C9/wbSLIcwq82tQ2wTf44aOHA8HlBMwRI8="
            crossorigin="anonymous"
    ></script>

    <!-- sortablejs -->
    <script
            src="https://cdn.jsdelivr.net/npm/sortablejs@1.15.0/Sortable.min.js"
            integrity="sha256-ipiJrswvAR4VAx/th+6zWsdeYmVae0iJuiR+6OqHJHQ="
            crossorigin="anonymous"
    ></script>
    <!--begin::Third Party Plugin(OverlayScrollbars)-->
    <script
            src="https://cdn.jsdelivr.net/npm/overlayscrollbars@2.10.1/browser/overlayscrollbars.browser.es6.min.js"
            integrity="sha256-dghWARbRe2eLlIJ56wNB+b760ywulqK3DzZYEpsg2fQ="
            crossorigin="anonymous"
    ></script>
    <!--end::Third Party Plugin(OverlayScrollbars)--><!--begin::Required Plugin(popperjs for Bootstrap 5)-->
    <script
            src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
            crossorigin="anonymous"
    ></script>
    <!--end::Required Plugin(popperjs for Bootstrap 5)--><!--begin::Required Plugin(Bootstrap 5)-->
    <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
            integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
            crossorigin="anonymous"
    ></script>

    <!--end::Required Plugin(Bootstrap 5)--><!--begin::Required Plugin(AdminLTE)-->
    <script src="js/adminlte.js"></script>
    <!--end::Required Plugin(AdminLTE)-->

    <!-- datepicker CSS JS -->
    <!-- Bootstrap Datepicker 로드 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.10.0/js/bootstrap-datepicker.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.10.0/locales/bootstrap-datepicker.ko.min.js" integrity="sha512-L4qpL1ZotXZLLe8Oo0ZyHrj/SweV7CieswUODAAPN/tnqN3PA1P+4qPu5vIryNor6HQ5o22NujIcAZIfyVXwbQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="js/datepickerJS.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.10.0/css/bootstrap-datepicker.min.css">
    <link rel="stylesheet" href="css/datepicker.css">

    <!-- recommend JS -->
    <script src="js/recommendJS.js"></script>

</head>
<body class="layout-fixed sidebar-expand-lg bg-body-tertiary">

<!--begin::App Wrapper-->
<div class="app-wrapper">
    <!--begin:::App Gnb-->
    <mytag:gnb gnb_main_header="상담관리" gnb_sub_header="신규 참여자"/>
    <!--end:::App Gnb-->
    <!--begin:::App main content-->
    <!--begin::App Main-->
    <main class="app-main">
        <!--begin::App Content-->
        <div class="app-content">
            <!--begin::Main content-->
            <!-- 필요 본문 내용은 이쪽에 만들어 주시면 됩니다. -->
            <div class="container-fluid">
                <div class="row pt-3">
                    <div class="col-md-12">
                        <%-- 기본정보 입력 폼 시작 --%>
                        <div class="row  card">
                            <div class="card-header">
                                <h1 class="card-title">기본정보</h1>
                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-lte-toggle="card-collapse" style="font-size: 1.5rem;">
                                        <i data-lte-icon="expand" class="bi bi-plus-lg"></i>
                                        <i data-lte-icon="collapse" class="bi bi-dash-lg"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-lg-1 pb-2 mb-1" style="width: 10%;">
                                        <label for="PARTIC" class="form-label">참여자</label>
                                        <input type="text" class="form-control" id="PARTIC" name="PARTIC">
                                    </div>
                                    <div class="col-md-1" style="width: 11%;">
                                        <label for="DOB" class="form-label"  >생년월일</label>
                                        <div class="input-group">
                                            <i class="bi bi-calendar-date input-group-text"></i>
                                            <input type="text" class="form-control datepicker_on" id="DOB" name="DOB" placeholder="yyyy-mm-dd" aria-label="생년월일">
                                        </div>
                                    </div>
                                    <div class="col-md-1" style="width: 6%;">
                                        <label for="GENDER" class="form-label">성별</label>
                                        <select class="form-select" aria-label="Default select example" id="GENDER" name="GENDER">
                                            <option selected value="남">남</option>
                                            <option value="여">여</option>
                                        </select>
                                    </div>
                                    <div class="col-md-1">
                                        <label for="RECRUIT" class="form-label">모집경로</label>
                                        <select class="form-select" aria-label="Default select example" id="RECRUIT" name="RECRUIT">
                                            <option selected value="센터배정">센터배정</option>
                                            <option value="대학">대학</option>
                                            <option value="고교">고교</option>
                                            <option value="훈련기관">훈련기관</option>
                                            <option value="자체모집">자체모집</option>
                                        </select>
                                    </div>
                                    <div class="col-md-1" style="width: 6%;">
                                        <label for="PARTTYPE" class="form-label">참여유형</label>
                                        <select class="form-select" aria-label="Default select example" id="PARTTYPE" name="PARTTYPE">
                                            <option selected value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="5">5</option>
                                        </select>
                                    </div>
                                    <div class="col-md-1" style="width: 15%;">
                                        <label for="SCHOOL" class="form-label">주소(시,구)</label>
                                        <input type="text" class="form-control" id="SCHOOL" name="SCHOOL">
                                        <div id="schoollist"></div>
                                    </div>
                                    <div class="col-md-1" style="width: 15%;">
                                        <label for="SPECIALTY" class="form-label">학교명</label>
                                        <input type="text" class="form-control" id="SPECIALTY" name="SPECIALTY">
                                        <div id="specialtylist"></div>
                                    </div>
                                    <div class="col-md-1" style="width: 15%;">
                                        <label for="ADDRESS" class="form-label">전공</label>
                                        <input type="text" class="form-control" id="ADDRESS" name="ADDRESS">
                                    </div>
                                    <div class="col-md-1" style="width: 8%;">
                                        <label for="ANTECEDENTS" class="form-label">경력</label>
                                        <input type="text" class="form-control" id="ANTECEDENTS" name="ANTECEDENTS">
                                    </div>
                                    <div class="col-md-2" style="width: 15%;">
                                        <label for="CERTIF" class="form-label">자격증</label>
                                        <input type="text" class="form-control" id="CERTIF" name="CERTIF">
                                    </div>
                                    <div class="col-md-1" style="width: 11%;">
                                        <label for="LSSUEDATE" class="form-label">발급일</label>
                                        <div class="input-group">
                                            <i class="bi bi-calendar-date input-group-text"></i>
                                            <input type="text" class="form-control datepicker_on" id="LSSUEDATE" name="LSSUEDATE" placeholder="yyyy-mm-dd" aria-label="발급일">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%-- 기본정보 입력 폼 끝 --%>

                        <%-- 상담정보 입력 폼 시작 --%>
                        <div class="row card mt-3">
                            <div class="card-header">
                                <h1 class="card-title">상담정보</h1>
                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-lte-toggle="card-collapse" style="font-size: 1.5rem;">
                                        <i data-lte-icon="expand" class="bi bi-plus-lg"></i>
                                        <i data-lte-icon="collapse" class="bi bi-dash-lg"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="pb-2 mb-1" style="width: 6%;">
                                        <label for="JOBSKILL" class="form-label">취업역량</label>
                                        <select class="form-select" aria-label="Default select example" id="JOBSKILL" name="JOBSKILL">
                                            <option value=""></option>
                                            <option value="A">A</option>
                                            <option value="B">B</option>
                                            <option value="C">C</option>
                                            <option value="D">D</option>
                                        </select>
                                    </div>
                                    <div class="" style="width: 11%;">
                                        <label for="LASTCONS" class="form-label" >최근상담일</label>
                                        <div class="input-group">
                                            <i class="bi bi-calendar-date input-group-text"></i>
                                            <input type="text" class="form-control datepicker_on" id="LASTCONS" name="LASTCONS" placeholder="yyyy-mm-dd" aria-label="최근상담일">
                                        </div>
                                    </div>
                                    <div class="" style="width: 10%;">
                                        <label for="PROGRESS" class="form-label">진행단계</label>
                                        <select class="form-select" aria-label="Default select example" id="PROGRESS" name="PROGRESS">
                                            <option selected value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="미고보">미고보</option>
                                            <option value="고보일반">고보일반</option>
                                            <option value="등록창업">등록창업</option>
                                            <option value="미등록창업">미등록창업</option>
                                            <option value="미사">미사</option>
                                            <option value="미사종">미사종</option>
                                            <option value="유예">유예</option>
                                            <option value="취소">취소</option>
                                            <option value="이관">이관</option>
                                            <option value="중단">중단</option>
                                        </select>
                                    </div>
                                    <div class="" style="width: 12%;">
                                        <label for="SUC_M" class="form-label">성공금_충족여부</label>
                                        <select class="form-select" aria-label="Default select example" id="SUC_M" name="SUC_M">
                                            <option selected value="고보미가입취업">고보미가입취업</option>
                                            <option value="본인">본인</option>
                                            <option value="알선">알선</option>
                                            <option value="소개취업">소개취업</option>
                                            <option value="1.5배알선">1.5배알선</option>
                                            <option value="창업">창업</option>
                                        </select>
                                    </div>
                                    <div class="" style="width: 11%;">
                                        <label for="INITCONS" class="form-label">초기상담일</label>
                                        <div class="input-group">
                                            <i class="bi bi-calendar-date input-group-text"></i>
                                            <input type="text" class="form-control datepicker_on" id="INITCONS" name="INITCONS" placeholder="yyyy-mm-dd" aria-label="초기상담일">
                                        </div>
                                    </div>
                                    <div class="" style="width: 11%;">
                                        <label for="JOBEX" class="form-label">구직만료일</label>
                                        <div class="input-group">
                                            <i class="bi bi-calendar-date input-group-text"></i>
                                            <input type="text" class="form-control datepicker_on" id="JOBEX" name="JOBEX" placeholder="yyyy-mm-dd" aria-label="구직만료일">
                                        </div>
                                    </div>
                                    <div class="" style="width: 11%;">
                                        <label for="IAPDATE" class="form-label">IAP수립일</label>
                                        <div class="input-group">
                                            <i class="bi bi-calendar-date input-group-text"></i>
                                            <input type="text" class="form-control datepicker_on" id="IAPDATE" name="IAPDATE" placeholder="yyyy-mm-dd" aria-label="IAP수립일">
                                        </div>
                                    </div>
                                    <div class="" style="width: 11%;">
                                        <label for="STEPAPPROACH" class="form-label">3단계진입일</label>
                                        <div class="input-group">
                                            <i class="bi bi-calendar-date input-group-text"></i>
                                            <input type="text" class="form-control datepicker_on" id="STEPAPPROACH" name="STEPAPPROACH" placeholder="yyyy-mm-dd" aria-label="3단계진입일">
                                        </div>
                                    </div>
                                    <div class="" style="width: 11%;">
                                        <label for="EXPDATE" class="form-label">기간만료(예정)일</label>
                                        <div class="input-group">
                                            <i class="bi bi-calendar-date input-group-text"></i>
                                            <input type="text" class="form-control datepicker_on" id="EXPDATE" name="EXPDATE" placeholder="yyyy-mm-dd" aria-label="기간만료(예정)일">
                                        </div>
                                    </div>
                                    <div class="" style="width: 11%;">
                                        <label for="CLINIC" class="form-label">클리닉실시일</label>
                                        <div class="input-group">
                                            <i class="bi bi-calendar-date input-group-text"></i>
                                            <input type="text" class="form-control datepicker_on" id="CLINIC" name="CLINIC" placeholder="yyyy-mm-dd" aria-label="클리닉실시일">
                                        </div>
                                    </div>
                                    <div class="" style="width: 15%;">
                                        <label for="JOBWANT" class="form-label">희망직무</label>
                                        <input type="text" class="form-control" id="JOBWANT" name="JOBWANT">

                                    </div>
                                    <div class="" style="width: 10%;">
                                        <label for="SALWANT" class="form-label">희망급여</label>
                                        <input type="number" class="form-control" id="SALWANT" name="SALWANT" min="0" max="1000" placeholder="단위 만원">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%-- 상담정보 입력 폼 끝 --%>

                        <%-- 취업정보 입력 폼 시작 --%>
                        <div class="row card mt-3">
                            <div class="card-header">
                                <h1 class="card-title">취업정보</h1>
                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-lte-toggle="card-collapse" style="font-size: 1.5rem;">
                                        <i data-lte-icon="expand" class="bi bi-plus-lg"></i>
                                        <i data-lte-icon="collapse" class="bi bi-dash-lg"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="pb-2 mb-1" style="width: 11%;">
                                        <label for="STARTDATE" class="form-label">취창업일</label>
                                        <div class="input-group">
                                            <i class="bi bi-calendar-date input-group-text"></i>
                                            <input type="text" class="form-control datepicker_on" id="STARTDATE" name="STARTDATE" placeholder="yyyy-mm-dd" aria-label="취창업일">
                                        </div>
                                    </div>
                                    <div class="" style="width: 11%;">
                                        <label for="PROCDATE" class="form-label" >취창업처리일</label>
                                        <div class="input-group">
                                            <i class="bi bi-calendar-date input-group-text"></i>
                                            <input type="text" class="form-control datepicker_on" id="PROCDATE" name="PROCDATE" placeholder="yyyy-mm-dd" aria-label="취창업처리일">
                                        </div>
                                    </div>
                                    <div class="" style="width: 11%;">
                                        <label for="EMPTYPE" class="form-label">취업유형</label>
                                        <select class="form-select" aria-label="Default select example" id="EMPTYPE" name="EMPTYPE">
                                            <option value=""></option>
                                            <option value="본인">본인</option>
                                            <option value="알선">알선</option>
                                            <option value="소개취업">소개취업</option>
                                            <option value="1.5배알선">1.5배알선</option>
                                        </select>
                                    </div>
                                    <div class="" style="width: 10%;">
                                        <label for="EMPLOYER" class="form-label">취업처</label>
                                        <input type="text" class="form-control" id="EMPLOYER" name="EMPLOYER">
                                    </div>
                                    <div class="" style="width: 8%;">
                                        <label for="SALARY" class="form-label">임금</label>
                                        <input type="number" class="form-control" id="SALARY" name="SALARY" min="0" max="1000" placeholder="단위 만원">

                                    </div>
                                    <div class="" style="width: 10%;">
                                        <label for="JOBROLE" class="form-label">직무</label>
                                        <input type="text" class="form-control" id="JOBROLE" name="JOBROLE">
                                    </div>
                                    <div class="" style="width: 14%;">
                                        <label for="INCENTIVE" class="form-label">취업인센티브_구분</label>
                                        <select class="form-select" aria-label="Default select example" id="INCENTIVE" name="INCENTIVE">
                                            <option value=""></option>
                                            <option value="해당[컨설팅 알선 - 120%]">해당[컨설팅 알선 - 120%]</option>
                                            <option value="해당[알선취업 - 100%]">해당[알선취업 - 100%]</option>
                                            <option value="해당[외부구인정보 소개 - 100%]">해당[외부구인정보 소개 - 100%]</option>
                                            <option value="해당[대면상담 6회 - 100%]">해당[대면상담 6회 - 100%]</option>
                                            <option value="해당[간접고용서비스 4회 - 50%]">해당[간접고용서비스 4회 - 50%]</option>
                                            <option value="미해당[서비스 미제공]">미해당[서비스 미제공]</option>
                                            <option value="미해당[1개월 미만 퇴사]">미해당[1개월 미만 퇴사]</option>
                                            <option value="미해당[파견업체]">미해당[파견업체]</option>
                                        </select>
                                    </div>
                                    <div class="" style="width: 10%;">
                                        <label for="JOBCAT" class="form-label">일경험분류</label>
                                        <select class="form-select" aria-label="Default select example" id="JOBCAT" name="JOBCAT">
                                            <option value=""></option>
                                            <option value="신규진입">신규진입</option>
                                            <option value="장기미취업">장기미취업</option>
                                            <option value="경력자">경력자</option>
                                            <option value="미경력중장년">미경력중장년</option>
                                        </select>
                                    </div>
                                    <div class="" style="width: 15%;">
                                        <label for="OTHERS" class="form-label">기타</label>
                                        <input type="text" class="form-control" id="OTHERS" name="OTHERS">

                                    </div>
                                    <div class="" style="width: 100%;">
                                        <label for="MEMO" class="form-label">메모</label>
                                        <textarea class="form-control" id="MEMO" name="MEMO" rows="3" cols="10" placeholder="메모를 입력하세요."></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <%-- 취업정보 입력 폼 끝 --%>
                        <%-- 참여자 등록 버튼 시작 --%>
                        <div class="row pt-2 mt-3">
                            <div class="col-12 text-end">
                                <button type="button" class="btn btn-primary" class="btn btn-check" id="btn_check">
                                    신규 참여자 등록
                                </button>
                            </div>
                        </div>
                        <%-- 참여자 등록 버튼 끝 --%>
                    </div>
                </div>
            </div>
            <!--end::Main content-->
        </div>
        <!--end::App Content-->
    </main>
    <!--end::App Main-->
    <!--end:::App main content-->
    <!--begin::Footer-->
    <mytag:footer/>
    <!--end::Footer-->

</div>

</body>
<!--begin::Script-->
<!--begin::OverlayScrollbars Configure-->
<script>
    const SELECTOR_SIDEBAR_WRAPPER = '.sidebar-wrapper';
    const Default = {
        scrollbarTheme: 'os-theme-light',
        scrollbarAutoHide: 'leave',
        scrollbarClickScroll: true,
    };
    document.addEventListener('DOMContentLoaded', function () {
        const sidebarWrapper = document.querySelector(SELECTOR_SIDEBAR_WRAPPER);
        if (sidebarWrapper && typeof OverlayScrollbarsGlobal?.OverlayScrollbars !== 'undefined') {
            OverlayScrollbarsGlobal.OverlayScrollbars(sidebarWrapper, {
                scrollbars: {
                    theme: Default.scrollbarTheme,
                    autoHide: Default.scrollbarAutoHide,
                    clickScroll: Default.scrollbarClickScroll,
                },
            });
        }
    });
</script>
<!--end::OverlayScrollbars Configure-->

<!-- OPTIONAL SCRIPTS -->
<!-- sortablejs -->
<script>
    const connectedSortables = document.querySelectorAll('.connectedSortable');
    connectedSortables.forEach((connectedSortable) => {
        let sortable = new Sortable(connectedSortable, {
            group: 'shared',
            handle: '.card-header',
        });
    });

    const cardHeaders = document.querySelectorAll('.connectedSortable .card-header');
    cardHeaders.forEach((cardHeader) => {
        cardHeader.style.cursor = 'move';
    });
</script>

<script>
    $(document).ready(function () {

        let schoolData = ["test","st","qwer"];
        recommendFunction("#SCHOOL", "#schoollist",schoolData);

        let specialtyData = ["test","st","qwer"];
        recommendFunction("#SPECIALTY", "#specialtylist",specialtyData);
    });
</script>


</html>
