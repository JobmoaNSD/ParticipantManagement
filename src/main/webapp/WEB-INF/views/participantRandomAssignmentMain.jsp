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

        .save-button-label{
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
                                        <li>파일 인코딩은 UTF-8로 저장해주세요.</li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="row">
                    <div class="row body-content col-md-12">
                        <div class="file-input-container col-md-12">
                            <label for="file-input" class="file-button-label"><i class="bi bi-filetype-csv"></i> 파일 찾기</label>
                            <input type="file" id="file-input" class="file-input" accept=".csv">
                            <label class="random-button-label"><i class="bi bi-shuffle"></i> 랜덤 배정</label>
                            <label class="reset-button-label"><i class="bi bi-arrow-counterclockwise"></i> 초기화</label>
                            <%-- TODO 저장 기능 제작해야함 --%>
                            <button class="save-button-label"><i class="bi bi-save-fill"></i> 저장</button>

                            <div class="response-text-div pb-2">경고 내용 출력 부분</div>
                        </div>
                    </div>
                    <div class="content-body col-md-12">
                        <div class="csvData" id="csvData">

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


<!-- CSV 파일 확인 후 테이블 생성 스크립트 -->
<!-- 필요한 클래스: file-text, file-button-label, file-input -->
<script>

    /**
     * 상담사 랜덤 배정 시스템
     *
     * 주요 기능:
     * - CSV 파일 업로드 및 테이블 생성
     * - 상담사별 균등 배정 알고리즘
     * - 배정 상태 추적 및 관리
     * - 오류 처리 및 사용자 알림
     *
     * @author 남상도
     * @version 1.0.0
     * @since 2025-07-18
     */

    $(document).ready(function () {
        // ================================
        // 1. DOM 요소 캐싱 및 초기화
        // ================================

        /** @type {jQuery} 파일 입력 요소 */
        const $fileInput = $('.file-input');
        /** @type {jQuery} 랜덤 배정 버튼 */
        const $randomButton = $(".random-button-label");
        /** @type {jQuery} 초기화 버튼 */
        const $resetButton = $(".reset-button-label");
        /** @type {jQuery} 도움말 버튼 */
        const $helpButton = $('#helpButton');
        /** @type {jQuery} 도움말 텍스트 영역 */
        const $helpText = $('#helpText');

        // ================================
        // 2. 상담사 배정 데이터 구조
        // ================================

        /**
         * 상담사 초기 배정 현황 (원본 데이터)
         * - 시스템 시작 시의 기준 상태
         * - 초기화 시 복원 기준점으로 사용
         *
         * @type {Object.<string, {current: number, max: number}>}
         * @property {number} current - 현재 배정된 인원 수
         * @property {number} max - 최대 배정 가능 인원 수
         */
        const currentCounselor = {
            'test1': {current: 20, max: 100},  // 상담사1: 20/100명
            'test2': {current: 5, max: 100},   // 상담사2: 5/100명
            'test3': {current: 10, max: 100},  // 상담사3: 10/100명
            'test4': {current: 4, max: 100}    // 상담사4: 4/100명
        };

        /**
         * 실시간 상담사 배정 현황 (작업 데이터)
         * - 랜덤 배정 과정에서 실시간으로 업데이트
         * - 배정 알고리즘의 기준 데이터
         *
         * @type {Object.<string, {current: number, max: number}>}
         */
        let counselorAssignments = {
            'test1': {current: 20, max: 100},
            'test2': {current: 5, max: 100},
            'test3': {current: 10, max: 100},
            'test4': {current: 4, max: 100}
        };

        // ================================
        // 3. 이벤트 리스너 등록
        // ================================

        // 파일 선택 시 CSV 파일 읽기 실행
        $fileInput.on('change', readCsvFile);

        // 도움말 토글 기능
        $helpButton.on('click', function () {
            if ($helpText.css("display") === "none") {
                $helpText.show();
            } else {
                $helpText.hide();
            }
        });

        // 랜덤 배정 실행 버튼
        $randomButton.on("click", function () {
            /**
             * 랜덤 배정 실행 과정:
             * 1. randomTableData() 함수 호출
             * 2. 성공 시: 배정 완료
             * 3. 실패 시: 오류 메시지 표시 및 버튼 상태 변경
             */
            if (!randomTableData()) {
                const responseTextDiv = $('.response-text-div');
                responseTextDiv.append('<br><small>오류 : 새로고침으로 참여자 진행인원을 초기화 해주세요.</small>');
                $randomButton.hide();  // 랜덤 배정 버튼 숨김
                $resetButton.show();   // 초기화 버튼 표시
            }
        });

        // 초기화 버튼 - 모든 상태를 원래대로 복원
        $resetButton.on("click", function () {
            $randomButton.show();                           // 랜덤 배정 버튼 표시
            $resetButton.hide();                            // 초기화 버튼 숨김
            counselorAssignments = currentCounselor;        // 배정 현황 초기화
            $("#csvData").empty();                          // 테이블 데이터 삭제
            $(".response-text-div").empty();                // 응답 메시지 초기화
        });

        // ================================
        // 4. 핵심 비즈니스 로직 함수들
        // ================================

        /**
         * 테이블의 모든 행에 대해 상담사 랜덤 배정을 실행하는 메인 함수
         *
         * 동작 과정:
         * 1. CSV 데이터 테이블의 모든 행(.csv-data-tr) 탐색
         * 2. 각 행마다 dataAssignment() 함수 호출하여 상담사 배정
         * 3. 배정 결과를 해당 행의 입력 필드에 설정
         * 4. 배정 실패 시 전체 프로세스 중단
         *
         * @returns {boolean} 배정 성공 여부
         * - true: 모든 참여자에게 상담사 배정 완료
         * - false: 배정 가능한 상담사 부족으로 실패
         */
        function randomTableData() {
            const $randomTr = $(".csv-data-tr");  // 데이터 행 선택
            let flag = true;                       // 전체 배정 성공 플래그
            let selectedCounselor = null;          // 선택된 상담사 임시 저장

            // 각 참여자 행에 대해 상담사 배정 실행
            $randomTr.each(function () {
                selectedCounselor = dataAssignment();  // 상담사 배정 함수 호출

                // 배정 실패 시 플래그 설정
                if (selectedCounselor == null) {
                    flag = false;
                }

                // 배정 결과를 입력 필드에 설정
                $(this).find("td").find("input").val(selectedCounselor);
            });

            return flag;  // 전체 배정 성공 여부 반환
        }

        /**
         * 균등 배정 알고리즘을 통한 상담사 선택 함수
         *
         * 알고리즘 단계:
         * 1. 배정 가능한 상담사 필터링 (current < max)
         * 2. 가장 적게 배정받은 상담사들 식별
         * 3. 동일 조건 상담사들 중 랜덤 선택
         * 4. 선택된 상담사의 배정 인원 증가
         *
         * @returns {string|null} 선택된 상담사 ID 또는 null (배정 불가)
         *
         * @example
         * // 상담사별 현재 배정 인원이 [20, 5, 10, 4]인 경우
         * // 최소값 4를 가진 'test4'가 우선 선택됨
         * const counselor = dataAssignment(); // 'test4' 반환
         */
        function dataAssignment() {
            // 1단계: 배정 가능한 상담사 필터링
            const availableCounselors = Object.keys(counselorAssignments).filter(
                counselor => counselorAssignments[counselor].current < counselorAssignments[counselor].max
            );

            // 2단계: 배정 가능한 상담사가 없는 경우 처리
            if (availableCounselors.length === 0) {
                console.log("모든 상담사가 최대 배정 인원에 도달했습니다.");
                return null;
            }

            // 3단계: 가장 적게 배정받은 상담사들 찾기
            const minAssignments = Math.min(...availableCounselors.map(
                counselor => counselorAssignments[counselor].current
            ));

            // 4단계: 최소 배정 인원을 가진 상담사들 필터링
            const priorityCounselors = availableCounselors.filter(
                counselor => counselorAssignments[counselor].current === minAssignments
            );

            // 5단계: 우선순위 상담사 중에서 랜덤 선택
            const randomIndex = Math.floor(Math.random() * priorityCounselors.length);
            const selectedCounselor = priorityCounselors[randomIndex];

            // 6단계: 선택된 상담사의 배정 인원 증가
            counselorAssignments[selectedCounselor].current++;

            // 7단계: 디버깅용 로그 출력
            console.log('선택된 상담사: ' + selectedCounselor);
            console.log('현재 배정 현황: ', counselorAssignments);

            return selectedCounselor;
        }
    });
</script>
</html>
