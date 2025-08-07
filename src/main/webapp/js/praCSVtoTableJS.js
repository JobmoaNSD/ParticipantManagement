
/**
 * CSV 파일 업로드 및 테이블 생성 스크립트
 *
 * 주요 기능:
 * - CSV 파일 유효성 검증
 * - 파일 읽기 및 파싱
 * - HTML 테이블 생성 및 표시
 * - 에러 처리 및 사용자 알림
 * - 상담사 랜덤 배정 알고리즘
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

// ================== 랜덤 배정 알고리즘 시작 ==================

/**
 * 참여자 데이터를 파싱하여 필요한 정보 추출
 *
 * @param {Array} participantRow - 참여자 한 줄 데이터
 * @returns {Object} 파싱된 참여자 정보
 */
function parseParticipantData(participantRow) {
    // CSV 데이터 구조에 맞게 인덱스 조정 (번호, 전담자_계정 제외하고 시작)
    // [번호, 전담자_계정, 참여자 성명, 생년월일, 성별, 모집경로, 참여유형, 진행단계, 특정계층]
    const [, , name, birthDate, gender, recruitmentPath, participationType, progressStage, specificClass] = participantRow;

    // 연령대 계산
    const ageGroup = calculateAgeGroup(birthDate);

    return {
        name: name,
        birthDate: birthDate,
        gender: gender === '남' ? 'man' : 'woman',
        participationType: participationType === '1' ? 'type1' : 'type2',
        ageGroup: ageGroup,
        specificClass: specificClass && specificClass.trim() === 'O' ? 'specialGroup' : 'normal'
    };
}

/**
 * 생년월일로부터 연령대 계산
 *
 * @param {string} birthDate - 생년월일 (YYYY-MM-DD 형식)
 * @returns {string} 'youth' 또는 'middleAged'
 */
function calculateAgeGroup(birthDate) {
    if (!birthDate) return 'youth'; // 기본값

    const birth = new Date(birthDate);
    const today = new Date();
    let age = today.getFullYear() - birth.getFullYear();

    // 생일이 지나지 않았으면 나이 -1
    const monthDiff = today.getMonth() - birth.getMonth();
    if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < birth.getDate())) {
        age--;
    }

    return age <= 34 ? 'youth' : 'middleAged';
}

/**
 * 참여자에게 최적의 상담사를 찾는 함수
 *
 * @param {Object} counselors - 상담사 데이터 객체
 * @param {Object} client - 참여자 정보
 * @returns {string|null} 선택된 상담사 ID 또는 null
 */
function findOptimalCounselorForParticipant(counselors, client) {
    // 1단계: 최대 배정 인원을 초과하지 않은 상담사만 필터링
    const availableCounselors = Object.keys(counselors).filter(counselorId => {
        const counselor = counselors[counselorId];
        return counselor.total < counselor.max;
    });

    if (availableCounselors.length === 0) {
        return null; // 배정 가능한 상담사가 없음
    }

    // 2단계: 총 배정 인원수(total)가 가장 적은 상담사들 찾기
    const minTotal = Math.min(...availableCounselors.map(id => counselors[id].total));
    const minTotalCounselors = availableCounselors.filter(id => counselors[id].total === minTotal);

    // 3단계: 금년도 배정 인원수(year2025)가 가장 적은 상담사들 찾기
    const minYear = Math.min(...minTotalCounselors.map(id => counselors[id].year2025 || 0));
    const candidateCounselors = minTotalCounselors.filter(id => (counselors[id].year2025 || 0) === minYear);

    // 4단계: 후보 상담사들에 대해 점수 계산
    const counselorScores = candidateCounselors.map(counselorId => {
        const counselor = counselors[counselorId];
        return {
            counselorId: counselorId,
            counselor: counselor,
            score: calculateBalanceScore(counselor, client)
        };
    });

    // 5단계: 가장 높은 점수의 상담사 선택
    counselorScores.sort((a, b) => b.score - a.score);

    return counselorScores[0].counselorId;
}

/**
 * 상담사와 참여자의 균형 점수를 계산
 *
 * @param {Object} counselor - 상담사 정보
 * @param {Object} client - 참여자 정보
 * @returns {number} 균형 점수 (높을수록 좋음)
 */
