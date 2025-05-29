<%--
  Created by IntelliJ IDEA.
  User: no1fc
  Date: 25. 4. 2.
  Time: 오전 11:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

    <!-- jQuery JS -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js" integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

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


    <!-- sortablejs -->
    <script
            src="https://cdn.jsdelivr.net/npm/sortablejs@1.15.0/Sortable.min.js"
            integrity="sha256-ipiJrswvAR4VAx/th+6zWsdeYmVae0iJuiR+6OqHJHQ="
            crossorigin="anonymous"
    ></script>
    <!-- sortablejs -->
    <!-- apexcharts -->
    <script
            src="https://cdn.jsdelivr.net/npm/apexcharts@3.37.1/dist/apexcharts.min.js"
            integrity="sha256-+vh8GkaU7C9/wbSLIcwq82tQ2wTf44aOHA8HlBMwRI8="
            crossorigin="anonymous"
    ></script>
    <!--begin::Required Plugin(AdminLTE)-->
    <script src="js/adminlte.js"></script>
    <!--end::Required Plugin(AdminLTE)-->

    <!-- pagination JS 파일 -->
    <script src="js/paginationJS.js"></script>

    <!-- selectOptionJS JS 파일 -->
    <script src="js/selectOptionJS.js"></script>

    <!-- Excel 다운 버튼 CSS 추가 -->
    <link rel="stylesheet" href="css/dailyWorkReportCss.css">

    <!-- sweetalert2 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
    <script src="js/sweetAlert.js"></script>

</head>
<body class="layout-fixed sidebar-expand-lg bg-body-tertiary">

