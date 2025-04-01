<%--
  Created by IntelliJ IDEA.
  User: no1fc
  Date: 25. 3. 13.
  Time: 오후 4:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
    <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>

    <!-- CSS 추가 -->
    <link rel="stylesheet" href="css/dailyWorkReportCss.css">

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
                <div class="row">
                    <form action="/downloadExcel.login" id="downloadForm" method="GET">
                        <div class="row">
                            <div class="row col-md-12 mt-3 p-0 align-items-center justify-content-end">
                                <div class="text-center" style="width: 100%; max-width: 160px;">
                                    <label class="type-label w-75" style="font-size: 14px">마지막 다운로드</label>
                                    <input type="text" id="lastSavedDate"
                                           class="lastSavedDate form-control w-75 ms-auto me-auto"
                                           value="${users==null? 0: users[0].endUpdateStatus}"
                                           disabled
                                    >
                                </div>
                                <div class="col-md-1  p-0">
                                    <button type="button" id="downloadBtn" class="excel-download-btn mt-3 mb-2">
                                        <i class="bi bi-file-earmark-excel-fill"></i>
                                        <span class="excel-download-text">엑셀 다운로드</span>
                                    </button>
                                    <input type="hidden" name="branch" value="${JOBMOA_LOGIN_DATA.memberBranch}">
                                    <input type="hidden" id="year" name="year" value="">
                                </div>
                            </div>

                            <div class="row col-md-12 mt-3 p-0 d-flex align-items-start justify-content-end">
                                <div class="row col-md-2">
                                    <div class="personnel-container" id="sortableList">
                                        <div class="personnel-header">
                                            금일 배정인원
                                        </div>
                                        <div class="personnel-content">
                                            <div>
                                                <label for="todayPersonnelOneType" class="type-label">1유형</label>
                                                <input type="number" id="todayPersonnelOneType" name="memberType1" class="type-input"
                                                       value="${users==null? 0: users[0].memberType1}">
                                            </div>
                                            <div>
                                                <label for="todayPersonnelTwoType" class="type-label">2유형</label>
                                                <input type="number" id="todayPersonnelTwoType" name="memberType2" class="type-input"
                                                       value="${users==null? 0: users[0].memberType2}">
                                            </div>
                                        </div>
                                        <div class="personnel-header">
                                            상담사 엑셀 순서
                                        </div>
                                        <c:choose>
                                            <c:when test="${empty users}">
                                                <div class="user-item">
                                                    <span>선택할 전담자가 없습니다.</span>
                                                </div>
                                            </c:when>
                                            <c:when test="${not empty users}">
                                                <c:forEach var="user" items="${users}" varStatus="status">
                                                    <!-- 기존 user-item div들이 여기에 반복됨 -->
                                                    <div class="user-item row col-md-12 p-0" data-id="${user.memberUserID}">
                                                        <div class="drag-handle d-flex align-items-center">
                                                            <span class="verticalEllipsis">&#8942;</span>
                                                            <span class="position-input">${status.count}</span>
                                                            <label for="checkbox_${user.memberUserID}" class="toggle"
                                                                   style="min-width: 75px;">
                                                                    ${user.memberUserName}
                                                            </label>
                                                            <span class="checkbox-wrapper-3">
                                                            <input type="checkbox" id="checkbox_${user.memberUserID}" class="checkbox" name="userIds" value="${user.memberUserID}" checked />
                                                            <label for="checkbox_${user.memberUserID}" class="toggle"><span></span></label>
                                                        </span>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </c:when>
                                        </c:choose>
                                    </div>
                                </div>

                                <div class="row col-md-10 ">
                                    <div class="col-md-12 ps-1 pe-0">
                                        <table id="status-table" class="status-table">
                                            <thead id="status-thead" class="status-thead">
                                            <tr class="status-thead-tr">
                                                <th scope="col" colspan="2" rowspan="2" class="text-center status-thead-th-name">
                                                    <span >상담사</span>
                                                </th>
                                                <th scope="col" colspan="2" class="text-center">
                                                    금일 누적 실적
                                                </th>
                                                <th scope="col" colspan="2" class="text-center">
                                                    금주 누적 실적
                                                </th>
                                                <th scope="col" colspan="2" class="text-center">
                                                    금월 누적 실적
                                                </th>
                                                <th scope="col" colspan="2" class="text-center">
                                                    금년 누적 실적
                                                </th>
                                            </tr>
                                            <tr class="status-thead-tr">
                                                <!-- 금일,금주,금월,금년 누적 실적 th table -->
                                                <c:forEach begin="0" end="3" varStatus="i">
                                                    <th scope="col" class="text-center">
                                                        일반 취업
                                                    </th>
                                                    <th scope="col" class="text-center">
                                                        알선 취업
                                                    </th>
                                                </c:forEach>
                                            </tr>
                                            </thead>
                                            <tbody id="status-tbody" class="status-tbody">
                                            <c:forEach var="user" items="${users}">
                                                <tr class="status-tbody-tr" data-id="${user.memberUserID}">
                                                    <!-- 상담사 성명 -->
                                                    <th scope="col" colspan="2" class="text-center">
                                                        <span class="status-tbody-span">${user.memberUserName}</span>
                                                    </th>
                                                    <!-- 상담사 성명 -->
                                                    <!-- 금일 누적 실적 th table 시작 -->
                                                    <th scope="col" class="text-center">
                                                        <input type="number" id="todayEmployment_${user.memberUserID}" name="memberTodayEmployments" class="todayEmployment form-control w-75 ms-auto me-auto"
                                                               value="${user.memberTodayEmployment}" min="0">
                                                    </th>
                                                    <th scope="col" class="text-center">
                                                        <input type="number" id="todayPlacement_${user.memberUserID}" name="memberTodayPlacements" class="todayPlacement form-control w-75 ms-auto me-auto"
                                                               value="${user.memberTodayPlacement}" min="0">
                                                    </th>
                                                    <!-- 금일 누적 실적 th table 끝 -->
                                                    <!-- 금주 누적 실적 th table 시작 -->
                                                    <th scope="col" class="text-center">
                                                        <input type="number" id="toWeekEmployment_${user.memberUserID}" name="memberToWeekEmployments" class="toWeekEmployment form-control w-75 ms-auto me-auto"
                                                               value="${user.memberToWeekEmployment}" min="0">
                                                    </th>
                                                    <th scope="col" class="text-center">
                                                        <input type="number" id="toWeekPlacement_${user.memberUserID}" name="memberToWeekPlacements" class="toWeekPlacement form-control w-75 ms-auto me-auto"
                                                               value="${user.memberToWeekPlacement}" min="0">
                                                    </th>
                                                    <!-- 금주 누적 실적 th table 끝 -->
                                                    <!-- 금월 누적 실적 th table 시작 -->
                                                    <th scope="col" class="text-center">
                                                        <input type="number" id="toMonthEmployment_${user.memberUserID}" name="memberToMonthEmployments" class="toMonthEmployment form-control w-75 ms-auto me-auto"
                                                               value="${user.memberToMonthEmployment}" min="0">
                                                    </th>
                                                    <th scope="col" class="text-center">
                                                        <input type="number" id="toMonthPlacement_${user.memberUserID}" name="memberToMonthPlacements" class="toMonthPlacement form-control w-75 ms-auto me-auto"
                                                               value="${user.memberToMonthPlacement}" min="0">
                                                    </th>
                                                    <!-- 금월 누적 실적 th table 끝 -->
                                                    <!-- 금년 누적 실적 th table 시작 -->
                                                    <th scope="col" class="text-center">
                                                        <input type="number" id="toYearEmployment_${user.memberUserID}" name="memberToYearEmployments" class="toYearEmployment form-control w-75 ms-auto me-auto"
                                                               value="${user.memberToYearEmployment}" min="0">
                                                    </th>
                                                    <th scope="col" class="text-center">
                                                        <input type="number" id="toYearPlacement_${user.memberUserID}" name="memberToYearPlacements" class="toYearPlacement form-control w-75 ms-auto me-auto"
                                                               value="${user.memberToYearPlacement}" min="0">
                                                    </th>
                                                    <!-- 금년 누적 실적 th table 끝 -->
                                                </tr>
                                            </c:forEach>

                                            </tbody>
                                        </table>
                                    </div>

                                </div>

                            </div>
                        </div>

                    </form>
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




