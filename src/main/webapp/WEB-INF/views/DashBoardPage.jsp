<%--
  Created by IntelliJ IDEA.
  User: no1fc
  Date: 24. 12. 30.
  Time: 오후 5:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag" %>
<!DOCTYPE html>
<html>
<head>
    <title>잡모아</title>
    <!-- Jobmoa 로고 탭 이미지 -->
    <mytag:Logo/>

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

    <!-- mouse pointer 모양 bootstrap 5 -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />

    <!-- chart.js script -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>

    <script src="js/drawChartCenterTextPlugin.js"></script>
    <script src="js/dashBoardJS.js"></script>

    <!-- ApexChart로 변경 -->
    <script src="js/ApexChartMainDashBoardJS.js"></script>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

    <!-- 랜덤 색상 지정 -->
    <script src="js/randomColorGenerator.js"></script>

    <!-- 진행바 스타일 적용 -->
    <link rel="stylesheet" href="css/dashboard.css">

</head>
<body class="layout-fixed sidebar-expand-lg bg-body-tertiary">

<!--begin::App Wrapper-->
<div class="app-wrapper">
    <!--begin:::App Gnb-->
    <mytag:gnb gnb_main_header="실적관리" gnb_sub_header="대시보드"/>
    <!--end:::App Gnb-->
    <!--begin:::App main content-->
    <!--begin::App Main-->
    <main class="app-main">
        <!--begin::App Content-->
        <div class="app-content">
            <!--begin::Main content-->
            <!-- 필요 본문 내용은 이쪽에 만들어 주시면 됩니다. -->
            <div class="container-fluid">
                <!-- begin::main content header 시작-->
                <div class="header row d-flex justify-content-between align-items-center bg-white border border-black rounded-2 m-1">
                    <!-- begin::main 지점 / 다우톡 주요 공지사항 시작 -->
                    <%--                    <div class="col-md-12 pt-0">--%>
                    <%--                        <div class="row">--%>
                    <div class="col-md-2">
                        <div class="h5 mt-1">
                            ${JOBMOA_LOGIN_DATA.memberBranch}지점
                        </div>
                        <div class="h3 m-0">
                            ${JOBMOA_LOGIN_DATA.memberUserName} 상담사
                        </div>
                    </div>
                    <div class="col-md-1 d-flex flex-column align-items-center justify-content-center p-0 ms-auto border-end border-dark border-2">
                        <div class="h6">
                            년도 조회
                        </div>
                        <div class="">
                            <select class="form-select form-select-sm" id="yearSelect">
                                <%--                                        <option value="2025">2025</option>--%>
                                <%--                                        <option value="2024">2024</option>--%>
                                <%--                                        <option value="2023">2023</option>--%>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-9 d-flex align-items-center justify-content-center p-0 ms-auto">
                        <div class="h6 h-100 d-flex align-items-center m-0 ms-auto me-auto">
                            <a class="link-dark link-underline-opacity-0" href="https://jobmoa.daouoffice.com/app/board"  target="_blank">다우톡 공지사항</a>
                        </div>
                        <div class="h6 h-100 d-flex align-items-center m-0 ms-auto me-auto">
                            <a class="link-dark link-underline-opacity-0" href="https://namsdn8n.monster/form/직무분석" target="_blank">AI 직무분석</a>
                        </div>
                        <div class="h6 h-100 d-flex align-items-center m-0 ms-auto me-auto">
                            <a class="link-dark link-underline-opacity-0" href="https://namsdn8n.monster/form/자기소개서" target="_blank">AI 자소서 생성</a>
                        </div>
                        <div class="h6 h-100 d-flex align-items-center m-0 ms-auto me-auto">
                            <a class="link-dark link-underline-opacity-0" href="https://jobmoa.daouoffice.com/app/board" target="_blank">AI 컨설팅 알선</a>
                        </div>
                        <div class="h6 h-100 d-flex align-items-center m-0 ms-auto me-auto">
                            <a class="link-dark link-underline-opacity-0" href="https://jobmoa.daouoffice.com/app/board" target="_blank">업무 메뉴얼</a>
                        </div>
                    </div>

                    <%--                        </div>--%>
                    <%--                    </div>--%>
                    <!-- end::main 지점 / 다우톡 주요 공지사항 끝 -->

                </div>
                <!-- begin::main 기본 header 끝-->

                <!-- begin::main 업무 참여자 통계 시작 -->
                <div class="row d-flex text-start bg-white border border-black rounded-2 pt-1 pb-1 m-1">
                    <div class="col-md-3 p-0">
                        <div class="col-md-12">
                            <div class="col-md-12 h2 ps-1">
                                금일 업무
                            </div>
                            <div class="col-md-12">
                                <ul class="list-group list-group-flush">
                                    <c:if test="${not empty dailyDashboard}">
                                        <li class="list-group-item d-flex border-bottom-0">
                                            <div class="">
                                                <div>초기상담 미실시자 ${dailyDashboard.dashBoardInItCons}명</div>
                                            </div>
                                        </li>
                                        <li class="list-group-item d-flex border-bottom-0">
                                            <div class="">
                                                <div>최근상담일 21일 경과자 ${dailyDashboard.dashBoardLastCons}명</div>
                                            </div>
                                        </li>
                                        <li class="list-group-item d-flex border-bottom-0">
                                            <div class="">
                                                <div>구직 만료 도래자 ${dailyDashboard.dashBoardJobEX}명</div>
                                            </div>
                                        </li>
                                        <li class="list-group-item d-flex border-bottom-0">
                                            <div class="">
                                                <div>기간 만료 예정자 ${dailyDashboard.dashBoardEXPDate}명</div>
                                            </div>
                                        </li>
                                    </c:if>
                                    <c:if test="${empty dailyDashboard}">
                                        <li class="list-group-item d-flex border-bottom-0">
                                            <div class="">
                                                <div>확인할 내역이 없습니다.</div>
                                            </div>
                                        </li>
                                    </c:if>
                                    <hr/>
                                    <%--
                                    FIXME 상담사 개인별 취업율을 확실하게 구분할 수 있도록 페이지에 내용을 추가.
                                    이번에 추가하면서 최적화가 가능하면 최적화를 진행하는 것이 가장 좋을 것 같다.
                                    Hosting server에서 DB 연결 후 사용하는 것이 DB 데이터가 쫌 더 빠르게 불러와질 확율이 있다.
                                    이유: local에서 직접 요청 불러오기 진행되는 것이니 사용자 요청 수신만 빠르면 되는 상황
                                    PC내에서 테스트하는 것과 동일하다고 볼 수 있을 듯함
                                    --%>
                                    <li class="list-group-item d-flex border-bottom-0">
                                        <div>
                                            <div>현재 취업자 ${employmentRate.dashBoardEarlyEmployedCountUser}명</div>
                                        </div>
                                    </li>
                                    <li class="list-group-item d-flex border-bottom-0">
                                        <div>
                                            <div>취업률 ${employmentRate.employmentRate}%</div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 border-start border-dark border-2">
                        <div class="row h2 ps-1">
                            참여자 통계
                        </div>
                        <div class="row">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item d-flex justify-content-between">
                                    <div class="ms-2 me-auto text-start w-100" id="thisYearParticipant">
                                        <%--                                            <div class="fw-bold">2025년 총 참여자 수 00명 (이관자 00명)</div>--%>
                                        <%--                                            <div>Ⅰ유형 00명 / Ⅱ유형 00명</div>--%>
                                        <%--                                            <div class="progress rounded rounded-2">--%>
                                        <%--                                                <div class="progress-bar" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25%</div>--%>
                                        <%--                                                <div class="progress-bar" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25%</div>--%>
                                        <%--                                            </div>--%>
                                    </div>
                                </li>
                                <li class="list-group-item d-flex justify-content-between">
                                    <div class="ms-2 me-auto text-start w-100" id="currentParticipant">
                                        <%--                                            <div class="fw-bold">현재 진행자 수 00명</div>--%>
                                        <%--                                            <div>2025년 00명 / 2024년 00명 / 2023년 00명 (이관자 00명 포함)</div>--%>
                                        <%--                                            <div class="progress rounded rounded-2">--%>
                                        <%--                                                <div class="progress-bar" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25%</div>--%>
                                        <%--                                                <div class="progress-bar" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25%</div>--%>
                                        <%--                                                <div class="progress-bar" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25%</div>--%>
                                        <%--                                            </div>--%>
                                    </div>
                                </li>
                                <li class="list-group-item d-flex justify-content-between">
                                    <div class="ms-2 me-auto text-start w-100" id="totalParticipant">
                                        <%--                                            <div class="fw-bold">총 참여자 수 00명</div>--%>
                                        <%--                                            <div>2025년 00명 / 2024년 00명 / 2023년 00명 (이관자 00명 포함)</div>--%>
                                        <%--                                            <div class="progress rounded rounded-2">--%>
                                        <%--                                                <div class="progress-bar" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25%</div>--%>
                                        <%--                                                <div class="progress-bar" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25%</div>--%>
                                        <%--                                                <div class="progress-bar" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">25%</div>--%>
                                        <%--                                            </div>--%>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md-5 border-start border-dark border-2">
                        <div class="row ps-1">
                            <div class="col-md-12">
                                <div class="d-flex">
                                    <div class="flex-grow-1">
                                        <div class="d-flex">
                                            <div class="flex-grow-1 h2">성과 점수 현황</div>
                                            <div class="flex-grow-1 d-flex align-items-start justify-content-end">
                                                <a
                                                        class="btn btn-outline-secondary btn-sm text-center"
