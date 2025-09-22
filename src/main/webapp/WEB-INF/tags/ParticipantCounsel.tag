<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ attribute name="counsel" type="com.jobmoa.app.CounselMain.biz.participantCounsel.CounselDTO" %>

<script href=""></script>

<%-- 상담정보 입력 폼 시작 --%>
<div class="row card mt-3">
    <div class="card-header">
        <h1 class="card-title">상담정보</h1>
        <div class="card-tools">
            <button type="button" class="btn btn-tool" data-lte-toggle="card-collapse" style="font-size: 1.5rem;">
                <i data-lte-icon="expand" class="bi bi-plus-lg"></i>
                <i data-lte-icon="collapse" class="bi bi-dash-lg"></i>
                <input type="hidden" id="counselJobNo" name="counselJobNo" value="${not empty param.counselJobNo ? param.counselJobNo : 0}">
            </button>
        </div>
    </div>
    <div class="card-body">
        <div class="row">
            <div class="pb-2 mb-1 w-auto">
                <label for="counselJobSkill" class="form-label">취업역량<span class="text-danger">*</span></label>
                <select class="form-select" aria-label="Default select example" id="counselJobSkill" name="counselJobSkill">
                    <option value=""></option>
                    <option value="A">A</option>
                    <option value="B">B</option>
                    <option value="C">C</option>
                    <option value="D">D</option>
                </select>
            </div>
            <div class="datepicker-div">
                <label for="counselLastCons" class="form-label" >최근상담일</label>
                <div class="input-group">
                    <i class="bi bi-calendar-date input-group-text"></i>
                    <input type="text" class="form-control datepicker_on" id="counselLastCons" name="counselLastCons" placeholder="yyyy-mm-dd" aria-label="최근상담일" value="${not empty counsel ? counsel.counselLastCons:""}"  autocomplete="off">
                </div>
            </div>
            <div class="w-auto">
                <label for="counselProgress" class="form-label">진행단계</label>
                <select class="form-select" aria-label="Default select example" id="counselProgress" name="counselProgress">
                    <option selected value="IAP 전">IAP 전</option>
                    <option value="IAP 후">IAP 후</option>
                    <option value="미고보">미고보</option>
                    <option value="고보일반">고보일반</option>
                    <option value="등록창업">등록창업</option>
                    <option value="미등록창업">미등록창업</option>
                    <option value="미취업사후관리">미취업사후관리</option>
                    <option value="미취업사후종료">미취업사후종료</option>
                    <option value="유예">유예</option>
                    <option value="취소">취소</option>
                    <option value="이관">이관</option>
                    <option value="중단">중단</option>
                </select>
            </div>
            <div class="datepicker-div">
                <label for="counselInItCons" class="form-label">초기상담일</label>
                <div class="input-group">
                    <i class="bi bi-calendar-date input-group-text"></i>
                    <input type="text" class="form-control datepicker_on" id="counselInItCons" name="counselInItCons" placeholder="yyyy-mm-dd" aria-label="초기상담일" value="${not empty counsel ? counsel.counselInItCons:""}" autocomplete="off">
                </div>
            </div>
            <div class="datepicker-div">
                <label for="counselJobEX" class="form-label">구직만료일</label>
                <div class="input-group">
                    <i class="bi bi-calendar-date input-group-text"></i>
                    <input type="text" class="form-control datepicker_on" id="counselJobEX" name="counselJobEX" placeholder="yyyy-mm-dd" aria-label="구직만료일" value="${not empty counsel ? counsel.counselJobEX:""}" autocomplete="off">
                </div>
            </div>
            <div class="datepicker-div">
                <label for="counselIAPDate" class="form-label">IAP수립일</label>
                <div class="input-group">
                    <i class="bi bi-calendar-date input-group-text"></i>
                    <input type="text" class="form-control datepicker_on" id="counselIAPDate" name="counselIAPDate" placeholder="yyyy-mm-dd" aria-label="IAP수립일" value="${not empty counsel ? counsel.counselIAPDate:""}" autocomplete="off">
                </div>
            </div>
            <div class="datepicker-div">
                <label for="counselIAP3Month" class="form-label">IAP 3개월차</label>
                <div class="input-group">
                    <i class="bi bi-calendar-date input-group-text"></i>
                    <input
                            type="text" class="form-control datepicker_on" id="counselIAP3Month" name="counselIAP3Month"
                            placeholder="yyyy-mm-dd" aria-label="IAP3개월차" value="${not empty counsel ? counsel.counselIAP3Month:""}" autocomplete="off"
                            disabled
                    >
                </div>
            </div>
            <div class="datepicker-div">
                <label for="counselIAP5Month" class="form-label">IAP 5개월차</label>
                <div class="input-group">
                    <i class="bi bi-calendar-date input-group-text"></i>
                    <input
                            type="text" class="form-control datepicker_on" id="counselIAP5Month" name="counselIAP5Month"
                            placeholder="yyyy-mm-dd" aria-label="IAP5개월차" value="${not empty counsel ? counsel.counselIAP5Month:""}" autocomplete="off"
                            disabled
                    >
                </div>
            </div>
            <%--<div class="datepicker-div">
                <label for="counselStepPro" class="form-label">3단계진입일</label>
                <div class="input-group">
                    <i class="bi bi-calendar-date input-group-text"></i>
                    <input type="text" class="form-control datepicker_on" id="counselStepPro" name="counselStepPro" placeholder="yyyy-mm-dd" aria-label="3단계진입일" value="${not empty counsel ? counsel.counselStepPro:""}" autocomplete="off">
                </div>
            </div>--%>
            <div class="datepicker-div">
                <label for="counselEXPDate" class="form-label">기간만료(예정)일<span class="text-danger">*</span></label>
                <div class="input-group">
                    <i class="bi bi-calendar-date input-group-text"></i>
                    <input type="text" class="form-control datepicker_on" id="counselEXPDate" name="counselEXPDate" placeholder="yyyy-mm-dd" aria-label="기간만료(예정)일" value="${not empty counsel ? counsel.counselEXPDate:""}" autocomplete="off">
                </div>
            </div>
            <!-- 직무카테고리-중분류 -->
            <div class="w-auto">
                <label for="jobCategoryMid" class="form-label">
                    직무카테고리-중분류<span class="text-danger">*</span>
                </label>
                <select class="form-select" id="jobCategoryMid" name="jobCategoryMid" required>
                    <option value="">선택하세요</option>
                    <option value="TEST1">테스트1</option>
                    <option value="TEST2">테스트2</option>
                </select>
            </div>

            <!-- 직무카테고리-소분류 -->
            <div class="w-auto">
                <label for="jobCategorySub" class="form-label">
                    직무카테고리-소분류<span class="text-danger">*</span>
                </label>
                <select class="form-select" id="jobCategorySub" name="jobCategorySub" required>
                    <option value="">선택하세요</option>
                    <option value="TEST1">테스트1</option>
                    <option value="TEST2">테스트2</option>
                </select>
            </div>

            <div class="w-auto">
                <label for="counselJobWant" class="form-label">희망직무<span class="text-danger">*</span></label>
                <input type="text" class="form-control" id="counselJobWant" name="counselJobWant" value="${not empty counsel ? counsel.counselJobWant:""}">
            </div>
            <div class="w-auto">
                <label for="counselSalWant" class="form-label">희망월급(단위 만원)<span class="text-danger">*</span></label>
                <input type="number" class="form-control" id="counselSalWant" name="counselSalWant" min="0" max="1000" placeholder="단위 만원" value="${not empty counsel ? counsel.counselSalWant:""}">
            </div>
            <div class="col-md-1 w-auto">
                <label for="counselPlacement" class="form-label">알선요청</label>
                <select class="form-select" aria-label="Default select example" id="counselPlacement" name="counselPlacement">
                    <option value="미희망" selected>미희망</option>
                    <option value="희망">희망</option>
                </select>
            </div>
            <div class="col-md-1 w-auto">
                <label for="counselEmploymentService" class="form-label">간접고용서비스</label>
                <select class="form-select" aria-label="Default select example" id="counselEmploymentService" name="counselEmploymentService">
                    <option value=""></option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                </select>
            </div>
            <div class="datepicker-div">
                <label for="counselAllowancePayment" class="form-label">수당지급일</label>
                <div class="input-group">
                    <i class="bi bi-calendar-date input-group-text"></i>
                    <input type="text" class="form-control datepicker_on" id="counselAllowancePayment" name="counselAllowancePayment" placeholder="yyyy-mm-dd" aria-label="수당지급일" value="${not empty counsel ? counsel.counselAllowancePayment:""}" autocomplete="off">
                </div>
            </div>
            <%-- 교육내역 --%>
            <div class="row col-md-12 education-div mt-1">
                <div class="education-div-header">
                    <label for="education" class="form-label">
                        교육내역
                        <i class="bi bi-patch-plus-fill education-div-plus"></i>
                        <i class="bi bi-patch-minus education-div-minus" style="display: none"></i>
                    </label>
                </div>
                <div class="education-div-content d-flex" id="education">
                </div>
            </div>
            <div class="row hidden-div" id="hiddenDiv">
                <div id="keywordContainer" class="col-md-12 mt-2 keyword-container">
                    <div class="bg-white">
                        <h1 class="mb-2 mt-2">키워드 추가하기</h1>
                        <p id="description" class="text-slate-500 mb-1">프로젝트에 관련된 키워드를 입력하거나 추천 키워드를 클릭하세요.</p>

                        <!-- 키워드 입력 컨테이너 -->
                        <div id="keywords-container" class="w-full border-2 border-slate-200 rounded-lg p-2 flex items-center flex-wrap gap-2 focus-within:border-indigo-500 focus-within:ring-2 focus-within:ring-indigo-200 transition-all duration-300">
                            <!-- 여기에 태그들이 동적으로 추가됩니다 -->
                            <input type="text" id="keyword-input" name="keyword-input" value=""
                                   class="flex-grow bg-transparent text-slate-700 placeholder-slate-400 focus:outline-none min-w-[100px] text-sm py-1" placeholder="2~10자 사이 키워드 입력...">
                        </div>
                        <p id="error-message" class="text-red-500 text-xs mt-1 h-4"></p>

                        <!-- 추천 키워드 목록 -->
                        <div id="suggested-section" class="mt-1">
                            <p class="text-sm font-medium text-slate-600 mb-2">추천 키워드<span class="text-danger">*</span></p>
                            <div id="suggested-keywords-container" class="flex flex-wrap gap-2">
                                <!-- 추천 키워드가 여기에 동적으로 추가됩니다 -->
                            </div>
                        </div>

                        <!-- 키워드 UI 바로 아래 아무 위치나 OK (같은 form 내부) -->
                        <div id="keywords-hidden-container" style="display:none;"></div>

                        <!-- 현재 키워드 목록 (선택 사항) -->
                        <div class="mt-1">
                            <p class="text-sm font-medium text-slate-600">현재 키워드: <span id="keyword-count" class="font-bold text-indigo-600">0</span>개</p>
                            <div id="keyword-list" class="text-sm text-slate-500 mt-2 mb-3">
                                <!-- 키워드 배열을 텍스트로 표시 -->
                            </div>
                        </div>
                    </div>
                </div>
                <div id="jobPlacementDiv" class="col-md-6 experience-div mt-2">
                    <label for="jobPlacementTextArea" class="form-label">알선 상세 정보<span class="text-danger">*</span></label>
                    <textarea class="form-control w-100" id="jobPlacementTextArea" name="placementDetail" placeholder="1. 핵심 역량 요약
