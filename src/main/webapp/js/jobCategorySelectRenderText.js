// jQuery 버전
$(function() {
    // 중분류 목록
    const jobCategoryMidArray = [
        { text: "카테고리 선택", value: "" },
        { text: "경영·사무·관리", value: "경영·사무·관리" },
        { text: "영업·마케팅·상품기획", value: "영업·마케팅·상품기획" },
        { text: "고객상담·서비스", value: "고객상담·서비스" },
        { text: "생산·제조·물류", value: "생산·제조·물류" },
        { text: "IT·개발·데이터", value: "IT·개발·데이터" },
        { text: "디자인·미디어·문화", value: "디자인·미디어·문화" },
        { text: "의료·보건", value: "의료·보건" },
        { text: "교육·연구", value: "교육·연구" }
    ];

    // 소분류 매핑: key는 중분류 value와 동일
    const jobCategorySubArray = {
        "경영·사무·관리": [
            { text: "기획·전략", value: "기획·전략" },
            { text: "회계·세무·재무", value: "회계·세무·재무" },
            { text: "인사·노무·HRD", value: "인사·노무·HRD" },
            { text: "총무·법무·사무", value: "총무·법무·사무" },
            { text: "건설·건축", value: "건설·건축" },
            { text: "금융·보험", value: "금융·보험" },
            { text: "공공·복지", value: "공공·복지" }
        ],
        "영업·마케팅·상품기획": [
            { text: "마케팅·홍보·조사", value: "마케팅·홍보·조사" },
            { text: "영업·판매·무역", value: "영업·판매·무역" },
            { text: "상품기획·MD", value: "상품기획·MD" }
        ],
        "고객상담·서비스": [
            { text: "고객상담·TM", value: "고객상담·TM" },
            { text: "서비스", value: "서비스" }
        ],
        "생산·제조·물류": [
            { text: "구매·자재·물류", value: "구매·자재·물류" },
            { text: "운전·운송·배송", value: "운전·운송·배송" },
            { text: "생산", value: "생산" }
        ],
        "IT·개발·데이터": [
            { text: "백엔드개발자", value: "백엔드개발자" },
            { text: "프론트엔드개발자", value: "프론트엔드개발자" },
            { text: "웹ㆍ앱개발자", value: "웹ㆍ앱개발자" },
            { text: "엔지니어", value: "엔지니어" },
            { text: "DBA", value: "DBA" },
            { text: "데이터엔지니어", value: "데이터엔지니어" }
        ],
        "디자인·미디어·문화": [
            { text: "디자인", value: "디자인" },
            { text: "미디어·문화·스포츠", value: "미디어·문화·스포츠" }
        ],
        "의료·보건": [
            { text: "의료", value: "의료" }
        ],
        "교육·연구": [
            { text: "연구R&D", value: "연구R&D" },
            { text: "교육", value: "교육" }
        ]
    };

    const $mid = $('#jobCategoryMid');
    const $sub = $('#jobCategorySub');

    const PLACEHOLDER = { text: '선택하세요', value: '' };
    const LASTPLACEHOLDER = { text: '기타', value: '기타' };

    function setOptions($select, items, selected) {
        $select.empty();
        $select.append($('<option>').val(PLACEHOLDER.value).text(PLACEHOLDER.text));
        items.forEach(item => {
            const $opt = $('<option>').val(item.value).text(item.text);
            if (selected != null && String(selected) === String(item.value)) {
                $opt.prop('selected', true);
            }
            $select.append($opt);
        });
        $select.append($('<option>').val(LASTPLACEHOLDER.value).text(LASTPLACEHOLDER.text));
    }

    function getSubcategories(midValue) {
        return jobCategorySubArray[midValue] || [];
    }

    function updateSubOptions(midValue, selectedSub) {
        const subs = getSubcategories(midValue);
        setOptions($sub, subs, selectedSub);
        $sub.prop('disabled', subs.length === 0);
    }

    // 초기 선택값 복원
    const selectedMid = $mid.data('selected') || '';
    const selectedSub = $sub.data('selected') || '';

    // 중분류 옵션(표시는 괄호 앞부분) 구성
    const midOptions = jobCategoryMidArray
        .filter(i => i.value !== '')
        .map(i => ({ text: i.text.split('(')[0], value: i.value }));

    setOptions($mid, midOptions, selectedMid);

    if (selectedMid) {
        updateSubOptions(selectedMid, selectedSub);
    } else {
        setOptions($sub, [], '');
        $sub.prop('disabled', true);
    }

    // 이벤트: 중분류 변경 시 소분류 갱신
    $mid.on('change', function() {
        updateSubOptions(this.value, '');
    });
});