function calculateBalanceScore(counselor, client) {
    let score = 0;

    // 연령대 균형 점수 계산 (가장 중요한 요소)
    const youthCount = counselor.youth || 0;
    const middleAgedCount = counselor.middleAged || 0;

    if (client.ageGroup === 'youth' && middleAgedCount > youthCount) {
        score += 3; // 중장년이 많고 청년을 배정하는 경우
    } else if (client.ageGroup === 'middleAged' && youthCount > middleAgedCount) {
        score += 3; // 청년이 많고 중장년을 배정하는 경우
    } else if (youthCount === middleAgedCount) {
        score += 2; // 동일한 경우
    }

    // 유형 균형 점수 계산
    const type1Count = counselor.type1 || 0;
    const type2Count = counselor.type2 || 0;

    if (client.participationType === 'type1' && type2Count > type1Count) {
        score += 2; // type2가 많고 type1을 배정하는 경우
    } else if (client.participationType === 'type2' && type1Count > type2Count) {
        score += 2; // type1이 많고 type2를 배정하는 경우
    } else if (type1Count === type2Count) {
        score += 1; // 동일한 경우
    }

    // 성별 균형 점수 계산
    const manCount = counselor.man || 0;
    const womanCount = counselor.woman || 0;

    if (client.gender === 'man' && womanCount > manCount) {
        score += 2; // 여성이 많고 남성을 배정하는 경우
    } else if (client.gender === 'woman' && manCount > womanCount) {
        score += 2; // 남성이 많고 여성을 배정하는 경우
    } else if (manCount === womanCount) {
        score += 1; // 동일한 경우
    }

    return score;
}

/**
 * 상담사 데이터를 업데이트 (배정 후)
 *
 * @param {Object} counselor - 상담사 객체
 * @param {Object} client - 참여자 정보
 */
function updateCounselorData(counselor, client) {
    // 총 배정 인원 증가
    counselor.total = (counselor.total || 0) + 1;

    // 금년도 배정 인원 증가
    counselor.year2025 = (counselor.year2025 || 0) + 1;

    // 유형별 증가
    if (client.participationType === 'type1') {
        counselor.type1 = (counselor.type1 || 0) + 1;
    } else {
        counselor.type2 = (counselor.type2 || 0) + 1;
    }

    // 성별 증가
    if (client.gender === 'man') {
        counselor.man = (counselor.man || 0) + 1;
    } else {
        counselor.woman = (counselor.woman || 0) + 1;
    }

    // 연령대별 증가
    if (client.specificClass === 'specialGroup') {
        counselor.specialGroup = (counselor.specialGroup || 0) + 1;
    } else if (client.ageGroup === 'youth') {
        counselor.youth = (counselor.youth || 0) + 1;
    } else {
        counselor.middleAged = (counselor.middleAged || 0) + 1;
    }

    // 현재 배정 인원 증가
    counselor.current = (counselor.current || 0) + 1;
}


/**
 * 배정 제외 인원을 제거한 상담사 데이터 반환
 *
 * @param {Object} counselorsData - 원본 상담사 데이터 객체
 * @param {Object} excludedPersonnel - 배정 제외 인원 객체 (예: {test2: true, test: true, test1: false})
 * @returns {Object} 제외 인원이 제거된 상담사 데이터 객체
 */
function filterExcludedParticipants(counselorsData, excludedPersonnel) {
    console.log("excludedPersonnel:"+excludedPersonnel);
    const excludedIds = extractExcludedIds(excludedPersonnel);
    return filterCounselorsByExcludedIds(counselorsData, excludedIds);
}

/**
 * 제외 인원 객체에서 true 값을 가진 ID만 추출
 *
 * @param {Object} excludedPersonnel - 배정 제외 인원 객체
 * @returns {Array} 제외된 ID 배열
 */
function extractExcludedIds(excludedPersonnel) {
    return Object.keys(excludedPersonnel).filter(counselorId => excludedPersonnel[counselorId] === true);
}