7년차 시니어 프론트엔드 개발자로서 대규모 트래픽을 처리하는 웹 서비스 개발 및 운영 경험 다수 보유
React 및 Vue.js 기반의 SPA(Single Page Application) 설계 및 구축에 능숙
성능 최적화에 대한 높은 이해: Web Vitals 지표 개선 및 렌더링 속도 향상 경험
팀 리딩 및 코드 리뷰, 기술 멘토링을 통한 팀의 기술 역량 강화에 기여
다양한 직군(기획, 디자인, 백엔드)과의 원활한 협업 능력 및 커뮤니케이션 스킬 보유

2. 경력 사항
1) (주)알파테크 (AlphaTech Inc.)
재직 기간: 2019년 3월 ~ 2025년 8월 (6년 6개월)
직급: 선임 개발자 (Senior Frontend Developer)

주요 업무 및 성과:
e커머스 플랫폼 '알파몰' 프론트엔드 개발 리딩
Next.js를 도입하여 SSR(서버사이드 렌더링)을 적용, 초기 로딩 속도 40% 개선
Recoil을 활용한 전역 상태 관리 시스템 설계 및 구축
결제 시스템 연동 및 사용자 인증 플로우 개발
신규 서비스 '알파 라이브' 기획 및 개발
WebRTC 기반의 라이브 커머스 방송 기능 개발
실시간 채팅 기능 구현 및 성능 안정화
프론트엔드 개발 문화 개선
팀 내 코드 컨벤션 및 Git-flow 전략 수립
주 1회 기술 공유 세션 운영