<%--                                                        onclick="alert('제작중인 페이지입니다.')"--%>
                                                        href="${IS_MANAGER? "scoreBranchDashboard.login":"scoreDashboard.login"}">
                                                    상세정보
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="d-flex">
                                    <!-- 그래프 영역 -->
                                    <div id="scoreChart" class="flex-grow-1 w-100 mw-100"></div>
                                    <!-- 등수 표시 영역 -->
                                    <div class="ms-1 d-flex flex-column justify-content-center">
                                        <div class="rank-box text-center" style="width: 150px; max-width: 150px">
                                            <h3 class="mb-0">등급 : <span id="myRanking"></span></h3>
                                            <div id="myTotalRanking" class="rank-number display-4 fw-bold text-primary fs-1"></div>
                                            <div id="nextRanking" class="fs-8"></div>
                                            <div class="text-center fs-8 mt-3 font-color text-muted">
                                                입사(발령) 1년 미만자는<br> 실적 데이터 신뢰도 낮음,<br> 참고용으로만 활용 바랍니다.
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end::main 업무 참여자 통계 끝 -->
                <!-- begin::main chart 본문 시작 -->
                <div class="row bg-white border border-black rounded-2 pt-1 pb-1 m-1" >
                    <div class="col-md-12">
                        <!-- begin::main chart header 시작 -->
                        <div class="row">
                            <div class="col-md-10 pt-2 pb-2 h2 me-auto">
                                <div class="row">
                                    <div class="col-md-10">
                                        개인 실적 달성률
                                    </div>
                                    <div class="col-md-2">
                                        <%--<div class="row h2 ps-3">
                                            <button type="button" class="btn btn-outline-secondary btn-sm" id="kpi-btn">
                                                상세보기<i class="bi bi-arrow-bar-right"></i>
                                            </button>
                                        </div>--%>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-2 pt-2 pb-2 h2 me-auto">
                                <div class="row">
                                    <div class="row">
                                        <div class="col-md-10">
                                            성공금 현황
                                        </div>
                                        <div class="col-md-2">
                                            <div class="row h2">
                                                <a type="button" class="btn btn-outline-secondary btn-sm" style="font-size: 10px" id="success-btn" href="successMoney.login">
                                                    상세보기<!--<i class="bi bi-arrow-bar-right"></i>-->
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- begin::main chart header 끝 -->
                        <div class="row text-center d-flex justify-content-center" id="chart-div">
                            <!-- KPI & 성공금 Start -->
                            <div class="col-md-10 pt-2 h2 me-auto">
                                <div class="row">
                                    <div class="col-md-2 ms-auto me-auto">
                                        <div class="flex-fill chart_startdate">
                                            <div class="text-center d-flex justify-content-center doughnut-chart">
                                                <%--FIXME chart_startdate terminatedEmploymentChart --%>
                                                <%--                                                <canvas id="chart_startdate"></canvas>--%>
                                                <!-- 종료 취업자 차트  -->
                                                <div id="exemple"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-2 ms-auto me-auto">
                                        <div class="flex-fill chart_startdate">
                                            <div class="text-center d-flex justify-content-center doughnut-chart">
                                                <%--FIXME chart_startdate terminatedEmploymentChart --%>