/**
 * 제외된 ID를 기준으로 상담사 데이터 필터링
 *
 * @param {Object} counselorsData - 원본 상담사 데이터 객체
 * @param {Array} excludedIds - 제외할 ID 배열
 * @returns {Object} 필터링된 상담사 데이터 객체
 */
function filterCounselorsByExcludedIds(counselorsData, excludedIds) {
    const filteredCounselors = {};

    Object.keys(counselorsData).forEach(counselorId => {
        if (!excludedIds.includes(counselorId)) {
            filteredCounselors[counselorId] = counselorsData[counselorId];
        }
    });

    return filteredCounselors;
}



/**
 * 상담사 랜덤 배정 알고리즘
 *
 * @param {Object} counselorsData - 상담사 데이터 객체
 * @param {Array} participantData - 참여자 데이터 배열
 * @returns {Array} 배정 결과 배열
 */
function assignParticipantsToCounselors(counselorsData, participantData) {
    const assignmentResults = [];
    // 배정 제외 인원을 제거한 참여자 데이터 생성
    const filteredParticipantData = filterExcludedParticipants(counselorsData, excludedPersonnel);

    // 참여자 데이터를 순회하면서 각각에 대해 최적 상담사 찾기
    participantData.forEach((participant, index) => {
        // 참여자 정보 파싱
        const clientInfo = parseParticipantData(participant);

        // 최적 상담사 찾기
        const assignedCounselorId = findOptimalCounselorForParticipant(filteredParticipantData, clientInfo);

        if (assignedCounselorId) {
            // 상담사에게 배정
            updateCounselorData(filteredParticipantData[assignedCounselorId], clientInfo);

            // 결과 저장
            assignmentResults.push({
                participantIndex: index,
                participantName: clientInfo.name,
                assignedCounselorId: assignedCounselorId,
                assignedCounselorName: filteredParticipantData[assignedCounselorId].name
            });

            // console.log(`${clientInfo.name} → ${counselorsData[assignedCounselorId].name} (${assignedCounselorId})`);
        } else {
            console.warn(`참여자 ${clientInfo.name}에게 배정 가능한 상담사가 없습니다.`);
        }
    });

    return assignmentResults;
}


/**
 * 배정 결과를 UI에 반영
 *
 * @param {Array} results - 배정 결과 배열
 */
function updateAssignmentUI(results) {
    $('#csv-data .csv-data-tr').each(function(index) {
        const result = results.find(r => r.participantIndex === index);
        if (result) {
            // 전담자_계정 컬럼에 배정된 상담사 ID 입력
            $(this).find('.random-td-input').text(result.assignedCounselorId);
        }
    });
}

/**
 * 상담사 테이블 업데이트
 *
 * @param {Object} updatedCounselors - 업데이트된 상담사 데이터
 */
function updateCounselorTable(updatedCounselors) {
    $('#assign-count-table-body').empty();

    Object.keys(updatedCounselors).forEach(counselorId => {
        const counselor = updatedCounselors[counselorId];
        const row = `
            <tr>  
                <td>
                <input type="checkbox" value="${counselorId}" id="${counselorId}" class="assign-counselor-input">
                <label for="${counselorId}">${counselorId}</label>
                </td>
                <td>${counselor.name}</td>
                <td>${counselor.total}</td>
                <td>${counselor.type1 || 0}</td>
                <td>${counselor.type2 || 0}</td>
                <td>${counselor.man || 0}</td>
                <td>${counselor.woman || 0}</td>
                <td>${counselor.youth || 0}</td>
                <td>${counselor.middleAged || 0}</td>
                <td>${counselor.specialGroup || 0}</td>
                <td>${counselor.current || 0}</td>
                <td>${counselor.max}</td>
            </tr>
        `;
        $('#assign-count-table-body').append(row);

        if(excludedPersonnel[counselorId] != null && excludedPersonnel[counselorId] !== undefined)
            $('#'+counselorId+'').prop('checked', excludedPersonnel[counselorId]);
    });
}

/**
 * 랜덤 배정 실행 함수 (UI와 연동)
 */
