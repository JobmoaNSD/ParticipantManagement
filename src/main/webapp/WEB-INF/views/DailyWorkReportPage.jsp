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
                    <form action="/downloadExcel.login" method="GET">

                        <div class="row col-md-12 mt-3">
                            <div class="col-md-2 text-center">
                                <div class="border border-1 border-dark">
                                    금일 배정인원
                                </div>
                                <div class="d-flex align-items-center justify-content-center border border-1 border-dark p-1">
                                    <div>
                                        <label for="todayPersonnelOneType" class="form-label">1유형</label>
                                        <input type="number" id="todayPersonnelOneType" class="form-control w-75 ms-auto me-auto" value="0">
                                    </div>
                                    <div>
                                        <label for="todayPersonnelOneType" class="form-label">2유형</label>
                                        <input type="number" id="todayPersonnelTwoType" class="form-control w-75 ms-auto me-auto" value="0">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-7">

                            </div>
                            <div class="col-md-3 d-flex align-items-end justify-content-end">
                                <button type="submit" class="excel-download-btn mt-3 mb-2">
                                    <i class="bi bi-file-earmark-excel-fill"></i>
                                    엑셀 다운로드
                                </button>
                                <input type="hidden" name="branch" value="${JOBMOA_LOGIN_DATA.memberBranch}">
                                <input type="hidden" id="year" name="year" value="">
                            </div>
                        </div>
                        <!-- 전체 리스트를 감싸는 컨테이너 추가 -->
                        <div class="user-list text-center" id="sortableList">
                            <c:choose>
                                <c:when test="${empty users}">
                                    <div class="user-item">
                                        <span>선택할 전담자가 없습니다.</span>
                                    </div>
                                </c:when>
                                <c:when test="${not empty users}">
                                    <c:forEach var="user" items="${users}" varStatus="status">
                                        <!-- 기존 user-item div들이 여기에 반복됨 -->
                                        <div class="user-item" data-id="${user.memberUserID}">
                                            <div class="drag-handle d-flex align-items-center justify-content-center">
                                                <div class="row col-md-2 d-flex align-items-center">
                                                    <span class="verticalEllipsis col-md-1">&#8942;</span>
                                                    <span class="position-input col-md-1">${status.count}</span>
                                                    <label for="checkbox_${user.memberUserID}" class="toggle col-md-3"
                                                           style="min-width: 75px;">
                                                            ${user.memberUserName}
                                                    </label>
                                                    <span class="checkbox-wrapper-3 col-md-3">
                                                        <input type="checkbox" id="checkbox_${user.memberUserID}" name="userIds" value="${user.memberUserID}" checked />
                                                        <label for="checkbox_${user.memberUserID}" class="toggle"><span></span></label>
                                                    </span>

                                                </div>
                                                <!-- TODO FIXME 27~28일 내로 실적 배정인원 저장 가능하게 로직 수정할 것 -->
                                                <div class="row">
                                                    <div class="col-md-2 ps-1 pe-1">
                                                        <div class="border border-1 border-dark">
                                                            금일 누적 실적
                                                        </div>
                                                        <div class="d-flex align-items-center justify-content-center border border-1 border-dark p-1">
                                                            <div>
                                                                <label for="todayPersonnelOneType" class="form-label">일반 취업</label>
                                                                <input type="number" id="todayPersonnelOneType" class="form-control w-75 ms-auto me-auto" value="0">
                                                            </div>
                                                            <div>
                                                                <label for="todayPersonnelOneType" class="form-label">알선 취업</label>
                                                                <input type="number" id="todayPersonnelTwoType" class="form-control w-75 ms-auto me-auto" value="0">
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-2 ps-1 pe-1">
                                                        <div class="border border-1 border-dark">
                                                            금주 누적 실적
                                                        </div>
                                                        <div class="d-flex align-items-center justify-content-center border border-1 border-dark p-1">
                                                            <div>
                                                                <label for="todayPersonnelOneType" class="form-label">일반 취업</label>
                                                                <input type="number" id="todayPersonnelOneType" class="form-control w-75 ms-auto me-auto" value="0">
                                                            </div>
                                                            <div>
                                                                <label for="todayPersonnelOneType" class="form-label">알선 취업</label>
                                                                <input type="number" id="todayPersonnelTwoType" class="form-control w-75 ms-auto me-auto" value="0">
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-2 ps-1 pe-1">
                                                        <div class="border border-1 border-dark">
                                                            금월 누적 실적
                                                        </div>
                                                        <div class="d-flex align-items-center justify-content-center border border-1 border-dark p-1">
                                                            <div>
                                                                <label for="todayPersonnelOneType" class="form-label">일반 취업</label>
                                                                <input type="number" id="todayPersonnelOneType" class="form-control w-75 ms-auto me-auto" value="0">
                                                            </div>
                                                            <div>
                                                                <label for="todayPersonnelOneType" class="form-label">알선 취업</label>
                                                                <input type="number" id="todayPersonnelTwoType" class="form-control w-75 ms-auto me-auto" value="0">
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-2 ps-1 pe-1">
                                                        <div class="border border-1 border-dark">
                                                            금년 누적 실적
                                                        </div>
                                                        <div class="d-flex align-items-center justify-content-center border border-1 border-dark p-1">
                                                            <div>
                                                                <label for="todayPersonnelOneType" class="form-label">일반 취업</label>
                                                                <input type="number" id="todayPersonnelOneType" class="form-control w-75 ms-auto me-auto" value="0">
                                                            </div>
                                                            <div>
                                                                <label for="todayPersonnelOneType" class="form-label">알선 취업</label>
                                                                <input type="number" id="todayPersonnelTwoType" class="form-control w-75 ms-auto me-auto" value="0">
                                                            </div>
                                                        </div>
                                                    </div>

                                                </div>


                                            </div>
                                        </div>
                                    </c:forEach>
                                </c:when>
                            </c:choose>
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
                console.log(`User ID: ${userId}, New Position: ${newPosition}`);
            });
        }
    });
</script>

</html>