<%--                                                <canvas id="chart_startdate"></canvas>--%>
                                                    <!-- 종료 취업자 차트  -->
                                                <div id="terminatedEmploymentChart"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-2 ms-auto me-auto">
                                        <div class="flex-fill chart_gender">
                                            <div class="text-center d-flex justify-content-center doughnut-chart">
                                                <%--FIXME chart_gender referralEmploymentChart --%>
<%--                                                <canvas id="chart_gender"></canvas>--%>
                                                    <!-- 알선 취업자 차트  -->
                                                <div id="referralEmploymentChart"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-2 ms-auto me-auto">
                                        <div class="flex-fill ex-chart1">
                                            <div class="text-center d-flex justify-content-center">
                                                <%--FIXME ex-chart1 earlyEmploymentChart --%>
<%--                                                <canvas id="ex-chart1"></canvas>--%>
                                                    <!-- 조기 취업자 차트  -->
                                                <div id="earlyEmploymentChart"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-2 ms-auto me-auto">
                                        <div class="flex-fill ex-chart2">
                                            <div class="text-center d-flex justify-content-center">
                                                <%--FIXME ex-chart2 betterJobChart --%>
<%--                                                <canvas id="ex-chart2"></canvas>--%>
                                                    <!-- 나은 일자리 취업자 차트  -->
                                                <div id="betterJobChart"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-2 ms-auto me-auto">
                                        <div class="flex-fill ex-chart3">
                                            <div class="text-center d-flex justify-content-center">
                                                <%--FIXME ex-chart3 incentiveQualificationChart --%>