function executeRandomAssignment() {
    try {
        // CSV 데이터 가져오기
        const participantRows = [];
        $('#csv-data .csv-data-tr').each(function() {
            const rowData = [];
            $(this).find('td').each(function() {
                rowData.push($(this).text().trim());
            });
            participantRows.push(rowData);
        });

        if (participantRows.length === 0) {
            alert('먼저 CSV 파일을 업로드해주세요.');
            return;
        }

        // 상담사 데이터 존재 확인
        if (typeof currentCounselor === 'undefined' || Object.keys(currentCounselor).length === 0) {
            alert('상담사 데이터가 없습니다. 페이지를 새로고침해주세요.');
            return;
        }

        // 상담사 데이터 복사 (원본 보존)
        const counselorsCopy = JSON.parse(JSON.stringify(currentCounselor));

        // 랜덤 배정 실행
        const assignmentResults = assignParticipantsToCounselors(counselorsCopy, participantRows);

        // UI 업데이트
        updateAssignmentUI(assignmentResults);

        // 상담사 테이블 업데이트
        updateCounselorTable(counselorsCopy);

        // 성공 메시지
        const responseTextDiv = $('.response-text-div');
        responseTextDiv.empty();
        responseTextDiv.show();
        responseTextDiv.append('<br><strong style="color: blue;">랜덤 배정이 완료되었습니다. (' + assignmentResults.length + '명 배정)</strong>');

        // console.log('랜덤 배정 완료:', assignmentResults);

    } catch (error) {
        console.error('랜덤 배정 중 오류 발생:', error);
        alert('랜덤 배정 중 오류가 발생했습니다: ' + error.message);
    }
}

/**
 * 데이터 검증 실행 함수 (수정된 버전)
 * CSV 데이터의 유효성을 검증합니다.
 */
function executeDataValidation() {
    const responseTextDiv = $('.response-text-div');
    try {
        responseTextDiv.empty();
        // CSV 데이터 존재 확인
        const csvRows = $('#csv-data .csv-data-tr');
        if (csvRows.length === 0) {
            responseTextDiv.show().html('<strong class="csv-danger">검증할 데이터가 없습니다. CSV 파일을 먼저 업로드해주세요.</strong>');
            return false;
        }

        let validationErrors = [];
        let validRowCount = 0;

        // 각 행 데이터 검증
        csvRows.each(function(index) {
            const rowData = [];
            $(this).find('td').each(function() {
                rowData.push($(this).text().trim());
            });

            // 실제 데이터 행만 검증 (헤더 제외)
            if (rowData.length >= 9) { // 최소 9개 컬럼 확인
                // 행 데이터 유효성 검증
                const rowErrors = validateRowData(rowData, index + 1);
                if (rowErrors.length > 0) {
                    validationErrors = validationErrors.concat(rowErrors);
                } else {
                    validRowCount++;
                }
            }
        });

        // 검증 결과 표시
        responseTextDiv.show();
        if (validationErrors.length === 0) {
            responseTextDiv.html(`<strong style="color: green;">✓ 데이터 검증 완료</strong><br>총 ${validRowCount}건의 데이터가 모두 유효합니다.`);
        } else {
            let errorHtml = `<strong class="csv-danger">✗ 데이터 검증 실패</strong><br>${validationErrors.length}개의 오류가 발견되었습니다.<br>`;
            errorHtml += '<div style="max-height: 200px; overflow-y: auto; margin-top: 10px; padding: 10px; border: 1px solid #ddd; background-color: #f9f9f9;">';
            errorHtml += '<ul style="margin: 0; padding-left: 20px; font-size: 0.9em;">';
            validationErrors.forEach(error => {
                errorHtml += `<li style="margin-bottom: 5px;">${error}</li>`;
            });
            errorHtml += '</ul></div>';
            responseTextDiv.html(errorHtml);
        }

        return validationErrors.length === 0;

    } catch (error) {
        console.error('데이터 검증 중 오류 발생:', error);
        responseTextDiv.show().html('<strong class="csv-danger">데이터 검증 중 시스템 오류가 발생했습니다.</strong>');
        return false;
    }
}


/**
 * 개별 행 데이터 유효성 검증 (수정된 버전)
 *
 * @param {Array} rowData - 행 데이터 배열
 * @param {number} rowNumber - 행 번호
 * @returns {Array} 오류 메시지 배열
 */
