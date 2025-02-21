$(document).ready(function () {
    let education_div_content = $(".education-div-content");
    let education_div_plus = $(".education-div-plus");
    let education_div_minus = $(".education-div-minus");

    function educationDivLength() {
        let DivLength = $(".education").length;
        console.log("교육 내역 div 개수: ["+DivLength+"]")
        if (DivLength > 1) {
            console.log("교육 내역 빼기 아이콘 보이기")
            education_div_minus.show();
        } else {
            console.log("교육 내역 빼기 아이콘 숨기기")
            education_div_minus.hide();
        }
    }

//plus 버튼 클릭하면 class명 particcertif_div 추가 및 minus 표시, html 추가
    education_div_plus.on("click", function () {
        console.log("교육 내역 Div 추가");
        const newDiv =
            $('<input type="text" class="form-control w-auto education" name="educations" placeholder="교육 내역 입력">');
        education_div_content.append(newDiv);
        education_div_minus.show();
    });

//minus 버튼 클릭 시 particcertif_div 제거, 1개 이하일 때는 minus 숨기기
    education_div_minus.on("click", function () {
        console.log("교육 내역 Div 삭제");
        education_div_content.children().last().remove();
        educationDivLength();
    });
})

function education(educationArr){
    const education_div_content = $(".education-div-content");
    if(educationArr == null || educationArr == '' || educationArr == undefined) {
        const newDiv = $('<input type="text" class="form-control w-auto education" name="educations" placeholder="교육 내역 입력">');
        education_div_content.append(newDiv);
    }
    //전달 받은 배열 만큼 div 태그를 생성한다.
    else if(educationArr.length > 0 && educationArr != null) {
        educationArr = educationArr.map(item => item);
        console.log(educationArr);

        educationArr.forEach((item) => {
            let newDiv = $('<input type="text" class="form-control w-auto education" name="educations" placeholder="교육 내역 입력" value="'+item.education+'">'
                + '<input type="hidden" name="educationNos" placeholder="교육내역 PK" value="'+item.educationNo+'">');
            education_div_content.append(newDiv);
        });
    }
}

