$(document).ready(function () {
    // <%-- form 전달 시작 --%>
    const btn_check = $("#btn_check") // 전송 버튼을 추가
    btn_check.on("click", function () {
        //참여자 성명
        const basicParticVal = $("#basicPartic").val();
        //취업역량
        const counselJobSkill = $("#counselJobSkill");
        let counselJobSkillVal = counselJobSkill.val();
        //진행단계
        const counselProgress = $("#counselProgress");
        let counselProgressVal = counselProgress.val();
        //초기상담일
        const counselInItCons = $("#counselInItCons");
        let counselInItConsVal = counselInItCons.val();
        //최근상담일
        const counselLastCons = $("#counselLastCons");
        let counselLastConsVal = counselLastCons.val();
        //IAP 수립일
        const counselIAPDateVal = $("#counselIAPDate").val();
        //IAP 수립일 3개월차
        const counselIAP3Month = $("#counselIAP3Month");
        const counselIAP3MonthVal = counselIAP3Month.val();
        //IAP 수립일 5개월차
        const counselIAP5Month = $("#counselIAP5Month");
        const counselIAP5MonthVal = counselIAP5Month.val();
        //취창업일
        const employmentStartDateVal = $("#employmentStartDate").val();
        //취창업처리일
        const employmentProcDateVal = $("#employmentProcDate").val();
        //퇴사일
        const employmentQuitVal = $("#employmentQuit").val();
        //취업유형
        const employmentEmpTypeVal = $("#employmentEmpType").val();
        //취업처
        const employmentLoyerVal = $("#employmentLoyer").val();
        //임금
        const employmentSalaryVal = $("#employmentSalary").val();
        //취업인센티브_구분
        const employmentIncentiveVal = $("#employmentIncentive").val();

        //기간만료일
        let counselEXPDateVal = $("#counselEXPDate").val();

        //flag 변수 생성
        //각 변수들이 비어 있다면 값이 없는 것으로 간주하여 form 태그 실행 함수에서 내보낸다.
        let flag = basicParticVal.length > 0;
        if(!flag){
            alertDefaultInfo("참여자 성명은 필수 입력 입니다.","참여자를 입력해주세요.");
            return;
        }
        else if(counselIAPDateVal.length > 0){
            //iap 전 상태에서 iap 수립일을 작성하고 등록 OR 저장하면 경고 출력
            //iap 수립일이 비어있지 않은 상태로
            // iap 3개월차, 5개월차 칸이 비어있다면 입력 요청 후 함수에서 내보낸다.
            if(!counselIAP3MonthVal.length > 0){
                alertDefaultInfo("IAP 3개월차가 비어있습니다.","IAP 3개월 이후 일자를 입력해주세요.");
                counselIAP3Month.focus();
                return;
            }
            else if(!counselIAP5MonthVal.length > 0){
                alertDefaultInfo("IAP 5개월차가 비어있습니다.","IAP 5개월 이후 일자를 입력해주세요.");
                counselIAP5Month.focus();
                return;
            }
            // iap 관련 일자가 모두 입력된 상태로 진행단계가 IAP 전으로 작성되어 있다면 IAP 후로 변경
            if(counselProgressVal == "IAP 전"){
                counselProgress.val("IAP 후")
            }

        }
        else if ((counselProgressVal == "미고보" || counselProgressVal == "고보일반" || counselProgressVal == "등록창업" || counselProgressVal == "미등록창업" ||
            counselProgressVal == "미취업사후종료" || counselProgressVal == "이관" || counselProgressVal == "중단") && counselEXPDateVal == ''){
            alertDefaultInfo("현재 선택한 진행단계의 "+counselProgressVal+"은/는 기간만료(예정)일은 필수로 입력되어야 합니다.");
            return;
        }


        // 초기상담일이 비어있는 상태라면 최근상담일이 초기상담일이 입력된다는 안내를 출력한다.
        if(!counselInItConsVal.length > 0){
            // alertDefaultQuestion('초기상담일이 작성되지 않았습니다.','최근상담일을 초기상담일로 작성합니다.')
            counselInItCons.val(counselLastConsVal);
            // return;
        }

        //취창업일이 비어있고 임금 OR 취업인센티브_구분이 비어있다면 함수에서 내보낸다.
        if(!employmentStartDateVal.length > 0){
            //임금이 작성되어 있거나
            flag = employmentSalaryVal.length > 0;
            //취업인센티브_구분이 선택되어 있다면
            flag = flag || employmentIncentiveVal.length > 0;

            flag = flag || employmentProcDateVal.length > 0;
            flag = flag || employmentQuitVal.length > 0;
            flag = flag || (employmentEmpTypeVal != null?employmentEmpTypeVal.length > 0:false);
            flag = flag || (employmentLoyerVal != null?employmentLoyerVal.length > 0:false);
            if(flag){
                alertDefaultInfo("취창업일을 입력해주세요.","");
                return;
            }
        }
        else {
            //임금이 작성되어 있거나
            if (!employmentSalaryVal.length > 0){
                alertDefaultInfo("임금은 필수 입력입니다.","");
                return;
            }
            //취업인센티브_구분이 선택되어 있다면
            if (!employmentIncentiveVal.length > 0){
                alertDefaultInfo("취업인센티브_구분은 필수 입력입니다.","");
                return;
            }
        }

        const form = $("#participantsForm");
        form.submit();
    });
// <%-- form 전달 끝 --%>

// <%-- 사용자 편의성을 위해 목록 리스트 출력 시작 --%>
    //자격증 목록 리스트 출력
    $(document).on("focus", ".particcertifCertif", function () {
        recommendFunction($(this), "#basicParticcertiflist",xmlData("./XMLData/particcertifXMLData.xml", "particcertif name"));
    });

    //학교명 목록 리스트 출력
    recommendFunction("#basicSchool", "#basicSchoollist",xmlData("./XMLData/SchoolXMLData.xml", "school name"));
// <%-- 사용자 편의성을 위해 목록 리스트 출력 끝 --%>

// <%-- IAP 수립일 기준 3,5개월 일자 지정 시작 --%>
    const counselIAPDate = $('#counselIAPDate');

    if(counselIAPDate.val().length > 0){

        //IAP 수립일 3개월 INPUT TAG 변수
        const counselIAP3Month = $('#counselIAP3Month')
        const counselIAP5Month = $('#counselIAP5Month')

        //활성화
        counselIAP3Month.attr("disabled", false);
        counselIAP5Month.attr("disabled", false);
    }

    counselIAPDate.on("change", function () {
        //IAP 수립일 값 가져온 변수
        const counselIAPDate = $('#counselIAPDate');
        const counselIAPDateVal = counselIAPDate.val();

        //IAP 수립일 3개월 INPUT TAG 변수
        const counselIAP3Month = $('#counselIAP3Month')
        const counselIAP5Month = $('#counselIAP5Month')

        console.log('변경 진행')
        if(counselIAPDateVal.length > 0){
            //사용자가 IAP 수립일을 입력하면
            //IAP3개월일자, IAP5개월일자 DISABLE를 제거
            counselIAP3Month.attr("disabled", false);
            counselIAP5Month.attr("disabled", false);

            //3개월, 5개월 자동 계산 함수 실행
            iapDateChangeFunction(counselIAPDateVal,counselIAP3Month,counselIAP5Month)
        }
        else{
            //IAP 수립일을 지우면 DISABLE를 추가
            counselIAP3Month.attr("disabled", true);
            counselIAP5Month.attr("disabled", true);
            //IAP3개월일자, IAP5개월일자를 제거
            counselIAP3Month.val("");
            counselIAP5Month.val("");
        }


    })

    //IAP 수립일을 받아오고
    //받아온 IAP 날짜에 m +3 / m +5 를 진행
    //3개월 후 일자와 5개월 후 일자를 구한 후 input tag에 입력
    function iapDateChangeFunction(counselIAPDateVal,counselIAP3Month,counselIAP5Month) {
        console.log('counselIAPDateVal : ['+counselIAPDateVal+']')

        // 날짜로 변환 시작
        const baseDate = new Date(counselIAPDateVal);
        //3개월
        const iap3MonthUpdate = new Date(baseDate);
        iap3MonthUpdate.setMonth(baseDate.getMonth() + 3);
        //5개월
        const iap5MonthUpdate = new Date(baseDate);
        iap5MonthUpdate.setMonth(baseDate.getMonth() + 5);
        // 날짜로 변환 끝

        //Date Format 변환 및 Div Data 추가 시작
        //3개월
        const iap3MonthUpdateVal = formatDate(iap3MonthUpdate);
        counselIAP3Month.val(iap3MonthUpdateVal);
        //5개월
        const iap5MonthUpdateVal = formatDate(iap5MonthUpdate);
        counselIAP5Month.val(iap5MonthUpdateVal);
        //Date Format 변환 및 Div Data 추가 끝
    }

    // YYYY-MM-DD 형식으로 포맷팅
    const formatDate = (date) => {
        const year = date.getFullYear();
        const month = String(date.getMonth() + 1).padStart(2, '0');
        const day = String(date.getDate()).padStart(2, '0');
        return year+'-'+month+'-'+day;
    };
// <%-- IAP 수립일 기준 3,5개월 일자 지정 끝 --%>


})