function validateRowData(rowData, rowNumber) {
    const errors = [];

    // 데이터 구조: [번호, 전담자_계정, 참여자 성명, 생년월일, 성별, 모집경로, 참여유형, 진행단계, 특정계층]
    const [number, counselorAccount, name, birthDate, gender, recruitmentPath, participationType, progressStage, specificClass] = rowData;

    // 필수 필드 검증
    if (!name || name.trim() === '') {
        errors.push(`${rowNumber}행: 참여자 성명이 비어있습니다.`);
    }

    // 생년월일 검증 (기존 praDataVerification.js의 validateBirthDate 함수 사용)
    if (birthDate && birthDate.trim() !== '') {
        const birthValidation = validateBirthDate(birthDate.trim());
        if (!birthValidation.isValid) {
            errors.push(`${rowNumber}행: ${birthValidation.message} (입력값: ${birthDate})`);
        }
    } else {
        errors.push(`${rowNumber}행: 생년월일이 비어있습니다.`);
    }

    // 성별 검증
    if (!gender || gender.trim() === '') {
        errors.push(`${rowNumber}행: 성별이 비어있습니다.`);
    } else if (gender.trim() !== '남' && gender.trim() !== '여') {
        errors.push(`${rowNumber}행: 성별은 '남' 또는 '여'만 입력 가능합니다. (입력값: ${gender})`);
    }

    // 참여유형 검증
    if (!participationType || participationType.trim() === '') {
        errors.push(`${rowNumber}행: 참여유형이 비어있습니다.`);
    } else if (participationType.trim() !== '1' && participationType.trim() !== '2') {
        errors.push(`${rowNumber}행: 참여유형은 '1' 또는 '2'만 입력 가능합니다. (입력값: ${participationType})`);
    }

    // 모집경로 검증 (필수 필드로 추가)
    if (!recruitmentPath || recruitmentPath.trim() === '') {
        errors.push(`${rowNumber}행: 모집경로가 비어있습니다.`);
    }

    // 진행단계 검증 (필수 필드로 추가)
    if (!progressStage || progressStage.trim() === '') {
        errors.push(`${rowNumber}행: 진행단계가 비어있습니다.`);
    }

    // 특정계층 검증 (선택사항이지만 값이 있다면 'O' 또는 'X' 또는 빈값만 허용)
    if (specificClass && specificClass.trim() !== '' &&
        specificClass.trim() !== 'O' && specificClass.trim() !== 'X') {
        errors.push(`${rowNumber}행: 특정계층은 'O', 'X' 또는 빈값만 입력 가능합니다. (입력값: ${specificClass})`);
    }

    return errors;
}


/**
 * 배정 데이터 저장 함수 (수정된 버전)
 * 서버로 배정 결과를 전송합니다.
 */
