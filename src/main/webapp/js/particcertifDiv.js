$(document).ready(function () {
    let particcertif_div_content = $(".particcertif-div-content");
    let particcertif_div_plus = $(".particcertif-div-plus");
    let particcertif_div_minus = $(".particcertif-div-minus");

    function particcertifDivLength() {
        let DivLength = $(".particcertifCertif").length;
        console.log("자격증 div 개수: ["+DivLength+"]")
        if (DivLength > 1) {
            console.log("자격증 빼기 아이콘 보이기")
            particcertif_div_minus.show();
        } else {
            console.log("자격증 빼기 아이콘 숨기기")
            particcertif_div_minus.hide();
        }
    }

//plus 버튼 클릭하면 class명 particcertif_div 추가 및 minus 표시, html 추가
    particcertif_div_plus.on("click", function () {
        console.log("자격증 Div 추가");
        const newDiv =
            $('<input type="text" class="form-control w-auto particcertifCertif" name="particcertifCertifs" placeholder="자격증 입력">');
        particcertif_div_content.append(newDiv);
        particcertif_div_minus.show();
    });

//minus 버튼 클릭 시 particcertif_div 제거, 1개 이하일 때는 minus 숨기기
    particcertif_div_minus.on("click", function () {
        console.log("자격증 Div 삭제");
        particcertif_div_content.children().last().remove();
        particcertifDivLength();
    });

})

function specialty(specialtyArr){
    const particcertif_div_content = $(".particcertif-div-content");

    if(specialtyArr == null || specialtyArr == '' || specialtyArr == undefined) {
        const newDiv = $('<input type="text" class="form-control w-auto particcertifCertif" name="particcertifCertifs" placeholder="자격증 입력">');
        particcertif_div_content.append(newDiv);
    }
    //전달 받은 배열 만큼 div 태그를 생성한다.
    else if(specialtyArr.length > 0 && specialtyArr != null) {
        specialtyArr = specialtyArr.map(item => item);
        console.log(specialtyArr);
        specialtyArr.forEach((item) => {
            // console.log(item.particcertifPartNo);
            let newDiv = $('<input type="text" class="form-control w-auto particcertifCertif" name="particcertifCertifs" placeholder="자격증 입력" value="'+item.particcertif+'">'
                + '<input type="hidden" name="particcertifPartNos" placeholder="자격증 PK" value="'+item.particcertifPartNo+'">');

            particcertif_div_content.append(newDiv);
        });
    }

}
