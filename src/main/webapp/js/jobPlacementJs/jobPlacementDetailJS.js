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

    const resumeEmailRequestButton = $('#resumeEmailRequestButton'); // 이메일 요청 버튼
    const resumeRequestForm = $('#resumeRequestForm'); // 이메일 요청 form
    const companyName = $('#companyName'); // 기업명
    const managerName = $('#managerName'); // 담당자명
    const email = $('#email'); // 이메일
    const emergencyContact = $('#emergencyContact'); // 비상연락처
    const otherRequests = $('#otherRequests'); // 기타사항

    // 백단으로 저장 요청 전달
    resumeEmailRequestButton.click(function() {
        const resumeDataArray = [];

        // Input 값 배열 추가
        resumeRequestForm.find('input').each(function() {
            const $input = $(this);
            const inputVal = $input.val();
            const inputName = changeInputName($input.attr('name'));
            console.log("inputVal: "+inputVal);

            resumeDataArray[inputName] = inputVal;
        });

        //TODO 사용자 관련 백엔드 전달 API 기능 생성해야함
        //TextArea 값 배열 추가
        resumeDataArray[changeInputName(otherRequests.attr('name'))] = otherRequests.val();

        sendResumeRequest(resumeDataArray)
            .then(r => {
                console.log(r)
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
            return "managerName"
        }
        else if(inputName === 'email'){
            return "email"
        }
        else if(inputName === 'emergencyContact'){
            return "emergencyContact"
        }
        else if(inputName === 'otherRequests'){
            return "otherRequests"
        }
    }

    async function sendResumeRequest(resumeDataArray) {
        console.log();
        return resumeDataArray
    }

    /* 이력서 요청 모달창 표시 */
    $('#resume-request-button').click(function() {
        const resumeRequestModal = new bootstrap.Modal($('#resumeRequestModal'));
        resumeRequestModal.show();
    });

    /* 이력서 요청 모달창 함수 끝 */

});