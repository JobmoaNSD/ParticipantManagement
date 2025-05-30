// Main Dashboard Apex Chart Option Config


function apexChartDoughnut(title,series,labels, colors, isBuble) {


    let percent = ''
    let chartData = []

    // 모든 시리즈 데이터에 대해 유효성 검사 실행
    series.map(function(item) {
        console.log("apexChartDoughnut : " + item);
        // 숫자로 변환 후 유효성 검사
        let num = Number(item);
        chartData.push(isNaN(num) ? 0.00 : num.toFixed(2));
    });

    if(isBuble){
        percent = '%'
    }

    //donut Chart Option Start
    const options = {
        series:chartData.map(Number), //백단에서 값을 넘겨받아와야함
        labels:labels, //백단에서 값을 넘겨받아와야함
        legend: {
            show: true,
            position: 'bottom'
        },
        title: {
            text: title,
            align: 'center'
        },
        chart: {
            type: 'donut',
            width: '320px'
        },
        colors: colors,
        responsive: [{
            breakpoint: 480
        }],
        plotOptions: { 
            pie:{
                customScale: 1,
                donut:{// donut 내부 값을 출력하고 크기를 지정하는 옵션
                    size: '50%', // 내부 크기 지정
                    labels: {
                        show: true,
                        name: { // 내분 값에 대한 font 크기 색 폰트 크기 설정
                            show: true,
                            fontSize: '40%',
                            fontFamily: 'Open Sans',
                            fontWeight: 500,
                            color: '#000000',
                        },
                        value: {
                            formatter: function(val) {
                                return Math.ceil(val) + percent;
                            },
                            style: {
                                fontSize: '11px',         // 작은 폰트
                                fontWeight: 'normal',     // 일반 두께
                            },
                            offsetY: -5,                  // 살짝 위로
                        }
                    }
                }
            }
        },
        dataLabels: {
            enabled: true,
            style: {
                fontSize: '11px',
                colors: ['rgba(24,1,1,0.94)'],
            },
            formatter: function(val, opts) {

                // 첫 번째 시리즈의 dataLabel을 숨김
                if (series.length == 2 && opts.seriesIndex === 1) {
                    return '';
                }
                return Math.ceil(val) + '%';
            }
        }
    }
    //donut Chart Option End

    return options;
}