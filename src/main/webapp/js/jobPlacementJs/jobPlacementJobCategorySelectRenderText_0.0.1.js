// jQuery 버전
$(jobCategorySelectRender);

function jobCategorySelectRender() {
// 중분류 목록
    const jobCategoryLargeArray = [
        {text: "경영·사무·관리", value: "경영·사무·관리"},
        {text: "영업·마케팅·상품기획", value: "영업·마케팅·상품기획"},
        {text: "고객상담·서비스", value: "고객상담·서비스"},
        {text: "생산·제조·물류", value: "생산·제조·물류"},
        {text: "IT·개발·데이터", value: "IT·개발·데이터"},
        {text: "디자인·미디어·문화", value: "디자인·미디어·문화"},
        {text: "의료·보건", value: "의료·보건"},
        {text: "교육·연구", value: "교육·연구"}
    ];

// 소분류 매핑: key는 중분류 value와 동일
    const jobCategoryMidArray = {
        "경영·사무·관리": [
            {text: "회계·세무·재무", value: "회계·세무·재무"},
            {text: "인사·노무·HRD", value: "인사·노무·HRD"},
            {text: "총무·법무·사무", value: "총무·법무·사무"},
            {text: "금융·보험", value: "금융·보험"},
            {text: "공공·복지", value: "공공·복지"}
        ],
        "영업·마케팅·상품기획": [
            {text: "마케팅·홍보·조사", value: "마케팅·홍보·조사"},
            {text: "영업·판매·무역", value: "영업·판매·무역"},
            {text: "상품기획·MD", value: "상품기획·MD"}
        ],
        "고객상담·서비스": [
            {text: "고객상담·TM", value: "고객상담·TM"},
            {text: "서비스", value: "서비스"}
        ],
        "생산·제조·물류": [
            {text: "구매·자재·물류", value: "구매·자재·물류"},
            {text: "운전·운송·배송", value: "운전·운송·배송"},
            {text: "생산", value: "생산"},
            {text: "건설·건축", value: "건설·건축"}
        ],
        "IT·개발·데이터": [
            {text: "IT·개발", value: "IT·개발"},
            {text: "데이터", value: "데이터"}
        ],
        "디자인·미디어·문화": [
            {text: "디자인", value: "디자인"},
            {text: "미디어·문화", value: "미디어·문화"},
            {text: "스포츠", value: "스포츠"}
        ],
        "의료·보건": [
            {text: "의료 전문직", value: "의료 전문직"},
            {text: "의료 종사직", value: "의료 종사직"}
        ],
        "교육·연구": [
            {text: "연구R&D", value: "연구R&D"},
            {text: "교육", value: "교육"}
        ]
    };

    const $large = $('#jobCategoryLarge');
    const $mid = $('#jobCategoryMid');

    const PLACEHOLDER = {text: '카테고리 선택', value: ''};
    const LASTPLACEHOLDER = {text: '기타', value: '기타'};

    function setOptions($select, items, selected) {
        $select.empty();
        if (items.length !== 0) {
            $select.append($('<option>').val(PLACEHOLDER.value).text(PLACEHOLDER.text));
        }
        items.forEach(item => {
            const $opt = $('<option>').val(item.value).text(item.text);
            if (selected != null && String(selected) === String(item.value)) {
                $opt.prop('selected', true);
            }
            $select.append($opt);
        });
        if (items.length !== 0) {
            $select.append($('<option>').val(LASTPLACEHOLDER.value).text(LASTPLACEHOLDER.text));
        }
    }

    function getMidCategories(largeValue) {
        return jobCategoryMidArray[largeValue] || [];
    }

    function updateMidOptions(largeValue, selectedMid) {
        const subs = getMidCategories(largeValue);
        setOptions($mid, subs, selectedMid);
        $mid.prop('disabled', subs.length === 0);
    }

// 초기 선택값 복원
    const selectedLarge = $large.data('selected') || '';
    const selectedMid = $mid.data('selected') || '';

// 대분류 옵션(표시는 괄호 앞부분) 구성
    const midOptions = jobCategoryLargeArray
        .filter(i => i.value !== '')
        .map(i => ({text: i.text.split('(')[0], value: i.value}));

    setOptions($large, midOptions, selectedLarge);

    if (selectedLarge) {
        updateMidOptions(selectedLarge, selectedMid);
    } else {
        setOptions($mid, [], '');
        $mid.prop('disabled', true);
    }

    // 이벤트: 대분류 변경 시 중분류 갱신
    $large.on('change', function () {
        updateMidOptions(this.value, '');
    });

    $large.on('', function () {
        console.log('change');
    });
}