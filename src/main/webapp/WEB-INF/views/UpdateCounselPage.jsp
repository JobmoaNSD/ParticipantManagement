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

    <!-- selectOption JS -->
    <script src="js/selectOptionJS.js"></script>

    <!-- sweetalert2 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
    <script src="js/sweetAlert.js"></script>


</head>
<body class="layout-fixed sidebar-expand-lg bg-body-tertiary">

<!--begin::App Wrapper-->
<div class="app-wrapper">
    <!--begin:::App Gnb-->
    <mytag:gnb gnb_main_header="상담관리" gnb_sub_header="참여자 수정"/>
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
                        <form id="newParticipantsForm" name="newParticipantsForm" method="POST" action="/updatecounsel.login" class="form-horizontal">
                            <%-- 참여자 수정 버튼 시작 --%>
                            <div class="row pb-2 mb-1">
                                <div class="col-12 text-end">
                                    <button type="button" class="btn btn-primary" id="btn_check">
                                        참여자 수정
                                    </button>
                                </div>
                            </div>
                            <%-- 참여자 수정 버튼 끝 --%>
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
                                        <div class="pb-2 mb-1 w-auto">
                                            <label for="counselJobSkill" class="form-label">취업역량</label>
                                            <select class="form-select" aria-label="Default select example" id="counselJobSkill" name="counselJobSkill">
                                                <option value=""></option>
                                                <option value="A">A</option>
                                                <option value="B">B</option>
                                                <option value="C">C</option>
                                                <option value="D">D</option>
                                            </select>
                                        </div>
                                        <div class="" style="width: 11%">
                                            <label for="counselLastCons" class="form-label" >최근상담일</label>
                                            <div class="input-group">
                                                <i class="bi bi-calendar-date input-group-text"></i>
                                                <input type="text" class="form-control datepicker_on" id="counselLastCons" name="counselLastCons" placeholder="yyyy-mm-dd" aria-label="최근상담일" value="${counsel.counselLastCons}">
                                            </div>
                                        </div>
                                        <div class="w-auto">
                                            <label for="counselProgress" class="form-label">진행단계</label>
                                            <select class="form-select" aria-label="Default select example" id="counselProgress" name="counselProgress">
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
                                        <div class="w-auto">
                                            <label for="counselSUCS" class="form-label">성공금_충족여부</label>
                                            <select class="form-select" aria-label="Default select example" id="counselSUCS" name="counselSUCS">
                                                <option selected value="고보미가입취업">고보미가입취업</option>
                                                <option value="본인">본인</option>
                                                <option value="알선">알선</option>
                                                <option value="소개취업">소개취업</option>
                                                <option value="1.5배알선">1.5배알선</option>
                                                <option value="창업">창업</option>
                                            </select>
                                        </div>
                                        <div class="" style="width: 11%">
                                            <label for="counselInItCons" class="form-label">초기상담일</label>
                                            <div class="input-group">
                                                <i class="bi bi-calendar-date input-group-text"></i>
                                                <input type="text" class="form-control datepicker_on" id="counselInItCons" name="counselInItCons" placeholder="yyyy-mm-dd" aria-label="초기상담일" value="${counsel.counselInItCons}">
                                            </div>
                                        </div>
                                        <div class="" style="width: 11%">
                                            <label for="counselJobEX" class="form-label">구직만료일</label>
                                            <div class="input-group">
                                                <i class="bi bi-calendar-date input-group-text"></i>
                                                <input type="text" class="form-control datepicker_on" id="counselJobEX" name="counselJobEX" placeholder="yyyy-mm-dd" aria-label="구직만료일" value="${counsel.counselJobEX}">
                                            </div>
                                        </div>
                                        <div class="" style="width: 11%">
                                            <label for="counselIAPDate" class="form-label">IAP수립일</label>
                                            <div class="input-group">
                                                <i class="bi bi-calendar-date input-group-text"></i>
                                                <input type="text" class="form-control datepicker_on" id="counselIAPDate" name="counselIAPDate" placeholder="yyyy-mm-dd" aria-label="IAP수립일" value="${counsel.counselIAPDate}">
                                            </div>
                                        </div>
                                        <div class="" style="width: 11%">
                                            <label for="counselStepPro" class="form-label">3단계진입일</label>
                                            <div class="input-group">
                                                <i class="bi bi-calendar-date input-group-text"></i>
                                                <input type="text" class="form-control datepicker_on" id="counselStepPro" name="counselStepPro" placeholder="yyyy-mm-dd" aria-label="3단계진입일" value="${counsel.counselStepPro}">
                                            </div>
                                        </div>
                                        <div class="" style="width: 11%">
                                            <label for="counselEXPDate" class="form-label">기간만료(예정)일</label>
                                            <div class="input-group">
                                                <i class="bi bi-calendar-date input-group-text"></i>
                                                <input type="text" class="form-control datepicker_on" id="counselEXPDate" name="counselEXPDate" placeholder="yyyy-mm-dd" aria-label="기간만료(예정)일" value="${counsel.counselEXPDate}">
                                            </div>
                                        </div>
                                        <div class="" style="width: 11%">
                                            <label for="counselClinic" class="form-label">클리닉실시일</label>
                                            <div class="input-group">
                                                <i class="bi bi-calendar-date input-group-text"></i>
                                                <input type="text" class="form-control datepicker_on" id="counselClinic" name="counselClinic" placeholder="yyyy-mm-dd" aria-label="클리닉실시일" value="${counsel.counselClinic}">
                                            </div>
                                        </div>
                                        <div class="w-auto">
                                            <label for="counselJobWant" class="form-label">희망직무</label>
                                            <input type="text" class="form-control" id="counselJobWant" name="counselJobWant" value="${counsel.counselJobWant}">

                                        </div>
                                        <div class="w-auto">
                                            <label for="counselSalWant" class="form-label">희망급여(단위 만원)</label>
                                            <input type="number" class="form-control" id="counselSalWant" name="counselSalWant" min="0" max="1000" placeholder="단위 만원" value="${counsel.counselSalWant}">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%-- 상담정보 입력 폼 끝 --%>
                        </form>
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

        <%-- form 전달 시작 --%>
        const btn_check = $("#btn_check") // 전송 버튼을 추가
        btn_check.on("click", function () {
           const form = $("#newParticipantsForm");
           form.submit();
        });
        <%-- form 전달 끝 --%>

        <%-- 목록 내용 변경 시작 --%>
        //취업역량
        selectOption($(".counselJobSkill"),${counselJobSkill});

        //진행단계 목록 내용 변경
        selectOption($(".counselProgress"),${counselProgress});

        //성공금_충족여부
        selectOption($(".counselSUCS"),${counselSUCS});
        <%-- 목록 내용 변경 끝 --%>
    });
</script>


</html>