<%--                                                <canvas id="ex-chart3" ></canvas>--%>
                                                    <!-- 인센 요건 충족 차트  -->
                                                <div id="incentiveQualificationChart"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-2">
                                <div class="row h-100">
                                    <div class="flex-fill ex-chart-bar1 col-md-12 chart-div">
                                        <div class="text-center d-flex justify-content-center h-100">
                                            <%--FIXME ex-chart-bar1 --%>
                                            <canvas id="ex-chart-bar1"></canvas>

                                        </div>
                                    </div>
<%--                                    <div class="flex-fill ex-chart-barZZ col-md-12 chart-div">--%>
<%--                                        <div class="text-center d-flex justify-content-center h-100">--%>
<%--                                            &lt;%&ndash;FIXME ex-chart-barZZ &ndash;%&gt;--%>
<%--                                            <canvas id="ex-chart-barZZ"></canvas>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- KPI & 성공금 End -->
                </div>

                <!-- end::main chart 본문 끝 -->
            </div>
            <!--end::Main content-->
        </div>
        <!--end::App Content-->
    </main>
    <!--end::App Main-->
    <!--end:::App Main content-->
    <!--begin::Footer-->
    <mytag:footer/>
    <!--end::Footer-->

</div>

</body>
<!--begin::Script-->
<!--begin::Third Party Plugin(OverlayScrollbars)-->
<script
        src="https://cdn.jsdelivr.net/npm/overlayscrollbars@2.10.1/browser/overlayscrollbars.browser.es6.min.js"
        integrity="sha256-dghWARbRe2eLlIJ56wNB+b760ywulqK3DzZYEpsg2fQ="
        crossorigin="anonymous"
></script>
<!--end::Third Party Plugin(OverlayScrollbars)-->

<!--begin::Required Plugin(popperjs for Bootstrap 5)-->
<script
        src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
        crossorigin="anonymous"
></script>
<!--end::Required Plugin(popperjs for Bootstrap 5)-->
<!--begin::Required Plugin(Bootstrap 5)-->
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
        integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
        crossorigin="anonymous"
></script>
<!--end::Required Plugin(Bootstrap 5)-->
<!--begin::Required Plugin(AdminLTE)-->
<script src="js/adminlte.js"></script>
<!--end::Required Plugin(AdminLTE)-->
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
<script
        src="https://cdn.jsdelivr.net/npm/sortablejs@1.15.0/Sortable.min.js"
        integrity="sha256-ipiJrswvAR4VAx/th+6zWsdeYmVae0iJuiR+6OqHJHQ="
        crossorigin="anonymous"
></script>
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
<!-- apexcharts -->
<script
        src="https://cdn.jsdelivr.net/npm/apexcharts@3.37.1/dist/apexcharts.min.js"
        integrity="sha256-+vh8GkaU7C9/wbSLIcwq82tQ2wTf44aOHA8HlBMwRI8="
        crossorigin="anonymous"
></script>

