$(document).ready(function () {
    // DOM 요소 가져오기
    const tagsContainer = document.getElementById('keywords-container');
    const tagInput = document.getElementById('keyword-input');
    const keywordCountSpan = document.getElementById('keyword-count');
    const keywordListDiv = document.getElementById('keyword-list');
    const suggestedContainer = document.getElementById('suggested-keywords-container');
    const suggestedSection = document.getElementById('suggested-section');
    const errorMessage = document.getElementById('error-message');
    const description = document.getElementById('description');
    const hiddenContainer = document.getElementById('keywords-hidden-container');
    const jobCategoryLarge = document.getElementById('jobCategoryLarge');

// --- 설정값 ---
    const MIN_KEYWORD_LENGTH = 2;
    const MAX_KEYWORD_LENGTH = 25;
    const MIN_TAG_COUNT = 1; // 최소 1개는 필요하다고 가정
    const MAX_TAG_COUNT = 5;
// ---------------

    // 키워드를 저장할 배열
    let tags = [];
    // 추천 키워드 배열 목록
    let allSuggestedKeywords = [];

    // 추천 키워드 전체 목록
    const allKeywords = {
        "경영·사무·관리":[
            '의사소통능력','문서작성능력','분석력','기획력','책임감','문제해결능력','대인관계능력','자기개발능력','조직이해능력','직업윤리','정보능력','수리능력','자원관리능력','기술능력','성실성','적응력','협력성','신뢰성','논리적사고','창의성','리더십','꼼꼼함','긍정적태도','학습의지','윤리의식','정리정돈능력','서비스마인드','끈기','자율성','정확성'
            ],
        "영업·마케팅·상품기획":[
            '의사소통능력','설득력','문제해결능력','기획력','분석력','대인관계능력','적응력','창의성','협상력','직업윤리','자기개발능력','정보능력','서비스마인드','신뢰성','끈기','리더십','수리능력','조직이해능력','시간관리능력','정확성','팀워크','관찰력','발표능력','자율성','긍정적 태도'
            ],
        "고객상담·서비스":[
            '의사소통능력','경청능력','문제해결능력','서비스마인드','스트레스관리능력','공감능력','책임감','대인관계능력','적응력','긍정적태도','정보능력','설득력','협력성','자기개발능력','직업윤리','시간관리능력','정확성','忍耐력','팀워크','발표능력','멀티태스킹능력','신뢰성','정리정돈능력','학습의지','창의성'
            ],
        "생산·제조·물류":[
            '의사소통능력','문제해결능력','책임감','협력성','적응력','정확성','기술능력','체력','정리정돈능력','시간관리능력','품질관리의식','자원관리능력','안전의식','끈기','문서작성능력','관찰력','신뢰성','학습의지','멀티태스킹능력','리더십','서비스마인드','창의성'
            ],
        "IT·개발·데이터":[
            '문제해결능력','협업 및 커뮤니케이션','빠른 학습력(기술 적응력)','책임감','자기주도성','성실성','꼼꼼함','논리적 사고','끈기','개방적 태도','정보능력','수리능력','자원관리능력','기술능력','조직이해능력','프로그래밍·코딩 역량','데이터 처리 및 활용 역량','시스템·도구 활용 능력','품질 관리 및 보안 인식','사용자 중심 사고(UI·UX 이해)'
            ],
        "디자인·미디어·문화":[
            '창의성','시각적감각','트렌드이해','문제해결능력','도구활용능력','스토리텔링능력','의사소통능력','협업능력','관찰력','적응력','감수성','정확성','시간관리능력','자기개발능력','프레젠테이션능력','비판적사고','융합능력','문화이해','신뢰성','윤리의식','서비스마인드','리더십'
            ],
        "의료·보건":[
            '의사소통능력','공감능력','문제해결능력','정확성','윤리의식','스트레스관리능력','대인관계능력','체력','책임감','관찰력','적응력','정보능력','자기개발능력','서비스마인드','팀워크','시간관리능력','신뢰성','학습의지','냉정함','정리정돈능력','리더십','창의성'
            ],
        "교육·연구":[
            '의사소통능력','설득력','문제해결능력','분석력','기획력','창의성','대인관계능력','책임감','적응력','비판적사고','정보능력','자기개발능력','발표능력','리더십','협업능력','정확성','시간관리능력','신뢰성','관찰력','윤리의식','학습의지','서비스마인드'
            ]
    };

    // 숨겨진 input들을 현재 tags와 동기화
    function syncHiddenInputs() {
        if (!hiddenContainer) return;
        hiddenContainer.innerHTML = ''; // 초기화
        tags.forEach(t => {
            const input = document.createElement('input');
            input.type = 'hidden';
            input.name = 'recommendedKeywords'; // 같은 name으로 여러 개 => List<String> 바인딩
            // input.id = 'keyword-input';
            input.classList.add('hidden-keyword-input');
            input.value = t;
            hiddenContainer.appendChild(input);
        });
    }

// 설명 문구 업데이트
    description.textContent = `참여자와 관련된 키워드를 입력하거나 추천 키워드를 클릭하세요. (최대 ${MAX_TAG_COUNT}개)`;

// 입력창 및 추천 키워드 상태 업데이트 함수
    function updateInputState() {
        if (tags.length >= MAX_TAG_COUNT) {
            tagInput.disabled = true;
            tagInput.placeholder = '최대 개수에 도달했습니다.';
            suggestedSection.style.display = 'none'; // 추천 섹션 숨기기
        } else {
            tagInput.disabled = false;
            tagInput.placeholder = `${MIN_KEYWORD_LENGTH}~${MAX_KEYWORD_LENGTH}자 사이 키워드 입력...`;
            suggestedSection.style.display = 'block'; // 추천 섹션 보이기
        }
    }

    // 키워드 배열이 변경될 때마다 UI를 업데이트하는 함수
    function updateKeywordsDisplay() {
        keywordCountSpan.textContent = tags.length;
        keywordListDiv.textContent = tags.length > 0 ? tags.join(', ') : '입력된 키워드가 없습니다.';
        updateInputState();
        syncHiddenInputs(); // 동기화 호출

        /*
         * 외부(백엔드에서 받은 초기값 등)에서 키워드 배열/문자열을 주입할 수 있도록 공개 API 제공
         * - 배열: ['자기주도성', '책임감', ...]
         * - 문자열: "[자기주도성, 책임감]" 또는 "자기주도성, 책임감"
         */
        window.addKeywordsFromBackend = function(input) {
            // 이미 최대치인 경우 스킵
            if (tags.length >= MAX_TAG_COUNT) return;

            const toArray = (val) => {
                if (Array.isArray(val)) return val;
                if (val == null) return [];
                // 양 끝 대괄호 제거 후 쉼표 분리
                return String(val)
                    .replace(/^\s*\[|\]\s*$/g, '')
                    .split(',')
                    .map(s => s.replace(/['"]/g, '').trim())
                    .filter(Boolean);
            };

            const keywords = toArray(input);

            for (const kw of keywords) {
                if (tags.length >= MAX_TAG_COUNT) break; // 최대 5개 제한 준수
                // addTag는 내부 유효성(중복/길이) 체크 수행
                addTag(kw);
            }
        };

    }

// 에러 메시지를 표시하는 함수
    function showError(message) {
        errorMessage.textContent = message;
        tagsContainer.classList.add('shake');
        setTimeout(() => {
            errorMessage.textContent = '';
            tagsContainer.classList.remove('shake');
        }, 1500);
    }

// 추천 키워드를 렌더링하는 함수
    function renderSuggestedKeywords() {
        suggestedContainer.innerHTML = ''; // 기존 추천 키워드 비우기
        const availableKeywords = allSuggestedKeywords.filter(keyword => !tags.includes(keyword));

        availableKeywords.forEach(keyword => {
            const button = document.createElement('button');
            button.setAttribute('class', 'bg-slate-200 hover:bg-slate-300 text-slate-700 text-xs font-medium px-3 py-1.5 rounded-full transition-colors duration-200');
            button.textContent = `+ ${keyword}`;
            button.addEventListener('click', () => {
                addTag(keyword);
            });
            suggestedContainer.appendChild(button);
        });
    }

// 태그를 추가하는 로직을 함수로 분리
    function addTag(label) {
        // 최대 개수 검사
        if (tags.length >= MAX_TAG_COUNT) {
            showError(`최대 ${MAX_TAG_COUNT}개의 키워드만 추가할 수 있습니다.`);
            return;
        }

        const newTagLabel = label.trim().replace(/,/g, '');

        // 글자 수 유효성 검사
        if (newTagLabel.length < MIN_KEYWORD_LENGTH || newTagLabel.length > MAX_KEYWORD_LENGTH) {
            showError(`키워드는 ${MIN_KEYWORD_LENGTH}~${MAX_KEYWORD_LENGTH}자 사이로 입력해주세요.`);
            return;
        }
        if (tags.includes(newTagLabel)) {
            showError('이미 추가된 키워드입니다.');
            return;
        }

        // 배열에 새로운 태그 추가
        tags.push(newTagLabel);
        // 새로운 태그를 화면에 생성
        const newTagElement = createTag(newTagLabel);
        tagsContainer.insertBefore(newTagElement, tagInput);

        // UI 업데이트
        updateKeywordsDisplay();
        renderSuggestedKeywords(); // 추천 키워드 목록 갱신
    }

    // 태그를 생성하고 화면에 추가하는 함수
    function createTag(label) {
        const div = document.createElement('div');
        div.setAttribute('class', 'flex items-center justify-center bg-indigo-100 text-indigo-700 text-sm font-medium px-3 py-1.5 rounded-full');

        const span = document.createElement('span');
        span.textContent = label;

        const closeBtn = document.createElement('button');
        closeBtn.setAttribute('class', 'ml-2 bg-indigo-200 hover:bg-indigo-300 text-indigo-700 rounded-full w-4 h-4 flex items-center justify-center text-xs font-bold transition-colors duration-200');
        closeBtn.textContent = '×';
        closeBtn.addEventListener('click', () => {
            const tagToRemove = div;
            const tagLabel = tagToRemove.querySelector('span').textContent;

            tagToRemove.remove();
            tags = tags.filter(tag => tag !== tagLabel);

            // UI 업데이트
            updateKeywordsDisplay();
            renderSuggestedKeywords(); // 추천 키워드 목록 갱신
        });

        div.appendChild(span);
        div.appendChild(closeBtn);

        return div;
    }

    // 입력 필드에서 키보드 이벤트 처리
    tagInput.addEventListener('keyup', (e) => {
        errorMessage.textContent = ''; // 키 입력 시 에러 메시지 초기화
        if (e.key === 'Enter' || e.key === ',') {
            e.preventDefault();
            if(e.target.value.trim() !== '') {
                addTag(e.target.value);
            }
            e.target.value = ''; // 입력 필드 비우기
        }
        else if (e.key === 'Backspace' && e.target.value === '' && tags.length > 0) {
            const lastTag = tagsContainer.querySelector('div:last-of-type');
            if(lastTag) {
                const tagLabel = lastTag.querySelector('span').textContent;
                tags = tags.filter(tag => tag !== tagLabel);
                lastTag.remove();

                updateKeywordsDisplay();
                renderSuggestedKeywords();
            }
        }
    });

    //대분류 변경에 따른 키워드 변경
    function jobCategoryLargeKeywordChange($val){
        allSuggestedKeywords = allKeywords[$val];
        renderSuggestedKeywords();
    }

    $('#jobCategoryLarge').on('change', function () {
        jobCategoryLargeKeywordChange($(this).val());
    })

    // 초기 UI 상태 설정
    updateKeywordsDisplay();
    // renderSuggestedKeywords();
})

