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
                <!-- main card 형식 본문  시작 -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="p-3">
                            <div class="">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="dashboard row text-center d-flex justify-content-center">
                                            <!-- card 형식 div 태그 시작 -->
                                            <!-- 첫번째 card 형식 div 태그 시작 -->
                                            <div class="col-sm-6 col-md-2">
                                                <div class="card card-stats card-round">
                                                    <div class="cardheader">
                                                        <div class="row align-items-center">
                                                            <h4 class="card-text pt-2">나올 공간입니다.</h4>
                                                        </div>
                                                    </div>
                                                    <div class="card-body p-0">
                                                        <div class="row align-items-center">
                                                            <div class="numbers">
                                                                <p class="">테스트 입력입니다.</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 첫번째 card 형식 div 태그 끝 -->
                                            <!-- 두번째 card 형식 div 태그 시작 -->
                                            <div class="col-sm-6 col-md-2">
                                                <div class="card card-stats card-round">
                                                    <div class="cardheader">
                                                        <div class="row align-items-center">
                                                            <h4 class="card-text pt-2">나올 공간입니다.</h4>
                                                        </div>
                                                    </div>
                                                    <div class="card-body p-0">
                                                        <div class="row align-items-center">
                                                            <div class="numbers">
                                                                <p class="">테스트 입력입니다.</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 두번째 card 형식 div 태그 끝 -->
                                            <!-- 세번째 card 형식 div 태그 시작 -->
                                            <div class="col-sm-6 col-md-2">
                                                <div class="card card-stats card-round">
                                                    <div class="cardheader">
                                                        <div class="row align-items-center">
                                                            <h4 class="card-text pt-2">나올 공간입니다.</h4>
                                                        </div>
                                                    </div>
                                                    <div class="card-body p-0">
                                                        <div class="row align-items-center">
                                                            <div class="numbers">
                                                                <p class="">테스트 입력입니다.</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 세번째 card 형식 div 태그 끝 -->
                                            <!-- 네번째 card 형식 div 태그 시작 -->
                                            <div class="col-sm-6 col-md-2">
                                                <div class="card card-stats card-round">
                                                    <div class="cardheader">
                                                        <div class="row align-items-center">
                                                            <h4 class="card-text pt-2">나올 공간입니다.</h4>
                                                        </div>
                                                    </div>
                                                    <div class="card-body p-0">
                                                        <div class="row align-items-center">
                                                            <div class="numbers">
                                                                <p class="">테스트 입력입니다.</p>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- 네번째 card 형식 div 태그 끝 -->
                                            <!-- card 형식 div 태그 끝 -->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- main card 형식 본문  끝 -->
                <!-- main chart 본문 시작 -->
                <div class="row text-center d-flex justify-content-center" id="chart-div">
                    <div class="row">
                        <!-- Ex Chart Start -->
                        <div class="col-md-3">
                            <div class="card flex-fill" class="ex-chart1">
                                <div class="card-header">
                                    <h3>예시 차트 입니다.</h3>
                                </div>
                                <div class="card-body text-center d-flex justify-content-center" style="height: 250px;">
                                    <%--FIXME ex-chart1 --%>
                                    <canvas id="ex-chart1"></canvas>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card flex-fill" class="ex-chart2">
                                <div class="card-header">
                                    <h3>예시 차트 입니다.</h3>
                                </div>
                                <div class="card-body text-center d-flex justify-content-center" style="height: 250px;">
                                    <%--FIXME ex-chart2 --%>
                                    <canvas id="ex-chart2"></canvas>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card flex-fill" class="ex-chart3">
                                <div class="card-header">
                                    <h3>예시 차트 입니다.</h3>
                                </div>
                                <div class="card-body text-center d-flex justify-content-center" style="height: 250px;">
                                    <%--FIXME ex-chart3 --%>
                                    <canvas id="ex-chart3"></canvas>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="card flex-fill" class="ex-chart4">
                                <div class="card-header">
                                    <h3>예시 차트 입니다.</h3>
                                </div>
                                <div class="card-body text-center d-flex justify-content-center" style="height: 250px;">
                                    <%--FIXME ex-chart4 --%>
                                    <canvas id="ex-chart4"></canvas>
                                </div>
                            </div>
                        </div>
                        <!-- Ex Chart End -->
                    </div>
                </div>
                <!-- main chart 본문 끝 -->
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

<%-- FIXME Chart.js javascript Start--%>
<script>
    $(document).ready(function () {
        var ctx = $('#ex-chart1')[0].getContext('2d');
        var ctx = $('#ex-chart2')[0].getContext('2d');
        var ctx = $('#ex-chart3')[0].getContext('2d');
        var ctx = $('#ex-chart4')[0].getContext('2d');
        // chart.js 중앙 텍스트 플러그인 정의 및 등록
        const drawCenterTextPlugin = {
            id: 'drawCenterText',
            beforeDraw: function (chart) {
                var width = chart.width,
                    height = chart.height,
                    ctx = chart.ctx;
                ctx.restore();
                var fontSize = (height / 250).toFixed(2); // 글자 크기 지정
                ctx.font = fontSize + "em sans-serif";
                ctx.textBaseline = "middle";
                // 중앙에 들어갈 텍스트와 위치 계산
                var text = "100",
                    textX = Math.round((width - ctx.measureText(text).width) / 2),
                    textY = height / 2;
                // 텍스트를 중앙에 출력
                ctx.fillText(text, textX, textY);
                ctx.save();
            }
        };
        //플러그인 추가
        Chart.register(drawCenterTextPlugin);

        const ex_chart = {
            type: 'doughnut',
            data: {
                labels: ['A', 'B', 'C'],
                datasets: [{
                    data: [300, 50, 100, 500, 600, 800, 900],
                    backgroundColor: ['#007bff', '#dc3545', '#2a5282','#7c2628','#ffc107','#ffc107'],
                    // hoverBackgroundColor: ['#007bff', '#dc3545', '#ffc107'],
                }],
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        display: false,
                    },
                    drawCenterText: true // 플러그인
                },
            }
        };

        new Chart($('#ex-chart1'), ex_chart);
        new Chart($('#ex-chart2'), ex_chart);
        new Chart($('#ex-chart3'), ex_chart);
        new Chart($('#ex-chart4'), ex_chart);

    })
</script>
<%-- FIXME Chart.js javascript End--%>
</html>
