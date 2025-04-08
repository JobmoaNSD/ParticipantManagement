$(document).ready(function(){
    //임시데이터
    const Datas = initData;

    //네번째 프레임
    let donutOptions = {
        series: Datas.inventiveSituation.map(situation => situation),
        chart: {
            type: 'bar',
            height: 350,
            toolbar: {
                show: true
            },
            //TODO FIXME 모달 생성 이벤트 제작 후 수정 예정
            events: {
                dataPointSelection: function(event, chartContext, config) { // click 대신 dataPointSelection 사용
                    const branchIndex = config.dataPointIndex;
                    const branchName = Datas.thisSuccess.branch[branchIndex];

                    // 전체 지점 클릭시 모달 표시
                    if (branchIndex === 0) {
                        showInventiveModal(branchName);
                    }
                }
            }
        },
        plotOptions: {
            bar: {
                horizontal: false,
                columnWidth: '55%',
                borderRadius: 2,
            },
        },
        stroke: {
            show: true,
            width: 2,
            colors: ['transparent']
        },
        xaxis: {
            categories: ['A 사업부','B 사업부'],
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
        colors: ['#ff0000', '#fca895', '#ffb0b0','#934e4e'],
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
        dataLabels: {
            enabled: true,
            formatter: function(val) {
                return val.toLocaleString() + '건';
            }
        },
        title: {
            text: '인센 미해당 현황',
            align: 'left'
        }
    };



    /**
     * 지점별 상담사 성공금 현황을 모달로 표시하는 함수
     * @param {string} branchName - 선택된 지점명
     */
    function showInventiveModal(branchName) {
        // 로딩 표시
        $('#inventiveSituationAChart').html('<div class="text-center"><div class="spinner-border" role="status"></div></div>');

        // API 호출을 시뮬레이션 (실제 구현시 AJAX로 대체)
        ajaxInventiveData(branchName)
            .then(data => {
                // 모달 제목 업데이트
                $('#inventiveSituationModal .modal-title').text('지점별 미해당 현황');

                // 상담사 차트 옵션
                const consultantChartOptions = {
                    series: data.inventiveSituation.map(situation => situation),
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
                                pan: false,
                                reset: false
                            }
                        }
                    },
                    plotOptions: {
                        bar: {
                            borderRadius: 4,
                            horizontal: false,
                            columnWidth: '70%'
                        }
                    },
                    dataLabels: {
                        enabled: true,
                        formatter: function(val) {
                            return val.toLocaleString() + '건';
                        }
                    },
                    xaxis: {
                        categories: data.branch,
                    },
                    yaxis: {
                        title: {
                            text: '미해당 건 수'
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
                                return val.toLocaleString() + ' 건';
                            }
                        }
                    }
                };

                // 차트 생성 및 렌더링
                const inventiveSituationAChart = new ApexCharts(
                    document.querySelector("#inventiveSituationAChart"),
                    consultantChartOptions
                );
                inventiveSituationAChart.render();



                // 모달 표시
                $('#inventiveSituationModal').modal('show');
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
    function ajaxInventiveData(branchName) {
        return new Promise((resolve) => {
            // 테스트용 더미 데이터 (실제 구현시 API 호출로 대체)
            setTimeout(() => {
                resolve({
                        branch:['남부','서부','인서','인남','동대문'],
                        inventiveSituation:[
                            {
                                name: '서비스 미제공',
                                data: [90, 55, 57, 82, 68]
                            },
                            {
                                name: '1개월 미만 퇴사',
                                data: [12, 85, 101, 98, 82]
                            },
                            {
                                name: '파견업체',
                                data: [23, 41, 36, 32, 34]
                            },
                            {
                                name: '최저임금 미만',
                                data: [23, 41, 36, 32, 34]
                            },
                        ]
                });
            }, 500);
        });
    }

    // 모달 닫힐 때 차트 정리
    $('#inventiveSituationModal').on('hidden.bs.modal', function () {
        $('#inventiveSituationAChart').empty();
        $('#inventiveSituationBChart').empty();
    });

    // 차트 렌더링
    new ApexCharts(document.querySelector("#dashboard_inventive_situation_chart"), donutOptions).render();
})