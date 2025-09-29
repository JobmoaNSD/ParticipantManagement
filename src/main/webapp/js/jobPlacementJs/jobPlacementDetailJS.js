/**
 * TextArea로 저장된 값에 대한 내용중 Enter 키를 HTML 코드 <br> Code로 전환
 */
function lineFeedChange(textData){
    return textData.replace(/\n/g, "<br>");
}

function locationBack(page){
    let href = 'placementList'+searchHref(page);
    window.location.href = href.lastIndexOf('jobNumber') > 0 ? href.substring(0,href.lastIndexOf('jobNumber')-1) : href;
}

$(document).ready(function() {
    let updateFlag = false;
    const updateBtn = $('#updateBtn');
    let originalData = {};

    let keywordDiv = $('#keyword-div');

    updateBtn.on('click', function() {
        if (!updateFlag) {
            updateFlag = true;
            convertToEditMode();
            default_datepicker();
            updateBtn.html('<i class="bi bi-check-square"></i> 저장');
            updateBtn.removeClass('btn-info').addClass('btn-success');
        } else {
            updateFlag = false;
            convertToReadMode();
            updateBtn.html('<i class="bi bi-pencil-square"></i> 수정');
            updateBtn.removeClass('btn-success').addClass('btn-info');
            saveUpdatedData().then(function(result) {
                console.log("Ascync Success [" +result+"]");
            })
            .catch(function(error) {
                alert("Async Error [" +error+"]");
            })
        }
    });

    function convertToEditMode() {
        $('.readonly-section .readonly-item').each(function() {
            const $item = $(this);
            const $value = $item.find('.readonly-value');
            const $pre = $item.find('.readonly-pre');

            const fieldId = $value.attr('id') || $pre.attr('id');

            if ($value.length > 0) {
                originalData[fieldId] = $value.text();
            } else if ($pre.length > 0) {
                originalData[fieldId] = $pre.text();
            }

            if ($value.length > 0) {
                const currentValue = $value.text();
                let inputHtml = '';
                let inputName = '';

                // 각 필드별로 name 속성 설정
                switch(fieldId) {
                    case 'detailName':
                        inputName = 'participant';
                        break;
                    case 'detailAge':
                        inputName = 'age';
                        break;
                    case 'detailLocation':
                        inputName = 'address';
                        break;
                    case 'detailJob':
                        inputName = 'desiredJob';
                        break;
                    case 'jobCategoryLargeValue':
                        inputName = 'jobCategoryLarge';
                        break;
                    case 'jobCategoryMidValue':
                        inputName = 'jobCategoryMid';
                        break;
                    case 'detailSalary':
                        inputName = 'desiredSalary';
                        break;
                    case 'schoolName':
                        inputName = 'schoolName';
                        break;
                    case 'major':
                        inputName = 'major';
                        break;
                    case 'detailCertificates':
                        inputName = 'certificate';
                        break;
                    case 'detailExperience':
                        inputName = 'career';
                        break;
                    case 'detailGender':
                        inputName = 'gender';
                        break;
                    default:
                        inputName = fieldId;
                }

                // 입력 타입 결정
                if (fieldId === 'detailAge') {
                    let detailBirthDate = $('#detailBirthDate').val();
                    inputHtml = '<input type="text" class="form-control editable-input datepicker_on" id="' + fieldId + '" name="' + inputName + '" value="' + detailBirthDate + '">';
                } else if (fieldId === 'detailSalary') {
                    // 희망연봉에서 "회사내규에 따름" 같은 텍스트 처리
                    const salaryValue = currentValue.replace(/[^0-9]/g, '');
                    inputHtml = '<input type="number" class="form-control editable-input" id="' + fieldId + '" name="' + inputName + '" value="' + salaryValue + '" min="0">';
                } else if(fieldId === 'detailGender'){
                    let flag = (currentValue === '남');//currentValue
                    inputHtml = '<select class="form-control editable-input editable-select" id="'+fieldId+'" name="'+inputName+'">' +
                    '<option value="남" '+(flag?'selected':'')+' >남</option>' +
                    '<option value="여" '+(!flag?'selected':'')+' >여</option>' +
                    '</select>'
                }
                else if (fieldId === 'detailLocation') {
                    inputHtml = '<input type="text" class="form-control editable-input" id="' + fieldId + '" name="' + inputName + '" value="' + currentValue + '" readonly>';
                }
                else if (fieldId === 'jobCategoryLargeValue'){
                    inputHtml = '<select class="form-control editable-input editable-select" id="'+inputName+'" name="'+inputName+'" required><option value="">선택하세요</option></select>';
                }
                else if (fieldId === 'jobCategoryMidValue'){
                    inputHtml = '<select class="form-control editable-input editable-select" id="'+inputName+'" name="'+inputName+'" required><option value="">선택하세요</option></select>';
                }
                else {
                    inputHtml = '<input type="text" class="form-control editable-input" id="' + fieldId + '" name="' + inputName + '" value="' + currentValue + '">';
                }

                $value.replaceWith(inputHtml);
            }

            if ($pre.length > 0) {
                const currentValue = $pre.text();
                const inputName = fieldId === 'placementDetail' ? 'placementDetail' : fieldId;
                const textareaHtml = '<textarea class="form-control editable-textarea" id="' + fieldId + '" name="' + inputName + '" rows="5">' + currentValue + '</textarea>';
                $pre.replaceWith(textareaHtml);
            }

            jobCategorySelectRender()
            //직무 카테고리 대분류
            selectOption($("#jobCategoryLarge"),originalData["jobCategoryLargeValue"]);
            //직무 카테고리 중분류
            selectOption($("#jobCategoryMid"),originalData["jobCategoryMidValue"]);
        });
    }

    function convertToReadMode() {
        $('.readonly-section .readonly-item').each(function() {
            const $item = $(this);
            const $input = $item.find('.editable-input');
            const $textarea = $item.find('.editable-textarea');

            if ($input.length > 0) {
                let fieldId = $input.attr('id');
                let newValue = $input.val();

                // 특정 필드의 값 처리
                if (fieldId === 'detailAge') {
/*                    if((newValue === '' || newValue === '0')){
                        newValue = '비공개';
                    }
                    else{
                        newValue = calculateAge(newValue);
                    }*/
                } else if (fieldId === 'detailCertificates' && newValue === '') {
                    newValue = '없음';
                } else if (fieldId === 'detailExperience' && newValue === '') {
                    newValue = '신입';
                }

                if(fieldId === 'jobCategoryLarge' || fieldId === 'jobCategoryMid'){
                    fieldId = fieldId === 'jobCategoryLarge' ? 'jobCategoryLargeValue' : 'jobCategoryMidValue';
                }

                const spanHtml = '<span class="readonly-value" id="' + fieldId + '">' + newValue + '</span>';
                $input.replaceWith(spanHtml);
            }

            if ($textarea.length > 0) {
                const fieldId = $textarea.attr('id');
                const newValue = $textarea.val();
                const preHtml = '<pre class="readonly-pre" id="' + fieldId + '">' + newValue + '</pre>';
                $textarea.replaceWith(preHtml);
            }
        });
    }

    function cancelEdit() {
        if (updateFlag) {
            updateFlag = false;

            $('.readonly-section .readonly-item').each(function() {
                const $item = $(this);
                const $input = $item.find('.editable-input');
                const $textarea = $item.find('.editable-textarea');

                if ($input.length > 0) {
                    let fieldId = $input.attr('id');
                    let originalValue = originalData[fieldId] || '';
                    console.log(fieldId+' Original Value:', originalData[fieldId]);
                    if(fieldId === 'jobCategoryLarge' || fieldId === 'jobCategoryMid'){
                        fieldId = fieldId === 'jobCategoryLarge' ? 'jobCategoryLargeValue' : 'jobCategoryMidValue';
                        originalValue = originalData[fieldId] = originalData[fieldId] || '';
                    }
                    const spanHtml = '<span class="readonly-value" id="' + fieldId + '">' + originalValue + '</span>';
                    $input.replaceWith(spanHtml);
                }

                if ($textarea.length > 0) {
                    const fieldId = $textarea.attr('id');
                    const originalValue = originalData[fieldId] || '';
                    const preHtml = '<pre class="readonly-pre" id="' + fieldId + '">' + originalValue + '</pre>';
                    $textarea.replaceWith(preHtml);
                }
            });

            updateBtn.html('<i class="bi bi-pencil-square"></i> 수정');
            updateBtn.removeClass('btn-success').addClass('btn-info');
        }
    }

    $(document).keydown(function(e) {
        if (e.keyCode === 27 && updateFlag) {
            cancelEdit();
        }
    });

    async function saveUpdatedData() {
        const updatedData = {};
        const jobNumber = $('#selectedParticipantId').text();
        const counselorId = $('#detailCounselorId').val();
        const detailBirthDate = $('#detailBirthDate').val();

        $('.readonly-section .readonly-value, .readonly-section .readonly-pre').each(function () {
            const $element = $(this);
            const fieldId = $element.attr('id');
            const value = $element.text();
            console.log('Field ID:', fieldId, 'Value:', value);
            console.log('Original Data:', originalData);
            console.log('detailBirthDate Data:', detailBirthDate);

            // 필드 ID를 서버에서 예상하는 필드명으로 매핑
            switch (fieldId) {
                case 'detailName':
                    updatedData.participant = value === '' ? originalData.birthDate : value;
                    break;
                case 'detailAge':
                    updatedData.birthDate = value === '' ? detailBirthDate : value;
                    break;
                case 'detailGender':
                    updatedData.gender = value;
                    break;
                case 'detailLocation':
                    updatedData.address = value === '' ? originalData.address : value;
                    break;
                case 'detailJob':
                    updatedData.desiredJob = value;
                    break;
                case 'jobCategoryLarge':
                    updatedData.jobCategoryLarge = value;
                    break;
                case 'jobCategoryMid':
                    updatedData.jobCategoryMid = value;
                    break;
                case 'detailSalary':
                    updatedData.desiredSalary = Math.floor((value/12));
                    break;
                case 'schoolName':
                    updatedData.schoolName = value;
                    break;
                case 'major':
                    updatedData.major = value;
                    break;
                case 'detailCertificates':
                    updatedData.certificate = value === '없음' ? '' : value;
                    break;
                case 'detailExperience':
                    updatedData.career = value === '신입' ? '' : value;
                    break;
                case 'placementDetail':
                    updatedData.placementDetail = value;
                    break;
            }
        });

        updatedData.jobNumber = jobNumber;
        updatedData.counselorId = counselorId;

        console.log('Updated data:', updatedData);

        // 실제 서버 업데이트 로직 (필요시 구현)
        return await fetch('jobPlacement/jobPlacementAsync', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(updatedData)
        })
        .then(response => {return response.json();})
        .catch(error => {return error;})
    }

    //만나이 생성 함수
    function calculateAge(birthdate) {
        const today = new Date();
        const birthDate = new Date(birthdate);
        let age = today.getFullYear() - birthDate.getFullYear();
        const monthDifference = today.getMonth() - birthDate.getMonth();

        if (monthDifference < 0 || (monthDifference === 0 && today.getDate() < birthDate.getDate())) {
            age--;
        }
        return age;
    }

    function keywordDivChange(){
        const keyword = keywordDiv.text();
        const keywords = keyword.split(',');
        // console.log(keywords);
        keywordDiv.empty();
        keywords.forEach(element => {
            keywordDiv.append('<div>'+element+'</div>');
        })
    }

    //시작시 적용
    keywordDivChange();

    /* 이력서 요청 모달창 함수 시작 */
    const $resumeEmailRequestButton = $('#resumeEmailRequestButton'); // 이메일 요청 버튼
    const $resumeRequestForm = $('#resumeRequestForm'); // 이메일 요청 form
    const $companyName = $('#companyName'); // 기업명
    const $managerName = $('#managerName'); // 담당자명
    const $email = $('#email'); // 이메일
    const $emergencyContact = $('#emergencyContact'); // 비상연락처
    const $otherRequests = $('#otherRequests'); // 기타사항
    const checkboxNames = [
        'personalInformationAgreeMarketing',
        'personalInformationAgreeCompany',
        'personalInformationAgreeManager',
    ];

    // 백단으로 저장 요청 전달
    $resumeEmailRequestButton.click(function() {
        const resumeDataArray = {};

        //otherRequests 기타사항 XLS 공격방어를 위해 작성
        const XLSRegex = /(<script\b[^>]*>([\s\S]*?)<\/script>)/gm

        // 폼 요소(input, textarea) 값을 배열에 추가
        $resumeRequestForm.find('input, textarea').each(function () {
            const $element = $(this);
            const name = changeInputName($element.attr('name'));

            if (!name) {
                return; // 이름이 없는 요소는 건너뜁니다.
            }

            let value = checkboxNames.includes(name) ? $element.is(':checked') : $element.val();

            if (typeof value === 'string') {
                value = value.replace(XLSRegex, '');
            }

            console.log(`inputVal: ${value}`);
            resumeDataArray[name] = value;
        });

        const companyName = $companyName.val();
        const managerName = $managerName.val();
        const email = $email.val();
        const emergencyContact = $emergencyContact.val();

        const isCheckValue = companyName === '' || managerName === '' || email === '' || emergencyContact === '';
        if(isCheckValue){
            if (companyName === ''){
                $companyName.focus();
                $companyName.css('border-color', 'red');
                $companyName.css('border-width', '2px');
                $companyName.css('border-style', 'solid');
                $companyName.css('border-radius', '5px');
                $companyName.css('background-color', '#f8d7da');
                $companyName.css('color', '#721c24');
                $companyName.css('font-weight', 'bold');
            }
            else if (managerName === ''){
                $managerName.focus();
                $managerName.css('border-color', 'red');
                $managerName.css('border-width', '2px');
                $managerName.css('border-style', 'solid');
                $managerName.css('border-radius', '5px');
                $managerName.css('background-color', '#f8d7da');
                $managerName.css('color', '#721c24');
                $managerName.css('font-weight', 'bold');
            }
            else if (email === ''){
                $email.focus();
                $email.css('border-color', 'red');
                $email.css('border-width', '2px');
                $email.css('border-style', 'solid');
                $email.css('border-radius', '5px');
                $email.css('background-color', '#f8d7da');
                $email.css('color', '#721c24');
                $email.css('font-weight', 'bold');
            }
            else if (emergencyContact === ''){
                $emergencyContact.focus();
                $emergencyContact.css('border-color', 'red');
                $emergencyContact.css('border-width', '2px');
                $emergencyContact.css('border-style', 'solid');
                $emergencyContact.css('border-radius', '5px');
                $emergencyContact.css('background-color', '#f8d7da');
                $emergencyContact.css('color', '#721c24');
                $emergencyContact.css('font-weight', 'bold');
            }
            return;
        }
        else{
            $companyName.removeAttr('style');
            $managerName.removeAttr('style');
            $email.removeAttr('style');
            $emergencyContact.removeAttr('style');
        }

        //emergencyContact(비상연락처) 전화번호 형식으로 작성
        const emergencyContactRegex = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
        if(!emergencyContactRegex.test(emergencyContact)){
            alert("전화번호 형식으로 작성해주세요.")
            return;
        }


        //TODO 사용자 관련 백엔드 전달 API 기능 생성해야함
        sendResumeRequest(resumeDataArray)
            .then(r => {
                const response = r.json();
                console.log("sendResumeRequest(resumeDataArray): "+r)
                //TODO 백엔드 완료 데이터 확인용 메시지 보여줄 수 있도록 설정하고 모달창 숨김처리
                response.then(data => {

                })
            })
            .catch(e => {
                console.log(e)
            });
    })

    function changeInputName(inputName){
        if(inputName === 'companyName'){
            return "companyName"
        }
        else if(inputName === 'managerName'){
            return "contactName"
        }
        else if(inputName === 'email'){
            return "contactEmail"
        }
        else if(inputName === 'emergencyContact'){
            return "contactPhone"
        }
        else if(inputName === 'otherRequests'){
            return "contactOther"
        }
        //마케팅 개인정보 사용 동의
        else if(inputName === 'personalInformationAgreeMarketing'){
            return "marketingConsent"
        }
        //기업 담당자 개인정보 동의
        else if(inputName === 'personalInformationAgreeManager'){
            return "contactPrivacy"
        }
        //기업 담당자가 확인해야할 개인정보 처리 동의
        else if(inputName === 'personalInformationAgreeCompany'){
            return "companyPrivacy"
        }
        else{
            return inputName
        }
    }

    async function sendResumeRequest(resumeDataArray) {
        console.log(resumeDataArray);
        // return resumeDataArray;
        return await fetch('/jobPlacement/resumeRequest', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json; charset=UTF-8'
            },
            body: JSON.stringify(resumeDataArray)
        })
    }

    // 이력서 요청 개인정보 모달창 표시
    $('#resume-request-button').click(function() {
        const personalInformation = new bootstrap.Modal($('#personalInformationModal'));
        personalInformation.show();
    })



    // 개인정보 전체 동의
    $('#personal-information-agree').click(function() {
        console.log("personal-information-agree Start");

        // 공통 클래스를 사용하여 모든 동의 체크박스를 한번에 선택합니다.
        const $agreeCheckboxes = $('.personalInformationAgree');

        // 모든 체크박스가 이미 선택되어 있는지 확인합니다.
        const allChecked = $agreeCheckboxes.length === $agreeCheckboxes.filter(':checked').length;

        // 새로운 체크 상태를 결정합니다. (모두 선택되었다면 -> 해제, 그렇지 않다면 -> 모두 선택)
        const newCheckedState = !allChecked;

        // 모든 체크박스에 새로운 상태를 일괄 적용합니다.
        $agreeCheckboxes.prop('checked', newCheckedState);

        console.log("personal-information-agree End");
    });

    // 이력서 요청 모달창 표시
    $('#btn-next-modal').click(function() {
        const resumeRequestModal = new bootstrap.Modal($('#resumeRequestModal'));
        const $personalInformation = $('#personalInformationModal');
        const $personalInformationAgreeCompany = $('#personalInformationAgreeCompany')
        const $personalInformationAgreeManager = $('#personalInformationAgreeManager')

        if($personalInformationAgreeCompany.is(':checked') === false || $personalInformationAgreeManager.is(':checked') === false){
            alert("필수 동의를 확인해주세요.")
            return;
        }

        $personalInformation.modal('hide');
        resumeRequestModal.show();
    });

    //modal 해제 후 input 값 제거
    /*$('#personalInformationModal').on('hidden.bs.modal', function (e) {
        modalHidden()
    })*/
    $('#resumeRequestModal').on('hidden.bs.modal', function (e) {
        modalHidden()
    })

    function modalHidden(){
        // const $resumeRequestModalLabel = $('#resumeRequestModalLabel');
        const $agreeCheckboxes = $('.personalInformationAgree');

        // $resumeRequestModalLabel.val('');
        $companyName.val('');
        $managerName.val('');
        $email.val('');
        $emergencyContact.val('');
        $otherRequests.val('');
        $agreeCheckboxes.prop('checked', false);

    }

    /* 이력서 요청 모달창 함수 끝 */

});