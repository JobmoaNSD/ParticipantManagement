$(document).ready(function(){
    //임시데이터
    const Datas = initData;

    //세번째 프레임
    let stackedBarOptions = {
        series: [{
            name: '해당',
            type: 'bar',
            data: Datas.correInventive.data
        },
            {
                name: '미해당',
                type: 'bar',
                data: Datas.notCorreInventive.data
            },
            {
                name: '해당 비율',
                type: 'line',
                data: Datas.correInventive.data.map((val, idx) => {
                    const total = val + Datas.notCorreInventive.data[idx];
                    return ((val / total) * 100).toFixed(1);
                })
            }],
        chart: {
            type: 'line',
            height: 350,
            stacked: true
        },
        xaxis: {
            categories: Datas.correInventive.branch,
        },
        plotOptions: {
            bar: {
                horizontal: false, // 세로 방향으로 변경
                dataLabels: {
                    formatter: function(val) {
                        return val + '건';
                    }
                }
            }
        },
        yaxis: [{
            opposite: true,
            title: {
                text: '비율 (%)'
            },
            min: 0,
            max: 100
        }],
        dataLabels: {
            enabled: true,
            formatter: function(val, { seriesIndex }) {
                if (seriesIndex === 2) {
                    return val + '%';
                }
                return val + '건';
            }
        },
        title: {
            text: '인센 현황',
            align: 'left'
        }
    };

    // 차트 렌더링
    new ApexCharts(document.querySelector("#dashboard_inventive_chart"), stackedBarOptions).render();
})