<!-- JavaScript 추가 순서지정 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Sortable/1.14.0/Sortable.min.js"></script>
<script>
    $(document).ready(function() {
        let year = $('#year');
        let today = new Date();
        year.val(today.getFullYear());


        // sortable 초기화
        $("#sortableList").sortable({
            items: ".user-item",             // 정렬 대상
            handle: ".drag-handle",          // 드래그 핸들
            axis: "y",                       // 세로 방향으로만 이동 가능
            cursor: "move",                  // 드래그 시 커서 모양
            opacity: 0.6,                    // 드래그 중인 항목의 투명도
            update: function(event, ui) {    // 정렬이 완료된 후 실행
                updateOrder();
                updateTbodyOrder();
            }
        });

        // 순서 업데이트 함수
        function updateOrder() {
            $('.user-item').each(function(index) {
                // 순서 번호 업데이트
                $(this).find('.position-input').text(index + 1);

                // 선택적: 서버에 순서 정보 전송
                let userId = $(this).data('id');
                let newPosition = index + 1;

                // 콘솔에 순서 변경 로그 출력
                <%--console.log(`User ID: ${userId}, New Position: ${newPosition}`);--%>
            });
        }

        $('#downloadBtn').on('click',()=>{
            $('#downloadForm').submit();
        });

        // tbody 순서 업데이트 함수
        function updateTbodyOrder() {
            const $tbody = $('#status-tbody');
            const $rows = $tbody.find('tr').toArray();

            // user-item의 순서대로 tbody의 행 재정렬
            $('.user-item').each(function(index) {
                const userId = $(this).data('id');
                const $matchingRow = $rows.find(row => $(row).data('id') === userId);

                if ($matchingRow) {
                    $tbody.append($matchingRow);
                }
            });
        }

        // 체크박스 상태 변경 시 실행되는 함수도 수정
        $('.user-item').on('change', function() {
            const changeVal = $(this).data('id');
            const $targetRow = $('.status-tbody-tr[data-id="'+changeVal+'"]');
            const $inputs = $targetRow.find('input');

            $inputs.prop('disabled', !$inputs.is(':disabled'));
        });


// 선택자 상수
        const SELECTORS = {
            ROW: 'tr',
            TODAY_EMPLOYMENT: '.todayEmployment',
            WEEK_EMPLOYMENT: '.toWeekEmployment',
            MONTH_EMPLOYMENT: '.toMonthEmployment',
            YEAR_EMPLOYMENT: '.toYearEmployment',
            TODAY_PLACEMENT: '.todayPlacement',
            WEEK_PLACEMENT: '.toWeekPlacement',
            MONTH_PLACEMENT: '.toMonthPlacement',
            YEAR_PLACEMENT: '.toYearPlacement',
            TODAY_PERSONNEL_ONE_TYPE:'#todayPersonnelOneType',
            TODAY_PERSONNEL_TWO_TYPE:'#todayPersonnelTwoType'
        };

// 각 행의 이전 값을 저장하기 위한 Map
        const previousValues = {
            employment: new Map(),
            placement: new Map()
        };

// 문자열을 숫자로 안전하게 변환
        const parseNumericValue = (value) => parseFloat(value) || 0;

// 특정 행의 누적 실적 값 업데이트
        const updateRowValues = (row, difference, type) => {
            const fields = type === 'employment'
                ? [SELECTORS.WEEK_EMPLOYMENT, SELECTORS.MONTH_EMPLOYMENT, SELECTORS.YEAR_EMPLOYMENT]
                : [SELECTORS.WEEK_PLACEMENT, SELECTORS.MONTH_PLACEMENT, SELECTORS.YEAR_PLACEMENT];

            fields.forEach(selector => {
                const input = $(row).find(selector);
                const currentValue = parseNumericValue(input.val());
                input.val(currentValue + difference);
            });
        };

// 일일 실적 변경 이벤트 처리 (취업)
        $(document).on('change', SELECTORS.TODAY_EMPLOYMENT, function() {
            handleValueChange(this, 'employment');
        });

// 일일 실적 변경 이벤트 처리 (알선)
        $(document).on('change', SELECTORS.TODAY_PLACEMENT, function() {
            handleValueChange(this, 'placement');
        });

// 값 변경 처리 함수
        const handleValueChange = (element, type) => {
            const currentRow = $(element).closest(SELECTORS.ROW);
            const rowId = currentRow.data('id') || currentRow.index();
            const previousValue = previousValues[type].get(rowId) || 0;
            const newValue = parseNumericValue($(element).val());
            const difference = newValue - previousValue;

            updateRowValues(currentRow, difference, type);
            previousValues[type].set(rowId, newValue);
        };

// 날짜 검사 및 초기화
        const initializeValues = () => {
            const lastSavedDate = $('#lastSavedDate').val();

            const resetSelectors = {
                year: [SELECTORS.YEAR_EMPLOYMENT, SELECTORS.YEAR_PLACEMENT],
                month: [SELECTORS.MONTH_EMPLOYMENT, SELECTORS.MONTH_PLACEMENT],
                week: [SELECTORS.WEEK_EMPLOYMENT, SELECTORS.WEEK_PLACEMENT],
                day: [SELECTORS.TODAY_EMPLOYMENT, SELECTORS.TODAY_PLACEMENT, SELECTORS.TODAY_PERSONNEL_ONE_TYPE, SELECTORS.TODAY_PERSONNEL_TWO_TYPE]
            };

            if (!isDate(lastSavedDate, 'year')) {
                resetSelectors.year.forEach(selector => $(selector).val(0));
            }
            if (!isDate(lastSavedDate, 'month')) {
                resetSelectors.month.forEach(selector => $(selector).val(0));
            }
            if (!isDate(lastSavedDate, 'week')) {
                resetSelectors.week.forEach(selector => $(selector).val(0));
            }
            if (!isDate(lastSavedDate, 'day')) {
                resetSelectors.day.forEach(selector => $(selector).val(0));
            }
        };
        const isDate = (date, condition) => {
            date = new Date(date);
            today = new Date();
            if(condition === 'year'){
                return today.getFullYear() === date.getFullYear();
            }
            else if(condition === 'month'){
                return today.getMonth() === date.getMonth();
            }
            else if(condition === 'week'){
                return getWeek(today) === getWeek(date);
            }
            else if(condition === 'day'){
                return today.getDate() === date.getDate();
            }
            return false;
        }

        const getWeek = (date) => {
            const currentDate = new Date(date);

            // 현재 날짜가 속한 주의 월요일 찾기
            const currentMonday = new Date(currentDate);
            const day = currentDate.getDay();
            const diff = day === 0 ? -6 : 1 - day; // 일요일(0)일 경우 이전 주 월요일로
            currentMonday.setDate(currentDate.getDate() + diff);

            // 해당 년도의 첫 번째 날짜
            const firstDayOfYear = new Date(currentDate.getFullYear(), 0, 1);

            // 해당 년도의 첫 번째 월요일 찾기
            const firstMonday = new Date(firstDayOfYear);
            const firstDay = firstDayOfYear.getDay();
            const firstDiff = firstDay === 0 ? 1 : 9 - firstDay;
            firstMonday.setDate(firstDayOfYear.getDate() + firstDiff - 7);

            // 첫 번째 월요일부터 현재 월요일까지의 차이를 계산
            const diffDays = Math.floor((currentMonday - firstMonday) / (1000 * 60 * 60 * 24));

            return Math.floor(diffDays / 7) + 1;
        };

        //초기화 실행
        initializeValues();
    });
</script>

</html>
