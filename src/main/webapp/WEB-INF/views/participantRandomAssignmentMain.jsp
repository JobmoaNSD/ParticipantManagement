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
                    <div class="row col-md-6">
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
                            <button id="save-button" class="save-button"><i class="bi bi-save-fill"></i> 저장</button>
                            <button id="varification-button" class="varification-button"><i class="bi bi-save-fill"></i> 데이터 검증</button>

                            <div class="response-text-div pb-2">경고 내용 출력 부분</div>
                        </div>
                    </div>

                    <div class="row body-content col-md-6">
                        <div class="counselor-container col-md-12">
                            <button class="btn btn-secondary float-end" id="excludeBtn">선택 상담사 배정 제외</button>
                        </div>
                        <div class="counselor-container col-md-12 overflow-y-scroll" style="max-height: 200px;">
                            <table class="table table-striped text-center" id="assign-count-table">
                                <thead id="assign-count-table-header">
                                    <tr>
                                        <th>상담사ID</th>
                                        <th>상담사</th>
                                        <th>총 (배정)진행자</th>
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
                        <div class="csvData" id="csvData">
                            <table class="table table-striped">
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
         * @type {Object.<string, {name:String, total:number, year:number, youth: number, middleAged:number, specialGroup:number ,current: number, max: number}>}
         * @property {String} name - 상담사 성명
         * @property {number} total - 총 배정 인원 수
         * @property {number} year - 2025년도 배정 인원 수
         * @property {number} youth - 청년 배정 인원 수
         * @property {number} middleAged - 중장년 배정 인원 수
         * @property {number} specialGroup - 특정 계층 배정 인원 수
         * @property {number} current - 현재 배정된 인원 수
         * @property {number} max - 최대 배정 가능 인원 수
         */
        const currentCounselor = ${assignData};
            /*{
            'counselor001': {name: "홍길동1", total:85, year:25, youth: 20, middleAged:35, specialGroup:5, current: 0, max: 100},
            'counselor002': {name: "홍길동2", total:92, year:28, youth: 22, middleAged:38, specialGroup:4, current: 0, max: 100},
            'counselor003': {name: "홍길동3", total:78, year:22, youth: 18, middleAged:32, specialGroup:6, current: 0, max: 100},
            'counselor004': {name: "홍길동4", total:96, year:30, youth: 24, middleAged:40, specialGroup:2, current: 0, max: 100},
            'counselor005': {name: "홍길동5", total:73, year:20, youth: 16, middleAged:28, specialGroup:9, current: 0, max: 100},
            'counselor006': {name: "홍길동6", total:88, year:26, youth: 21, middleAged:36, specialGroup:5, current: 0, max: 100},
            'counselor007': {name: "홍길동7", total:91, year:27, youth: 23, middleAged:37, specialGroup:4, current: 0, max: 100},
            'counselor008': {name: "홍길동8", total:82, year:24, youth: 19, middleAged:33, specialGroup:6, current: 0, max: 100},
            'counselor009': {name: "홍길동9", total:75, year:21, youth: 17, middleAged:29, specialGroup:8, current: 0, max: 100},
            'counselor010': {name: "홍길동10", total:90, year:29, youth: 25, middleAged:39, specialGroup:3, current: 0, max: 100}
        };*/

        /**
         * 실시간 상담사 배정 현황 (작업 데이터)
         * - 랜덤 배정 과정에서 실시간으로 업데이트
         * - 배정 알고리즘의 기준 데이터
         *
         * @type {Object.<string, {name:String, total:number, year:number, youth: number, middleAged:number, specialGroup:number ,current: number, max: number}>}
         */
        let counselorAssignments = ${assignData};
        /*{
            'counselor001': {name: "홍길동1", total:85, year:25, youth: 20, middleAged:35, specialGroup:5, current: 0, max: 100},
            'counselor002': {name: "홍길동2", total:92, year:28, youth: 22, middleAged:38, specialGroup:4, current: 0, max: 100},
            'counselor003': {name: "홍길동3", total:78, year:22, youth: 18, middleAged:32, specialGroup:6, current: 0, max: 100},
            'counselor004': {name: "홍길동4", total:96, year:30, youth: 24, middleAged:40, specialGroup:2, current: 0, max: 100},
            'counselor005': {name: "홍길동5", total:73, year:20, youth: 16, middleAged:28, specialGroup:9, current: 0, max: 100},
            'counselor006': {name: "홍길동6", total:88, year:26, youth: 21, middleAged:36, specialGroup:5, current: 0, max: 100},
            'counselor007': {name: "홍길동7", total:91, year:27, youth: 23, middleAged:37, specialGroup:4, current: 0, max: 100},
            'counselor008': {name: "홍길동8", total:82, year:24, youth: 19, middleAged:33, specialGroup:6, current: 0, max: 100},
            'counselor009': {name: "홍길동9", total:75, year:21, youth: 17, middleAged:29, specialGroup:8, current: 0, max: 100},
            'counselor010': {name: "홍길동10", total:90, year:29, youth: 25, middleAged:39, specialGroup:3, current: 0, max: 100}
        };*/


        /**
         * 랜덤 배정을 제외할 인원을 추가해서
         * 랜덤 배정이 불가능하도록 등록
         *
         * @type {Object.<string, boolean>}
         */
        let excludedPersonnel = {
        }

        /**
         * 참여자 배정 현황 시각화
         *  - 각 전담자에게 랜덤하게 배정하기 전에 시각화를 진행
         */
        assignTable(counselorAssignments,excludedPersonnel);

        /**
         * 배정 제외 상담사 지정
         *  - 선택된 상담사에 대해 배정을 제외하도록 설정
         */
        $("#excludeBtn").on("click", function () {
            excludeCounselor(excludedPersonnel);
        });

        // ================================
        // 3. 이벤트 리스너 등록
        // ================================

        // 파일 선택 시 CSV 파일 읽기 실행
        // $fileInput.on('change', readCsvFile);
        $fileInput.on('change', function (e) {
            // console.log(e.target.files[0]);
            // console.log(e);
            if(!readCsvFile(e)){
                resetFunction();
            }
            else{
                jobPlacementList.splice(0);
                validationErrors.splice(0);
                arrayData.splice(0);
                verificationFlag = false;
            }
        });

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
            Object.entries(counselorAssignments).forEach(([key, value]) => {
                counselorAssignments[key].current = 0;
            })
            /**
             * 랜덤 배정 실행 과정:
             * 1. randomTableData() 함수 호출
             * 2. 성공 시: 배정 완료
             * 3. 실패 시: 오류 메시지 표시 및 버튼 상태 변경
             */
            if (!randomTableData(currentCounselor,counselorAssignments,excludedPersonnel)) {
                const responseTextDiv = $('.response-text-div');
                responseTextDiv.append('<br><small>오류 : 새로고침으로 참여자 진행인원을 초기화 해주세요.</small>');
                $randomButton.hide();  // 랜덤 배정 버튼 숨김
                $resetButton.show();   // 초기화 버튼 표시
            }
        });

        // 초기화 버튼 - 모든 상태를 원래대로 복원
        $resetButton.on("click", function () {
            resetFunction();
        });

        function resetFunction(){
            $randomButton.show();                           // 랜덤 배정 버튼 표시
            $resetButton.hide();                            // 초기화 버튼 숨김
            counselorAssignments = {}                     // 배정 현황 정보 초기화(삭제)
            counselorAssignments = currentCounselor;       // 배정 현황 초기화(원본 추가)
            $("#csv-data").empty();                         // 테이블 데이터 삭제
            $("#file-input").val("");                       // 파일 데이터 초기화
            $(".response-text-div").empty();                // 응답 메시지 초기화
            verificationFlag = false;                       // 데이터 검증 초기화
            assignTable(counselorAssignments,excludedPersonnel); // 배정 현황 시각 자료 초기화
        }

        $('#save-button').on("click", function () {
            sendAsJobPlacementDTO();
        })


        /**
         * jobPlacementList csv 파일 참여자 정보
         * validationErrors 에러 로그
         * arrayData 오류난 PK 번호 확인
         * verificationFlag 검증 완료 여부 확인
         * @type {*[]}
         */
        const jobPlacementList = [];
        const validationErrors = [];
        let arrayData = [];
        let verificationFlag = false;

        /**
         * JobPlacementDTO에 맞춘 데이터 구조로 변환
         */
        function convertToJobPlacementDTO(participantData) {
            return {
                pkNumber:participantData.pkNumber, // PK 번호
                counselor: participantData.counselor,           // 상담사
                participant: participantData.participant,       // 참여자
                birthDate: participantData.birthDate,          // 생년월일
                gender: participantData.gender,                // 성별
                specificClass: participantData.specificClass,  // 특정계층
                // 추가 필드들은 기본값 또는 빈 값으로 설정
                counselorBranch: '',
                counselorId: participantData.counselor, //상담사 아이디
                address: '',
                schoolName: '',
                major: '',
                desiredJob: '',
                career: '',
                age: 0,
                certificate: '',
                certificates: [],
                desiredSalary: '',
                email: '',
                uniqueNumber: '',
                // CSV에서 추출한 추가 정보
                recruitmentPath: participantData.recruitmentPath, // 모집경로
                participationType: participantData.participationType, // 참여유형
                progressStage: participantData.progressStage // 진행단계
            };
        }

        function validateParticipantData(participantData) {
            const errors = [];

            if (!participantData.counselor) {
                errors.push('전담자가 배정되지 않았습니다.');
            }

            if (!participantData.participant) {
                errors.push('참여자 성명이 없습니다.');
            }

            if (!participantData.birthDate) {
                errors.push('생년월일이 없습니다.');
            }
            else{
                let birthDate = participantData.birthDate;
                let response = validateBirthDate(birthDate);
                if (!response.isValid){
                    errors.push(response.message);
                }
            }

            if (!participantData.gender) {
                errors.push('성별이 없습니다.');
            }
            else{
                const gender = participantData.gender;
                if (gender != '남' && gender != '여'){
                    errors.push('등록되지 않은 성별이 들어가 있습니다.')
                }
            }

            if (!participantData.recruitmentPath) {
                errors.push("모집경로가 없습니다.")
            }
            else{
                const recruitmentPath = participantData.recruitmentPath;
                const recruitmentPathArray = ['센터배정','대학','고교','훈련기관','자체모집','이관'];
                let flag = false;
                for(let path of recruitmentPathArray){
                    if(path === recruitmentPath){
                        flag = true;
                        break;
                    }
                }

                if(!flag) errors.push("모집경로를 변경해주세요. ('센터배정','대학','고교','훈련기관','자체모집','이관')")

            }

            if(!participantData.participationType){
                errors.push('참여유형이 없습니다.');
            }
            else{
                const type = participantData.participationType;
                if (type != "1" && type != "2"){
                    errors.push("유형을 확인해주세요. ('1','2')")
                }
            }

            if(!participantData.progressStage){
                errors.push('진행단계가 없습니다.');
            }
            else{
                const stage = participantData.progressStage;
                const stageArray = ['IAP 전','IAP 후','미고보','고보일반','등록창업','미등록창업','미취업사후관리','미취업사후종료','유예','취소','이관','중단'];
                let flag = false;
                for(let path of stageArray){
                    if(path === stage){
                        flag = true;
                        break;
                    }
                }
                if(!flag) errors.push("진행단계를 변경해주세요. ('IAP 전','IAP 후','미고보','고보일반','등록창업','미등록창업','미취업사후관리','미취업사후종료','유예','취소','이관','중단')")
            }

            if(!participantData.specificClass){
                errors.push('특정계층 설정이 없습니다.');
            }

            return errors;
        }

        /**
         * Table내에 있는 데이터 배열 전환 및 잘못된 값에 대한 내용 저장용 배열 등록 함수
         *
         */
        function dataInsertFunction(){
            jobPlacementList.splice(0);
            validationErrors.splice(0);
            arrayData.splice(0);

            try{
                $('.csv-data-tr').each(function(index) {
                    const $row = $(this);
                    const $cells = $row.find('td');

                    const participantData = {
                        pkNumber: $cells.eq(0).text().trim(), //PK 번호
                        counselor: $cells.eq(1).text().trim(), //상담사 성명
                        participant: $cells.eq(2).text().trim(), //참여자 성명
                        birthDate: $cells.eq(3).text().trim(), // 참여자 생년월일
                        gender: $cells.eq(4).text().trim(), // 참여자 성별
                        recruitmentPath: $cells.eq(5).text().trim(), //참여자 모집경로
                        participationType: $cells.eq(6).text().trim(), //참여유형
                        progressStage: $cells.eq(7).text().trim(), //진행단계
                        specificClass: $cells.eq(8).text().trim() //특정계층
                    };

                    // 데이터 검증
                    const errors = validateParticipantData(participantData);
                    if (errors.length > 0) {
                        validationErrors.push('행 '+(index+1)+': '+errors.join(', '));
                        arrayData.push(index+1);
                    } else {
                        const jobPlacementDTO = convertToJobPlacementDTO(participantData);
                        jobPlacementList.push(jobPlacementDTO);
                    }
                });
                console.log("errors : "+validationErrors.join('\n'));

                //배열에 값이 있는지 여부를 전달한다.
                verificationFlag = jobPlacementList.length > 0;
                if(!verificationFlag){
                    alert("데이터가 없거나 모든 데이터에 문제가 발생했습니다.")
                }
            }
            catch(e){
                //오류 발생시 내용 false를 반환하여 더 이상 진행이 불가능하도록 수정
                verificationFlag = false;
            }
        }

        $("#varification-button").on("click", function () {
            dataInsertFunction();
            insertCheck(arrayData);

            if(!verificationFlag){
                alert("데이터 검증 실패")
            }
            else{
                alert("데이터 검증 완료")
            }
        })


        /**
         * DTO 형식으로 데이터 전송
         */
        function sendAsJobPlacementDTO() {

            if(!verificationFlag){
                //데이터 추가 함수
                //dataInsertFunction();
                console.log("verificationFlag : "+verificationFlag);
                alert("데이터 검증 완료 후 진행해주세요.");
                return;
            }

            if(validationErrors.length > 0){
                alert("다음 정보를 확인 후 저장해주세요.\n"+validationErrors.join('\n'));
                return;
            }

            // console.log("verificationFlag 외부 실행 : "+verificationFlag);
            //
            // console.log("jobPlacementList:"+JSON.stringify(jobPlacementList));
            // console.log("validationErrors:"+JSON.stringify(validationErrors));

            let count = 0 ;
            let responseTimer = setInterval(function() {count++},1000)

            // 백엔드로 전송
            $.ajax({
                url: '/api/pra.login',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(jobPlacementList),
                success: function(response) {
                    if (jobPlacementList.length > 0){
                        alert(count+'초 동안 '+jobPlacementList.length+'명의 참여자 정보가 저장되었습니다.');
                        clearInterval(responseTimer);
                        insertCheck(arrayData);
                    }
                    else{
                        alert(count+'초 동안 응답 참여자 등록에 실패했습니다.');
                    }
                    // console.log("response:["+response+"]");
                    verificationFlag = false;
                },
                error: function(xhr, status, error) {
                    alert('저장 중 오류가 발생했습니다.');
                    console.error('Error:', error);
                    verificationFlag = false;
                }
            });
        }

        function insertCheck(responseData){
            const $rows = $('.csv-data-tr');
            $rows.each(function(index) {
                const $row = $(this);
                const $cells = $row.find('td');
                let currentData = $cells.eq(0).text().trim();
                let flag = false;

                for (let data of responseData){
                    flag = currentData == data
                    // console.log("flag:"+data);
                    if(flag) break;
                }
                // console.log("flag:"+flag);

                if(!flag){
                    $cells.eq(0).css('background-color', 'white');
                }
                else{
                    $cells.eq(0).css('background-color', 'red');
                    // console.log("error:"+currentData);

                }
            });
        }

    });
</script>
</html>
