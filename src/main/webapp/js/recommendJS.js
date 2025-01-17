
    function recommendFunction(inputTag, listTag, autoData) {
        // 입력 필드
        const recruitinput = $(inputTag);
        // 추천 목록 출력
        const recruitlist = $(listTag);

        // 추천할 데이터 목록
        const auto = autoData;
        // 입력 이벤트 감지
        recruitinput.on("input", function () {
            // 입력 input에서 입력값 받아오기
            const query = recruitinput.val().trim().toLowerCase();
            // 추천 데이터 초기화
            recruitlist.empty();

            // 만약 입력 값이 없으면
            if (!query) {
                recruitlist.hide(); // 추천 데이터를 숨깁니다.
                return;
            }

            // 추천 데이터에서 유사 항목 필터링
            const result = auto.filter(item => item.toLowerCase().includes(query));

            // 비슷한 데이터를 추천 목록에 추가
            result.forEach(item => {
                // div 태그 생성
                const listDiv = $("<div>").text(item).css({
                    "padding": "8px",
                    "cursor": "pointer",
                    "border-bottom": "1px solid #ddd",
                    "background-color": "#fff"
                });

                // 클릭 이벤트 추가
                listDiv.on("click", function () {
                    recruitinput.val(item); // 추천 값 설정
                    recruitlist.empty().hide(); // 추천 목록 초기화 및 숨김
                });

                // 추천 목록에 추가
                recruitlist.append(listDiv);
            });

            recruitlist.show(); // 추천 목록 표시
        });

        // 다른 곳 클릭 시 추천 목록 삭제
        $(document).on("click", function (e) {
            if (!$(e.target).is(recruitinput) && !$.contains(recruitlist[0], e.target)) {
                recruitlist.empty().hide(); // 추천 데이터 초기화 및 숨김
            }
        });
    }
