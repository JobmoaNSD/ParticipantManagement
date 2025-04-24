<%--
  Created by IntelliJ IDEA.
  User: no1fc
  Date: 25. 4. 15.
  Time: 오전 9:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="mytag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        /*로딩바용 style*/
        .loader{
            width: 24px;
            height: 24px;
            border: 4px solid #4A90E2;
            border-top: 4px solid transparent;
            border-radius: 50%;
            animation: spin 1s linear infinite;
        }
        @keyframes spin {
            from {
                transform: rotate(0deg);
            }
            to {
                transform: rotate(360deg);
            }
        }
    </style>
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
            <div class="container-fluid pt-1 pb-1 vstack">
                <!-- 필요 본문 내용은 이쪽에 만들어 주시면 됩니다. -->
                <c:if test="${IS_BRANCH_MANAGER || IS_MANAGER}">
                    <label  for="excludeRadio" style="max-width: 250px; font-size: 15px;">1년 미만 근로자</label>
                    <div class="btn-group" style="max-width: 250px;" role="group" aria-label="Basic radio toggle button group">
                        <input type="radio" class="btn-check" name="btnradio" id="excludeRadio" autocomplete="off" value="false" checked>
                        <label class="btn btn-outline-primary" for="excludeRadio" style="font-size: 10px;">미포함<br>(컨설턴트 평균 비교)</label>

                        <input type="radio" class="btn-check" name="btnradio" id="includeRadio" autocomplete="off" value="true">
                        <label class="btn btn-outline-primary" for="includeRadio" style="font-size: 10px;">포함<br>(고용부 평가 기준)</label>
                    </div>
                </c:if>

                <div id="loadingScoreChartDiv" class="d-flex justify-content-center align-items-center"></div>
                <div id="scoreChartDiv">

                    <div id="scoreChart">

                    </div>
                </div>

                <div id="loadingDiv" class="d-flex justify-content-center align-items-center">

                </div>

                <div class="row">
                    <div id="totalScore" class=" col-md-4"></div>
                    <div id="employmentScore" class=" col-md-4"></div>
                    <div id="placementScore" class=" col-md-4"></div>
                </div>
                <div class="row">
                    <div id="retentionScore" class=" col-md-4"></div>
                    <div id="earlyEmploymentScore" class=" col-md-4"></div>
                    <div id="betterJobScore" class=" col-md-4"></div>
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