<!--begin::App Wrapper-->
<div class="app-wrapper">
    <!--begin:::App Gnb-->
    <mytag:gnb gnb_main_header="지점관리" gnb_sub_header="지점전체참여자"/>
    <!--end:::App Gnb-->

    <!--begin:::App main content-->
    <!--begin::App Main-->
    <main class="app-main">
        <!--begin::App Content-->
        <div class="app-content">
            <div class="container-fluid">
                <!-- 필요 본문 내용은 이쪽에 만들어 주시면 됩니다. -->

                <div class="row col-md-11 pt-5 me-auto ms-auto">
                    <div class="col-md-12 text-center d-flex align-items-center justify-content-center ">
                        <h3 class="flex-fill">참여자 조회</h3>
                        <button id="excelDownload" class="excel-download-btn mt-3 mb-2 me-2">
                            <i class="bi bi-file-earmark-excel-fill"></i>
                            엑셀 다운로드
                        </button>
                    </div>
                    <%-- 참여자 검색 시작 --%>
                    <form class="row col-md-12 pt-3 pb-0 ms-auto me-auto" id="searchForm" name="searchForm" method="GET" action="/branchParitic.login">
                        <input type="hidden" name="page" value="1">
                        <!-- 검색 조건 선택 -->

                        <div class="col-md-3 ms-auto d-flex justify-content-center pe-1">
                            <select
                                    class="form-select shadow-sm  w-75 me-2"
                                    name="endDateOption"
                                    id="endDate-Option"
                            >
                                <option ${param.endDateOption.equals("false") ? 'selected' : ''} value="false">진행중</option>
                                <option ${param.endDateOption.equals("true") ? 'selected' : ''} value="true">마감</option>
                                <option ${param.endDateOption.equals("allType") ? 'selected' : ''} value="allType">전체</option>
                            </select>
                            <select
                                    class="form-select shadow-sm w-75 me-2"
                                    name="participantInItCons"
                                    id="year">
                                <option ${param.participantInItCons.equals("All") ? 'selected' : ''} value="All">년도</option>
                                <option ${param.participantInItCons.equals("2025") ? 'selected' : ''} value="2025">2025</option>
                                <option ${param.participantInItCons.equals("2024") ? 'selected' : ''} value="2024">2024</option>
                                <option ${param.participantInItCons.equals("2023") ? 'selected' : ''} value="2023">2023</option>
                                <option ${param.participantInItCons.equals("2022") ? 'selected' : ''} value="2022">2022</option>
                            </select>
                            <select
                                    class="form-select shadow-sm"
                                    name="searchOption"
                                    id="search-Option"
                            >
                                <option ${param.searchOption.equals("참여자") ? 'selected' : ''} value="참여자">참여자</option>
                                <option ${param.searchOption.equals("전담자") ? 'selected' : ''} value="전담자">전담자</option>
                                <option ${param.searchOption.equals("구직번호") ? 'selected' : ''} value="구직번호">구직번호</option>
                                <option ${param.searchOption.equals("진행단계") ? 'selected' : ''} value="진행단계">진행단계</option>
                                <option ${param.searchOption.equals("학교명") ? 'selected' : ''} value="학교명">학교</option>
                            </select>
                        </div>
                        <!-- 검색 입력 -->
                        <div class="col-md-7 ps-1">
                            <input
                                    type="text"
                                    class="form-control shadow-sm"
                                    id="search"
                                    name="search"
                                    placeholder="검색어를 입력해주세요."
                                    value="${param.search}"
                            />
                        </div>
                        <%-- 검색버튼 --%>
                        <div class="col-md-1 text-center btn btn-secondary" id="searchBtn">
                            검색<i class="bi bi-search"></i>
                        </div>
                        <div class="col-md-1 ps-1 pe-1 text-center me-auto">
                            <select class="form-select shadow-sm" name="pageRows" id="pageRows">
                                <option ${param.pageRows.equals("100") ? 'selected' : ''} value="100">100</option>
                                <option ${param.pageRows.equals("90") ? 'selected' : ''} value="90">90</option>
                                <option ${param.pageRows.equals("80") ? 'selected' : ''} value="80">80</option>
                                <option ${param.pageRows.equals("70") ? 'selected' : ''} value="70">70</option>
                                <option ${param.pageRows.equals("60") ? 'selected' : ''} value="60">60</option>
                            </select>
                        </div>
                        <div class="navbar-expand mt-3">
                            <ul class="navbar-nav w-75 ms-auto me-auto">
                                <li class="nav-item d-none d-md-block w-auto btn-link ms-auto me-auto">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="searchType" id="allType" value="" ${(param.searchType.equals("") or param.searchType eq null) ? 'checked' : ''}>
                                        <label class="form-check-label" for="allType">옵션 선택</label>
                                    </div>
                                </li>
                                <li class="nav-item d-none d-md-block w-auto btn-link ms-auto me-auto">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="searchType" id="noInitialConsult" value="noInitial" ${param.searchType.equals("noInitial") ? 'checked' : ''}>
                                        <label class="form-check-label" for="noInitialConsult">초기상담 미실시자</label>
                                    </div>
                                </li>
                                <li class="nav-item d-none d-md-block w-auto btn-link ms-auto me-auto">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="searchType" id="recentConsult21" value="recent21" ${param.searchType.equals("recent21") ? 'checked' : ''}>
                                        <label class="form-check-label" for="recentConsult21">최근상담일 21일</label>
                                    </div>
                                </li>
                                <li class="nav-item d-none d-md-block w-auto btn-link ms-auto me-auto">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="searchType" id="jobExpire15" value="jobExpire" ${param.searchType.equals("jobExpire") ? 'checked' : ''}>
                                        <label class="form-check-label" for="jobExpire15">구직 만료 15일 도래자</label>
                                    </div>
                                </li>
                                <li class="nav-item d-none d-md-block w-auto btn-link ms-auto me-auto">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="searchType" id="periodExpire15" value="periodExpire" ${param.searchType.equals("periodExpire") ? 'checked' : ''}>
                                        <label class="form-check-label" for="periodExpire15">기간 만료 15일 예정자</label>
                                    </div>
                                </li>
                                <li class="nav-item d-none d-md-block w-auto btn-link ms-auto me-auto">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="searchType" id="employment" value="employment" ${param.searchType.equals("employment") ? 'checked' : ''}>
                                        <label class="form-check-label" for="employment">취업자</label>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </form>


                    <%-- 참여자 검색 끝 --%>
                    <%-- 참여자 테이블 시작 --%>
                    <div class="row col-md-12 pt-3 pb-3 ms-auto me-auto mt-auto">
                        <div class="col-md-12 text-end">
                            현재 화면 참여자 <span class="text-center countSpan">X</span>명
                        </div>
                        <div class="col-md-12 text-end">
                            검색된 참여자 <span class="text-center totalCountSpan">${totalCount}</span>명
                        </div>
                        <div class="table-responsive">
                            <table class="table table-striped table-hover shadow-sm">
                                <thead class="table-dark text-white">
                                <tr class="text-center">
                                    <th class="text-center"><input type="button" class="btn btn-danger" id="delete_btn" value="삭제"></th>
                                    <th class="table-Column">
                                        <span class="column">구직번호</span>
                                    </th>
                                    <th class="table-Column">
                                        <span class="column">전담자</span>
                                    </th>
                                    <th class="table-Column">
                                        <span class="column">참여자</span>
                                    </th>
                                    <th class="table-Column">
                                        <span class="column">성별</span>
                                    </th>
                                    <th class="table-Column">
                                        <span class="column">최근상담일</span>
                                    </th>
                                    <th class="table-Column">
                                        <span class="column">상담경과일</span>
                                    </th>
                                    <th class="table-Column">
                                        <span class="column">진행단계</span>
                                    </th>
                                    <th class="table-Column">
                                        <span class="column">생년월일</span>
                                    </th>
                                    <th class="table-Column">
                                        <span class="column">초기상담일</span>
                                    </th>
                                    <th class="table-Column">
                                        <span class="column">간접고용서비스</span>
                                    </th>
                                </tr>
                                </thead>
                                <tbody class="align-middle">

                                <c:choose>
                                    <c:when test="${empty datas}">
                                        <td class="text-center" colspan="12">
                                            검색된 참여자가 없습니다.
                                        </td>
                                    </c:when>
                                    <c:when test="${not empty datas}">
                                        <c:forEach items="${datas}" var="data">
                                            <tr class="text-center">
                                                <td><label class="text-center w-100 h-100"><input type="checkbox" class="delete" name="delete" value="${data.participantJobNo}"></label></td>
                                                <td>${data.participantJobNo}</td>
                                                <td>${data.participantUserName}</td>
                                                <td><a
                                                        class="selectParticipant"
                                                        href="/participantUpdate.login">
                                                        ${data.participantPartic}
                                                </a></td>
                                                <td>${data.participantGender}</td>
                                                <td>${data.participantLastCons}</td>
                                                <td class="adventCons-td">${data.participantAdventCons}</td>
                                                <td>${data.participantProgress}</td>
                                                <td>${data.participantDob}</td>
                                                <td>${data.participantInItCons}</td>
                                                <td>${data.participantEmploymentService eq '' or data.participantEmploymentService eq null?0:data.participantEmploymentService} 회</td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                </c:choose>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <%-- 참여자 테이블 끝 --%>

                    <%-- 페이지네이션 시작 --%>
                    <div class="col-md-11 text-center ms-auto me-auto d-flex justify-content-center">
                        <ul class="pagination">
                        </ul>
                    </div>
                    <%-- 페이지네이션 끝 --%>
                </div>

            </div>

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
        //table tr 개수 지정
        let trCount = $('.align-middle tr').length;
        let trCountSpan = $('.countSpan');
        trCountSpan.text(trCount);

        // DOM 로드 후 툴팁 활성화
        <%-- 툴팁 활성화 스크립트 시작 --%>
        $('[data-bs-toggle="tooltip"]').tooltip({
            delay: {show: 0, hide: 0} // 표시와 사라짐에 딜레이를 없애즉시 나타나도록 설정
        });
        <%-- 툴팁 활성화 스크립트 끝 --%>

        <%-- 수정 버튼별 구직번호 전달 스크립트 시작 --%>

        //선택 버튼의 구직번호 불러올 함수
        function getJobNumber(currentRow) {
            // '구직번호' 열의 텍스트 추출 (구직번호가 2번째 열이라고 가정)
            // console.log('버튼 클릭, 구직번호:', currentRow.find('td').eq(1).text());
            return currentRow.find('td').eq(1).text();
        }

        //선택 버튼의 구직번호 불러올 함수
        function getParticipantName(currentRow) {
            // '참여자' 열의 텍스트 추출 (참여자가 3번째 열이라고 가정)
            // console.log('마감 버튼 클릭, 참여자 이름:', currentRow.find('td').eq(2).text());
            return currentRow.find('td').eq(2).text();
        }

        //참여자 정보 수정을 위한 버튼 배열
        const btns = [[$('.btn-basic'), 'basic'], [$('.btn-counsel'), 'counsel'], [$('.btn-employment'), 'employment']];

        //배열을 확인 / 확인된 배열의 구직 번호를 불러 오는 함수
        btns.forEach(function ($btn) {
            $btn[0].on('click', function () {
                // 현재 버튼의 부모 tr 요소 탐색
                const number = getJobNumber($(this).closest('tr'));
                // console.log('/update'+$btn[1]+'?'+$btn[1]+'JobNo=' + number)
                location.href = '/update' + $btn[1] + '.login?' + searchMainHref($btn[1] + 'JobNo=' + number);
            });
        })
        <%-- 수정 버튼별 구직번호 전달 스크립트 끝 --%>

        <%-- aTag 시작 --%>
        aHrefChange();
        <%-- a태그 href search 값 변경 시작 --%>

        function aHrefChange() {
            let selectATag = $('.selectParticipant');
            selectATag.each(function () {
                let aTag = $(this);
                const jobNo = getJobNumber(aTag.closest('tr'));
                aTag.attr('href', aTag.attr('href') + '?' + searchMainHref('basicJobNo=' + jobNo));
            })
        }

        <%-- 내림차순 오름차순 조회 함수 --%>
        /*<th className="table-Column">
            <span className="order">
                <i className="bi bi-sort-up-alt"></i>
                <i className="bi bi-sort-down"></i>
            </span>
        </th>*/
        let tableColumn = $('.table-Column');
        let columnParam = '${param.column}';
        let orderParam = '${param.order}';
        let columns = $('.column');

        if(columnParam != null && columnParam != ''){
            columns.each(function () {
                let columnValue = $(this).text();
                let form = $('#searchForm');

                if(columnValue == columnParam){
                    if(orderParam == 'desc'){
                        $(this).append('<span class="order desc"><i class="bi bi-sort-down"></i></span>');
                        $(this).find('.order').val('desc');
                        form.append('<input type="hidden" name="column" value="'+columnValue+'">');
                        form.append('<input type="hidden" name="order" value="desc">');
                    }
                    else if(orderParam == 'asc'){
                        $(this).append('<span class="order asc"><i class="bi bi-sort-up-alt"></i></span>');
                        $(this).find('.order').val('asc');
                        form.append('<input type="hidden" name="column" value="'+columnValue+'">');
                        form.append('<input type="hidden" name="order" value="asc">');
                    }
                }
            })
        }

        tableColumn.each(function () {
            $(this).on('click', function () {
                sort($(this));
            });
        });

        function removeOrder(attribute){
            attribute.find('.order').remove();
            let returnValue;
            tableColumn.each(function () {
                let columnValue = $(this).find('.column').text();
                let findValue = attribute.find('.column').text();

                if(columnValue == findValue){
                    returnValue = columnValue;
                }
                $(this).find('.order').remove();
            });
            return returnValue;
        }

        function sort(attribute){
            let orderValue = attribute.find('.order').val();
            let columnValue = removeOrder(attribute);
            console.log('sort column : [' + columnValue+'] order : [' + orderValue+']');

            if (orderValue == 'desc') {
                // attribute.append('<span class="order asc"><i class="bi bi-sort-down"></i></span>');
                // attribute.find('.order').val('asc');
                // console.log(searchMainHref('column=' + columnValue + '&order=asc'));

                location.replace('/branchParitic.login?'+sortHref('column=' + columnValue + '&order=asc'));
                // location.href = '/branchParitic.login?' + searchMainHref('column=' + columnValue + '&order=asc');
            }
            else{
                // attribute.append('<span class="order desc"><i class="bi bi-sort-up-alt"></i></span>');
                // attribute.find('.order').val('desc');
                // console.log(searchMainHref('column=' + columnValue + '&order=desc'));

                location.replace('/branchParitic.login?'+sortHref('column=' + columnValue + '&order=desc'));
                // location.href = '/branchParitic.login?' + searchMainHref('column=' + columnValue + '&order=desc');
            }
        }


        <%-- 검색 스크립트 시작 --%>
        //필터 변수
        const search_option = $('#search-Option');
        //검색어 변수
        const search = $('#search');
        //페이지 개수 변수
        const pageRows = $('#pageRows');
        //검색 버튼 변수
        const searchBtn = $('#searchBtn');

        function searchFunction() {
            $('#searchForm').submit();
        }

        searchBtn.on('click', function () {
            searchFunction();
        });

        search.on('keypress', function (e) {
            if (e.keyCode == 13) {
                searchFunction();
            }
        });


        <%-- 검색 스크립트 끝 --%>

        <%-- pagination 시작 --%>
        // page 변수
        let page = parseInt("${page}", 10) || 1; // page가 비어있거나 아닌 경우 숫자로 변환 후 기본값 1 적용
        page = (page == 0) ? 1 : page; //page가 0이라면 1로 변경
        // startButton 변수
        const startButton = parseInt("${startButton}", 10) || 1; // startButton 기본값 1
        // endButton 변수
        const endButton = parseInt("${endButton}", 10) || 1; // endButton 기본값 10
        // totalButton 변수
        const totalButton = parseInt("${totalButton}", 10) || 0; // totalButton 기본값 0
        //pagination JS 함수 호출
        paginationAddItems(page, startButton, endButton, totalButton);
        <%-- pagination 끝 --%>

        <%-- 참여자 삭제 체크 시작 --%>
        let jobNo = [];
        let participantNames = [];
        const getCheckedValues = (items) => {
            jobNo = [];
            items.each(function () {
                const value = $(this).val();
                jobNo.push(value);
            });
        };

        $('#delete_btn').on('click', () => {
            const delete_items = $('.delete:checked');
            getCheckedValues(delete_items)

            let title = "선택된 참여자를 삭제합니다."
            let text = "삭제가 완료되면 복구가 불가능합니다."
            let confirmButtonText = "삭제"
            let cancelButtonText = "취소"

            alertConfirmQuestion(title, text, confirmButtonText, cancelButtonText).then((result) => {
                if (!result) {
                    return;
                }
                $.ajax({
                    url: 'participantDelete.login',
                    type: 'POST',
                    contentType: 'application/json',
                    dataType: 'json',
                    data: JSON.stringify({basicJobNos: jobNo}),
                    success: function (data) {
                        console.log(data);
                        console.log(data.length);
                        let flag = false;
                        if (data.length > 0) {
                            alertDefaultInfo('삭제되지 않은 인원이 있습니다.' + '<br>' + data.length + ' 명 \n 구직번호 : ' + data + '<br>')
                                .then((result) => {
                                    if (result) {
                                        flag = true
                                    }
                                });
                        } else {
                            flag = true;
                        }
                        if (flag) location.reload();
                    },
                    error: function (data) {
                        alertDefaultError('오류발생', '삭제중 오류가 발생했습니다.');
                        console.log(data);
                    }
                });
            });
        });

        <%-- 참여자 삭제 체크 끝 --%>

        <%-- 마감 여부 시작 --%>
        const isCloses = $('.isClose_td');
        isCloses.on('click', function () {
            const close_span = $(this).find('span');
            const number = getJobNumber(close_span.closest('tr'));
            const participantName = getParticipantName(close_span.closest('tr'));
            let title = participantName + " 참여자 선택"
            let text = "마감 처리 하시겠습니까?"
            let confirmButtonText = "마감"
            if(close_span.text() == "마감"){
                text = "진행중으로 변경 하시겠습니까?"
                confirmButtonText = "확인"
            }
            let cancelButtonText = "취소"

            console.log(number);
            let isClose = false;
            if (close_span.hasClass('badge bg-success isClose_span')) {
                isClose = true;
            }

            alertConfirmQuestion(title, text, confirmButtonText, cancelButtonText).then((result) => {
                if (!result) {
                    return;
                }
                $.ajax({
                    url: 'ParticipantClose.login',
                    type: 'POST',
                    contentType: 'application/json',
                    dataType: 'json',
                    data: JSON.stringify({basicJobNo: number, basicClose: isClose}),
                    success: function (data) {
                        console.log(data == true);
                        if (data) {
                            close_span.removeClass('badge bg-success isClose_span').addClass('badge bg-danger isClose_span')
                            close_span.text("마감")
                        } else {
                            close_span.removeClass('badge bg-danger isClose_span').addClass('badge bg-success isClose_span')
                            close_span.text("진행중")
                        }
                    },
                    error: function (data) {

                    }
                });
            })

        });
        <%-- 마감 여부 끝 --%>

        <%-- 최근상담일 기준 색 필터 시작 --%>
        let adventCons = $('.adventCons-td');
        adventCons.each(function () {
            let adventCons = $(this).text();
            if (adventCons.length == 0 || adventCons == null || adventCons == '') {

            } else if (adventCons > 21) {
                $(this).css('background-color', 'rgba(255,58,58,0.55)');
            } else if (adventCons > 15) {
                $(this).css('background-color', 'rgba(255,249,0,0.51)');
            } else {
                $(this).css('background-color', 'rgba(0,255,0,0.51)');
            }
        });
        <%-- 최근상담일 기준 색 필터 끝 --%>

        <%-- param 값 조회, &값으로 문자열 반환 --%>

        function searchMainHref(jobno) {
            let href=jobno;
            //url param data delete & order change
            let search = window.location.search.split('&');
            search[0] = search[0].replace('?', '');
            if (search[0] != null || search[0] != undefined) {
                /*                console.log('search :['+search+']');*/
                search.forEach(function (item) {
                    /*                    console.log('item['+item+']');
                                        console.log('search['+search.indexOf(item)+']');*/
                    if (search.indexOf(item) >= 0) {
                        href += '&' + item
                        // console.log('href :['+item+']');
                    }
                });
                // href = '&'+jobno;
                // console.log('href :['+href+']');
            }
            //마지막이 &라면 지우고 href 변수에 추가
            if (href.charAt(href.length - 1) == '&') {
                href = href + 'page=1';
            }
            return href;
        }

        function sortHref(jobno) {
            let href='';
            //url param data delete & order change
            let search = deleteParam(location.href,['column','order']).split('&');
            search[0] = search[0].replace('?', '');
            if (search[0] != null || search[0] != undefined) {
                /*                console.log('search :['+search+']');*/
                search.forEach(function (item) {
                    /*                    console.log('item['+item+']');
                                        console.log('search['+search.indexOf(item)+']');*/
                    if (search.indexOf(item) >= 0) {
                        href += item+'&'
                        // console.log('href :['+item+']');
                    }
                });
                // console.log('href :['+href+']');
            }
            href = href + jobno;
            //마지막이 &라면 지우고 href 변수에 추가
            if (href.charAt(href.length - 1) == '&') {
                href = href.replace('&','');
            }

            return href;
        }


        function deleteParam(urlValue, deleteParams){
            //url에 있는 컬럼중 column, order param value 를 삭제하고 페이지 이동
            let url = new URL(urlValue);
            // console.log('deleteParam url :['+url+']');
            const searchParam = new URLSearchParams(url.search);
            // console.log('deleteParam searchParam :['+searchParam+']');

            //전달받은 삭제를 원하는 param data 값을 확인 후 삭제를 진행
            deleteParams.map((value) => {
                searchParam.delete(value);
                // console.log('deleteParam value :['+value+']');
                // console.log('deleteParam searchParam :['+searchParam+']');
            })
            // console.log('deleteParam url :['+url+']');
            // console.log('deleteParam searchParam :['+searchParam+']');
            return url.search = searchParam.toString();
        }
    });