<%-- FIXME Chart.js doughnut chart javascript Start--%>
<script>
    $(document).ready(function () {

        let employmentRate = ${empty myKPI.employmentRate ? 0 : myKPI.employmentRate}; // 취업률
        console.log("employmentRate : " + employmentRate);
        let avgEmploymentRateMiddle = ${empty myKPI.avgEmploymentRateMiddle ? 0 : myKPI.avgEmploymentRateMiddle}; // 평균 취업률
        console.log("avgEmploymentRateMiddle : " + avgEmploymentRateMiddle);
        let placementRate = ${empty myKPI.placementRate ? 0 : myKPI.placementRate}; // 알선취업률
        console.log("employmentRate : "+placementRate);
        let avgPlacementRateMiddle = ${empty myKPI.avgPlacementRateMiddle ? 0 : myKPI.avgPlacementRateMiddle}; // 평균 알선취업률
        console.log("avgPlacementRateMiddle : "+avgPlacementRateMiddle);
        let earlyEmploymentRate = ${empty myKPI.earlyEmploymentRate ? 0 : myKPI.earlyEmploymentRate}; // 조기취업률
        console.log("earlyEmploymentRate : "+ earlyEmploymentRate);
        let avgEarlyEmploymentRateMiddle = ${empty myKPI.avgEarlyEmploymentRateMiddle ? 0 : myKPI.avgEarlyEmploymentRateMiddle}; // 평균 조기취업률
        console.log("avgEarlyEmploymentRateMiddle : "+ avgEarlyEmploymentRateMiddle);
        let betterJobRate = ${empty myKPI.betterJobRate ? 0 : myKPI.betterJobRate}; // 나은일자리
        console.log("betterJobRate : "+ betterJobRate);
        let avgBetterJobRateMiddle = ${empty myKPI.avgBetterJobRateMiddle ? 0 : myKPI.avgBetterJobRateMiddle}; // 평균 나은일자리
        console.log("avgBetterJobRateMiddle : "+ avgBetterJobRateMiddle);
        let assignedParticipants = ${empty myKPI.assignedParticipants ? 0 : myKPI.assignedParticipants}; // 배정인원수
        console.log("assignedParticipants : "+ assignedParticipants);
        let noServiceCount = ${empty myKPI.noServiceCount ? 0 : myKPI.noServiceCount}; // 인센 미해당 서비스미제공
        console.log("noServiceCount : "+ noServiceCount);
        let falseCaseNum = ${empty myKPI.falseCaseNum ? 0 : myKPI.falseCaseNum}; // 인센 미해당
        console.log("falseCaseNum : "+ falseCaseNum);
        let trueCaseNum = ${empty myKPI.trueCaseNum ? 0 : myKPI.trueCaseNum}; // 인센 해당
        console.log("trueCaseNum : "+ trueCaseNum);

        // 음수 확인 후 고정 값 지정
        function checkNegative(value1,value2) {
            let result = (value1 - value2);

            if (result < 0) {
                result = 0;
            }
            return result;
        }


        let colors = ['#0064a6','#0064A600']

        //배정 인원 차트
        let series = [assignedParticipants, 95-assignedParticipants]
        let labels = ['배정 인원','남은 목표']
        let donut = new ApexCharts(document.querySelector("#exemple"), apexChartDoughnut('배정인원(목표:95)',series, labels,colors,false));
        donut.render();

        //종료 취업자 차트
        series = [employmentRate, 65-employmentRate]
        labels = ['종료 취업자','남은 목표']
        donut = new ApexCharts(document.querySelector("#terminatedEmploymentChart"), apexChartDoughnut('종료 취업자',series, labels,colors,true));
        donut.render();

        console.log("placementRate : "+placementRate);
        console.log("checkNegative(avgPlacementRateMiddle,placementRate) : "+checkNegative(avgPlacementRateMiddle,placementRate));
        //알선 취업자 차트
        series = [placementRate, checkNegative(avgPlacementRateMiddle,placementRate)]
        labels = ['알선 취업자','남은 목표']
        donut = new ApexCharts(document.querySelector("#referralEmploymentChart"), apexChartDoughnut('알선 취업자',series, labels,colors,true));
        donut.render();

        //조기 취업자 차트
        series = [earlyEmploymentRate, checkNegative(avgEarlyEmploymentRateMiddle,earlyEmploymentRate)]
        labels = ['조기 취업자','남은 목표']
        donut = new ApexCharts(document.querySelector("#earlyEmploymentChart"), apexChartDoughnut('조기 취업자',series, labels,colors,true));
        donut.render();

        //나은일자리 차트
        series = [betterJobRate, checkNegative(avgBetterJobRateMiddle,betterJobRate)]
        labels = ['나은일자리','남은 목표']
        donut = new ApexCharts(document.querySelector("#betterJobChart"), apexChartDoughnut('나은일자리',series, labels,colors,true));
        donut.render();

        //인센 요건 충족 차트
        series = [noServiceCount, falseCaseNum, trueCaseNum]
        labels = ['서비스 미제공', '미해당', '해당']
        colors = ['#ff0707', '#ff9100ff', '#0064a6']
        donut = new ApexCharts(document.querySelector("#incentiveQualificationChart"), apexChartDoughnut('인센 요건 충족',series, labels,colors,true));
        donut.render();

        <%--/*//전체 chart 플러그인 추가--%>
        <%--Chart.register(drawCenterTextPlugin);--%>
        <%--Chart.register(ChartDataLabels);--%>


        <%--// let id;--%>
        <%--let drawCenterText_text='';--%>
        <%--let denominator = 700;--%>

        <%--id = $('#chart_startdate');--%>
        <%--const chart_startdate = {title:['미취업자','취업자'],text:JSON.parse('${dashBoardEmployedKPI}')};--%>
        <%--drawCenterText_text = '종료 취업자';--%>
        <%--chart_doughnut_data(id,chart_startdate,drawCenterText_text,denominator);--%>

        <%--id = $('#chart_gender');--%>
        <%--const chart_gender = {title:['알선 취업자', '취업자'],text:JSON.parse('${dashBoardReferredEmployedKPI}')};--%>
        <%--drawCenterText_text = '알선 취업자';--%>
        <%--chart_doughnut_data(id,chart_gender,drawCenterText_text,denominator);--%>

        <%--id = $('#ex-chart1');--%>
        <%--const testdata1 = {title:['조기 취업자','취업자'],text:JSON.parse('${dashBoardEarlyEmployedKPI}')};--%>
        <%--drawCenterText_text = '조기 취업자';--%>
        <%--chart_doughnut_data(id,testdata1,drawCenterText_text,denominator);--%>

        <%--id = $('#ex-chart2');--%>
        <%--const testdata2 = {title:['나은 일자리','취업자'],text:JSON.parse('${dashBoardBetterJobKPI}')};--%>
        <%--drawCenterText_text = '나은 일자리';--%>
        <%--chart_doughnut_data(id,testdata2,drawCenterText_text,denominator);--%>

        <%--id = $('#ex-chart3');--%>
        <%--const testdata3 = {title:['마감X','마감'],text:JSON.parse('${dashBoardCloseKPI}')};--%>
        <%--drawCenterText_text = '인센 요건 충족';--%>
        <%--chart_doughnut_data(id,testdata3,drawCenterText_text,denominator);*/--%>

    })
