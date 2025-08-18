$(document).ready(function(){
    const $card_mypage_body = $('#card-mypage-body');
    const $checkPasswordBtn = $('#checkPasswordBtn');
    const $checkPassword = $('#checkPassword');
    const $changeAccount = $('#changeAccount');
    let password_check_flag = false;
    let password_change_flag = false;
    
    //변경 버튼 숨김처리
    $changeAccount.hide();

    const exampleData = {
        "memberBranch": {name:"지점",val: "서울 강남 지점", type: "text"},
        "memberUserName": {name:"이름",val: "남상도", type: "text"},
        "memberUserID": {name:"아이디",val: "nsd2000", type: "text"},
        "memberPhoneNumber": {name:"대표번호(내선)",val: "02-2607-9119(609)", type: "phone"},
        "memberUserChangePW": {name:"변경비밀번호",val: "", type: "password"},
        "memberUserChangePWOK": {name:"변경비밀번호확인",val: "", type: "password"},
        "memberRegDate": {name:"등록일",val: "2025-01-20", type: "date"},
        "memberUniqueNumber": {name:"고유번호",val: "SN-202501-101", type: "text"},
        "memberTodayEmployment": {name:"금일 일반 취업",val: 3, type: "number"},
        "memberTodayPlacement": {name:"금일 알선 취업",val: 2, type: "number"},
        "memberToWeekEmployment": {name:"금주 일반 취업",val: 15, type: "number"},
        "memberToWeekPlacement": {name:"금주 알선 취업",val: 11, type: "number"},
        "memberToMonthEmployment": {name:"금월 일반 취업",val: 62, type: "number"},
        "memberToMonthPlacement": {name:"금월 알선 취업",val: 48, type: "number"},
        "memberToYearEmployment": {name:"금년 일반 취업",val: 540, type: "number"},
        "memberToYearPlacement": {name:"금년 알선 취업",val: 397, type: "number"},
        "endUpdateStatus": {name:"업데이트일자",val: "2025-08-18", type: "date"},
        "memberJoinedDate": {name:"입사일",val: "2023-03-15", type: "date"},
        "memberAssignedDate": {name:"발령일",val: "2023-04-01", type: "date"},
        "memberContinuous": {name:"근속구분",val: "1년이상", type: "text"}
    };

    $checkPasswordBtn.on('click', function(){

/*
        // 예시 데이터
        $changeAccount.show();
        password_check_flag = true;
        $card_mypage_body.empty();
        changeCardBody(exampleData);

        //확인 완료 후 날짜 기반으로 데이터 초기화
        initializeDateValues();
*/

        // TODO FIXME 백단 제작 후 변경예정
        fetch('checkPassword.login', {
            Method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                memberUserPW: $checkPassword.val()
            })
        })
            .then(r => {
                const result = r.json();
                const status = r.status;
                if (status === 200) {
                    //변경 버튼 숨김처리
                    $changeAccount.show();
                    password_check_flag = true;
                    $card_mypage_body.empty();
                    changeCardBody(result);
                }

        })
            .catch(e => {
                console.log(e);
            })


    })

    function changeCardBody(data){
        let htmlBody = '';
        Object.keys(data).forEach(function(key){
            htmlBody += `<div class="col-md-12 d-flex align-items-center m-0">
                                    <p class="col-md-2">${data[key].name}</p>
                                    <div id="${key}_div" class="${key} text-center col-md-10 m-0 h-100"">
                                        ${changeData(data,key)}
                                    </div>
                                </div>`
        })
        $card_mypage_body.append(htmlBody);
    }

    function changeData(data, key){
        let htmlData = `<input type="${data[key].type}" class="form-control" id="${key}" name="${key}" value="${data[key].val}">`;
        if(key === 'memberBranch' || key === 'memberUserName' || key === 'memberUserID' || key === 'memberRegDate' || key === 'memberUniqueNumber' || key === 'endUpdateStatus' || key === 'memberJoinedDate' || key === 'memberAssignedDate' || key === 'memberContinuous'){
            htmlData = `<p class="${key} text-center col-md-10 m-0 h-100" id="${key}" style="font-size: 1rem;">${data[key].val}</p>`;
        }

        return htmlData;
    }


    $(document).on('input', "#memberUserChangePW", function(){
        password_change_flag = changePasswordFlagFunction($(this));

        console.log("memberUserChangePW password_change_flag: " + password_change_flag);
    })

    $(document).on('input', "#memberUserChangePWOK", function(){
        password_change_flag = changePasswordFlagFunction($(this));

        console.log("memberUserChangePWOK password_change_flag: " + password_change_flag);
    })

    function changePasswordFlagFunction(element) {
        let flag = passwordRegexCheck(element)
        if (flag) {
            flag = changePassword();
        }
        return flag;
    }

    //비밀번호 변경 확인
    function passwordRegexCheck(element){
        const $memberUserChangePWOK_div = $('#memberUserChangePWOK_div');

        if(element.val() === ''){
            element.css('border-color', '#565454E8');
            $("#errorRegexPasswordDiv").remove();
            return false;
        }
        const regex = /^(?=.*[a-zA-Z])(?=.*[!@#$%^&*])(?=.*[0-9])(?=.{6,})/;

        if(regex.test(element.val())){
            element.css('border-color', '#13e749');
            $("#errorRegexPasswordDiv").remove();
            return true;
        }
        else{
            $("#errorRegexPasswordDiv").remove();
            element.css('border-color', '#ff0000');
            let errorHTML = `<div id="errorRegexPasswordDiv" style="color:#ff0000;">영문 대소문자, 특수문자 [!@#$%^&*], 숫자 포함 6자리입니다.</div>`;
            $memberUserChangePWOK_div.append(errorHTML)
            return false;
        }
    }

    function changePassword(){
        const $memberUserChangePW = $('#memberUserChangePW');
        const $memberUserChangePWOK = $('#memberUserChangePWOK');
        const $memberUserChangePWOK_div = $('#memberUserChangePWOK_div');

        if ($memberUserChangePW.val() === $memberUserChangePWOK.val()) {
            $memberUserChangePWOK.css('border-color', '#13e749');
            $("#errorPasswordDiv").remove();
            return true;
        }
        else{
            $("#errorPasswordDiv").remove();
            $memberUserChangePWOK.css('border-color', '#ff0000');
            let errorHTML = `<div id="errorPasswordDiv" style="color:#ff0000;">입력한 패스워드가 틀립니다.</div>`;
            $memberUserChangePWOK_div.append(errorHTML)
            return false;
        }
    }

    // 선택자 상수
    const SELECTORS = {
        TODAY_EMPLOYMENT: '#memberTodayEmployment',
        WEEK_EMPLOYMENT: '#memberToWeekEmployment',
        MONTH_EMPLOYMENT: '#memberToMonthEmployment',
        YEAR_EMPLOYMENT: '#memberToYearEmployment',
        TODAY_PLACEMENT: '#memberTodayPlacement',
        WEEK_PLACEMENT: '#memberToWeekPlacement',
        MONTH_PLACEMENT: '#memberToMonthPlacement',
        YEAR_PLACEMENT: '#memberToYearPlacement'
    };

    // 각 행의 이전 값을 저장하기 위한 Map
    const previousValues = {
        employment: new Map(),
        placement: new Map()
    };

    // 문자열을 숫자로 안전하게 변환
    const parseNumericValue = (value) => parseFloat(value) || 0;

    // 특정 행의 누적 실적 값 업데이트
    const updateRowValues = (difference, type) => {
        const fields = type === 'employment'
            ? [SELECTORS.WEEK_EMPLOYMENT, SELECTORS.MONTH_EMPLOYMENT, SELECTORS.YEAR_EMPLOYMENT]
            : [SELECTORS.WEEK_PLACEMENT, SELECTORS.MONTH_PLACEMENT, SELECTORS.YEAR_PLACEMENT];

        fields.forEach(selector => {
            const input = $(selector);
            const currentValue = parseNumericValue(input.val());
            input.val(currentValue + difference);
        });
    };

    // 일일 실적 변경 이벤트 처리 (취업)
    $(document).on('change', SELECTORS.TODAY_EMPLOYMENT, function() {
        handleValueChange(this, 'employment');
    });

    // 일일 실적 변경 이벤트 처리 (알선)
    $(document).on('change', SELECTORS.TODAY_PLACEMENT, function() {
        handleValueChange(this, 'placement');
    });

    // 값 변경 처리 함수
    const handleValueChange = (element, type) => {
        const elementId = $(element);
        const previousValue = previousValues[type].get(element) || 0;
        const newValue = parseNumericValue(elementId.val());
        const difference = newValue - previousValue;

        updateRowValues(difference, type);
        previousValues[type].set(element, newValue);
    };


    // 날짜 검사 및 초기화
    const initializeDateValues = () => {
        const lastSavedDate = $('#endUpdateStatus').text();
        console.log(lastSavedDate);

        const resetSelectors = {
            year: [SELECTORS.YEAR_EMPLOYMENT, SELECTORS.YEAR_PLACEMENT],
            month: [SELECTORS.MONTH_EMPLOYMENT, SELECTORS.MONTH_PLACEMENT],
            week: [SELECTORS.WEEK_EMPLOYMENT, SELECTORS.WEEK_PLACEMENT],
            day: [SELECTORS.TODAY_EMPLOYMENT, SELECTORS.TODAY_PLACEMENT, SELECTORS.TODAY_PERSONNEL_ONE_TYPE, SELECTORS.TODAY_PERSONNEL_TWO_TYPE]
        };

        if (!isDate(lastSavedDate, 'year')) {
            resetSelectors.year.forEach(selector => $(selector).val(0));
        }
        if (!isDate(lastSavedDate, 'month')) {
            resetSelectors.month.forEach(selector => $(selector).val(0));
        }
        if (!isDate(lastSavedDate, 'week')) {
            resetSelectors.week.forEach(selector => $(selector).val(0));
        }
        if (!isDate(lastSavedDate, 'day')) {
            resetSelectors.day.forEach(selector => $(selector).val(0));
        }
    };

    const isDate = (date, condition) => {
        date = new Date(date);
        let today = new Date();
        if(condition === 'year'){
            return today.getFullYear() === date.getFullYear();
        }
        else if(condition === 'month'){
            return today.getMonth() === date.getMonth();
        }
        else if(condition === 'week'){
            return getWeek(today) === getWeek(date);
        }
        else if(condition === 'day'){
            return today.getDate() === date.getDate();
        }
        return false;
    }

    const getWeek = (date) => {
        const currentDate = new Date(date);

        // 현재 날짜가 속한 주의 월요일 찾기
        const currentMonday = new Date(currentDate);
        const day = currentDate.getDay();
        const diff = day === 0 ? -6 : 1 - day; // 일요일(0)일 경우 이전 주 월요일로
        currentMonday.setDate(currentDate.getDate() + diff);

        // 해당 년도의 첫 번째 날짜
        const firstDayOfYear = new Date(currentDate.getFullYear(), 0, 1);

        // 해당 년도의 첫 번째 월요일 찾기
        const firstMonday = new Date(firstDayOfYear);
        const firstDay = firstDayOfYear.getDay();
        const firstDiff = firstDay === 0 ? 1 : 9 - firstDay;
        firstMonday.setDate(firstDayOfYear.getDate() + firstDiff - 7);

        // 첫 번째 월요일부터 현재 월요일까지의 차이를 계산
        const diffDays = Math.floor((currentMonday - firstMonday) / (1000 * 60 * 60 * 24));

        return Math.floor(diffDays / 7) + 1;
    };


    $(document).on('click', '#changeAccount', function(){
        const $form_control = $(".form-control");
        const data = {};
        $form_control.each(function(){
            data[$(this).attr('name')] = $(this).val();
        })
        console.log(data);
        if (passwordChangeCheck()){
            // TODO FIXME 백단 제작 후 변경예정
            const result = fetch('changeAccount.login', {
                Method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({data})
            })
                .catch(e => {
                        console.log(e);
                    })

            result.then(r => {
                console.log(r);
            })
                .catch(e => {
                    console.log(e);
                })
            console.log("changeAccount success");
        }
        else{
            console.log("changeAccount fail");
        }
    })

    function passwordChangeCheck(){
        if(password_change_flag){
            if (confirm("비밀번호도 같이 변경됩니다.\n정말 수정하시겠습니까?")) {
                return true;
            }
        }
    }

})