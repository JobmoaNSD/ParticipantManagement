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

    <!-- chart.js script 데이터 -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>

    <!-- jQuery 시작 데이터 -->
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

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
                    <div class="col-md-10 pt-1">
                        <div class="row">
                            <div class="col-md-2 align-items-center">
                                <div class="h5">
                                    XX지점
                                </div>
                                <div class="h3">
                                    홍길동 상담사
                                </div>
                            </div>
                            <div class="col-md-8 d-flex flex-column align-items-center">
                                <div class="">
                                    다우톡 공지사항
                                </div>
                                <div class="h3">
                                    <a href="https://jobmoa.daouoffice.com/app/board" target="_blank">Test Link1</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- end::main 지점 / 다우톡 주요 공지사항 끝 -->
                    <!-- begin::main 다우톡 업무 메뉴얼 시작-->
                    <div class="col-md-2 d-flex flex-column align-items-center pt-1">
                        <div class="">
                            업무 메뉴얼
                        </div>
                        <div class="h3">
                            <a href="https://jobmoa.daouoffice.com/app/board" target="_blank">Test Link1</a>
                        </div>
                    </div>
                    <!-- begin::main 다우톡 업무 메뉴얼 끝-->
                </div>
                <!-- begin::main 기본 header 끝-->

                <!-- begin::main 업무 참여자 통계 시작 -->
                <div class="row text-center bg-white border border-black rounded-2 pt-1 pb-1 m-1">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="row">
                                <div class="row h2 ps-3">
                                    금일 업무
                                </div>
                                <div class="row">
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item d-flex border-bottom-0">
                                            <div class="">
                                                <div>집중알선대상자 XX명</div>
                                            </div>
                                        </li>
                                        <li class="list-group-item d-flex border-bottom-0">
                                            <div class="">
                                                <div>30일 경과예정자 X명</div>
                                            </div>
                                        </li>
                                        <li class="list-group-item d-flex border-bottom-0">
                                            <div class="">
                                                <div>구직촉진수당 신청 예정자 XX명</div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8 border-start border-dark border-2">
                            <div class="row h2 ps-3">
                                참여자 통계
                            </div>
                            <div class="row">
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item d-flex justify-content-between">
                                        <div class="ms-2 me-auto text-start">
                                            <div class="fw-bold">2025년 총 참여자 수 00명 (이관자 00명)</div>
                                            <div>Ⅰ유형 00명 / Ⅱ유형 00명</div>
                                        </div>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between">
                                        <div class="ms-2 me-auto text-start">
                                            <div class="fw-bold">총 진행자 수 00명</div>
                                            <div>2025년 00명 / 2024년 00명 / 2023년 00명 (이관자 00명 포함)</div>
                                        </div>
                                    </li>
                                    <li class="list-group-item d-flex justify-content-between">
                                        <div class="ms-2 me-auto text-start">
                                            <div class="fw-bold">총 참여자 수 00명</div>
                                            <div>2025년 00명 / 2024년 00명 / 2023년 00명 (이관자 00명 포함)</div>
                                        </div>
                                    </li>
                                </ul>
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
                            <div class="col-md-8 pt-2 pb-2 h2 me-auto">
                                <div class="row">
                                    <div class="col-md-10">
                                        나의 KPI 달성률
                                    </div>
                                    <div class="col-md-2">
                                        <div class="row h2 ps-3">
                                            <button type="button" class="btn btn-outline-secondary btn-sm" id="kpi-btn">
                                                상세보기<i class="bi bi-arrow-bar-right"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 pt-2 pb-2 h2 me-auto">
                                <div class="row">
                                    <div class="row">
                                        <div class="col-md-9">
                                            성공금 현황
                                        </div>
                                        <div class="col-md-3">
                                            <div class="row h2 ps-3">
                                                <button type="button" class="btn btn-outline-secondary btn-sm" id="success-btn">
                                                    상세보기<i class="bi bi-arrow-bar-right"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- begin::main chart header 끝 -->
                        <div class="row text-center d-flex justify-content-center" id="chart-div">
                            <!-- KPI & 성공금 Start -->
                            <div class="col-md-8 pt-2 h2 me-auto">
                                <div class="row">
                                    <div class="col-md-3">
                                        <div class="flex-fill chart_startdate">
                                            <div class="text-center d-flex justify-content-center doughnut-chart" style="weight: 200px;">
                                                <%--FIXME chart_startdate --%>
                                                <canvas id="chart_startdate"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="flex-fill chart_gender">
                                            <div class="text-center d-flex justify-content-center doughnut-chart" style="weight: 200px;">
                                                <%--FIXME chart_gender --%>
                                                <canvas id="chart_gender"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="flex-fill ex-chart1">
                                            <div class="text-center d-flex justify-content-center" style="weight: 200px;">
                                                <%--FIXME ex-chart1 --%>
                                                <canvas id="ex-chart1"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="flex-fill ex-chart2">
                                            <div class="text-center d-flex justify-content-center" style="weight: 200px;">
                                                <%--FIXME ex-chart2 --%>
                                                <canvas id="ex-chart2"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-2">
                                        <div class="flex-fill ex-chart3">
                                            <div class="text-center d-flex justify-content-center" style="weight: 200px;">
                                                <%--FIXME ex-chart3 --%>
                                                <canvas id="ex-chart3" ></canvas>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-4">
                                <div class="row h-100">
                                    <div class="flex-fill ex-chart-bar1 h-100">
                                        <div class="text-center d-flex justify-content-center h-100">
                                            <%--FIXME ex-chart-bar1 --%>
                                            <canvas id="ex-chart-bar1"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                        <!-- KPI & 성공금 End -->
                </div>
                <!-- end::main chart 본문 끝 -->
                <!-- begin::sub chart 본문 시작 -->
                <div class="row bg-white border border-black rounded-2 pt-1 pb-1 m-1">
                    <div class="col-md-12">
                        <!-- begin::sub chart header 시작 -->
                        <div class="row">
                            <div class="col-md-12 pt-2 pb-2 h2 me-auto">
                                <div class="row">
                                    <div class="col-md-11">
                                        나의 성과 현황
                                    </div>
                                    <div class="col-md-1">
                                        <div class="row h2 ps-3">
                                            <button type="button" class="btn btn-outline-secondary btn-sm" id="my-btn">
                                                상세보기<i class="bi bi-arrow-bar-right"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- begin::sub chart header 끝 -->
                        <div class="row text-center d-flex justify-content-center" id="my-chart-div">
                            <!-- 나의 성과 현황 시작 -->
                            <div class="col-md-2">
                                <div class="row">
                                    <div class="flex-fill ex-chart-bar1">
                                        <div class="text-center d-flex justify-content-center">
                                            <%--FIXME ex-chart-bar1 --%>
                                            <canvas id="ex-chart-bar1"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-2">
                                <div class="row">
                                    <div class="flex-fill ex-chart-bar1">
                                        <div class="text-center d-flex justify-content-center">
                                            <%--FIXME ex-chart-bar1 --%>
                                            <canvas id="ex-chart-bar1"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-2">
                                <div class="row">
                                    <div class="flex-fill ex-chart-bar1">
                                        <div class="text-center d-flex justify-content-center">
                                            <%--FIXME ex-chart-bar1 --%>
                                            <canvas id="ex-chart-bar1"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-2">
                                <div class="row">
                                    <div class="flex-fill ex-chart-bar1">
                                        <div class="text-center d-flex justify-content-center">
                                            <%--FIXME ex-chart-bar1 --%>
                                            <canvas id="ex-chart-bar1"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-2">
                                <div class="row">
                                    <div class="flex-fill ex-chart-bar1">
                                        <div class="text-center d-flex justify-content-center">
                                            <%--FIXME ex-chart-bar1 --%>
                                            <canvas id="ex-chart-bar1"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 나의 성과 현황 끝 -->
                        </div>
                    </div>
                </div>
                <!-- begin::sub chart 본문 끝 -->
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
<!--end::Required Plugin(AdminLTE)--><!--begin::OverlayScrollbars Configure-->
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

        // chart.js 중앙 텍스트 플러그인 정의 및 등록
        const drawCenterTextPlugin = {
            id: 'drawCenterText',
            beforeDraw: function (chart) {
                const width = chart.width;
                const height = chart.height;
                const ctx = chart.ctx;

                // 중앙 텍스트 내용 가져오기
                const text = chart.options.plugins.drawCenterText?.text || "";

                // 폰트 및 텍스트 정보 설정
                ctx.restore();
                var fontSize = (height / 700).toFixed(2); // 글자 크기 지정
                ctx.font = fontSize + "em sans-serif";
                ctx.textBaseline = "middle";

                // 중앙에 들어갈 텍스트와 위치 계산
                const textX = Math.round((width - ctx.measureText(text).width) / 2);
                const textY = height / 2;

                // 텍스트 출력
                ctx.fillText(text, textX, textY);
                ctx.save();
            }
        };

        //전체 chart 플러그인 추가
        Chart.register(drawCenterTextPlugin);
        Chart.register(ChartDataLabels);

        const chart_startdate = {
            type: 'doughnut',
            data: {
                labels: ['미취업자', '취업자'],
                datasets: [{
                    data: [50, 250],
                    backgroundColor: ['#ffffff','#f67676'],
                    hoverBackgroundColor: ['#e04e4e'],
                    border:1,
                    borderWidth: 1,
                    borderColor: '#000000',
                    hoverBorderColor: '#000000',
                }],
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        display: false,
                    },
                    datalabels: {
                        formatter: function (value, context) {
                            return Math.round(value / context.chart.getDatasetMeta(0).total * 100) + "%";
                        },
                        color: '#fff',
                    },
                    drawCenterText:{
                        text:'취업자 수\n'+'250'+'명',
                    }
                },
            },
        };

        const chart_gender = {
            type: 'doughnut',
            data: {
                labels: ['남', '여'],
                datasets: [{
                    data: [300, 400],
                    backgroundColor: ['#ffffff','#f67676'],
                    hoverBackgroundColor: ['#e04e4e'],
                    border:1,
                    borderWidth: 1,
                    borderColor: '#000000',
                    hoverBorderColor: '#000000',
                }],
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        display: false,
                    },
                    datalabels: {
                        formatter: function (value, context) {
                            return Math.round(value / context.chart.getDatasetMeta(0).total * 100) + "%";
                        },
                        color: '#fff',
                    },
                    drawCenterText:{
                        text:'남\n'+'300'+'명'+' 여 '+'400'+'명',
                    }
                },
            },
        };

        const chart_1 = {
            type: 'doughnut',
            data: {
                labels: ['test', 'test2'],
                datasets: [{
                    data: [10, 500],
                    backgroundColor: ['#ffffff','#f67676'],
                    hoverBackgroundColor: ['#e04e4e'],
                    border:1,
                    borderWidth: 1,
                    borderColor: '#000000',
                    hoverBorderColor: '#000000',
                }],
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        display: false,
                    },
                    datalabels: {
                        formatter: function (value, context) {
                            return Math.round(value / context.chart.getDatasetMeta(0).total * 100) + "%";
                        },
                        color: '#fff',
                    },

                    drawCenterText:{
                        text:'300',
                    }, // 플러그인
                },
            },
        };

        const chart_2 = {
            type: 'doughnut',
            data: {
                labels: ['test3', 'test4'],
                datasets: [{
                    data: [90, 600],
                    backgroundColor: ['#ffffff','rgba(255,0,0,0.48)'],
                    hoverBackgroundColor: ['#e04e4e'],
                    border:1,
                    borderWidth: 1,
                    borderColor: '#000000',
                    hoverBorderColor: '#000000',
                }],
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        display: false,
                    },
                    datalabels: {
                        formatter: function (value, context) {
                            return Math.round(value / context.chart.getDatasetMeta(0).total * 100) + "%";
                        },
                        color: '#fff',
                    },

                    drawCenterText:{
                        text:'300',
                    }, // 플러그인
                },
            },
        };

        const chart_3 = {
            type: 'doughnut',
            data: {
                labels: ['test4', 'test6'],
                datasets: [{
                    data: [200, 400],
                    backgroundColor: ['#ffffff','#f67676'],
                    hoverBackgroundColor: ['#e04e4e'],
                    border:1,
                    borderWidth: 1,
                    borderColor: '#000000',
                    hoverBorderColor: '#000000',
                }],
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        display: false,
                    },
                    datalabels: {
                        formatter: function (value, context) {
                            return Math.round(value / context.chart.getDatasetMeta(0).total * 100) + "%";
                        },
                        color: '#fff',
                    },

                    drawCenterText:{
                        text:'300',
                    }, // 플러그인
                },
            },
        };

        new Chart($('#chart_startdate'), chart_startdate);
        new Chart($('#chart_gender'), chart_gender);
        new Chart($('#ex-chart1'), chart_1);
        new Chart($('#ex-chart2'), chart_2);
        new Chart($('#ex-chart3'), chart_3);

    })
