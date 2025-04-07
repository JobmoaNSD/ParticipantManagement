$(document).ready(function(){

    //임시데이터
    const Datas = {
        branch:['전체 지점','남부','서부','인서','인남','동대문'],
        thisSuccess:{
            branch:['전체 지점','남부','서부','인서','인남','동대문'],
            data:[20,10,40,30,50,40,80,90]
        },
        previousSuccess:{
            branch:['전체 지점','남부','서부','인서','인남','동대문'],
            data:[30,20,50,40,70,60,90,100]
        },
        correInventive:{
            branch:['전체 지점','남부','서부','인서','인남','동대문'],
            data:[10,20,30,40,50,60,70,80]
        },
        notCorreInventive:{
            branch:['전체 지점','남부','서부','인서','인남','동대문'],
            data:[20,10,40,30,50,40,80,90]
        },
        inventiveSituation:
            [{
                name: '서비스 미제공',
                data: [90, 55, 57, 56, 61, 58, 63, 60, 66]
            },
            {
                name: '1개월 미만 퇴사',
                data: [12, 85, 101, 98, 87, 105, 91, 114, 94]
            },
            {
                name: '파견업체',
                data: [23, 41, 36, 26, 45, 48, 52, 53, 41]
            }]
    }

    //첫번째 프레임 필터

    //두번째 프레임
    // ApexCharts를 사용한 복합 그래프 구현
    let options = {
        series: [{
            name: '당해년도',
            type: 'column',
            data: Datas.thisSuccess.data
        }, {
            name: '전년도',
            type: 'line',
            data: Datas.previousSuccess.data
        }],
        xaxis:{
            categories:Datas.thisSuccess.branch,
        },
        chart: {
            height: 350,
            type: 'line',
            events: {
                dataPointSelection: function(event, chartContext, config) { // click 대신 dataPointSelection 사용
                    const branchIndex = config.dataPointIndex;
                    const branchName = Datas.thisSuccess.branch[branchIndex];

                    // 전체 지점이 아닌 경우에만 모달 표시
                    if (branchIndex !== 0) {
                        showConsultantModal(branchName);
                    }
                }
            }
        },
        stroke: {
            width: [0, 3] // column은 0, line은 3
        },
        xaxis: {
            categories: Datas.thisSuccess.branch,
            title: {
                text: '지점'
            }
        },
        yaxis: {
            title: {
                text: '성공금액 (만원)'
            },
            labels: {
                formatter: function(val) {
                    return val.toLocaleString() + '만원';
                }
            }
        },
        dataLabels: {
            enabled: true,
            formatter: function(val) {
                return val.toLocaleString() + '만원';
            }
        },
        title: {
            text: '지점별 성공금 현황',
            align: 'left'
        }
    };


    /**
     * 지점별 상담사 성공금 현황을 모달로 표시하는 함수
     * @param {string} branchName - 선택된 지점명
     */
    function showConsultantModal(branchName) {
        // 로딩 표시
        $('#counselorChart').html('<div class="text-center"><div class="spinner-border" role="status"></div></div>');

        // API 호출을 시뮬레이션 (실제 구현시 AJAX로 대체)
        fetchConsultantData(branchName)
            .then(data => {
                // 모달 제목 업데이트
                $('#counselorModal .modal-title').text(`${branchName} 상담사 성공금 현황`);

                // 상담사 차트 옵션
                const consultantChartOptions = {
                    series: [{
                        name: '성공금',
                        data: data.amounts
                    }],
                    chart: {
                        type: 'bar',
                        height: 350,
                        toolbar: {
                            show: true,
                            tools: {
                                download: true,
                                selection: false,
                                zoom: false,
                                zoomin: false,
                                zoomout: false,
                                pan: false,
                                reset: false
                            }
                        }
                    },
                    plotOptions: {
                        bar: {
                            borderRadius: 4,
                            horizontal: false,
                            columnWidth: '55%'
                        }
                    },
                    dataLabels: {
                        enabled: true,
                        formatter: function(val) {
                            return val.toLocaleString() + '만원';
                        }
                    },
                    xaxis: {
                        categories: data.consultants,
                        title: {
                            text: '상담사명'
                        }
                    },
                    yaxis: {
                        title: {
                            text: '성공금액 (만원)'
                        },
                        labels: {
                            formatter: function(val) {
                                return val.toLocaleString();
                            }
                        }
                    },
                    colors: ['#2E93fA'],
                    tooltip: {
                        y: {
                            formatter: function(val) {
                                return val.toLocaleString() + ' 만원';
                            }
                        }
                    }
                };

                // 차트 생성 및 렌더링
                const consultantChart = new ApexCharts(
                    document.querySelector("#counselorChart"),
                    consultantChartOptions
                );
                consultantChart.render();

                // 모달 표시
                $('#counselorModal').modal('show');
            })
            .catch(error => {
                console.error('상담사 데이터 조회 실패:', error);
                sweetAlert('error', '데이터 조회 실패', '상담사 정보를 불러오는데 실패했습니다.');
            });
    }

    /**
     * 상담사 데이터를 가져오는 함수 (실제 구현 시 API 호출로 대체)
     * @param {string} branchName - 지점명
     * @returns {Promise} - 상담사 데이터
     */
    function fetchConsultantData(branchName) {
        return new Promise((resolve) => {
            // 테스트용 더미 데이터 (실제 구현시 API 호출로 대체)
            setTimeout(() => {
                resolve({
                    consultants: ['김상담', '이상담', '박상담', '최상담', '정상담'],
                    amounts: [2500, 2100, 1800, 2300, 1900]
                });
            }, 500);
        });
    }

    // 모달 닫힐 때 차트 정리
    $('#counselorModal').on('hidden.bs.modal', function () {
        $('#counselorChart').empty();
    });



    //세번째 프레임
    let stackedBarOptions = {
        series: [{
            name: '해당',
            data: Datas.correInventive.data
        },
            {
                name: '미해당',
                data: Datas.notCorreInventive.data
            }],
        chart: {
            type: 'bar',
            height: 350,
            stacked: true,
            horizontal: true
        },
        xaxis: {
            categories: Datas.correInventive.branch,
        },
        plotOptions: {
            bar: {
                horizontal: true,
                dataLabels: {
                    formatter: function(val) {
                        return val + '건'; // 원본 데이터 표시
                    }
                }
            }
        },        
        title: {
            text: '인센 현황',
            align: 'left'
        }
    };


    //네번째 프레임
    let donutOptions = {
        series: Datas.inventiveSituation.map(situation => situation),
        chart: {
            type: 'bar',
            height: 350,
            toolbar: {
                show: true
            }
        },
        plotOptions: {
            bar: {
                horizontal: false,
                columnWidth: '55%',
                borderRadius: 2,
            },
        },
        dataLabels: {
            enabled: false
        },
        stroke: {
            show: true,
            width: 2,
            colors: ['transparent']
        },
        xaxis: {
            categories: Datas.branch,
        },
        yaxis: {
            title: {
                text: ''
            },
            labels: {
                formatter: function(val) {
                    return val.toLocaleString();
                }
            }
        },
        fill: {
            opacity: 1
        },
        // 기본 색상 설정
        colors: ['#ff0000', '#fca895', '#ffb0b0'],
        tooltip: {
            y: {
                formatter: function(val) {
                    return val.toLocaleString() + " 건";
                }
            }
        },
        legend: {
            position: 'bottom',
            horizontalAlign: 'center'
        },
        // 강조 효과를 위한 states 설정
        states: {
            active: {
                allowMultipleDataPointsSelection: false,
                filter: {
                    type: 'none'
                }
            }
        },
        title: {
            text: '인센 미해당 현황',
            align: 'left'
        }
    };



    // 차트 렌더링
    new ApexCharts(document.querySelector("#dashboard_Success_chart"), options).render();
    new ApexCharts(document.querySelector("#dashboard_inventive_chart"), stackedBarOptions).render();
    new ApexCharts(document.querySelector("#dashboard_inventive_situation_chart"), donutOptions).render();
    // new ApexCharts(document.querySelector("#yearlyEmploymentChart"), yearlyEmploymentOptions).render();

    // 특정 데이터 강조 함수
    function highlightSeries(seriesIndex) {
        const newColors = options.series.map((_, index) =>
            index === seriesIndex ? '#2E93fA' : '#E0E0E0'
        );

        chart.updateOptions({
            colors: newColors
        });
    }

// 컨트롤 버튼 생성
    const controls = `
    <div class="btn-group mt-3 mb-3" role="group">
        <button class="btn btn-outline-primary" onclick="highlightSeries(0)">당월</button>
        <button class="btn btn-outline-primary" onclick="highlightSeries(1)">전월</button>
        <button class="btn btn-outline-primary" onclick="highlightSeries(2)">전년동월</button>
    </div>
`;

// 컨트롤 버튼 추가
    document.querySelector("#chart").insertAdjacentHTML('beforebegin', controls);

// 초기 강조 설정 (첫 번째 시리즈)
    highlightSeries(0);

})