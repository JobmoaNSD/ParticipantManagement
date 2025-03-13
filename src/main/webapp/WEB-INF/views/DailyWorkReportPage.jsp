<%--
  Created by IntelliJ IDEA.
  User: no1fc
  Date: 25. 3. 13.
  Time: 오후 4:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag" %>
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
    <!-- mouse pointer 모양 bootstrap 5 -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />

    <style>
        table {
            border-collapse: collapse;
            width: 100%;
            margin-bottom: 20px;
        }
        th, td {
            border: 1px solid #000;
            padding: 5px;
            text-align: center;
            font-size: 12px;
        }
        .section-title {
            background-color: #f0f0f0;
            font-weight: bold;
        }
        .approval-section {
            text-align: right;
            margin-bottom: 20px;
        }
        .approval-box {
            display: inline-block;
            border: 1px solid #000;
            padding: 10px;
            margin-left: 10px;
        }
    </style>
</head>
<body class="layout-fixed sidebar-expand-lg bg-body-tertiary">

<!--begin::App Wrapper-->
<div class="app-wrapper">
    <!--begin:::App Gnb-->
    <mytag:gnb gnb_main_header="실적관리" gnb_sub_header="일일업무보고"/>
    <!--end:::App Gnb-->
    <!--begin:::App main content-->
    <!--begin::App Main-->
    <main class="app-main">
        <!--begin::App Content-->
        <div class="app-content">
            <!--begin::Main content-->
            <div class="container-fluid">
                <!-- 필요 본문 내용은 이쪽에 만들어 주시면 됩니다. -->
                <h1>지점 국민취업지원제도 업무진행현황 일일보고</h1>

                <!-- 결재란 -->
                <div class="approval-section">
                    <div class="approval-box">
                        <div>지점관리자</div>
                        <div style="height: 60px;"></div>
                    </div>
                    <div class="approval-box">
                        <div>대표</div>
                        <div style="height: 60px;"></div>
                    </div>
                    <div class="approval-box">
                        <div>회장</div>
                        <div style="height: 60px;"></div>
                    </div>
                </div>

                <div>2025년 3월 13일 목요일</div>

                <!-- 1. 배정 현황 -->
                <h3>1. 배정 현황</h3>
                <table>
                    <tr>
                        <th colspan="6">2024년 총 서비스 대상 인원(전산 배정 인원)</th>
                        <th colspan="2">금일 배정인원</th>
                        <th>상담사 수</th>
                        <th>평균 배정인원</th>
                        <th>배정목표</th>
                    </tr>
                    <tr>
                        <td colspan="2">합계</td>
                        <td colspan="2">Ⅱ유형</td>
                        <td colspan="2">Ⅰ유형</td>
                        <td>Ⅱ유형</td>
                        <td>Ⅰ유형</td>
                        <td>0</td>
                        <td>#DIV/0!</td>
                        <td>100</td>
                    </tr>
                </table>

                <!-- 2. 알선취업 성과 현황 -->
                <h3>2. 알선취업 성과 현황</h3>
                <table>
                    <tr>
                        <th rowspan="2">구분</th>
                        <th colspan="2">금일 누적 실적</th>
                        <th colspan="2">금주 누적 실적</th>
                        <th colspan="2">금월 누적 실적</th>
                        <th colspan="2">금년 누적 실적</th>
                    </tr>
                    <tr>
                        <th>일반 취업</th>
                        <th>알선 취업</th>
                        <th>일반 취업</th>
                        <th>알선 취업</th>
                        <th>일반 취업</th>
                        <th>알선 취업</th>
                        <th>일반 취업</th>
                        <th>알선 취업</th>
                    </tr>
                    <!-- 상담사별 행 10개 추가 -->
                    <tr>
                        <td>합계</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </table>

                <!-- 3. 총괄 진행현황 -->
                <h3>3. 총괄 진행현황</h3>
                <table>
                    <tr>
                        <th>구분</th>
                        <th>취소</th>
                        <th>참여자 합계</th>
                        <th>현진행자(유예포함)</th>
                        <th>3단계 진행자</th>
                        <th>기간만료</th>
                        <th>중단</th>
                        <th>성과 불인정 취업</th>
                        <th>성과 인정 취업</th>
                        <th>알선취업</th>
                        <th>평가 취업률</th>
                        <th>알선취업률</th>
                        <th>229만원 이상 취업률</th>
                        <th>고용유지율</th>
                        <th>조기취업실적</th>
                        <th>취업인센티브 발생률</th>
                    </tr>
                    <!-- 각 연도별 데이터 행 추가 -->
                </table>

                <!-- 4. 기타사항 -->
                <h3>4. 기타사항</h3>
                <textarea style="width: 100%; height: 100px;"></textarea>
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
<!-- apexcharts -->
<script
        src="https://cdn.jsdelivr.net/npm/apexcharts@3.37.1/dist/apexcharts.min.js"
        integrity="sha256-+vh8GkaU7C9/wbSLIcwq82tQ2wTf44aOHA8HlBMwRI8="
        crossorigin="anonymous"
></script>
</html>
