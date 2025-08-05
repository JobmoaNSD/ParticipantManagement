/**
 * CSV 파일 업로드 및 테이블 생성 스크립트
 *
 * 주요 기능:
 * - CSV 파일 유효성 검증
 * - 파일 읽기 및 파싱
 * - HTML 테이블 생성 및 표시
 * - 에러 처리 및 사용자 알림
 *
 * 사용 라이브러리:
 * - jQuery 3.7.1
 * - jQuery CSV 1.0.9
 *
 * 필요한 HTML 요소:
 * - .file-input: 파일 입력 요소
 * - .response-text-div: 상태 메시지 표시 영역
 * - #csvData: 테이블이 표시될 영역
 *
 * @author [남상도]
 * @version 1.0.0
 * @since 2025-07-18
 */
/**
 * CSV 파일을 읽어오는 메인 함수
 *
 * 동작 순서:
 * 1. 파일 유효성 검증 (타입, 확장자)
 * 2. FileReader API를 사용한 파일 읽기
 * 3. 읽기 완료 시 processCSV 함수 호출
 *
 * @param {Event} file - 파일 선택 이벤트 객체
 * @throws {Error} CSV 파일이 아닌 경우 에러 발생
 */
function readCsvFile(file) {
    const fileReader = new FileReader();
    const fileData = file.target.files[0];
    const fileType = fileData.type;
    const fileName = fileData.name;
    const responseTextDiv = $('.response-text-div');

    // 이전 메시지 초기화
    responseTextDiv.empty();

    // 파일 타입 검증: MIME 타입이 text/csv인지 확인
    if(fileType !== 'text/csv'){
        responseTextDiv.show();
        responseTextDiv.append('<strong class="csv-danger">csv 파일만 업로드 가능합니다.</strong>');
        throw new Error('csv 파일만 업로드 가능합니다.');
    }

    // 파일명 로깅 (디버깅용)
    console.log('업로드된 파일명:', fileName);

    /**
     * 파일 읽기 완료 시 실행되는 콜백 함수
     * @param {ProgressEvent} e - 파일 읽기 이벤트
     */
    fileReader.onload = function (e) {
        let csvData = e.target.result;
        // BOM 제거
        if (csvData.charCodeAt(0) === 0xFEFF) {
            csvData = csvData.slice(1);
        }

        processCSV(csvData); // CSV 데이터 처리 함수 호출
    }

    /**
     * 파일 읽기 오류 시 실행되는 콜백 함수
     * 네트워크 오류, 파일 손상 등의 경우 발생
     */
    fileReader.onerror = function() {
        responseTextDiv.show();
        responseTextDiv.append('<strong class="csv-danger">파일 읽기 중 오류가 발생했습니다.</strong>');
        return false;
    }

    // 파일을 텍스트 형태로 읽기 시작
    fileReader.readAsText(fileData, 'UTF-8');
    return true;
}

/**
 * CSV 텍스트 데이터를 파싱하여 HTML 테이블로 변환하는 함수
 *
 * 처리 과정:
 * 1. 데이터 정제 (줄바꿈 통일, 빈 줄 제거)
 * 2. jQuery CSV 라이브러리를 사용한 파싱
 * 3. HTML 테이블 생성
 * 4. DOM에 삽입
 *
 * @param {string} csvText - 파싱할 CSV 텍스트 데이터
 */
