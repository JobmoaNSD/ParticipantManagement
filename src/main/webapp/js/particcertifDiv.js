
$(document).ready(function () {
    /*
                여러 자격증 입력이 가능하게 하기 위한 함수
            */
    const particcertif_div_content = $(".particcertif-div-content");
    const particcertif_div_plus = $(".particcertif-div-plus");
    const particcertif_div_minus = $(".particcertif-div-minus");
    const particcertifDivLength = function () {
        let DivLength = $(".particcertifCertif").length;
        console.log("자격증 div 개수: ["+DivLength+"]")
        if (DivLength > 1) {
            console.log("자격증 빼기 아이콘 보이기")
            particcertif_div_minus.show();
        } else {
            console.log("자격증 빼기 아이콘 숨기기")
            particcertif_div_minus.hide();
        }
    };

//plus 버튼 클릭하면 class명 particcertif_div 추가 및 minus 표시, html 추가
    particcertif_div_plus.on("click", function () {
        console.log("자격증 Div 추가");
        const newDiv =
            $('<input type="text" class="form-control particcertifCertif w-auto" id="particcertifCertif" name="particcertifCertif" placeholder="자격증 입력">');
        particcertif_div_content.append(newDiv);
        particcertif_div_minus.show();
        particcertifDivLength();
    });

//minus 버튼 클릭 시 particcertif_div 제거, 1개 이하일 때는 minus 숨기기
    particcertif_div_minus.on("click", function () {
        console.log("자격증 Div 삭제");
        particcertif_div_content.children().last().remove();
        if (particcertif_div_content.length <= 1) {
            particcertif_div_minus.hide();
        }
        particcertifDivLength();
    });
})
