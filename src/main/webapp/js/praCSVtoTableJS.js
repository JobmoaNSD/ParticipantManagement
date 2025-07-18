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
    }

    // 파일을 텍스트 형태로 읽기 시작
    fileReader.readAsText(fileData, 'UTF-8');
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
        let table = '<table class="table table-striped">';
        table += '<thead><tr>';

        // 첫 번째 행을 테이블 헤더로 처리
        if (data.length > 0) {
            for (let j = 0; j < data[0].length; j++) {
                if (j === 0) {
                    table += '<th>전담자 계정</th>';
                }
                table += '<th>' + escapeHtml(data[0][j]) + '</th>';
            }
        }
        table += '</tr></thead><tbody>';

        // 나머지 데이터를 테이블 바디로 처리
        for (let i = 1; i < data.length; i++) {
            table += '<tr class="csv-data-tr">';
            for (let j = 0; j < data[i].length; j++) {
                if (j === 0) {
                    table += '<td class="random-td-input" ><input type="text" class="random-input" id="random-'+(i+1)+' readonly"></td>';
                }
                table += '<td>' + escapeHtml(data[i][j]) + '</td>';
            }
            table += '</tr>';
        }
        table += '</tbody></table>';

        // 5단계: 생성된 테이블을 DOM에 삽입
        $('#csvData').html(table);

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