function executeDataSave() {
    const responseTextDiv = $('.response-text-div');

    try {
        // CSV 데이터 존재 확인
        const csvRows = $('#csv-data .csv-data-tr');
        if (csvRows.length === 0) {
            responseTextDiv.show().html('<strong class="csv-danger">저장할 데이터가 없습니다. CSV 파일을 먼저 업로드해주세요.</strong>');
            return false;
        }

        // 배정 데이터 수집 (ParticipantRandomAssignmentDTO 형식에 맞게)
        const assignmentDataList = [];
        let unassignedCount = 0;

        csvRows.each(function(index) {
            const row = $(this);
            const cells = row.find('td');

            // CSV 데이터 구조: [번호, 전담자_계정, 참여자 성명, 생년월일, 성별, 모집경로, 참여유형, 진행단계, 특정계층]
            const counselorId = cells.eq(1).text().trim(); // 전담자_계정
            const participantName = cells.eq(2).text().trim(); // 참여자 성명
            const birthDate = cells.eq(3).text().trim(); // 생년월일
            const gender = cells.eq(4).text().trim(); // 성별
            const recruitmentPath = cells.eq(5).text().trim(); // 모집경로
            const participationType = cells.eq(6).text().trim(); // 참여유형
            const progressStage = cells.eq(7).text().trim(); // 진행단계
            const specificClass = cells.eq(8).text().trim(); // 특정계층

            if (!counselorId || counselorId === '') {
                unassignedCount++;
            } else {
                // ParticipantRandomAssignmentDTO 구조에 맞게 데이터 생성
                const assignmentDTO = {
                    counselorID: counselorId,
                    participant: participantName,
                    birthDate: birthDate,
                    gender: gender,
                    recruitmentPath: recruitmentPath,
                    participationType: participationType,
                    progressStage: progressStage,
                    specificClass: specificClass
                    // condition과 branch는 서버에서 설정됨
                };

                assignmentDataList.push(assignmentDTO);
            }
        });

        // 미배정 참여자 확인
        if (unassignedCount > 0) {
            if (!confirm(`${unassignedCount}명의 참여자가 아직 배정되지 않았습니다. 그래도 저장하시겠습니까?`)) {
                return false;
            }
        }

        // 저장할 데이터가 없는 경우
        if (assignmentDataList.length === 0) {
            responseTextDiv.show().html('<strong class="csv-danger">저장할 배정 데이터가 없습니다.</strong>');
            return false;
        }

        // 저장 확인
        if (!confirm(`총 ${assignmentDataList.length}명의 배정 데이터를 저장하시겠습니까?`)) {
            return false;
        }

        // 로딩 상태 표시
        responseTextDiv.show().html('<strong style="color: blue;">데이터 저장 중...</strong>');

        // 서버로 데이터 전송 (올바른 URL과 데이터 구조)
        $.ajax({
            url: '/api/pra.login', // PraAsyncAPI의 올바른 엔드포인트
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(assignmentDataList), // 배열 직접 전송
            success: function(response) {
                if (response === true) {
                    responseTextDiv.html('<strong style="color: green;">✓ 데이터가 성공적으로 저장되었습니다.</strong>');
                    console.log('저장 성공:', response);
                } else {
                    responseTextDiv.html('<strong class="csv-danger">✗ 데이터 저장에 실패했습니다.</strong>');
                    console.error('저장 실패:', response);
                }
            },
            error: function(xhr, status, error) {
                console.error('저장 중 오류 발생:', error);
                console.error('응답 상태:', xhr.status);
                console.error('응답 내용:', xhr.responseText);

                let errorMessage = '데이터 저장 중 오류가 발생했습니다.';
                if (xhr.status === 400) {
                    errorMessage += ' (잘못된 요청)';
                } else if (xhr.status === 500) {
                    errorMessage += ' (서버 오류)';
                }

                responseTextDiv.html(`<strong class="csv-danger">✗ ${errorMessage}</strong>`);
            }
        });

        return true;

    } catch (error) {
        console.error('데이터 저장 중 클라이언트 오류 발생:', error);
        responseTextDiv.show().html('<strong class="csv-danger">데이터 저장 중 오류가 발생했습니다.</strong>');
        return false;
    }
}


// ================== 이벤트 바인딩 ==================

$(document).ready(function() {
    // 파일 업로드 이벤트
    $('.file-input').on('change', readCsvFile);

    // 랜덤 배정 버튼 이벤트
    $('.random-button-label').on('click', function() {
        if (confirm('참여자 랜덤 배정을 시작하시겠습니까?')) {
            executeRandomAssignment();
        }
    });

    // 초기화 버튼 이벤트
    $('.reset-button-label').on('click', function() {
        if (confirm('배정 결과를 초기화하시겠습니까?')) {
            $('#csv-data .random-td-input').text('');
            $('.response-text-div').hide().empty();
            updateCounselorTable(currentCounselor);
            excludedPersonnel = {};
            console.log('배정 결과가 초기화되었습니다.');
        }
    });

    // 도움말 버튼 이벤트
    $('#helpButton').on('click', function() {
        $('.title-sub-header').toggle();
    });

    // 저장 버튼 이벤트 추가
    $('#save-button').on('click', function() {
        executeDataSave();
    });

    // 데이터 검증 버튼 이벤트 추가
    $('#varification-button').on('click', function() {
        executeDataValidation();
    });

    //배정 제외 상담사 선택
    $('#excludeBtn').on('click', function() {
        excludeCounselor(excludedPersonnel);
    })
});

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
 * 최적의 상담사를 찾는 함수
 *
 * @param {Object.<string, {name:string, total:number, type1:number, type2:number, man:number, woman:number, year:number, youth:number, middleAged:number, specialGroup:number, current:number, max:number}>} counselorsData - 상담사 데이터 객체
 * @param {{ageGroup: 'youth'|'middleAged', type: 'type1'|'type2', gender: 'man'|'woman'}} newClient - 새로운 클라이언트 정보
 * @returns {string|null} 선택된 상담사 ID 또는 null (배정 불가능한 경우)
 */