2) (주)스타트컴퍼니 (Start Company)
재직 기간: 2018년 1월 ~ 2019년 2월 (1년 2개월)
직급: 개발자 (Frontend Developer)

주요 업무 및 성과:
여행 정보 플랫폼 웹사이트 개발
Vue.js 기반 반응형 웹 UI 개발
RESTful API 연동 및 데이터 시각화 작업

3. 보유 기술
구분 기술 스택
Languages: JavaScript(ES6+), TypeScript, HTML5, CSS3/Sass
Frameworks: React, Next.js, Vue.js, Nuxt.js
State Management: Recoil, Redux Toolkit, MobX, Vuex
Styling: Styled-components, Emotion, Tailwind CSS
Build Tools: Webpack, Vite
Collaboration: Git, GitHub, Jira, Slack

4. 자격증
자격증명 정보처리기사
취득일 2017년 11월 발급
기관 한국산업인력공단
자격증명 SQL 개발자 (SQLD)
취득일 2018년 6월
기관 한국데이터산업진흥원

5. 교육 내역
기간 2014.03 ~ 2018.02
교육 과정명 한국대학교 컴퓨터공학과 (학사 졸업)
교육 기관 한국대학교

기간 2023.05
교육 과정명 Advanced TypeScript Workshop (온라인)
교육 기관 Inflearn" style="height: 300px; resize: none;">${not empty counsel ? counsel.placementDetail:""}</textarea>
                </div>
                <div id="suggestionDiv" class="col-md-6 experience-div mt-2">
                    <label for="suggestionTextArea" class="form-label">추천사<span class="text-danger">*</span></label>
                    <textarea class="form-control w-100" id="suggestionTextArea" name="suggestionDetail"
                              placeholder="알선을 희망하는 참여자의 추천 멘트를 작성해주세요." style="height: 300px; resize: none;">${not empty counsel ? counsel.suggestionDetail:""}</textarea>
                </div>
            </div>

        </div>
    </div>
</div>
<%-- 상담정보 입력 폼 끝 --%>