</script>
<%-- FIXME Chart.js Doughnut Chart javascript  End --%>
<%-- FIXME Chart.js Bar Chart javascript Start --%>
<%-- FIXME 현재 사용하지 않고 있으므로 주석 처리 --%>
<script>
    $('document').ready(function () {
        let data_title = JSON.parse('${dashBoardDataTitle}');
        //chart 성공금 현황
        //성공금 발생
        let id=$('#ex-chart-bar1');
        let lable=['성공금 발생'];
        let data={title:data_title,text:JSON.parse('${dashBoardSuccessMoney}')};
        console.log(data);
        chart_bar_data_my(id,lable,data);

        <%--//인센티브 발생--%>
        <%--id=$('#ex-chart-barZZ');--%>
        <%--lable=['인센티브'];--%>
        <%--data={title:data_title,text:JSON.parse('${dashBoardSuccessMoneyIncentive}')};--%>
        <%--chart_bar_data_my(id,lable,data);--%>
        <%--
                       //chart 나의 성과 현황
                       //취업자 수
                       id=$('#ex-chart-bar2');
                       lable=['취업자 수'];
                       data={title:data_title,text:JSON.parse('${dashBoardEmployedCount}')};
                       chart_bar_data_my(id,lable,data);

                       //알선 취업자 수
                       id=$('#ex-chart-bar3');
                       lable=['알선 취업자 수'];
                       data={title:data_title,text:JSON.parse('${dashBoardReferredEmployedCount}')};
                       chart_bar_data_my(id,lable,data);

                       //조기 취업자 수
                       id=$('#ex-chart-bar4');
                       lable=['조기 취업자 수'];
                       data={title:data_title,text:JSON.parse('${dashBoardEarlyEmployedCount}')};
                       chart_bar_data_my(id,lable,data);

                       //나은 일자리
                       id=$('#ex-chart-bar5');
                       lable=['나은 일자리'];
                       data={title:data_title,text:JSON.parse('${dashBoardBetterJobCount}')};
                       chart_bar_data_my(id,lable,data);

                       //고용 유지 6개월
                       id=$('#ex-chart-bar6');
                       lable=['고용 유지 6개월'];
                       data={title:data_title,text:JSON.parse('${dashBoardSixMonthRetentionCount}')};
                       chart_bar_data_my(id,lable,data);

                       //고용 유지
                       id=$('#ex-chart-bar7');
                       lable=['고용 유지 12개월'];
                       data={title:data_title,text:JSON.parse('${dashBoardTwelveMonthRetentionCount}')};
                       chart_bar_data_my(id,lable,data);
        --%>
    })