function findOptimalCounselor(counselorsData, newClient) {
    // 1단계: 용량별 필터링 (total >= max인 상담사 제외)
    const availableCounselors = Object.keys(counselorsData).filter(counselorId => {
        const counselor = counselorsData[counselorId];
        return counselor.total < counselor.max;
    });

    // 배정 가능한 상담사가 없는 경우
    if (availableCounselors.length === 0) {
        return null;
    }

    // 2단계: 최소 총 배정 수(total) 찾기
    const minTotal = Math.min(...availableCounselors.map(id => counselorsData[id].total));
    const minTotalCounselors = availableCounselors.filter(id => counselorsData[id].total === minTotal);

    // 3단계: 최소 올해 배정 수(year) 찾기
    const minYear = Math.min(...minTotalCounselors.map(id => counselorsData[id].year2025 || counselorsData[id].year || 0));
    const minYearCounselors = minTotalCounselors.filter(id => (counselorsData[id].year2025 || counselorsData[id].year || 0) === minYear);

    // 한 명만 남은 경우 해당 상담사 반환
    if (minYearCounselors.length === 1) {
        return minYearCounselors[0];
    }

    // 4단계: 밸런스 점수 계산을 통한 최적 후보 선택
    const counselorScores = minYearCounselors.map(counselorId => {
        const counselor = counselorsData[counselorId];
        let balanceScore = 0;

        // 연령 밸런스 점수 (+1점)
        const youthCount = counselor.youth || 0;
        const middleAgedCount = counselor.middleAged || 0;

        if (youthCount === middleAgedCount) {
            // 동일한 경우 누구를 배정해도 차별화 개선
            balanceScore += 1;
        } else if (youthCount > middleAgedCount && newClient.ageGroup === 'middleAged') {
            // 청년이 더 많고 신규 클라이언트가 중장년
            balanceScore += 1;
        } else if (middleAgedCount > youthCount && newClient.ageGroup === 'youth') {
            // 중장년이 더 많고 신규 클라이언트가 청년
            balanceScore += 1;
        }

        // 유형 밸런스 점수 (+1점)
        const type1Count = counselor.type1 || 0;
        const type2Count = counselor.type2 || 0;

        if (type1Count < type2Count && newClient.type === 'type1') {
            // type1이 적고 신규 클라이언트가 type1
            balanceScore += 1;
        } else if (type2Count < type1Count && newClient.type === 'type2') {
            // type2가 적고 신규 클라이언트가 type2
            balanceScore += 1;
        }

        // 성별 밸런스 점수 (+1점)
        const manCount = counselor.man || 0;
        const womanCount = counselor.woman || 0;

        if (manCount < womanCount && newClient.gender === 'man') {
            // 남성이 적고 신규 클라이언트가 남성
            balanceScore += 1;
        } else if (womanCount < manCount && newClient.gender === 'woman') {
            // 여성이 적고 신규 클라이언트가 여성
            balanceScore += 1;
        }

        return {
            counselorId,
            balanceScore,
            counselor
        };
    });

    // 5단계: 최고 밸런스 점수를 가진 상담사들 찾기
    const maxScore = Math.max(...counselorScores.map(item => item.balanceScore));
    const topScoreCounselors = counselorScores.filter(item => item.balanceScore === maxScore);

    // 타이브레이커: 첫 번째 상담사 반환
    return topScoreCounselors[0].counselorId;
}

/**
 * // excludedPersonnel = []
 *
 // * @param {Array} excludedPersonnel 제외 상담사를 담을 객체
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