</script>
<%-- FIXME Chart.js Doughnut Chart javascript  End --%>
<%-- FIXME Chart.js Bar Chart javascript Start --%>
<script>
    $('document').ready(function () {
        const chart_bar1 = {
            type: 'bar',
            data: {
                labels: ['성공금 발생', '인센티브'],
                datasets: [{
                    label: '잡모아 평균',
                    data: [60005715, 4502212],
                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                    borderColor: 'rgba(54, 162, 235, 1)',
                    borderWidth: 1,
                },
                    {
                        label: '지점 평균',
                        data: [35021540, 2512412],
                        backgroundColor: 'rgba(255, 159, 64, 0.2)',
                        borderColor: 'rgba(255, 159, 64, 1)',
                        borderWidth: 1
                    },
                    {
                        label: '홍길동',
                        data: [42535410, 3210021],
                        backgroundColor: 'rgba(75, 192, 192, 0.2)',
                        borderColor: 'rgba(75, 192, 192, 1)',
                        borderWidth: 1
                    }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: {
                        display: false,
                    },
                },
                plugins: {
                    legend: {
                        display: true,
                        position: 'bottom',
                    },
                }
            }
        }

        new Chart($('#ex-chart-bar1'), chart_bar1);
    })
</script>
<%-- FIXME Chart.js Bar Chart javascript End --%>

<script>
    $(document).ready(function () {

    })
</script>
</html>