</script>
<%-- FIXME Chart.js Bar Chart javascript End --%>

<%-- FIXME 참여자통계 Javascript Start --%>
<script>
    /*
    * 백단에서 각 조건에 맞는 참여자 숫자 데이터 를 전달받습니다.
    * 전달받은 숫자 데이터를 계산하여 % 형식으로 보여주고
    * title, subtitle 형식에 맞게 html div 태그 형식으로 뿌려줍니다.
    * */

    $(document).ready(function () {
        const thisYearParticipant = $('#thisYearParticipant');
        const currentParticipant = $('#currentParticipant');
        const totalParticipant = $('#totalParticipant');

        // 총 참여자 수 계산
        function calculateTotalParticipants(data) {
            let total = 0;
            $.each(data, function (_, value) {
                total += parseInt(value.data);
            });
            return total;
        }

        // 비율 계산
        function calculatePercentage(total, data) {
            let arr = [];
            $.each(data, function (_, value) {
                arr[_] = ((parseInt(value.data) / total) * 100).toFixed(2);
                isNaN(arr[_]) ? arr[_] = 0 : arr[_];
            })
            //console.log("arr:"+arr);
            return arr;
        }

        // 유형별 서브타이틀 생성
        function generateTypeSubtitle(data) {
            let subtitle = '';
            $.each(data, function (index, value) {
                subtitle += (index === 0 ? 'Ⅰ유형 ' : 'Ⅱ유형 ') + value.data + '명';
                if (index < data.length - 1) {
                    subtitle += ' / ';
                }
            });
            return subtitle;
        }

        // 년도별 서브타이틀 생성
        function generateYearSubtitle(data) {
            let subtitle = '';
            $.each(data, function (index, value) {
                subtitle += value.year + '년 ' + value.data + '명';
                if (index < data.length - 1) {
                    subtitle += ' / ';
                }
            });
            return subtitle;
        }

        // 진행자 데이터 처리
        function processParticipantData(targetElement, data, titleTemplate , subtitleTemplate) {
            const total = calculateTotalParticipants(data);
            const subtitle =  subtitleTemplate;
            const percentage = calculatePercentage(total, data);
            const title = titleTemplate + total + "명";
            const divContent = createDiv(title, subtitle, percentage);
            appendDiv(targetElement, divContent);
        }

        // DIV 생성
        function createDiv(title, subtitle, percentage) {
            let returnValue =
                "<div class='fw-bold'>"+title+"</div>"+
                "<div>"+subtitle+"</div>"+
                "<div class='progress rounded rounded-2'>";

            percentage.map((data)=> {
                returnValue += "<div class='progress-bar' role='progressbar'" +
                    "style='width: " + data + "%; background: linear-gradient(90deg, "+randomColor()+", "+randomColor()+");color: black;font-weight: bold;' aria-valuenow='" + data + "'" +
                    "aria-valuemin='0' aria-valuemax='100'>" + data + "%</div>"
            });

            returnValue += "</div>";
            return returnValue;
        }

        // DIV 추가
        function appendDiv(target, divContent) {
            target.append(divContent);
        }

        // 데이터
        let thisYearData = JSON.parse('${empty nowParticipantJsonData ?"[{\"year\":\"0\",\"data\":\"0\"}]":nowParticipantJsonData}');
        let currentData = JSON.parse('${empty currentParticipantJsonData ?"[{\"year\":\"0\",\"data\":\"0\"}]":currentParticipantJsonData}');
        let totalData = JSON.parse('${empty totalParticipantJsonData ?"[{\"year\":\"0\",\"data\":\"0\"}]":totalParticipantJsonData}');

        // 각 참여자 데이터 처리
        processParticipantData(thisYearParticipant, thisYearData, ${dashBoardYear}+"년 총 참여자 수 ", generateTypeSubtitle(thisYearData));
        processParticipantData(currentParticipant, currentData, "현재 진행자 수 ", generateYearSubtitle(currentData));
        processParticipantData(totalParticipant, totalData, "총 참여자 수 ", generateYearSubtitle(totalData));
    });