function processCSV(csvText) {
    const responseTextDiv = $('.response-text-div');
    const csv_column = $('.csv-column');


    try {
        // 1단계: CSV 파싱 전 기본적인 데이터 정제
        const cleanedCsvText = cleanCsvData(csvText);

        // 2단계: jQuery CSV 라이브러리 옵션 설정 및 파싱
        const data = $.csv.toArrays(cleanedCsvText, {
            separator: ',',      // 구분자: 쉼표
            delimiter: '"',      // 문자열 구분자: 큰따옴표
            headers: false,      // 헤더 자동 처리 비활성화
            onParseValue: function(value, index) {
                // 각 값의 앞뒤 공백 제거
                return value.trim();
            }
        });

        // 3단계: 데이터 유효성 검증
        if (data.length === 0) {
            responseTextDiv.show();
            responseTextDiv.append('<strong class="csv-danger">CSV 파일이 비어있습니다.</strong>');
            return;
        }

        // 4단계: HTML 테이블 생성 시작
        // 예상 헤더를 배열로 미리 수집 (한 번만 실행)
        const expectedHeaders = [];
        csv_column.each(function(i) {
            if (i !== 0) {
                expectedHeaders.push($(this).text().trim());
            }
        });

        // 헤더 검증 (O(n+m) → O(n))
        if (data.length > 0 && !validateCSVHeaders(data[0], expectedHeaders)) {
            responseTextDiv.show();
            responseTextDiv.append('<strong class="csv-danger">CSV 파일의 헤더가 다릅니다.</strong>');
            return; // 헤더가 맞지 않으면 처리 중단
        }


        let table = '';
        // 나머지 데이터를 테이블 바디로 처리
        for (let i = 1; i < data.length; i++) {
            table += '<tr class="csv-data-tr">';
            for (let j = 0; j < data[i].length; j++) {
                if (j === 0) {
                    table += '<td>'+i+'</td>'
                    // table += '<td class="random-td-input" ><input type="text" class="random-input" id="random-'+(i+1)+' readonly"></td>';
                    table += '<td class="random-td-input"></td>';
                }
                table += '<td class="random-td">' + escapeHtml(data[i][j]) + '</td>';
            }
            table += '</tr>';
        }
        // table += '</tbody></table>';

        // 5단계: 생성된 테이블을 DOM에 삽입
        $('#csv-data').html(table);

        // 6단계: 성공 메시지 표시
        responseTextDiv.show();
        responseTextDiv.append('<strong style="color: green;">CSV 파일이 성공적으로 로드되었습니다.</strong>');

    } catch (error) {
        // 에러 처리: 파싱 실패, 형식 오류 등
        console.error('CSV 파싱 에러:', error);
        responseTextDiv.show();
        responseTextDiv.append('<strong class="csv-danger">CSV 파일 형식이 올바르지 않습니다. 파일을 확인해주세요.</strong>');

        // 특정 에러 타입에 대한 상세 정보 표시
        if (error.message.includes('Illegal Quote')) {
            responseTextDiv.append('<br><small>오류 위치: ' + error.message + '</small>');
        }
    }
}

// CSV 헤더 검증 함수 (효율적인 버전)
function validateCSVHeaders(csvHeaders, expectedHeaders) {
    // 길이가 다르면 바로 false 반환
    if (csvHeaders.length !== expectedHeaders.length) {
        console.log(`컬럼 개수가 맞지 않습니다. CSV: ${csvHeaders.length}, 예상: ${expectedHeaders.length}`);
        return false;
    }

    // 순서대로 비교 (O(n))
    for (let i = 1; i < csvHeaders.length; i++) {
        const csvHeader = escapeHtml(csvHeaders[i]).trim();
        const expectedHeader = expectedHeaders[i].trim();

        if (csvHeader !== expectedHeader) {
            console.log(`컬럼이 맞지 않습니다. ${csvHeader} != ${expectedHeader} (위치: ${i})`);
            return false;
        }
    }

    return true;
}


/**
 * CSV 데이터를 정제하는 유틸리티 함수
 *
 * 수행 작업:
 * - 운영체제별 줄바꿈 문자 통일 (Windows: \r\n, Mac: \r, Unix: \n)
 * - 빈 줄 제거
 * - 데이터 무결성 보장
 *
 * @param {string} csvText - 정제할 CSV 텍스트
 * @returns {string} 정제된 CSV 텍스트
 */
function cleanCsvData(csvText) {
    // 기본적인 정제 작업
    let cleaned = csvText.replace(/\r\n/g, '\n'); // Windows 줄바꿈을 Unix 형태로 통일
    cleaned = cleaned.replace(/\r/g, '\n');       // Mac 줄바꿈을 Unix 형태로 통일

    // 비어있는 줄 제거 (공백만 있는 줄도 제거)
    cleaned = cleaned.split('\n').filter(line => line.trim() !== '').join('\n');

    return cleaned;
}

/**
 * HTML 특수 문자를 이스케이프하는 보안 함수
 *
 * XSS(Cross-Site Scripting) 공격 방지를 위해
 * HTML에서 특별한 의미를 가지는 문자들을 안전한 형태로 변환
 *
 * 변환 대상:
 * - & → &amp;   (앰퍼샌드)
 * - < → &lt;    (왼쪽 꺾쇠)
 * - > → &gt;    (오른쪽 꺾쇠)
 * - " → &quot;  (큰따옴표)
 * - ' → &#039;  (작은따옴표)
 *
 * @param {string} text - 이스케이프할 텍스트
 * @returns {string} 이스케이프된 안전한 텍스트
 */
