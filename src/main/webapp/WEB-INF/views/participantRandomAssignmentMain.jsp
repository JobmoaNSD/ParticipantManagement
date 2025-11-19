<%--
  Created by IntelliJ IDEA.
  User: no1fc
  Date: 25. 7. 17.
  Time: 오후 3:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>잡모아 - 참여자 랜덤 배정</title>
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

    <!-- csv file array change CDN -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-csv/1.0.9/jquery.csv.min.js" integrity="sha512-Y8iWYJDo6HiTo5xtml1g4QqHtl/PO1w+dmUpQfQSOTqKNsMhExfyPN2ncNAe9JuJUSKzwK/b6oaNPop4MXzkwg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-csv/1.0.9/jquery.csv.js" integrity="sha512-eDkr7sqAJqr3s63mdge3uTyuKVpEbzw3eji7CbGYr8VeM+NtqNajwuAiU31S0buRspDF1mZ8qTSeEZ4v/8b3Gw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <!-- praCSVtoTable JS -->
    <script src="<c:url value="/js/praCSVtoTableJS.js"/>"></script>

    <!-- praCSVtoTable JS -->
    <script src="<c:url value="/js/praDataVerification.js"/>"></script>

    <!-- table2excel Table to Excel -->
    <script src="https://cdn.rawgit.com/rainabba/jquery-table2excel/1.1.0/dist/jquery.table2excel.min.js"></script>
    <!-- praTableExport JS -->
    <script src="<c:url value="/js/praTabletoExcel.js"/>"></script>

    <!-- csv file inline css -->
    <!-- id&class file-text, file-button-label, file-input -->
    <style>

        .title-header{
            font-size: 1.25em;
            font-weight: bold;
            margin-bottom: 10px;
        }

        #helpButton{
            font-size: 0.854em;
            font-weight: normal;
            color: #007bff;
            cursor: pointer;
        }

        .file-input{
            display: none;
        }

        .file-button-label{
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
        }

        .response-text-div{
            display: none;
            font-size: 0.854em;
        }

        .response-text-div .csv-danger{
            color: red;
            font-weight: bold;
        }

        .title-sub-header{
            display: none;
        }

        .random-button-label{
            display: inline-block;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
        }

        .reset-button-label{
            display: none;
            padding: 10px 20px;
            background-color: #ffb700;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
        }

        .save-button{
            display: inline-block;
            padding: 10px 20px;
            background-color: #018b38;
            color: #fff;
            border: 0;
            border-radius: 5px;
            cursor: pointer;
        }

        #varification-button{
            display: inline-block;
            padding: 10px 20px;
            background-color: #018b38;
            color: #fff;
            border: 0;
            border-radius: 5px;
            cursor: pointer;
        }

        #template-button{
            display: inline-block;
            padding: 10px 20px;
            background-color: #018b38;
            color: #fff;
            border: 0;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body class="layout-fixed sidebar-expand-lg bg-body-tertiary">