</script>
<%-- FIXME 참여자통계 Javascript End --%>

<%-- FIXME 년도 조회 Start --%>
<script>
    $(document).ready(function () {
        const yearSelect = $('#yearSelect');

        getYearData(yearSelect);

        function getYearData(id) {
            // 현재 날짜 및 시간 정보를 가져오기
            let currentDate = new Date();
            let currentYear = currentDate.getFullYear();

            //id.append('<option value="'+currentYear+'">'+currentYear+'</option>');
            for(var i=currentYear; i>=currentYear-5; i--){
                id.append('<option value="'+i+'">'+i+'</option>');
            }
        }

        yearSelect.val('${dashBoardYear}');

        yearSelect.change(function () {
            let year = $(this).val();
            location.href = "/dashboard.login?dashBoardYear="+year;
        });
    })
</script>
<%-- FIXME 년도 조회 End --%>

<%-- 템플릿용으로 만들어둔 등수 현황 데이터 --%>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        let data = ${scoreJson};
        // console.log(data[0].data);
        // console.log(data[0].myRanking);
        // console.log(data[0].myTotalRanking);
        // console.log(data[0].totalTopScore);

        const nextRanginScore = data[0].pointsToNextGrade;
        const nextRanking = data[0].nextGrade;

        console.log(Math.floor(nextRanginScore*100)/100);
        let $nextRanking = $('#nextRanking');
        // $nextRanking.text("다음등급까지: "+ nextRanginScore + "점");
        $nextRanking.append("다음 등급 "+nextRanking);

        $('#myRanking').text(data[0].myRanking);
        $('#myTotalRanking').text(data[0].myTotalRanking);
        // 차트 옵션 설정
        const options = {
            series: [{
                name: '점수',
                data: data[0].data // [전체 평균, 지점 평균, 내 점수]
            }],
            chart: {
                type: 'bar',
                height: 350,
                width: '100%',
                toolbar: {
                    show: false
                },
                events: {
                    dataPointSelection: function(event, chartContext, config) { // click 대신 dataPointSelection 사용
                        const clickIndex = config.dataPointIndex;
                        // const branchName = Datas.thisSuccess.branch[branchIndex];

                        // 전체 지점 클릭시 모달 표시 or 페이지이동
                        if (clickIndex === 1) {
                            // alert('제작중입니다.')
                            location.href = "scoreBranchDashboard.login";
                        }
                    }
                }
            },
            plotOptions: {
                bar: {
                    horizontal: false,
                    columnWidth: '55%',
                    borderRadius: 5,
                    distributed: true
                },
            },
            dataLabels: {
                enabled: true,
                formatter: function (val) {
                    return val + '점';
                }
            },
            colors: ['#2E93fA', '#66DA26', '#FF9800'],
            xaxis: {
                categories: ['전체 지점 평균', '내 지점 평균', '내 점수'],
                labels: {
                    style: {
                        fontSize: '12px'
                    }
                }
            },
            yaxis: [{
                title: {
                    text: '점수',
                },
                max: 90,
                min: 0,            // 최소값 설정
                tickAmount: 5,     // 눈금 간격 설정
                labels: {
                    formatter: function(val) {
                        return val.toFixed(0);
                    }
                }
            }],
            title: {
                text: '점수 현황',
                align: 'center',
                margin: 10,
                style: {
                    fontSize: '16px'
                }
            }
        };

        // 차트 생성
        const chart = new ApexCharts(document.querySelector("#scoreChart"), options);
        chart.render();
    });
</script>

</html>
