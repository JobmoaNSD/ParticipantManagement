<%--
  Created by IntelliJ IDEA.
  User: no1fc
  Date: 24. 12. 30.
  Time: 오후 5:16
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

    <!-- sweetalert2 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
    <script src="js/sweetAlert.js"></script>

</head>
<body class="layout-fixed sidebar-expand-lg bg-body-tertiary">

<!--begin::App Wrapper-->
<div class="app-wrapper">
    <!--begin:::App Gnb-->
    <mytag:gnb gnb_main_header="상담관리" gnb_sub_header="참여자 조회"/>
    <!--end:::App Gnb-->

    <!--begin:::App main content-->
    <!--begin::App Main-->
    <main class="app-main">
        <!--begin::App Content-->
        <div class="app-content">
            <div class="container-fluid">
                <!-- 필요 본문 내용은 이쪽에 만들어 주시면 됩니다. -->

                <div class="row col-md-11 pt-5 me-auto ms-auto">
                    <div class="col-md-12 text-center">
                        <h3>참여자 조회</h3>
                    </div>
                    <%-- 참여자 검색 시작 --%>
                    <div class="row col-md-12 pt-3 pb-3 ms-auto me-auto" >
                        <!-- 검색 조건 선택 -->
                        <div class="col-md-2 ms-auto">
                            <select
                                    class="form-select shadow-sm"
                                    name="searchOption"
                                    id="search-Option"
                            >
                                <option ${param.searchOption.equals("참여자") ? 'selected' : ''} value="참여자">참여자</option>
                                <option ${param.searchOption.equals("구직번호") ? 'selected' : ''} value="구직번호">구직번호</option>
                                <option ${param.searchOption.equals("진행단계") ? 'selected' : ''} value="진행단계">진행단계</option>
                            </select>
                        </div>
                        <!-- 검색 입력 -->
                        <div class="col-md-7">
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
                            검색
                        </div>
                        <div class="col-md-1 ps-1 pe-1 text-center me-auto">
                            <select class="form-select shadow-sm" name="pageRows" id="pageRows">
                                <option ${param.pageRows.equals("10") ? 'selected' : ''} value="10">10</option>
                                <option ${param.pageRows.equals("20") ? 'selected' : ''} value="20">20</option>
                                <option ${param.pageRows.equals("30") ? 'selected' : ''} value="30">30</option>
                                <option ${param.pageRows.equals("40") ? 'selected' : ''} value="40">40</option>
                                <option ${param.pageRows.equals("50") ? 'selected' : ''} value="50">50</option>
                            </select>
                        </div>
                    </div>
                    <%-- 참여자 검색 끝 --%>
                    <%-- 참여자 테이블 시작 --%>
                    <div class="row col-md-12 pt-3 pb-3 ms-auto me-auto mt-auto">
                        <div class="table-responsive">
                            <table class="table table-striped table-hover shadow-sm">
                                <thead class="table-dark text-white">
                                <tr class="text-center">
                                    <th class="text-center"><input type="button" class="btn btn-danger" id="delete_btn" value="삭제"></th>
                                    <th>구직번호</th>
                                    <th>참여자</th>
                                    <th>성별</th>
                                    <th>최근상담일</th>
                                    <th>진행단계</th>
                                    <th>생년월일</th>
                                    <th>등록일</th>
                                    <th>마감</th>
                                    <th>수정</th>
                                </tr>
                                </thead>
                                <tbody class="align-middle">

                                <c:choose>
                                    <c:when test="${empty datas}">
                                        <td class="text-center" colspan="10">
                                            신규 참여자를 등록해주세요.
                                        </td>
                                    </c:when>
                                    <c:when test="${not empty datas}">
                                        <c:forEach items="${datas}" var="data">
                                            <tr class="text-center">
                                                <td><label class="text-center w-100 h-100"><input type="checkbox" class="delete" name="delete" value="${data.participantJobNo}"></label></td>
                                                <td>${data.participantJobNo}</td>
                                                <td><a href="/participantUpdate.login?basicJobNo=${data.participantJobNo}">${data.participantPartic}</a></td>
                                                <td>${data.participantGender}</td>
                                                <td>${data.participantLastCons}</td>
                                                <td>${data.participantProgress}</td>
                                                <td>${data.participantDob}</td>
                                                <td>${data.participantRegDate}</td>
                                                <td class="text-center isClose_td">
                                                    <span class="badge ${data.participantClose ? 'bg-danger' : 'bg-success'} isClose_span">
                                                            ${data.participantClose ? '마감' : '진행중'}
                                                    </span>
                                                </td>
                                                <td class="text-center">
                                                    <div class="btn-group" role="group">
                                                        <button type="button" class="btn btn-primary btn-sm shadow-sm btn-basic" data-bs-toggle="tooltip" data-popper-placement="top" title="기본정보 수정">
                                                            <i class="bi bi-pencil"></i> 기본
                                                        </button>
                                                        <button type="button" class="btn btn-info btn-sm shadow-sm mx-1 btn-counsel" data-bs-toggle="tooltip" data-bs-placement="top" title="상담정보 수정">
                                                            <i class="bi bi-chat"></i> 상담
                                                        </button>
                                                        <button type="button" class="btn btn-success btn-sm shadow-sm btn-employment" data-bs-toggle="tooltip" data-bs-placement="top" title="취업정보 수정">
                                                            <i class="bi bi-briefcase"></i> 취업
                                                        </button>
                                                    </div>
                                                </td>
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

        //참여자 정보 수정을 위한 버튼 배열
        const btns = [[$('.btn-basic'), 'basic'], [$('.btn-counsel'), 'counsel'], [$('.btn-employment'), 'employment']];

        //배열을 확인 / 확인된 배열의 구직 번호를 불러 오는 함수
        btns.forEach(function ($btn) {
            $btn[0].on('click', function () {
                // 현재 버튼의 부모 tr 요소 탐색
                const number = getJobNumber($(this).closest('tr'));
                // console.log('/update'+$btn[1]+'?'+$btn[1]+'JobNo=' + number)
                location.href = '/update' + $btn[1] + '.login?' + $btn[1] + 'JobNo=' + number;
            });
        })
        <%-- 수정 버튼별 구직번호 전달 스크립트 끝 --%>

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
            if (search.val() == ''){
                alert("검색어를 입력해주세요.");
                return;
            }
            location.href = '/participant.login?page=1&searchOption=' + search_option.val() + '&search=' + search.val() + '&pageRows=' + pageRows.val();
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
                                if(result){
                                    flag = true
                                }
                            });
                    }
                    else{
                        flag = true;
                    }
                    if (flag) location.reload();
                },
                error: function (data) {
                    alertDefaultError('오류발생','삭제중 오류가 발생했습니다.');
                    console.log(data);
                }
            });
        });

        <%-- 참여자 삭제 체크 끝 --%>

        <%-- 마감 여부 시작 --%>
        const isCloses = $('.isClose_td');
            isCloses.on('click', function () {
                const close_span = $(this).find('span');
                const number = getJobNumber(close_span.closest('tr'));
                console.log(number);
                let isClose = false;
                if(close_span.hasClass('badge bg-success isClose_span')){
                    isClose = true;
                }

                $.ajax({
                    url: 'ParticipantClose.login',
                    type: 'POST',
                    contentType: 'application/json',
                    dataType: 'json',
                    data: JSON.stringify({basicJobNo: number, basicClose: isClose}),
                    success: function (data) {
                        console.log(data == true);
                        if(data){
                            close_span.removeClass('badge bg-success isClose_span').addClass('badge bg-danger isClose_span')
                            close_span.text("마감")
                        }
                        else{
                            close_span.removeClass('badge bg-danger isClose_span').addClass('badge bg-success isClose_span')
                            close_span.text("진행중")
                        }
                    },
                    error: function (data) {

                    }
                });
            });
        <%-- 마감 여부 끝 --%>
    });
</script>

</html>