function escapeHtml(text) {
    const map = {
        '&': '&amp;',
        '<': '&lt;',
        '>': '&gt;',
        '"': '&quot;',
        "'": '&#039;'
    };
    return text.replace(/[&<>"']/g, function(m) { return map[m]; });
}

/**
 * 개선된 상담사 배정 알고리즘
 *
 * 알고리즘 단계:
 * 1. 제외 인원 설정 추가
 * 2. 총 배정인원을 확인
 * 3. 청년, 특정계층, 중장년으로 나눠 각각의 배정인원을 확인 후 점수 산정
 * 4. 특정계층의 경우 인원이 많지 않으면 청년, 중장년으로 배정해 점수를 산정
 * 5. 산정된 점수의 총합을 기준으로 배정점수가 낮으면서 배정인원이 적은 상담사에게 청년 우선 배정
 * 6. 이후 특정계층과 중장년을 각각 배정
 *
 * @param {string} currentCounselor - 현재 상담사 정보
 * @param {Object} counselorAssignments - 상담사별 배정 정보
 * @param {string} participantAgeGroup - 참여자 연령대 ('청년', '특정계층', '중장년')
 * @param {Object} excludedPersonnel - 제외 인원 설정
 * @returns {string|null} 선택된 상담사 ID 또는 null
 */
//TODO 청년 중장년 관련해서 데이터 대입이 잘 되는지 확인 하면 완료
function dataAssignment(currentCounselor, counselorAssignments, participantAgeGroup = '청년', excludedPersonnel = {}) {
    // 1단계: 제외 인원 설정 적용 및 배정 가능한 상담사 필터링
    const availableCounselors = Object.keys(counselorAssignments).filter(counselor => {
        const counselorData = counselorAssignments[counselor];
        const isExcluded = excludedPersonnel[counselor] || false;
        const hasCapacity = counselorData.total < counselorData.max;
        //const under100Limit = counselorData.total < 100; // 총 진행인원 100 미만

        // console.log("excludedPersonnel[counselor] : " + excludedPersonnel[counselor]);
        // console.log("counselorData.current : " + counselorData.current);
        // console.log("counselorData.max : " + counselorData.max);
        // console.log("counselorData.total : " + counselorData.total);
        // console.log("isExcluded : " + isExcluded);
        // console.log("hasCapacity : " + hasCapacity);
        // console.log("under100Limit : " + under100Limit);
        return !isExcluded && hasCapacity;// && under100Limit;
    });

    // 2단계: 배정 가능한 상담사가 없는 경우 처리
    if (availableCounselors.length === 0) {
        console.log("배정 가능한 상담사가 없습니다.");
        return null;
    }

    // 3단계: 각 상담사별 점수 계산
    const counselorScores = availableCounselors.map(counselor => {
        const data = counselorAssignments[counselor];

        // 점수 계산 (낮을수록 우선순위 높음)
        const totalScore = data.total || 0;           // 전체 총 진행 인원
        const yearScore = data.year || 0;     // 2025년 진행자 수
        const youthScore = data.youth || 0;           // 청년 수
        const middleAgedScore = data.middleAged || 0; // 중장년 수
        const specialGroupScore = data.specialGroup || 0; // 특정계층 수

        // 가중치를 적용한 종합 점수 계산
        const comprehensiveScore = (totalScore * 0.4) + (yearScore * 0.3) +
            (youthScore * 0.15) + (middleAgedScore * 0.15);

        return {
            counselor: counselor,
            totalScore: totalScore,
            yearScore: yearScore,
            youthScore: youthScore,
            middleAgedScore: middleAgedScore,
            specialGroupScore: specialGroupScore,
            comprehensiveScore: comprehensiveScore,
            data: data
        };
    });

    // 4단계: 특정계층 인원이 적은 경우 청년/중장년으로 재배정 로직
    if (participantAgeGroup === '특정계층') {
        const totalSpecialGroup = counselorScores.reduce((sum, score) => sum + score.specialGroupScore, 0);

        // 특정계층 총 인원이 10명 이하인 경우 청년/중장년으로 분산 배정
        if (totalSpecialGroup <= 10) {
            console.log("특정계층 인원이 적어 청년/중장년으로 분산 배정합니다.");

            // 청년과 중장년 중 더 적은 쪽으로 우선 배정
            const avgYouth = counselorScores.reduce((sum, score) => sum + score.youthScore, 0) / counselorScores.length;
            const avgMiddleAged = counselorScores.reduce((sum, score) => sum + score.middleAgedScore, 0) / counselorScores.length;

            participantAgeGroup = avgYouth <= avgMiddleAged ? '청년' : '중장년';
        }
    }

    // 5단계: 연령대별 배정 우선순위 결정
    let selectedCounselor = null;

    if (participantAgeGroup === '청년') {
        console.log('청년 데이터 등록')
        selectedCounselor = selectCounselorForYouth(counselorScores);
    } else if (participantAgeGroup === '중장년') {
        console.log('중장년 데이터 등록')
        selectedCounselor = selectCounselorForMiddleAged(counselorScores);
    } else if (participantAgeGroup === '특정계층') {
        console.log('특정계층 데이터 등록')
        selectedCounselor = selectCounselorForSpecialGroup(counselorScores);
    }

    // 6단계: 선택된 상담사의 배정 인원 증가
    if (selectedCounselor) {
        const counselorData = counselorAssignments[selectedCounselor];
        counselorData.current++;
        counselorData.total++;
        counselorData.year = (counselorData.year || 0) + 1;

        // 연령대별 카운트 증가
        if (participantAgeGroup === '청년') {
            counselorData.youth = (counselorData.youth || 0) + 1;
        } else if (participantAgeGroup === '중장년') {
            counselorData.middleAged = (counselorData.middleAged || 0) + 1;
        } else if (participantAgeGroup === '특정계층') {
            counselorData.specialGroup = (counselorData.specialGroup || 0) + 1;
        }

        // console.log(`선택된 상담사: ${selectedCounselor} (${participantAgeGroup})`);
        // console.log('현재 배정 현황:', counselorAssignments);
    }

    return selectedCounselor;
}

/**
 * 청년 배정을 위한 상담사 선택
 * 종합점수가 낮으면서 배정인원이 적은 상담사 우선 선택
 */
function selectCounselorForYouth(counselorScores) {
    // 종합점수 기준 정렬 (낮은 순)
    counselorScores.sort((a, b) => {
        if (a.comprehensiveScore !== b.comprehensiveScore) {
            return a.comprehensiveScore - b.comprehensiveScore;
        }
        // 종합점수가 같으면 2025년 배정자 수가 적은 순
        if (a.yearScore !== b.yearScore) {
            return a.yearScore - b.yearScore;
        }
        // 청년 수가 적은 순으로 우선 배정
        return a.youthScore - b.youthScore;
    });

    return counselorScores[0]?.counselor || null;
}

/**
 * 중장년 배정을 위한 상담사 선택
 * 청년 수가 많은 상담사에게 중장년 우선 배정
 */
function selectCounselorForMiddleAged(counselorScores) {
    // 종합점수가 낮으면서 청년 수가 많은 상담사 우선 선택
    counselorScores.sort((a, b) => {
        if (a.comprehensiveScore !== b.comprehensiveScore) {
            return a.comprehensiveScore - b.comprehensiveScore;
        }
        // 종합점수가 같으면 2025년 배정자 수가 적은 순
        if (a.yearScore !== b.yearScore) {
            return a.yearScore - b.yearScore;
        }
        // 청년 수가 많은 순으로 중장년 배정 (균형 조정)
        return b.youthScore - a.youthScore;
    });

    return counselorScores[0]?.counselor || null;
}

/**
 * 특정계층 배정을 위한 상담사 선택
 */
function selectCounselorForSpecialGroup(counselorScores) {
    // 종합점수 기준 정렬 (낮은 순)
    counselorScores.sort((a, b) => {
        if (a.comprehensiveScore !== b.comprehensiveScore) {
            return a.comprehensiveScore - b.comprehensiveScore;
        }
        // 종합점수가 같으면 2025년 배정자 수가 적은 순
        if (a.yearScore !== b.yearScore) {
            return a.yearScore - b.yearScore;
        }
        // 특정계층 수가 적은 순으로 우선 배정
        return a.specialGroupScore - b.specialGroupScore;
    });

    return counselorScores[0]?.counselor || null;
}

/**
 * 개선된 랜덤 테이블 데이터 배정 함수
 * CSV 데이터에서 연령대 정보를 추출하여 적절한 배정 수행
 */
function randomTableData(currentCounselor, counselorAssignments, excludedPersonnel = {}) {
    const $randomTr = $(".csv-data-tr");
    let flag = true;
    let selectedCounselor = null;

    $randomTr.each(function (index) {
        const $row = $(this);
        const rowData = [];

        // 행의 모든 셀 데이터 수집
        $row.find("td.random-td").each(function() {
            rowData.push($(this).text().trim());
        });

        // 연령대 정보 추출 (예: 나이 컬럼에서 연령대 판단)
        // 실제 CSV 구조에 맞게 인덱스 조정 필요
        const participantAgeGroup = determineAgeGroup(rowData);

        // 상담사 배정
        selectedCounselor = dataAssignment(
            currentCounselor,
            counselorAssignments,
            participantAgeGroup,
            excludedPersonnel
        );

        // 배정 실패 시 플래그 설정
        if (selectedCounselor == null) {
            flag = false;
            console.log(`${index + 1}번째 참여자 배정 실패`);
            return false;
        }
        //배정 인원 확인
        assignTable(counselorAssignments, excludedPersonnel);

        // 배정 결과를 테이블에 표시
        $row.find("td.random-td-input").text(selectedCounselor);
    });

    return flag;
}

/**
 * 참여자 데이터에서 연령대, 특정계층 판단 함수
 * @param {Array} rowData - 참여자 행 데이터
 * @returns {string} 연령대 ('청년', '특정계층', '중장년')
 */
function determineAgeGroup(rowData) {
    // 실제 CSV 구조에 맞게 구현 필요
    // 예시: 나이 컬럼이 3번째 인덱스에 있다고 가정
    const birthDate = rowData[1]; // 기본값 25세
    let specificClass = rowData[6];

    let age = createAge(birthDate);

    console.log("age : "+age)

    if (age <= 34) {
        return '청년';
    } else if (age >= 35) {
        return '중장년';
    } else if (specificClass == 'O') {
        return '특정계층';
    }
}

function createAge (birthDate) {
    let todayDate = new Date();
    let newBirthDate = new Date(birthDate);
    let age = todayDate.getFullYear() - newBirthDate.getFullYear();
    let m = todayDate.getMonth() - newBirthDate.getMonth();
    if (m < 0 || (m === 0 && todayDate.getDate() < newBirthDate.getDate())) {
        age--;
    }
    return age;
}


/**
 * 상담사 시각화 자료를 위해 전달받은 데이터를 기반으로 값을 설정
 *
 * @param {Object} counselorAssignments 실시간 상담사 배정 현황 (작업 데이터)
 * @param {Object} excludedPersonnel 배정 제외 상당사 지정
 */
function assignTable(counselorAssignments, excludedPersonnel) {
    const $assignCountTable = $('#assign-count-table');
    const $assignCountTableHeader = $('#assign-count-table-header');
    const $assignCountTableBody = $('#assign-count-table-body');

    //tbody tag를 제거
    $assignCountTableBody.empty();

    //백단에서 전달받은 데이터 id 값을 기준으로 값을 추가.
    Object.keys(counselorAssignments).forEach(counselor => {
        let tableHTML = "<tr class='assign-tr'>";
        tableHTML += "<td class='assign-counselor-td'>" +
            "<input type='checkbox' value='"+counselor+"' id='"+counselor+"' class='assign-counselor-input'>" +
            "<label for='" +counselor+"'>" + counselor + "</label></td>";
        tableHTML += "<td>" + counselorAssignments[counselor].name + "</td>";
        tableHTML += "<td>" + counselorAssignments[counselor].total + "</td>";
        tableHTML += "<td>" + counselorAssignments[counselor].type1 + "</td>";
        tableHTML += "<td>" + counselorAssignments[counselor].type2 + "</td>";
        tableHTML += "<td>" + counselorAssignments[counselor].man + "</td>";
        tableHTML += "<td>" + counselorAssignments[counselor].woman + "</td>";
        tableHTML += "<td>" + counselorAssignments[counselor].youth + "</td>";
        tableHTML += "<td>" + counselorAssignments[counselor].middleAged + "</td>";
        tableHTML += "<td>" + counselorAssignments[counselor].specialGroup + "</td>";
        tableHTML += "<td>" + counselorAssignments[counselor].current + "</td>";
        tableHTML += "<td>" + counselorAssignments[counselor].max + "</td>";
        tableHTML += "</tr>";
        $assignCountTableBody.append(tableHTML);

        $('#'+counselor+'').prop('checked', excludedPersonnel[counselor]);
    })
}


/**
 * // excludedPersonnel = {}
 *
 * @param {Object} excludedPersonnel 제외 상담사를 담을 객체
 */
function excludeCounselor(excludedPersonnel) {
    let $assignCounselorInput = $(".assign-counselor-input");

    $assignCounselorInput.each(function (){
        let $this = $(this);
        let excludedCounselor = $this.val();
        excludedPersonnel[excludedCounselor] = $this.is(":checked");
    })

    let alertMassage = "다음과 같이 배정 제외 설정을 완료했습니다. \n"+Object.entries(excludedPersonnel).map(([key, value]) => key + ' : ' + value).join("\n");
    alert(alertMassage);
}