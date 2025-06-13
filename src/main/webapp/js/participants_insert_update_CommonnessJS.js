// <%-- form 전달 시작 --%>
const btn_check = $("#btn_check") // 전송 버튼을 추가
btn_check.on("click", function () {
    //참여자 성명
    const basicPartic = $("#basicPartic").val();
    //진행단계
    let progressVal = $("#counselProgress").val();
    //취창업일
    const employmentStartDate = $("#employmentStartDate").val();
    //취창업처리일
    const employmentProcDate = $("#employmentProcDate").val();
    //퇴사일
    const employmentQuit = $("#employmentQuit").val();
    //취업유형
    const employmentEmpType = $("#employmentEmpType").val();
    //취업처
    const employmentLoyer = $("#employmentLoyer").val();
    //임금
    const employmentSalary = $("#employmentSalary").val();
    //취업인센티브_구분
    const employmentIncentive = $("#employmentIncentive").val();

    //기간만료일
    let counselEXPDate = $("#counselEXPDate").val();

    //flag 변수 생성
    //각 변수들이 비어 있다면 값이 없는 것으로 간주하여 form 태그 실행 함수에서 내보낸다.
    let flag = basicPartic.length > 0;
    if(!flag){
        alertDefaultInfo("참여자 성명은 필수 입력 입니다.","참여자를 입력해주세요.");
        return;
    }
    else if ((progressVal == "미고보" || progressVal == "고보일반" || progressVal == "등록창업" || progressVal == "미등록창업" ||
        progressVal == "미취업사후종료" || progressVal == "이관" || progressVal == "중단") && counselEXPDate == ''){
        alertDefaultInfo("현재 선택한 진행단계의 "+progressVal+"은/는 기간만료(예정)일은 필수로 입력되어야 합니다.");
        return;
    }

    //취창업일이 비어있고 임금 OR 취업인센티브_구분이 비어있다면 함수를 내보낸다.
    if(!employmentStartDate.length > 0){
        //임금이 작성되어 있거나
        flag = employmentSalary.length > 0;
        //취업인센티브_구분이 선택되어 있다면
        flag = flag || employmentIncentive.length > 0;

        flag = flag || employmentProcDate.length > 0;
        flag = flag || employmentQuit.length > 0;
        flag = flag || (employmentEmpType != null?employmentEmpType.length > 0:false);
        flag = flag || (employmentLoyer != null?employmentLoyer.length > 0:false);
        if(flag){
            alertDefaultInfo("취창업일을 입력해주세요.","");
            return;
        }
    }
    else {
        //임금이 작성되어 있거나
        if (!employmentSalary.length > 0){
            alertDefaultInfo("임금은 필수 입력입니다.","");
            return;
        }
        //취업인센티브_구분이 선택되어 있다면
        if (!employmentIncentive.length > 0){
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

// <%-- IAP 수립일 기준 3,5개월 일자지정 --%>