</script>

<!-- Excel Download jQuery -->
<script>
    $(document).ready(function () {

        let excelDownloadButton = $('#excelDownload');
        excelDownloadButton.on('click', function () {
            downloadExcel();
        });

        /**
         * 엑셀 다운로드 - 간단한 방식
         */
        function downloadExcel() {
            // 로딩 메시지 표시
            showLoading('엑셀 파일을 준비하는 중입니다...');

            // 안정적인 방식으로 다운로드 시작
            try {
                // participantExcel.login은 기존에 잘 작동하던 엔드포인트
                window.location.href = '/participantExcel.login' + searchHref(1) + '&branchPage=true';
                console.log('/participantExcel.login' + searchHref(1) + '&branchPage=true');

                // 3초 후 로딩 숨기기
                setTimeout(hideLoading, 3000);
            } catch (e) {
                hideLoading();
                showError('엑셀 다운로드 중 오류가 발생했습니다. 잠시 후 다시 시도해주세요.');
                console.error('다운로드 오류:', e);
            }
        }

// 로딩 표시 함수
        function showLoading(message) {
            // 기존 로딩 제거
            hideLoading();

            // 로딩 요소 생성
            const overlay = document.createElement('div');
            overlay.id = 'loading-overlay';
            overlay.style.cssText = `
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        display: flex;
        justify-content: center;
        align-items: center;
        z-index: 9999;
    `;

            const loadingBox = document.createElement('div');
            loadingBox.style.cssText = `
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        text-align: center;
        max-width: 80%;
    `;

            const spinner = document.createElement('div');
            spinner.style.cssText = `
        border: 4px solid #f3f3f3;
        border-top: 4px solid #3498db;
        border-radius: 50%;
        width: 40px;
        height: 40px;
        margin: 0 auto 15px;
        animation: spin 1s linear infinite;
    `;

            // 애니메이션 정의
            const style = document.createElement('style');
            style.textContent = `
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
    `;
            document.head.appendChild(style);

            const messageElem = document.createElement('p');
            messageElem.style.margin = '0';
            messageElem.textContent = message || '처리 중...';

            loadingBox.appendChild(spinner);
            loadingBox.appendChild(messageElem);
            overlay.appendChild(loadingBox);
            document.body.appendChild(overlay);
        }

// 로딩 숨기기 함수
        function hideLoading() {
            const overlay = document.getElementById('loading-overlay');
            if (overlay) {
                document.body.removeChild(overlay);
            }
        }

// 오류 메시지 표시 함수
        function showError(message) {
            if (typeof Swal !== 'undefined') {
                Swal.fire({
                    icon: 'error',
                    title: '오류',
                    text: message
                });
            } else {
                alert(message);
            }
        }

    });
</script>

</html>