<!--begin::App Wrapper-->
<div class="app-wrapper">
    <!--begin:::App Gnb-->
    <mytag:gnb gnb_main_header="지점관리" gnb_sub_header="참여자 랜덤 배정"/>
    <!--end:::App Gnb-->
    <!--begin:::App main content-->
    <!--begin::App Main-->
    <main class="app-main">
        <!--begin::App Content-->
        <div class="app-content">
            <!--begin::Main content-->
            <div class="container-fluid">
                <!-- 필요 본문 내용은 이쪽에 만들어 주시면 됩니다. -->
                <div class="row">
                    <div class="col-md-4">
                        <div class="title-header col-md-12 pt-2">
                            참여자 랜덤 배정 <span id="helpButton" data-toggle="tooltip" data-placement="top" title="사용 방법 및 파일 설명"><i class="bi bi-lightbulb-fill"></i>도움말</span>
                        </div>
                        <div class="title-sub-header col-md-12" id="helpText">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="alert alert-info">
                                        <h6>랜덤 배정 사용 방법:</h6>
                                        <ul>
                                            <li>csv 파일 찾기 클릭</li>
                                            <li>상담사 랜덤 배정 클릭</li>
                                            <li>배정 상담사 확인 후 저장</li>
                                        </ul>
                                        <h6>CSV 파일 작성 가이드:</h6>
                                        <ul>
                                            <li>첫 번째 줄은 헤더(컬럼명)로 작성해주세요.</li>
                                            <li>데이터에 쉼표(,)가 포함된 경우 따옴표(")로 감싸주세요.</li>
                                            <li>따옴표가 포함된 데이터는 두 개의 따옴표("")로 표시해주세요.</li>
                                            <li>CSV파일 저장시 CSV UTF-8(쉼표로 분리)로 저장해주세요.</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="file-input-container col-md-12 align-content-end">
                            <label for="file-input" class="file-button-label"><i class="bi bi-filetype-csv"></i> 파일 찾기</label>
                            <input type="file" id="file-input" class="file-input" accept=".csv">
                            <label class="random-button-label"><i class="bi bi-shuffle"></i> 랜덤 배정</label>
                            <label class="reset-button-label"><i class="bi bi-arrow-counterclockwise"></i> 초기화</label>
                            <br>
                            <button id="save-button" class="save-button mt-1"><i class="bi bi-save-fill"></i> 저장</button>
                            <button id="varification-button" class="varification-button"><i class="bi bi-save-fill"></i> 데이터 검증</button>
                            <a href="/templateFolder/Template.csv"><button id="template-button"><i class="bi bi-save-fill"></i> 템플릿 다운로드</button></a>

                            <div class="response-text-div pb-2">경고 내용 출력 부분</div>
                        </div>
                    </div>

                    <div class="body-content col-md-8">
                        <div class="counselor-container col-md-12 mt-1">
                            <button class="btn btn-secondary float-end" id="excludeBtn">선택 상담사 배정 제외</button>
                        </div>
                        <div class="counselor-container col-md-12 overflow-y-scroll" style="max-height: 200px;">
                            <table class="table table-striped text-center" id="assign-count-table">
                                <thead id="assign-count-table-header">
                                <tr>
                                    <th>상담사ID</th>
                                    <th>상담사</th>
                                    <th>총 (배정)진행자</th>
                                    <th>1유형</th>
                                    <th>2유형</th>
                                    <th>남</th>
                                    <th>여</th>
                                    <th>청년</th>
                                    <th>중장년</th>
                                    <th>특정계층</th>
                                    <th>현재 배정 인원</th>
                                    <th>최대 배정 인원</th>
                                </tr>
                                </thead>
                                <tbody id="assign-count-table-body">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="content-body col-md-12">
                        <!-- csvData ID를 JavaScript와 일치시킴 -->
                        <div class="csvData" id="csvData">
                            <div class="counselor-container col-md-12 mt-1">
                                <button class="btn btn-success float-end" id="excel-download-btn" onclick="exportToExcel()">Excel 다운로드</button>
                            </div>
                            <table class="table table-striped" id="pra-csv-table">
                                <thead class="csv-data-header">
                                <tr>
                                    <th class="">번호</th>
                                    <th class="csv-column">전담자_계정</th>
                                    <th class="csv-column">참여자 성명</th>
                                    <th class="csv-column">생년월일</th>
                                    <th class="csv-column">성별</th>
                                    <th class="csv-column">모집경로</th>
                                    <th class="csv-column">참여유형</th>
                                    <th class="csv-column">진행단계</th>
                                    <th class="csv-column">특정계층</th>
                                </tr>
                                </thead>
                                <tbody class="csv-data" id="csv-data">
                                </tbody>
                            </table>
                        </div>
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

<!-- 상담사 데이터 초기화 -->
<script>
    // 상담사 데이터를 전역 변수로 설정 (실제 데이터로 교체 필요)
    let currentCounselor = ${assignData};
        /*{
        'C001': {
            name: '홍길동',
            total: 0,
            type1: 0,
            type2: 0,
            man: 0,
            woman: 0,
            youth: 0,
            middleAged: 0,
            specialGroup: 0,
            year2025: 0,
            current: 0,
            max: 30
        },
        'C002': {
            name: '김철수',
            total: 0,
            type1: 0,
            type2: 0,
            man: 0,
            woman: 0,
            youth: 0,
            middleAged: 0,
            specialGroup: 0,
            year2025: 0,
            current: 0,
            max: 30
        },
        'C003': {
            name: '박영희',
            total: 0,
            type1: 0,
            type2: 0,
            man: 0,
            woman: 0,
            youth: 0,
            middleAged: 0,
            specialGroup: 0,
            year2025: 0,
            current: 0,
            max: 30
        }
    };*/

    // 배정 제외 인원 배열
    let excludedPersonnel = {};

    // 페이지 로드 시 상담사 테이블 초기화
    $(document).ready(function() {
        updateCounselorTable(currentCounselor);

        // 초기화 버튼 표시
        $('.reset-button-label').show();
    });
</script>

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