<script>


    // 초기 데이터 정의
    const initData = [
        {name:"총점", data:0.01},
        {name:"남부", data:0.1},
        {name:"서부", data:0.2}
    ];

    let changJson = {
        name:[], data:[]
    }

    // 데이터 확인 및 차트 렌더링
    let responseData = ${branchAvg}; // JSP에서 전달된 데이터

    // 첫 번째 차트 - 점수 현황
    function renderScoreChart(data) {
        const options = {
            series: [{
                name: "평균",
                data: data.data
            }],
            chart: {
                type: 'bar',
                height: 350,
                events: {
                    dataPointSelection: function(event, chartContext, config) { // click 대신 dataPointSelection 사용
                        const clickIndex = config.dataPointIndex;
                        const branchName = data.name[clickIndex];
                        if(clickIndex !== 0){
                            // console.log(clickIndex);
                            // console.log(branchName);
                            fetchData(branchName);
                        }
                    }
                }
            },
            plotOptions: {
                bar: {
                    horizontal: false,
                    columnWidth: '55%',
                    dataLabels: {
                        position: 'top'
                    }
                },
            },
            dataLabels: {
                enabled: true,
                formatter: function(val) {
                    return val.toFixed(2);
                }
            },
            xaxis: {
                categories: data.name,
                position: 'bottom'
            },
            yaxis:{
                max: 90,
                min: 0,            // 최소값 설정
                tickAmount: 5,     // 눈금 간격 설정
                labels: {
                    formatter: function(val) {
                        return val.toFixed(0);
                    }
                }
            }
        };

        const chart = new ApexCharts(document.querySelector("#scoreChart"), options);
        chart.render();
    }

    //두 번째 차트 사용자별 점수
    // 각 차트에 표시할 데이터를 정의하는 함수
    function getChartOptions(chartIndex, title, maxScore, jsonValue, jsonScore, jsonTopScore) {
        // 각 차트의 제목과 데이터 설정
        let chartTitle = title[chartIndex];
        let seriesData = [{
            name: title[chartIndex]+' 점수',
            data: selectData[jsonValue[chartIndex]][jsonScore[chartIndex]]
        }];
        let yaxisAnnotation = [{
            y: selectData[jsonValue[chartIndex]][jsonTopScore[chartIndex]],
            borderColor: '#FF4560',
            label: {
                borderColor: '#FF4560',
                style: {
                    color: '#fff',
                    background: '#FF4560'
                },
                text: title[chartIndex]+' 평균: ' + selectData[jsonValue[chartIndex]][jsonTopScore[chartIndex]] + '점'
            }
        }];
        const chartColors = [
            ['#2196F3'],    // 총점 - 파란색
            ['#00BCD4'],    // 취업자 - 틸색
            ['#009688'],    // 알선취업자 - 청록색
            ['#4CAF50'],    // 고용유지 - 녹색
            ['#8BC34A'],    // 조기취업자 - 라임색
            ['#3F51B5']     // 나은일자리 - 인디고
        ];

        // 차트 옵션 구성
        const options = {
            series: seriesData,
            colors: chartColors[chartIndex],
            chart: {
                height: 450,
                type: 'bar',
                toolbar: {
                    show: true,
                    tools: {
                        download: true,
                        selection: true,
                    }
                },
                dropShadow: {
                    enabled: true,
                    opacity: 0.3,
                    blur: 3
                },
                events: {
                    dataPointSelection: function(event, chartContext, config) { // click 대신 dataPointSelection 사용
                        const clickIndex = config.dataPointIndex;
                        const userID = selectData.userID[clickIndex];
                        if(clickIndex !== 0){
                            location.href = "scoreDashboard.login?dashboardUserID=" + userID + "&dashboardBranch=" + selectData.branch;
                        }
                    }
                }
            },
            plotOptions: {
                bar: {
                    horizontal: false,
                    columnWidth: '90%',
                    endingShape: 'rounded',
                    borderRadius: 4,
                    dataLabels: {
                        position: 'top'
                    }
                },
            },
            stroke: {
                show: true,
                width: 10,
                colors: ['transparent']
            },
            dataLabels: {
                enabled: true,
                formatter: function(val) {
                    return val.toFixed(1) + '점';
                },
                style: {
                    fontSize: '10px',
                    fontFamily: 'Helvetica, Arial, sans-serif',
                    fontWeight: 'bold',
                    colors: ['#ffffff']
                }
            },
            xaxis: {
                categories: selectData.username,
                tickPlacement: 'between',
                labels: {
                    style: {
                        fontSize: '12px',
                        fontWeight: 600,
                    },
                    rotate: -45,
                    hideOverlappingLabels: false
                }
            },
            yaxis: {
                title: {
                    text: '점수',
                    style: {
                        fontSize: '10px',
                        fontWeight: 600
                    }
                },
                min: 0,
                max: maxScore[chartIndex],
                forceNiceScale: true,
                tickAmount: 5,
                labels: {
                    formatter: function(val) {
                        return val.toFixed(0) + '점';
                    }
                }
            },
            legend: {
                position: 'top',
                horizontalAlign: 'right',
                floating: true,
                fontSize: '13px',
                markers: {
                    size: 8
                }
            },
            title: {
                text: chartTitle,
                align: 'center',
                style: {
                    fontSize: '16px',
                    fontWeight: 'bold'
                },
                margin: 20
            },
            tooltip: {
                shared: true,
                intersect: false,
                y: {
                    formatter: function(val) {
                        return val.toFixed(1) + '점';
                    }
                },
                theme: 'dark'
            },
            grid: {
                borderColor: '#e0e0e0'
            },
            markers: {
                size: 6,
                hover: {
                    size: 9
                }
            },
            annotations: {
                yaxis: yaxisAnnotation
            }
        };

        return options;
    }

    // 차트 렌더링 함수 수정
    function renderDistributionChart(title, maxScore, jsonValue, jsonScore, jsonTopScore) {
        // 각 차트 요소를 선택하고 렌더링
        for (let i = 0; i < jsonValue.length; i++) {
            const chartElement = document.querySelector("#"+jsonScore[i]);
            if (chartElement) {
                const options = getChartOptions(i, title, maxScore, jsonValue, jsonScore, jsonTopScore);
                const chart = new ApexCharts(chartElement, options);
                chart.render();
            }
        }
    }

    //상담사별 데이터 불러오는 fetch(비동기 함수)
    function fetchData(data) {
        //초기화 함수
        emptyFunction();
        const $loadingDiv = $('#loadingDiv');
        $loadingDiv.html('실적 정보를 불러오는 중입니다.<div class="loader"></div>');

        fetch('dashBoardAjaxBranchScore.login', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({dashboardBranch:data})
        }).then(async response => {
            let data = JSON.parse(await response.json());

            //console.log(data);
            //console.log(data);
            changeDataAVG(data);
            changeDataUser(data);

            //"total" 총점,"employment"취업자,"placement"알선취업자,"retention"고용유지,"earlyEmployment"조기취업자,"betterJob"나은일자리
            const title = ["총점","취업자","알선취업자","고용유지","조기취업자","나은일자리"]
            const maxScore = [90,30,25,15,10,10] //점수 확인용
            const jsonValue = ["total","employment","placement","retention","earlyEmployment","betterJob"]
            const jsonScore = ["totalScore","employmentScore","placementScore","retentionScore","earlyEmploymentScore","betterJobScore"]
            const jsonTopScore = ["totalStandardScore","employmentTopScore","placementTopScore","retentionTopScore","earlyEmploymentTopScore","betterJobTopScore"]
            // console.log(jsonScore.length);
            renderDistributionChart(title, maxScore, jsonValue, jsonScore, jsonTopScore);
            $loadingDiv.empty()
        }).catch(r => {
            $loadingDiv.html('<div> 오류가 발생했습니다.(다른 지점은 선택할 수 없습니다. </div>');
        })
    }

    let selectData = {
        username:[],
        userID:[],
        branch:{},
        retention: {
            retentionTopScore: {},
            retentionScore:[]
        },
        placement:{
            placementTopScore:{},
            placementScore:[]
        },
        employment: {
            employmentTopScore:{},
            employmentScore:[]
        },
        earlyEmployment:{
            earlyEmploymentTopScore:{},
            earlyEmploymentScore:[]
        },
        betterJob:{
            betterJobTopScore:{},
            betterJobScore:[]
        },
        total:{
            totalStandardScore: {},
            myBranchScore: {},
            totalScore:[]
        },
    }

    function changeDataAVG(data){
        data.branchScore.forEach(function(value, key){
            //console.log(value.retentionTopScore);
            selectData.retention.retentionTopScore = value.retentionTopScore;
            //console.log(value.placementTopScore);
            selectData.placement.placementTopScore = value.placementTopScore;
            //console.log(value.employmentTopScore);
            selectData.employment.employmentTopScore = value.employmentTopScore;
            //console.log(value.earlyEmploymentTopScore);
            selectData.earlyEmployment.earlyEmploymentTopScore = value.earlyEmploymentTopScore;
            //console.log(value.betterJobTopScore);
            selectData.betterJob.betterJobTopScore = value.betterJobTopScore;
            //console.log(value.totalStandardScore); // 전체 총점
            selectData.total.totalStandardScore = value.totalStandardScore;
        })
    }

    function changeDataUser(data){
        data.branchUserScore.forEach(function(value, key){
            //console.log(value.username);
            selectData.username.push(value.username);
            //console.log(value.userID);
            selectData.userID.push(value.userID);
            //console.log(value.branch)
            selectData.branch = value.branch;
            //console.log(value.retentionScore);
            selectData.retention.retentionScore.push(value.retentionScore);
            //console.log(value.placementScore);
            selectData.placement.placementScore.push(value.placementScore);
            //console.log(value.employmentScore);
            selectData.employment.employmentScore.push(value.employmentScore);
            //console.log(value.earlyEmploymentScore);
            selectData.earlyEmployment.earlyEmploymentScore.push(value.earlyEmploymentScore);
            console.log(value.betterJobScore);
            selectData.betterJob.betterJobScore.push(value.betterJobScore);
            //console.log(value.totalScore);//개인 총점
            selectData.total.totalScore.push(value.totalScore);
            //console.log(value.myBranchScore); //지점 총점
            selectData.total.myBranchScore = value.myBranchScore;
        })
    }

    function emptyFunction(){
        selectData = {
            username:[],
            userID:[],
            branch:{},
            retention: {
                retentionTopScore: {},
                retentionScore:[]
            },
            placement:{
                placementTopScore:{},
                placementScore:[]
            },
            employment: {
                employmentTopScore:{},
                employmentScore:[]
            },
            earlyEmployment:{
                earlyEmploymentTopScore:{},
                earlyEmploymentScore:[]
            },
            betterJob:{
                betterJobTopScore:{},
                betterJobScore:[]
            },
            total:{
                totalStandardScore: {},
                myBranchScore: {},
                totalScore:[]
            },
        };
        $("#totalScore").empty();
        $("#employmentScore").empty();
        $("#placementScore").empty();
        $("#retentionScore").empty();
        $("#earlyEmploymentScore").empty();
        $("#betterJobScore").empty();
        $('#loadingDiv').empty();
    }

    $(document).ready(function () {
        changeData(responseData);

        // 데이터 존재 여부 확인 (JavaScript 방식으로 수정)
        if (!responseData || Object.keys(responseData).length === 0) {
            changeData(initData)
        }
        //지점 평균 데이터 출력
        renderScoreChart(changJson);

        function changeData(data){
            data.map(function(item){
                changJson.name.push(item.name);
                changJson.data.push(item.data);
            });
            //console.log(changJson);
        }

        const excludeRadio = $('#excludeRadio'); //미포함
        const includeRadio = $('#includeRadio'); //포함

        //1년 미만 상담사 미포함
        excludeRadio.click(function(){
            let excludeVal = excludeRadio.val();
            fetchPerformanceContract(excludeVal);
        });
        //1년 미만 상담사 포함
        includeRadio.click(function(){
            let includeVal = includeRadio.val();
            fetchPerformanceContract(includeVal);
        });

        function fetchPerformanceContract(condition){

            console.log(condition, "condition 삭제 진행중")
            $("#scoreChartDiv").empty();
            const $loadingScoreChartDiv = $("#loadingScoreChartDiv");
            $loadingScoreChartDiv.html('실적 정보를 불러오는 중입니다.<div class="loader"></div>');


            changJson = {
                name:[], data:[]
            }

            fetch('scoreBranchPerformanceAjax.login', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    dashBoardStartDate:'2024-11-01', //FIXME 추후 실적 일정 설정 input 추가시 수정
                    dashBoardEndDate:'2025-10-31',
                    dashboardCondition:condition})
            }).then(async response => {
                console.log(condition, "condition 삭제 진행끝")
                $("#scoreChartDiv").append('<div id="scoreChart"></div>');

                let data = JSON.parse(await response.json());
                if(data.length === 0){
                    alert("실적 데이터를 불러오는 동안 오류가 발생했습니다.")
                    return;
                }
                //실적 차트에 맞도록 데이터 변환
                changeData(data);
                //실적 차트 생성
                renderScoreChart(changJson);
                $loadingScoreChartDiv.empty();
            }).catch(r => {
                console.log(r);
                $loadingScoreChartDiv.html("Error 발생 : "+r);
            })
        }

    });
</script>
<script
        src="https://cdn.jsdelivr.net/npm/apexcharts@3.37.1/dist/apexcharts.min.js"
        integrity="sha256-+vh8GkaU7C9/wbSLIcwq82tQ2wTf44aOHA8HlBMwRI8="
        crossorigin="anonymous"
></script>
</html>
